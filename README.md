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
