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