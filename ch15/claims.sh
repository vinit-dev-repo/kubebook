p=$(cut -d. -f2 "$1" | tr '_-' '/+')
while [ $(( ${#p} % 4 )) -ne 0 ]; do p="$p="; done
j=$(echo "$p" | base64 -d 2>/dev/null)
exp=$(echo "$j" | grep -o '"exp":[0-9]*' | cut -d: -f2)
iat=$(echo "$j" | grep -o '"iat":[0-9]*' | cut -d: -f2)
echo "aud=$(echo "$j" | grep -o '"aud":[[][^]]*]' | cut -d: -f2-)"
echo "sub=$(echo "$j" | grep -o '"sub":"[^"]*"' | cut -d: -f2-)"
echo "pod=$(echo "$j" | grep -o '"pod":{"name":"[^"]*"' | cut -d'"' -f6)"
echo "exp-iat=$((exp - iat))"
