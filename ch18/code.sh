kubectl exec kubebook-ch18-client -- sh -c "wget -S -qO- -T 5 --header 'Host: $1' 'http://$2$3' 2>&1 | grep -o 'HTTP/1.1 [0-9]*' | awk 'NR == 1'"
