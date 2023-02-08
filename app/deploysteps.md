# Login to docker registry
docker login

# Buinding images
docker build -t acatanzaro/frontend:latest -f Frontend/Dockerfile .
docker build -t acatanzaro/backend:latest -f Backend/Dockerfile .

# Pushing images to registry
docker push acatanzaro/frontend:latest
docker push acatanzaro/backend:latest

# configure secrets
echo "myrealsecretphrase" | docker --context node1 secret create app_frontend_secret_sample - 
echo "myotherrealsecretphrase" | docker --context node1 secret create app_backend_secret_sample - 
echo "mysupersupersecretcoso" | docker --context node1 secret create app_sqldata_secret_sample - 

# configure config
docker --context node1 config create app_sample_config sample_config.json
echo "this_is_the_value_of_the_config" | docker --context node1 config create app_sample_config_value -

# deploy stack on swarm
docker --context node1 stack deploy --compose-file app-deploy.yml app
