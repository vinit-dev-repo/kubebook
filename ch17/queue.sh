#!/bin/sh
# Small in-memory-lifetime teaching queue; /state belongs to this Pod.
set -eu
locked=false
for attempt in $(seq 1 40); do
  if mkdir /state/lock 2>/dev/null; then locked=true; break; fi
  sleep 0.05
done
if test "$locked" != true; then
  printf 'Status: 503 Service Unavailable\r\nContent-Type: text/plain\r\n\r\nbusy\n'
  exit 0
fi
trap 'rmdir /state/lock' EXIT
IFS=: read -r action item value <<EOF
${QUERY_STRING:-status}
EOF
reply() { printf 'Content-Type: text/plain\r\n\r\n%s\n' "$1"; }
reject() { printf 'Status: 400 Bad Request\r\nContent-Type: text/plain\r\n\r\ninvalid request\n'; exit 0; }
if test "$action" != status && test "${REQUEST_METHOD:-}" != POST; then reject; fi
case "$action" in
  claim)
    if test -s /state/pending; then
      read -r item pages < /state/pending
      printf '%s\n' "$pages" > "/state/inflight/$item"
      sed '1d' /state/pending > /state/pending.next
      mv /state/pending.next /state/pending
      reply "item $item $pages"
    elif test -n "$(ls -A /state/inflight)"; then
      reply wait
    else
      reply done
    fi
    ;;
  ack)
    case "$item" in atlas|fern|harbor|kite|lantern|moss|reed) ;; *) reject ;; esac
    case "$value" in ''|*[!0-9]*) reject ;; esac
    test -f "/state/inflight/$item" || reject
    printf '%s %s\n' "$item" "$value" >> /state/results
    rm "/state/inflight/$item"
    reply stored
    ;;
  enqueue)
    test "$item" = reed && test "$value" = 10 || reject
    test ! -e /state/reed-added || reject
    printf 'reed 10\n' >> /state/pending
    touch /state/reed-added
    reply queued
    ;;
  status)
    printf 'Content-Type: text/plain\r\n\r\n'
    printf 'pending=%s inflight=%s results=%s\n' "$(wc -l < /state/pending | tr -d ' ')" "$(ls -A /state/inflight | wc -l | tr -d ' ')" "$(wc -l < /state/results | tr -d ' ')"
    sed 's/^/pending /' /state/pending | sort
    sed 's/^/result /' /state/results | sort
    ;;
  *) reject ;;
esac
