#!/bin/sh
# usage: sh jwt.sh FILE
# prints the payload (the middle part) of the JWT in FILE as JSON text
cut -d. -f2 "$1" | tr '_-' '/+' | awk '{l=length($0)%4; if(l==2)$0=$0"=="; if(l==3)$0=$0"="; print}' | base64 -d 2>/dev/null
echo
