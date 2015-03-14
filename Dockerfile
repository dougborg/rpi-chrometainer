FROM resin/rpi-raspbian:wheezy
MAINTAINER Douglas Borg <dougborg@dougborg.org>

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
      ca-certificates \
      ttf-mscorefonts-installer \
      libexif-dev \
      libpango1.0-0 \
      libv4l-0 \
      chromium \
      chromium-l10n && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/usr/bin/chromium", "--no-sandbox",\
            "--user-data-dir=/tmp", "--disable-setuid-sandbox"]
