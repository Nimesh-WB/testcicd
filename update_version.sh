#!/bin/bash

# Get the short commit hash for versioning
VERSION=$(git rev-parse --short HEAD)

# Path to your deployment YAML file
DEPLOYMENT_FILE="./deployment.yaml"

# Update the version in the YAML file
sed -i "s/version: v.*/version: $VERSION/" $DEPLOYMENT_FILE

echo "Updated version to $VERSION"
