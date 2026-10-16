channel_select_pod() {
  channel_node=$(kubectl -n default get pod victim -o jsonpath='{.spec.nodeName}')
  test -n "$channel_node" && test "$CP" = "$channel_node"
  channel_pair=$(kubectl -n kubebook-ch42-falco get pods -l app.kubernetes.io/name=falco -o json | docker exec -i "$CP" jq -er --arg node "$channel_node" -f /root/kubebook-channel-query-0.jq)
  read -r channel_pod channel_uid <<< "$channel_pair"
  test -n "$channel_pod" && test -n "$channel_uid"
  channel_container=$(kubectl -n kubebook-ch42-falco get pod "$channel_pod" -o jsonpath='{.status.containerStatuses[?(@.name=="falco")].containerID}')
  channel_restarts=$(kubectl -n kubebook-ch42-falco get pod "$channel_pod" -o jsonpath='{.status.containerStatuses[?(@.name=="falco")].restartCount}')
  test -n "$channel_container" && test -n "$channel_restarts"
}
channel_same_pod() {
  test "$(kubectl -n kubebook-ch42-falco get pod "$channel_pod" -o jsonpath='{.metadata.uid}')" = "$channel_uid"
  test "$(kubectl -n kubebook-ch42-falco get pod "$channel_pod" -o jsonpath='{.spec.nodeName}')" = "$channel_node"
  test "$(kubectl -n kubebook-ch42-falco get pod "$channel_pod" -o jsonpath='{.status.containerStatuses[?(@.name=="falco")].containerID}')" = "$channel_container"
  test "$(kubectl -n kubebook-ch42-falco get pod "$channel_pod" -o jsonpath='{.status.containerStatuses[?(@.name=="falco")].restartCount}')" = "$channel_restarts"
}
channel_wait_source() {
  channel_started=0
  for channel_i in $(seq 1 60); do
    if kubectl -n kubebook-ch42-falco logs "$channel_pod" -c falco > channel-startup.log 2>&1 && grep -F "Opening 'syscall' source with modern BPF probe." channel-startup.log > /dev/null; then channel_started=1; break; fi
    sleep 1
  done
  test "$channel_started" -eq 1 || { cat channel-startup.log >&2; return 1; }
  channel_same_pod
}
channel_check_config() {
  channel_expected_stdout=$1
  channel_expected_file=$2
  channel_expected_name=$3
  kubectl -n kubebook-ch42-falco exec "$channel_pod" -c falco -- cat /etc/falco/falco.yaml | awk -v so="$channel_expected_stdout" -v fo="$channel_expected_file" -v fn="$channel_expected_name" '
    /^stdout_output:/ { section="stdout"; next }
    /^file_output:/ { section="file"; next }
    /^[A-Za-z_][A-Za-z_0-9]*:/ { section="" }
    section=="stdout" && $1=="enabled:" { stdout=$2 }
    section=="file" && $1=="enabled:" { file=$2 }
    section=="file" && $1=="filename:" { name=$2; gsub(/^["\047]|["\047]$/, "", name) }
    END { if (stdout!=so || file!=fo || (fo=="true" && name!=fn)) exit 1; print "stdout=" stdout " file=" file (fo=="true" ? " filename=" name : "") }
  '
}
channel_json_lines() {
  grep '^{' "$1" > "$2" || test "$?" -eq 1
  docker exec -i "$CP" jq -s empty < "$2" > /dev/null
}
