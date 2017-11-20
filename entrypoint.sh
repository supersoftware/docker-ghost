#!/bin/bash
set -e

# make sure the s3 adapter is in adapters directory
mkdir -p content/adapters/storage
cp -pr node_modules/ghost-storage-adapter-s3 content/adapters/storage/s3

# custom theme
mkdir -p /var/lib/ghost/content/themes
cd /var/lib/ghost/content/themes
curl -SLO https://github.com/supersoftware/ghostium/archive/v2.4.1-custom.zip
unzip v2.4.1-custom.zip
mv ghostium-2.4.1-custom ghostium-custom
rm v2.4.1-custom.zip
cd /var/lib/ghost

# execute the default entrypoint
docker-entrypoint.sh "$@"

