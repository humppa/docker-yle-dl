# Docker installation for https://aajanki.github.io/yle-dl
# Usage: docker run -ti --rm -v $(pwd)/dl:/yle yle-dl <args...>

FROM ubuntu:xenial

LABEL maintainer="dev@starck.fi"

COPY apt/99translations /etc/apt/apt.conf.d/99translations
COPY apt/sources.list /etc/apt/sources.list

RUN set -x \
  && apt-get update && apt-get --yes full-upgrade \
  && apt-get install --yes make python python-crypto rtmpdump \
     php-bcmath php-cli php-curl php-mcrypt php-xml

RUN set -x && phpenmod mcrypt

ADD https://github.com/aajanki/yle-dl/archive/2.15.tar.gz /opt/yle-dl.tar.gz

RUN set -x \
  && cd /opt \
  && tar xzvf yle-dl.tar.gz \
  && cd /opt/yle-dl-2.15 \
  && make install

VOLUME /yle

ENTRYPOINT ["/usr/local/bin/yle-dl", "--destdir", "/yle"]
