#!/bin/bash
set -e

# make sure the s3 adapter is in adapters directory
mkdir -p content/adapters/storage
cp -pr node_modules/ghost-storage-adapter-s3 content/adapters/storage/s3

# custom theme
THEME_VER=2.4.5-custom
mkdir -p /var/lib/ghost/content/themes
cd /var/lib/ghost/content/themes
curl -SLO https://github.com/supersoftware/ghostium/archive/v${THEME_VER}.zip
unzip v${THEME_VER}.zip
mv ghostium-${THEME_VER} ghostium-custom
rm v${THEME_VER}.zip
cd /var/lib/ghost

# execute the default entrypoint
docker-entrypoint.sh "$@"

