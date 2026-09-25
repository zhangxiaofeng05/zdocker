help: Makefile
	@echo
	@echo " Choose a command run:"
	@echo
	@sed -n 's/^##//p' $< | column -t -s ':' |  sed -e 's/^/ /'

## mysql: mysql docker
.PHONY: mysql
mysql:
	# docker: https://hub.docker.com/_/mysql
	# docker run -d --name mysql9.7.2 -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123456 -v mysql:/var/lib/mysql mysql:9.7.2
	## mysql 8.0
	docker run -d --name mysql8.0 -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123456 -v mysql:/var/lib/mysql mysql:8.0
	## mysql 5.7
	# docker run --platform linux/x86_64 -d --name mysql5.7 -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123456 -v mysql5.7:/var/lib/mysql mysql:5.7.42

## rabbitmq: rabbitmq docker
.PHONY: rabbitmq
rabbitmq:
	# docker: https://hub.docker.com/_/rabbitmq
	# management: http://127.0.0.1:15672  guest/guest
	docker run -d --name rabbitmq -p 15672:15672 -p 5672:5672 -v rabbitmq:/var/lib/rabbitmq rabbitmq:4.3.6-management

## kafka: kafka docker
.PHONY: kafka
kafka:
	# docker: https://hub.docker.com/r/apache/kafka
	# https://kafka.apache.org/documentation/
	# https://github.com/apache/kafka/blob/trunk/docker/examples/README.md
	docker run -d --name kafka -p 9092:9092 -v kafka:/mnt/shared/config apache/kafka:4.3.1

## swagger-ui: swagger ui
.PHONY: swagger-ui
swagger-ui:
	# docker: https://hub.docker.com/r/swaggerapi/swagger-ui
	# https://github.com/swagger-api/swagger-ui
	# swagger ui: http://127.0.0.1
	docker run -d --name swagger-ui -p 80:8080 swaggerapi/swagger-ui:v5.33.0

## jaeger: jaeger docker
.PHONY: jaeger
jaeger:
	# https://www.jaegertracing.io/
	# 文档: https://www.jaegertracing.io/docs/
	# Jaeger UI  http://localhost:16686
	docker run -d --name jaeger \
		-p 16686:16686 \
		-p 4317:4317 \
		-p 4318:4318 \
		-p 5778:5778 \
		-p 9411:9411 \
		cr.jaegertracing.io/jaegertracing/jaeger:2.21.0

## jenkins: jenkins docker
.PHONY: jenkins
jenkins:
	# https://github.com/jenkinsci/docker
	# UI http://127.0.0.1:8080
	# reference: https://juejin.cn/post/6967243012199940110
	docker run -d --name jenkins -p 8080:8080 -p 50000:50000 -v jenkins:/var/jenkins_home jenkins/jenkins:lts-jdk21

## postgres: postgres docker
.PHONY: postgres
postgres:
	# docker: https://hub.docker.com/_/postgres
	docker run -d --name postgres -p 5432:5432 -e POSTGRES_PASSWORD=123456 -e PGDATA=/var/lib/postgresql/data/pgdata -v postgres:/var/lib/postgresql/data postgres:18

## clickhouse: clickhouse docker
.PHONY: clickhouse
clickhouse:
	# docker: https://hub.docker.com/r/clickhouse/clickhouse-server
	# 文档: https://clickhouse.com/docs/get-started/setup/self-managed/docker
	# username: default  password: CLICKHOUSE_PASSWORD
	docker run -d --name clickhouse -p 8123:8123 -p 9000:9000 -p 9009:9009 -e CLICKHOUSE_PASSWORD=123456 --ulimit nofile=262144:262144 -v clickhouse:/var/lib/clickhouse clickhouse/clickhouse-server:26.8

## azuresqledge: Microsoft SQL Server - Ubuntu based images
.PHONY: azuresqledge
azuresqledge:
	# https://mcr.microsoft.com/en-us/artifact/mar/mssql/server/about
	# username: sa  password: MSSQL_SA_PASSWORD
	docker run -d --name azuresqledge -p 1433:1433 -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=12344321aA" -e "MSSQL_PID=Evaluation" mcr.microsoft.com/mssql/server:2025-latest

## httpbin: httpbin docker
.PHONY: httpbin
httpbin:
	# github https://github.com/postmanlabs/httpbin
	# docker: https://hub.docker.com/r/kennethreitz/httpbin
	# web: http://127.0.0.1/
	docker run -d --name httpbin -p 80:80 kennethreitz/httpbin

