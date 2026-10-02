#!/bin/sh
# usage: sh rules-values.sh RULESFILE
# prints a values file that puts the rules in /etc/falco/rules.d as kubebook-rules.yaml
echo "customRules:"
echo "  kubebook-rules.yaml: |-"
sed 's/^/    /' "$1"
