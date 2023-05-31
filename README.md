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
