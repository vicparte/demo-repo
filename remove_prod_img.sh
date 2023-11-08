#!/bin/bash


docker tag react_image vicparte/prod-react_image:V1
docker push vicparte/prod-react_image:V1


docker rmi -f react_image
docker rmi -f vicparte/prod-react_image:V1
