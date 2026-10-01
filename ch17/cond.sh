#!/bin/sh
# cond.sh POD: print the conditions of the endpoint that belongs to POD in the slice of the web Service
kubectl get endpointslices -l kubernetes.io/service-name=kubebook-ch17-web -o jsonpath='{range .items[0].endpoints[*]}{.targetRef.name} ready={.conditions.ready} serving={.conditions.serving} terminating={.conditions.terminating}{"\n"}{end}' | grep "^$1 "
