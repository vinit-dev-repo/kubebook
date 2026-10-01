#!/bin/sh
# usage: sh bench.sh OUTFILE [ARG...]
# runs kube-bench as a Job with ARG... and --benchmark cis-1.12, saves its log in OUTFILE, and removes the Job
set -e
out=$1
shift
args=""
for a in "$@"; do args="$args, \"$a\""; done
sed "s#command: \[\"kube-bench\"\]#command: [\"kube-bench\"$args, \"--benchmark\", \"cis-1.12\"]#" job.yaml > job-run.yaml
kubectl delete job kube-bench --ignore-not-found > /dev/null
kubectl apply -f job-run.yaml > /dev/null
kubectl wait --for=condition=complete job/kube-bench --timeout=170s > /dev/null 2>&1
kubectl logs job/kube-bench > "$out" 2>&1
kubectl delete job kube-bench > /dev/null
