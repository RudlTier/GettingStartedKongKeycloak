HOST_IP=192.168.178.26

curl -X POST http://${HOST_IP}:8080/auth/realms/master/protocol/openid-connect/auth \
    -H 'grant_type=authorization_code' \
    -H 'Content-Type: application/x-www-form-urlencoded' \
    -d 'grant_type=authorization_code' \
    -d 'code='${AUTHORIZATION_TOKEN} \
    -d 'client_id=Kong' \
    -d 'redirect_uri=https%3A%2F%2Foidcdebugger.com%2Fdebug' |
    jq '.'

AUTHORIZATION_TOKEN=bbced640-82ee-4a2d-857b-03b3a8d8fe84.1743ae64-16a1-4864-b01a-f6933b6a5917.ff1bbde2-4cee-454c-987a-40a08efa9699
CLIENT_SECRET=67362c3e-c1fc-46bf-827d-393f5cb1a682
# Get Access Token
curl -X POST http://${HOST_IP}:8080/auth/realms/master/protocol/openid-connect/token \
    -H 'grant_type=authorization_code' \
    -H 'Content-Type: application/x-www-form-urlencoded' \
    -d 'grant_type=authorization_code' \
    -d 'code='${AUTHORIZATION_TOKEN} \
    -d 'client_id=Test' \
    -d 'client_secret='${CLIENT_SECRET} \
    -d 'redirect_uri=https%3A%2F%2Foidcdebugger.com%2Fdebug' |
    jq '.'
