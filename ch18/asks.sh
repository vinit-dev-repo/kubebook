kubectl exec kubebook-ch18-client -- sh -c "wget -qO- -T 5 --no-check-certificate --header 'Host: $1' 'https://$2$3' 2>&1 | awk 'NR == 1'"
