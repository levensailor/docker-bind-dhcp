# bind9 + isc-dhcp-server + webmin


* Add isc-dhcp-server to sameersbn/bind


### Build:

```sudo docker build -t the-name-you-want-to-give:latest .```
### Run:
1. Edit run.sh if you want to run your own build and provide the name you have given in the build step.
2. Make run.sh executable ```chmod +x run.sh```
3. ```sudo ./run.sh```

### Webmin
Access webmin at [https://localhost:10000](https://localhost:10000)
### Bonus: Install portainer and manage your containers.
```sudo docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer --name portainer```
