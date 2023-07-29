## zdocker
use makefile to run a docker quickly.

reference:
 - https://github.com/bitnami/containers
 - https://docs.docker.com/desktop/networking/#use-cases-and-workarounds-for-all-platforms
	- `host.docker.internal`

## terminal
### code-server
```
docker run -d --name code-server -p 127.0.0.1:8080:8080 \
  -v "$HOME/.config:/home/coder/.config" \
  -v "$PWD:/home/coder/project" \
  -u "$(id -u):$(id -g)" \
  -e "DOCKER_USER=$USER" \
  codercom/code-server:latest
```
`"$PWD:/home/coder/project"` work directory

### syncthing
```
docker run -d --name syncthing -p 8384:8384 -p 22000:22000/tcp -p 22000:22000/udp -p 21027:21027/udp \
    -v "$HOME/syncthing:/var/syncthing" \
    --hostname=my-syncthing \
    syncthing/syncthing:latest
```
`"$HOME/syncthing:/var/syncthing"` syncthing directory  
browser: http://127.0.0.1:8384  
设置局域网连接: `default, tcp://192.168.1.13:22000`  

## others
### TiDB
https://github.com/pingcap/tidb-docker-compose

