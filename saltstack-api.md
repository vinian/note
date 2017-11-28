# enable salt-api on debian

**all the command run on salt-master**

## 1. install salt-api
```bash
sudo apt-get update && sudo apt-get install -y salt-api
```

## 2. install CherryPy 
```bash
pip install CherryPy
```

## 3. install PyOpenSSL and generate self sign cert
```bash
pip install PyOpenSSL
salt-call --local tls.create_self_signed_cert
```

## 4. create user for salt-api
```bash
sudo useradd -M -s /usr/sbin/nologin saltapi
echo "saltapi:saltapi" | sudo chpasswd
```

## 5. add auth and salt-api config on master conf
```bash
### and the following to the end of /etc/salt/master
external_auth:
  pam:
    saltapi:
      - '*':
        - test.*


rest_cherrypy:
  host: 0.0.0.0     # change this to other address if you are not want to listen on all address
  port: 8000        # change to other if you are not use 8000
  ssl_crt: /etc/pki/tls/certs/localhost.crt
  ssl_key: /etc/pki/tls/certs/localhost.key


```

## 6. start salt-api and restart salt-master
```bash
sudo systemctl restart salt-master
sudo systemctl start salt-api
```

## 7. testing
```bash
curl -sSk https://localhost:8000/login \
    -H 'Accept: application/x-yaml' \
    -d username=saltapi \
    -d password=saltapi \
    -d eauth=pam
return:
- eauth: pam
  expire: 1510541934.351513
  perms: {}
  start: 1510498734.351513
  token: e77faa3faae4059f7ac1849c27029a6f2c95c8a1
  user: saltapi
```

**if you want to run other fun by user saltapi, you must explicit add it to master config external_auth**

[salt-api docs](https://docs.saltstack.com/en/latest/ref/netapi/all/salt.netapi.rest_cherrypy.html)
