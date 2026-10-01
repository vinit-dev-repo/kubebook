kubectl get httproute "$2" -n "$1" -o jsonpath='{range .status.parents[*]}{range .conditions[*]}{.type}={.status} {.reason}{"\n"}{end}{end}'