## redis: redis docker
.PHONY: redis
redis:
	# docker: https://hub.docker.com/_/redis
	# 文档: https://redis.io/docs/latest/operate/oss_and_stack/install/install-stack/docker/
	# username: empty  password: 123456
	docker run -d --name redis -p 6379:6379 -v redis:/data redis:8.10.1 --requirepass "123456"

## rediscli: redis cli
.PHONY: rediscli
rediscli:
	docker exec -it redis redis-cli

## memcached: memcached docker
.PHONY: memcached
memcached:
	# docker: https://hub.docker.com/_/memcached
	docker run -d --name memcached -p 11211:11211 memcached:1.6.45

## adminer: adminer docker
.PHONY: adminer
adminer:
	# docker: https://hub.docker.com/_/adminer
	# web: http://127.0.0.1:8080/
	docker run -d --name adminer -p 8080:8080 adminer:6.0.1

## phpmyadmin: phpmyadmin docker
.PHONY: phpmyadmin
phpmyadmin:
	# docker: https://hub.docker.com/_/phpmyadmin
	docker run -d --name phpmyadmin -p 8080:80 -e PMA_ARBITRARY=1 phpmyadmin:5.2.3

## dbgate: dbgate docker
.PHONY: dbgate
dbgate:
	# docker: https://hub.docker.com/r/dbgate/dbgate
	# web: http://127.0.0.1:3000
	docker run -d --name dbgate -p 3000:3000 dbgate/dbgate:7.3.0

## etcd: etcd docker
.PHONY: etcd
etcd:
	# 文档: https://etcd.io/docs/v3.7/op-guide/container/
	docker run -d --name etcd \
		-p 2379:2379 \
		-p 2380:2380 \
		-v etcd:/etcd-data \
		gcr.io/etcd-development/etcd:v3.7.0 \
		etcd \
		--advertise-client-urls http://0.0.0.0:2379 \
		--listen-client-urls http://0.0.0.0:2379 \

## open-webui: open-webui docker
.PHONY: open-webui
open-webui:
	# 文档: https://docs.openwebui.com/
	# web: http://127.0.0.1:3000
	# 支持各种兼容 OpenAI 的 API
	# 1. ollama 安装在电脑上,使用此命令
	docker run -d --name open-webui-local -p 3000:8080 --add-host=host.docker.internal:host-gateway -v open-webui-local:/app/backend/data ghcr.io/open-webui/open-webui:main
	# 2. ollama 安装在别的服务器上,使用此命令
	# docker run -d --name open-webui-remote -p 3000:8080 -e OLLAMA_BASE_URL=http://192.168.1.8:11434 -v open-webui-remote:/app/backend/data ghcr.io/open-webui/open-webui:main

## consul: consul docker
.PHONY: consul
consul:
	# docker: https://hub.docker.com/r/hashicorp/consul
	# 文档: https://developer.hashicorp.com/consul/docs/deploy/server/docker
	# web: http://127.0.0.1:8500
	docker run -d --name consul -p 8500:8500 -p 8600:8600/udp -v consul:/consul/data hashicorp/consul:2.0 consul agent -server -ui -node=server-1 -bootstrap-expect=1 -client=0.0.0.0 -data-dir=/consul/data

## mongo: mongo docker
.PHONY: mongo
mongo:
	# docker: https://hub.docker.com/_/mongo
	docker run -d --name mongo -p 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=root -e MONGO_INITDB_ROOT_PASSWORD=123456 -v mongo:/data/db -v mongo:/data/configdb mongo:7.0.43

## elasticsearch: elasticsearch docker
.PHONY: elasticsearch
elasticsearch:
	# http://localhost:9200/  https://www.elastic.co/guide/en/elasticsearch/reference/current/security-minimal-setup.html#_enable_elasticsearch_security_features
	# Password for the 'elastic' user (at least 6 characters)
	# docker: https://hub.docker.com/_/elasticsearch
	# 文档: https://www.elastic.co/docs/deploy-manage/deploy/self-managed/install-elasticsearch-docker-basic
	docker run -d --name elasticsearch -p 9200:9200 -p 9300:9300 -e discovery.type=single-node -e ELASTIC_PASSWORD=123456 -e xpack.security.enabled=true -v elasticsearch:/usr/share/elasticsearch/data docker.elastic.co/elasticsearch/elasticsearch:9.5.3

