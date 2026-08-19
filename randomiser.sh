#!/bin/bash


[ "$1" != "false" ] && bash anim.sh "Deploying script..." purple

# charset='A-Za-z0-9'

#while true; do
#  head -c 100 /dev/urandom | tr -dc "$charset" | head -c 50 | tr -d '\n'
#  sleep 0.00000000001
#done

# This is generally a better version of spam.bash but more advanced

cat /dev/urandom | tr -dc 'a-zA-Z0-9' | while IFS= read -r -n1 char; do printf "%s" "$char"; done