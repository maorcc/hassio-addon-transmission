ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk add --no-cache \
  transmission-daemon~=4.0.4

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
