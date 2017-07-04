FROM owncloud/alpine:latest
MAINTAINER ownCloud DevOps <devops@owncloud.com>

ENTRYPOINT ["/usr/local/bin/smash-wrapper"]

ARG VERSION
ARG BUILD_DATE
ARG VCS_REF

RUN apk update && \
  apk add build-base git py2-pip coreutils cmake qt5-qtwebkit-dev qt5-qttools-dev qt5-qtkeychain-dev@testing && \
  git clone https://github.com/owncloud/client.git /tmp/client && \
  cd /tmp/client && \
  git checkout ${VERSION} && \
  cmake -DCMAKE_BUILD_TYPE="Debug" -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_SYSCONFDIR=/etc/owncloud-client && \
  make all install && \
  cd && \
  rm -rf /tmp/client && \
  apk del build-base cmake && \
  rm -rf /var/cache/apk/* /tmp/* && \
  git clone --depth 1 https://github.com/owncloud/smashbox.git /smashbox && \
  cd /smashbox && \
  pip install -r requirements.txt && \
  cd && \
  rm -rf /var/cache/apk/* /tmp/*

WORKDIR /smashbox
COPY rootfs /

LABEL org.label-schema.version=$VERSION
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.vcs-url="https://github.com/owncloud-docker/smashbox.git"
LABEL org.label-schema.name="ownCloud Smashbox"
LABEL org.label-schema.vendor="ownCloud GmbH"
LABEL org.label-schema.schema-version="1.0"
