set -eu
printf '3\n5\n8\n' | awk '{rows++; total += $1} END {printf "rows=%d total=%d\n", rows, total}' > /work/receipt.tmp
mv /work/receipt.tmp /work/receipt
for attempt in $(seq 1 120); do
  test -s /work/acknowledged && break
  sleep 1
done
cmp /work/receipt /work/acknowledged
cat /work/receipt
