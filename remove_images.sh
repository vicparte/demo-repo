#!/bin/bash

##tag images##

docker tag react_image vicparte/dev-react_image:v1
docker push	vicparte/dev-react_image:v1


##remove images##
docker rmi -f react_image
docker rmi -f vicparte/dev-react_image:v1
