#!/bin/sh
cat <<'EOF'
apiVersion: config.kubernetes.io/v1
kind: ResourceList
items:
- apiVersion: v1
  kind: ConfigMap
  metadata:
    name: from-a-script
  data:
    made: by-an-exec-function
EOF
