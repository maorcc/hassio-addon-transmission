ARG BUILD_FROM=ghcr.io/home-assistant/base:3.24
FROM ${BUILD_FROM}

RUN apk add --no-cache \
  transmission-daemon~=4.1.2-r0

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
