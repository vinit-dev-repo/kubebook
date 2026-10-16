#!/bin/sh
set -eu
case "$1" in hello|migration-old|migration-new) ;; *) exit 2;; esac
sh etcd.sh get "/registry/kubebook.example.com/greetings/default/$1" --print-value-only > storage-value.json
docker exec -i kubebook-ch35-control-plane jq -er .apiVersion < storage-value.json
