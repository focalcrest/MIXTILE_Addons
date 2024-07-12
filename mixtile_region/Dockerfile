ARG BUILD_FROM
FROM $BUILD_FROM

# Copy data for add-on
RUN \
set -x \
&& apk add --no-cache \
    py3-pip \
    python3 \
&& pip3 install \
    --no-cache-dir \
    --prefer-binary \
    --break-system-packages pyserial 

COPY run.sh /
COPY rootfs /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]