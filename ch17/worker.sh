#!/bin/sh
set -eu
case "$MODE" in once|loop) ;; *) exit 2 ;; esac
for attempt in $(seq 1 120); do
  response=$(wget -qO- -T 5 --post-data='' "$QUEUE_URL?claim")
  set -- $response
  case "$1" in
    item)
      test "$#" = 3
      item=$2
      pages=$3
      sheets=$(((pages + 1) / 2))
      receipt=$(wget -qO- -T 5 --post-data='' "$QUEUE_URL?ack:$item:$sheets")
      test "$receipt" = stored
      printf '%s sheets=%s\n' "$item" "$sheets"
      if test "$MODE" = once; then exit 0; fi
      ;;
    wait) sleep 1 ;;
    done) exit 0 ;;
    *) exit 2 ;;
  esac
done
exit 1
