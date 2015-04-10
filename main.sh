#!/bin/bash
for i in $(seq 0 $(jq 'length - 1' users.json)); do
  jq -r --arg i $i '.[$i | tonumber].email' users.json
  jq --arg i $i -f form.jq users.json | \
    curl -s -d @- -H "X-API-TOKEN: $1" \
      https://api.typeform.io/v0.1/forms | \
    jq -r '.links.form_render.get'
done
