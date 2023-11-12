ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk add --no-cache \
  transmission-cli~=4.0.4 \
  transmission-daemon~=4.0.4

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
