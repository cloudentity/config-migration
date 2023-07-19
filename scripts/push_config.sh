#!/bin/bash
set -ex

AT=$(curl -k -u $CID:$CS -X POST "https://$URL/$TENANT/system/oauth2/token" --header "Content-Type: application/x-www-form-urlencoded" --data-raw "grant_type=client_credentials" | jq -r '.access_token')
curl -k --location --request PATCH "https://$URL/api/hub/$TENANT/workspaces/$WORKSPACE/promote/config-rfc7396" -H "Authorization: Bearer $AT" -d @$1