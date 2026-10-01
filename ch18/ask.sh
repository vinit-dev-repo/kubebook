kubectl exec kubebook-ch18-client -- sh -c "wget -qO- -T 5 --header 'Host: $1' --header '${4:-X-Kubebook: none}' 'http://$2$3' 2>&1 | awk 'NR == 1'"
