# Using Open Source OpenID Connect Kong Plugin https://github.com/nokia/kong-oidc

HOST_IP=192.168.178.26
CLIENT_SECRET=9ecdf7f6-235d-4e07-9216-d58d61c3b69c
curl -s -X POST http://localhost:8001/plugins \
    -d name=oidc \
    -d config.client_id=kong \
    -d config.client_secret=${CLIENT_SECRET} \
    -d config.discovery=http://${HOST_IP}:8080/auth/realms/master/.well-known/openid-configuration |
    jq '.'
