docker run --rm --privileged multiarch/qemu-user-static:register --reset
docker login -u $DOCKER_USER -p $DOCKER_PASS
REPO=orda/iot-base
TAG=`if [[ $TRAVIS_PULL_REQUEST == "false" ]] && [[ $TRAVIS_BRANCH == "master" ]]; then echo "latest"; else echo $TRAVIS_PULL_REQUEST_BRANCH; fi`
docker build -f Dockerfile -t $REPO:$COMMIT .
docker tag $REPO:$COMMIT $REPO:$TAG
docker tag $REPO:$COMMIT $REPO:travis-$TRAVIS_BUILD_NUMBER
docker push $REPO
