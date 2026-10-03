#!/bin/sh
# mask.sh: print standard input with every IPv6 address as X:X::X and every IPv4 address as A.B.C.D
sed -E 's/[0-9a-f]{1,4}(:[0-9a-f]{0,4}){2,7}/X:X::X/g; s/[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/A.B.C.D/g'
