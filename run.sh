docker run \
--name=bind-dhcp \
-d \
--restart=always \
--dns=8.8.8.8 \
--publish=192.168.0.1:53:53/udp \
--publish=192.168.0.1:67:67/udp \
--publish=192.168.0.1:10000:10000 \
--volume=`pwd`/docker/bind-dhcp:/data \
--env='ROOT_PASSWORD=CHANGETHEPASSWORD' \
--net=host \
devspyrosv/bind-dhcp-webmin:latest
