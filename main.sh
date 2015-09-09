#!/bin/bash
for i in $(seq 0 $(jq 'length - 1' users.json)); do
  jq -r --arg i $i '.[$i | tonumber].email' users.json
  jq --arg i $i -f form.jq users.json | \
    curl -s -d @- -H "X-API-TOKEN: $1" \
      https://api.typeform.io/v0.4/forms | \
    jq -r '._links[1].href'
done
