ARG BUILD_FROM
ARG BUILD_ARCH

FROM $BUILD_FROM

ARG UNIVERSAL_SILABS_FLASHER

# Copy data for add-on
RUN \
set -x \
&& apk add --no-cache \
    py3-pip \
    python3 \
&& pip3 install \
    --no-cache-dir \
    --prefer-binary \
    --find-links "https://wheels.home-assistant.io/musllinux/${BUILD_ARCH}/" \
    universal-silabs-flasher=="${UNIVERSAL_SILABS_FLASHER}"

COPY run.sh /
# RUN \
#     set -x \
#     && apk add --no-cache \
#         py3-pip \
#         python3 \

CMD [ "/run.sh" ]