# Use Keycloak for OpenID Authentication

REALM_NAME=Master
BASE_URL=http://localhost:8080/auth/realms/${REALM_NAME}/protocol/openid-connect/token
CLIENT_SECRET=ef9449cb-49b9-47a4-bd06-fe867aa8ad0e

curl -L -X POST ${BASE_URL} \
    -H 'Content-Type: application/x-www-form-urlencoded' \
    --data-urlencode 'client_id=kong' \
    --data-urlencode 'grant_type=password' \
    --data-urlencode 'client_secret='${CLIENT_SECRET} \
    --data-urlencode 'scope=openid' \
    --data-urlencode 'username=test' \
    --data-urlencode 'password=test' |
    jq '.'
