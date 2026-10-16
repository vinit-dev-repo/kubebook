set -e
touch /tmp/ready
while :; do
  mode=$(cat /settings/mode)
  case "$mode" in
    busy)
      awk 'BEGIN { for (i=1; i<=1000000; i++) total+=i; printf "%.0f\n", total }' > /tmp/result.next
      test "$(cat /tmp/result.next)" = 500000500000
      mv /tmp/result.next /tmp/result
      printf 'busy\n' > /tmp/observed.next
      mv /tmp/observed.next /tmp/observed
      ;;
    idle)
      printf 'idle\n' > /tmp/observed.next
      mv /tmp/observed.next /tmp/observed
      sleep 1
      ;;
    *) printf 'Invalid mode: %s\n' "$mode" >&2; exit 1 ;;
  esac
done
