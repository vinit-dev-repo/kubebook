set -eu
for attempt in $(seq 1 120); do
  test -s /work/receipt && break
  sleep 1
done
cat /work/receipt > /work/acknowledged.tmp
printf 'helper acknowledged receipt\n'
mv /work/acknowledged.tmp /work/acknowledged
while :; do sleep 1; done
