curl -X POST http://localhost:8001/services/e67cb07f-2efb-4957-b530-38fbc3c961c8/plugins \
    --data "name=oauth2-introspection" \
    --data "config.introspection_url=http://localhost:8080/auth/realms/master/protocol/openid-connect/auth" \
    --data "config.authorization_value=Basic S29uZzpmODAwNmFiYS05NjExLTQ0MzYtOTY2OC00NWMwYWMxMzQ0NjI=" \
    --data "config.consumer_by=username"
