#!/bin/sh
# endpoints.sh SERVICE: print how many endpoints the EndpointSlices of SERVICE list
kubectl get endpointslices -l kubernetes.io/service-name="$1" -o jsonpath='{.items[*].endpoints[*].targetRef.name}' | wc -w | tr -d ' '
