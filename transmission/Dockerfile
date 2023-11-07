ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk add --no-cache \
  transmission-cli \
  transmission-daemon

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
