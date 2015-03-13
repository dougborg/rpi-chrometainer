FROM resin/rpi-raspbian:wheezy
MAINTAINER Douglas Borg <dougborg@dougborg.org>

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
      ca-certificates \
      libnss3 \
      ttf-mscorefonts-installer \
      xwit \
      chromium && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/usr/bin/chromium", "--no-sandbox",\
            "--user-data-dir=/tmp", "--disable-setuid-sandbox"]