## kibana: kibana docker
.PHONY: kibana
kibana:
	# 获取token命令: docker exec elasticsearch bin/elasticsearch-service-tokens create elastic/kibana kibana-token
	# web: http://127.0.0.1:5601/   登录 elastic:123456
	docker run -d --name kibana -p 5601:5601 \
		-e ELASTICSEARCH_HOSTS='["http://host.docker.internal:9200"]' \
  	-e ELASTICSEARCH_SERVICEACCOUNTTOKEN='AAEAAWVsYXN0aWMva2liYW5hL2tpYmFuYS10b2tlbjpTOFhkY3J3eVRDZTlVa0NkbGpBbTFR' \
		docker.elastic.co/kibana/kibana:9.5.3

# 不好用
## openobserve: openobserve docker
.PHONY: openobserve
openobserve:
	# http://localhost:5080/  https://openobserve.ai/docs/quickstart/#self-hosted-installation
	docker run -d --name openobserve -p 5080:5080 -v openobserve:/data -e ZO_DATA_DIR="/data" -e ZO_ROOT_USER_EMAIL="f154704230@gmail.com" -e ZO_ROOT_USER_PASSWORD="123321@mnB" public.ecr.aws/zinclabs/openobserve:latest

## grafana: grafana docker
.PHONY: grafana
grafana:
	# docker: https://hub.docker.com/r/grafana/grafana
	# web: http://127.0.0.1:3000
	# default admin user credentials are admin/admin.
	docker run -d --name=grafana -p 3000:3000 grafana/grafana:13.0

## pyroscope: pyroscope docker
.PHONY: pyroscope
pyroscope:
	# github: https://github.com/grafana/pyroscope
	# docker: https://hub.docker.com/r/grafana/pyroscope
	# web browser: http://127.0.0.1:4040
	docker run -d --name=pyroscope -p 4040:4040 -v pyroscope:/data grafana/pyroscope

## nats: NATS docker
.PHONY: nats
nats:
	# 文档: https://docs.nats.io/concepts/getting-started/
	# docker: https://hub.docker.com/_/nats
	docker run -d --name nats -p 4222:4222 -p 8222:8222 nats:2.15.0

## rustfs: rustfs docker
.PHONY: rustfs
rustfs:
	# default root credentials rustfsadmin:rustfsadmin
	# web browser: http://127.0.0.1:9001
	# github地址: https://github.com/rustfs/rustfs
	# 文档: https://docs.rustfs.com/zh/installation/container/docker
	# docker: https://hub.docker.com/r/rustfs/rustfs
	docker run -d --name rustfs \
		-p 9000:9000 -p 9001:9001 \
	  -v rustfs:/data \
		-e RUSTFS_ACCESS_KEY="HfEkrJI7nA5PLW1oBw2S" \
  	-e RUSTFS_SECRET_KEY="j0nHgEF15huB8KNIOYk3JTSerxL7adlpt6UDwAvz" \
		-e RUSTFS_ADDRESS=":9000" \
		-e RUSTFS_CONSOLE_ADDRESS=":9001" \
		-e RUSTFS_CONSOLE_ENABLE=true \
		-e RUSTFS_OBS_LOGGER_LEVEL=error \
		rustfs/rustfs:1.0.0

## answer: answer docker
.PHONY: answer
answer:
	# web browser: http://127.0.0.1:9080
	# github地址: https://github.com/apache/answer
	# 文档: https://answer.apache.org/docs/installation
	# docker: https://hub.docker.com/r/apache/answer
	docker run -d --name answer -p 9080:80 -v answer-data:/data apache/answer:2.0.2

## minDoc: MinDoc docker
.PHONY: minDoc
minDoc:
	# 创建数据库: CREATE DATABASE `mindoc_db`;
	# web browser: http://127.0.0.1:8181
	# 默认用户名: admin 密码: 123456
	# github地址: https://github.com/mindoc-org/mindoc
	docker run -d --name mindoc -p 8181:8181 -e MINDOC_DB_ADAPTER=mysql -e MINDOC_DB_HOST=host.docker.internal -e MINDOC_DB_PORT=3306 -e MINDOC_DB_DATABASE=mindoc_db -e MINDOC_DB_USERNAME=root -e MINDOC_DB_PASSWORD=123456 -e httpport=8181 -d registry.cn-hangzhou.aliyuncs.com/mindoc-org/mindoc:v2.1

## siyuan: siyuan docker
.PHONY: siyuan
siyuan:
	# web browser: http://127.0.0.1:6806
	# github地址: https://github.com/siyuan-note/siyuan
	# docker: https://hub.docker.com/r/b3log/siyuan
	docker run -d --name siyuan \
  -v siyuan:/siyuan/workspace \
  -p 6806:6806 \
  -e PUID=1001 -e PGID=1002 \
  b3log/siyuan:v3.8.5 \
	serve \
  --workspace=/siyuan/workspace/ \
  --accessAuthCode=123456

