#!/bin/bash
set -ex

AT=$(curl -k -u $CID:$CS -X POST "https://$URL/$TENANT/system/oauth2/token" --header "Content-Type: application/x-www-form-urlencoded" --data-raw "grant_type=client_credentials" | jq -r '.access_token')
$(curl -k --location --request GET "https://$URL/api/hub/$TENANT/workspaces/$WORKSPACE/promote/config" -H "Authorization: Bearer $AT" | jq > $1)