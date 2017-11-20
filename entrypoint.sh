#!/bin/bash
set -e

# make sure the s3 adapter is in adapters directory
mkdir -p content/adapters/storage
cp -pr node_modules/ghost-storage-adapter-s3 content/adapters/storage/s3

# custom theme
mkdir -p /var/lib/ghost/content/themes/ghostium-custom
curl -SLO https://github.com/supersoftware/ghostium/archive/v2.4.0-custom.tar.gz
tar xzf v2.4.0-custom.tar.gz -C /var/lib/ghost/content/themes
mv /var/lib/ghost/content/themes/ghostium-2.4.0-custom /var/lib/ghost/content/themes/ghostium-custom
rm v2.4.0-custom.tar.gz

# execute the default entrypoint
docker-entrypoint.sh "$@"

