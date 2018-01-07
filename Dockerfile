FROM ubuntu:xenial
MAINTAINER spyros86@gmail.com

ENV BIND_USER=bind \
    DHCP_USER=dhcpd \
    DHCP_INTERFACES=" " \
    DATA_DIR=/data

ARG DEBIAN_FRONTEND=noninteractive

RUN rm -rf /etc/apt/apt.conf.d/docker-gzip-indexes \
 && apt-get -q -y update \
 && apt-get -q -y -o "DPkg::Options::=--force-confold" -o "DPkg::Options::=--force-confdef" install \
 vim.tiny wget sudo net-tools ca-certificates unzip apt-transport-https apt-show-versions \
 && wget http://www.webmin.com/jcameron-key.asc -qO - | apt-key add - \
 && echo "deb http://download.webmin.com/download/repository sarge contrib" >> /etc/apt/sources.list \
 && apt-get -q -y update \
 && apt-get -q -y -o "DPkg::Options::=--force-confold" -o "DPkg::Options::=--force-confdef" install apt-utils \
 && apt-get -q -y -o "DPkg::Options::=--force-confold" -o "DPkg::Options::=--force-confdef" dist-upgrade \
 && apt-get -q -y -o "DPkg::Options::=--force-confold" -o "DPkg::Options::=--force-confdef" install \
 bind9 isc-dhcp-server man webmin dnsutils \
 && apt-get -q -y autoremove \
 && apt-get -q -y clean \
 && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

EXPOSE 53/udp 53/tcp 67/udp 68/udp 10000/tcp
ENTRYPOINT ["/sbin/entrypoint.sh"]
CMD ["/usr/sbin/named"]




