If you want to run multiple docker containers that serve websites to multiple domains.

Assuming all containers run on the same host computer, are working and are pubicly visible through different ports. One container is already visible on port 80 (we'll call this the main container). 

On the host computer (that hosts the containers):

```
docker network create NETWORKNAME
```

Append this to the run command of every container you want to link together

```
docker run ... --net NETWORKNAME ...
```

Restart all containers in the network.

Find out the internal IP's of the containers you want to redirect to from the main container:

```
docker inspect CONTAINERNAME
```

Near the end of the output should be an IPAddress. Copy or write it down.

Edit the nginx config file, add this to the beginning of the file:

```
server {
        listen 80;
        server_name SECONDDOMAIN.COM;

        location / {
          proxy_pass http://IPADDRESS:PORT;
        }
}
```

Note that the port should point to the internal port that nginx uses inside the container, not the external port.
