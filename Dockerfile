FROM ghost:1-alpine

# install custom theme
RUN apk add --no-cache curl
RUN mkdir -p /var/lib/ghost/versions/1.17.3/content/themes/ghostium-2.3.2-custom \
    && curl -SLO https://github.com/supersoftware/ghostium/archive/v2.3.2-custom.tar.gz \
    && tar xzf v2.3.2-custom.tar.gz -C /var/lib/ghost/versions/1.17.3/content/themes/ghostium-2.3.2-custom \
    && rm v2.3.2-custom.tar.gz

# install s3 adapter
RUN npm install ghost-storage-adapter-s3

# We cannot copy the s3 adapter inside content because
# the parent image is exposing it as VOLUME.
# Hence we copy the adapter within a custom entrypoint.sh
COPY entrypoint.sh /usr/local/bin
ENTRYPOINT ["entrypoint.sh"]
CMD ["node", "current/index.js"]
