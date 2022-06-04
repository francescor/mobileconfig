# mobileconfig
Generate multi-use .mobileconfig files for your mailboxes


Forked from https://github.com/al5ina5/mobileconfig 

* removed password input (dangerous and useless)
* have it working without password
* setup Docker 

# Docker

```
docker build -f Dockerfile -t mobileconfig .
docker run -it -p 3000:3000 mobileconfig
```

then http://localhost:3000

enable at boot with 

```
docker-compose -f docker-compose.yml up -d
```

rebuild 

```
docker-compose -f ${rootdir}/docker-compose.yml up -d --force-recreate --no-deps --build
```

# enable VH in apache


Add the following to an existing apache2 VH to have service available at https://domain.xxx.yy

```
    ProxyRequests off
    ProxyPreserveHost off
    ProxyVia Full
    <Proxy *>
      Require all granted
    </Proxy>
                <Location />
                  ProxyPass http://127.0.0.1:3000/
                  ProxyPassReverse http://127.0.0.1:3000/
                </Location>
        </VirtualHost>
```
