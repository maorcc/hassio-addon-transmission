ARG BUILD_FROM=ghcr.io/home-assistant/base:3.23
FROM ${BUILD_FROM}

RUN apk add --no-cache \
  transmission-daemon~=4.0.6-r4

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
