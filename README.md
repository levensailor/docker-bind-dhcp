# bind9 + isc-dhcp-server + webmin


* Add isc-dhcp-server to sameersbn/bind


### Build:

```sudo docker build -t devspyrosv/bind-dhcp-webmin:latest .```

### Install portainer:
```sudo docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer --name portainer```
