### github
https://github.com/umami-software/umami

### docker_compose
https://github.com/umami-software/umami/blob/master/docker-compose.yml

```bash
wget https://raw.githubusercontent.com/umami-software/umami/refs/heads/master/docker-compose.yml
```

#### run
```bash
docker-compose up -d
```

#### browse
http://localhost:3000


### docker_with_mysql
获取mysql的ip
```bash
ip addr show eth0
```

连接已有的mysql
```bash
docker run -d --name umami \
  -p 3000:3000 \
  -e DATABASE_URL="mysql://root:123456@172.17.0.1:3306/umami" \
  -e DATABASE_TYPE="mysql" \
  docker.umami.is/umami-software/umami:mysql-latest
```