## memos: memos docker
.PHONY: memos
memos:
	# web browser: http://127.0.0.1:5230  guest/guest
	# github地址: https://github.com/usememos/memos
	docker run -d --name memos -p 5230:5230 -v memos:/var/opt/memos neosmemo/memos:0.31

## libretv: libretv docker
.PHONY: libretv
libretv:
	# web browser: http://127.0.0.1:8899
	# github地址: https://github.com/LibreSpark/LibreTV
	docker run -d --name libretv -p 8899:8080 -e PASSWORD=123456 ghcr.io/librespark/libretv:2.12.7

## decotv: decotv docker
.PHONY: decotv
decotv:
	# web browser: http://127.0.0.1:3000
	# github地址: https://github.com/Decohererk/DecoTV
	docker run -d --name decotv \
		-p 3000:3000 \
		-v decotv-downloads:/app/.cache/ffmpeg-downloads \
  	-e PASSWORD=123456 \
  	ghcr.io/decohererk/decotv:latest

## uptime-kuma: uptime-kuma docker
.PHONY: uptime-kuma
uptime-kuma:
	# web browser: http://127.0.0.1:3001
	# github地址: https://github.com/louislam/uptime-kuma
	docker run -d --name uptime-kuma -p 3001:3001 -v uptime-kuma:/app/data louislam/uptime-kuma:2

## nezha: nezha docker
.PHONY: nezha
nezha:
	# github地址: https://github.com/nezhahq/nezha
	# 参考: https://github.com/nezhahq/scripts/blob/main/extras/docker-compose.yaml
	# web browser: http://127.0.0.1:8008
	docker run -d --name nezha -p 8008:8008 -v nezha:/dashboard/data ghcr.io/nezhahq/nezha:v2.3.13

## vocechat-server: vocechat-server docker
.PHONY: vocechat-server
vocechat-server:
	# web browser: http://127.0.0.1:3000
	# 主页: https://voce.chat/zh-CN
	# 部署的服务只能 20 个账户,只能发消息,文件。不能语音和视频。和 rocket.chat 类似,有各平台的客户端。
	docker run -d --name vocechat-server -p 3000:3000 privoce/vocechat-server:latest

## navidrome: navidrome docker
.PHONY: navidrome
navidrome:
	# web browser: http://127.0.0.1:4533
	# github地址: https://github.com/navidrome/navidrome/
	# 文档: https://www.navidrome.org/docs/installation/docker/
	# 音乐文件复制进容器: docker cp 本地文件夹或文件 容器ID或者容器名:/music
	docker run -d --name navidrome -p 4533:4533 -v navidrome:/music -v navidrome:/data -e ND_LOGLEVEL=info deluan/navidrome:latest

## screego: screego docker
.PHONY: screego
screego:
	# web browser: http://127.0.0.1:5050
	# github地址: https://github.com/screego/server
	# 部署文档:https://screego.net/#/install?id=docker  获取公网ip: curl 'https://api.ipify.org'
	# 必须使用 反向代理 通过 TLS ,共享屏幕需要使用 https 访问。WebRTC 需要真实的 TLS证书。
	# 可以使用自签名证书,使用 https 和 ip 地址访问,无法远程共享屏幕。
	# 也可绑定域名，使用 https://github.com/acmesh-official/acme.sh 申请证书, 使用 https 和域名访问
	docker run -d --name screego -p 3478:3478 -p 5050:5050 -p 50000-50200:50000-50200/udp -e SCREEGO_EXTERNAL_IP=EXTERNALIP -e SCREEGO_TURN_PORT_RANGE=50000:50200 ghcr.io/screego/server:1.12.5

## it-tools: it-tools docker
.PHONY: it-tools
it-tools:
	# web browser: http://127.0.0.1:8080
	# github地址: https://github.com/CorentinTh/it-tools
	# 官方web: https://it-tools.tech/
	docker run -d --name it-tools -p 8080:80 corentinth/it-tools:latest

## v2raya: v2raya docker
.PHONY: v2raya
v2raya:
	# web browser: http://localhost:2017
	# github地址: https://github.com/v2rayA/v2rayA
	docker run -d --name v2raya -p 2017:2017 -p 20170-20172:20170-20172 ghcr.io/v2raya/v2raya

## stirling-pdf: stirling-pdf docker
.PHONY: stirling-pdf
stirling-pdf:
	# PDF编辑器
	# web browser: http://localhost:8080
	# github地址: https://github.com/Stirling-Tools/Stirling-PDF
	docker run -d --name stirling-pdf -p 8080:8080 docker.stirlingpdf.com/stirlingtools/stirling-pdf
