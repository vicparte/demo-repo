#!/bin/bash

# Define the image name and version file

image_name="vicparte/dev-demo"
version_file="version.txt"


if [ ! -f $version_file ]; then
    echo "1" > $version_file
fi

# Read the current version from the file
current_version=$(cat $version_file)

# Increment the version number
new_version=$((current_version + 1))

# Build the Docker image with the specified tag
docker build -t $image_name:$new_version .

# Push the image to Docker Hub
docker push $image_name:$new_version

# Update the version file with the new version
echo $new_version > $version_file
