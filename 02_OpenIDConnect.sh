# Using Open Source OpenID Connect Kong Plugin https://github.com/nokia/kong-oidc

HOST_IP=192.168.178.26
CLIENT_SECRET=ef9449cb-49b9-47a4-bd06-fe867aa8ad0e
curl -s -X POST http://localhost:8001/plugins \
    -d name=oidc \
    -d config.client_id=kong \
    -d config.client_secret=${CLIENT_SECRET} \
    -d config.discovery=http://${HOST_IP}:8080/auth/realms/master/.well-known/openid-configuration |
    jq '.'

curl -s -X GET http://localhost:8001/plugins |
    jq '.'

PLUGIN_ID=79d91156-9ece-4be7-b6be-ce64924556bc
curl -s -X DELETE http://localhost:8001/plugins/${PLUGIN_ID}

curl -s -X PUT http://localhost:8001/plugins/79d91156-9ece-4be7-b6be-ce64924556bc \
    -d name=oidc \
    -d config.client_id=kong \
    -d config.client_secret=${CLIENT_SECRET} \
    -d config.discovery=http://${HOST_IP}:8080/auth/realms/master/.well-known/openid-configuration \
    -d config.introspection_endpoint_auth_method=http://192.168.178.26:8080/auth/realms/master/protocol/openid-connect/token/introspect |
    jq '.'

# Get Keycloak Introspection Endpoint
curl -s http://${HOST_IP}:8080/auth/realms/master/.well-known/openid-configuration | jq '.'
#=> http://192.168.178.26:8080/auth/realms/master/protocol/openid-connect/token/introspect
