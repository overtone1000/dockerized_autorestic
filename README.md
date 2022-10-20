Build and push with
```
REGISTRY=docker.io && \
IMAGE_NAME=autorestic && \
UNAME=overtone1000 && \
TAG=$REGISTRY/$UNAME/$IMAGE_NAME &&\
docker login && \
docker build -t $IMAGE_NAME ./build && \
docker image tag $IMAGE_NAME $TAG && \
docker push $TAG
```

Environment variables RESTIC_PASSWORD and S3_ACCOUNT_KEY should be kept out of public repositories.
Put them in a .env file that's excluded with gitignore, and deploy the stack with
Deploy with `env $(cat .env) docker stack deploy -c ./docker/stack.yml stack_name`