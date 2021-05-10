BaseURL=http://localhost:8001

#######################
###    Services     ###
#######################
# List all Services
curl -i -X GET $BaseURL/services
# Create a Kong Service
curl -i -X POST $BaseURL/services/ \
    -d "name=mockbin-service" \
    -d "host=mockbin.com" \
    -d "path=/request"
# Create a Route fow new Kong Service
curl -i -X POST $BaseURL/services/mockbin-service/routes \
    -d "paths[]=/mock"
# Delete a Service
curl -i -X DELETE $BaseURL/services/mockbin-service

#######################
###      Routes     ###
#######################
# List all Routes
curl -i -X GET $BaseURL/routes

# Delete a Route
RouteId=c204081e-2e88-4005-98b0-833ad357036c
curl -i -X DELETE $BaseURL/routes/$RouteId

#######################
###    Consumer     ###
#######################
curl -i -X POST $BaseURL/consumers \
    -d "username=michi"

#######################
###    Key Auth     ###
#######################
# Add the Service
curl -X POST $BaseURL/services/mockbin-service/plugins \
    --data "name=key-auth" \
    --data "config.key_names=apikey"

# Assign Customer a Key
curl -X POST $BaseURL/consumers/michi/key-auth \
    -d "key=secretkey123"

#######################
###    Rate Limit   ###
#######################
curl -X POST $BaseURL/services/mockbin-service/plugins \
    --data "name=rate-limiting" \
    --data "config.minute=5" \
    --data "config.hour=10000" \
    --data "config.policy=local" \
    --data "config.limit_by=consumer"

curl -X DELETE $BaseURL/services/mockbin-service/plugins/b40f0854-8995-44f4-a9d5-f303dbdf288b

curl -X POST $BaseURL/services/mockbin-service/plugins \
    --data "name=canary" \
    --data "config.percentage=50" \
    --data "config.upstream_host=example.com" \
    --data "config.upstream_fallback=false" \
    --data "config.upstream_port=80"
