FROM madharjan/docker-base:14.04
MAINTAINER Madhav Raj Maharjan <madhav.maharjan@gmail.com>

ARG VCS_REF
ARG MYSQL_VERSION
ARG DEBUG=false

LABEL description="Docker container for MySQL Server" os_version="Ubuntu ${UBUNTU_VERSION}" \
      org.label-schema.vcs-ref=${VCS_REF} org.label-schema.vcs-url="https://github.com/madharjan/docker-mysql"

ENV MYSQL_VERSION ${MYSQL_VERSION}

RUN mkdir -p /build
COPY . /build

RUN /build/scripts/install.sh && /build/scripts/cleanup.sh

VOLUME ["/etc/mysql/conf.d", "/var/lib/mysql", "/var/log/mysql"]

CMD ["/sbin/my_init"]

EXPOSE 3306
