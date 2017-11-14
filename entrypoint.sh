#!/bin/bash
set -e

# make sure the s3 adapter is in adapters directory
mkdir -p content/adapters/storage
cp -pr node_modules/ghost-storage-adapter-s3 content/adapters/storage/s3

# execute the default entrypoint
docker-entrypoint.sh "$@"

