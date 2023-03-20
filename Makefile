help: Makefile
	@echo
	@echo " Choose a command run:"
	@echo
	@sed -n 's/^##//p' $< | column -t -s ':' |  sed -e 's/^/ /'

## mysql: mysql docker
.PHONY: mysql
mysql:
	docker run -d --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123456 -v mysql:/var/lib/mysql mysql:8.0

## rabbitmq: rabbitmq docker
.PHONY: rabbitmq
rabbitmq:
	docker run -d --name rabbitmq -p 15672:15672 -p 5672:5672 -v rabbitmq:/var/lib/rabbitmq rabbitmq:3.11.0-management

## jaeger: jaeger docker
.PHONY: jaeger
jaeger:
	# https://www.jaegertracing.io/
	# Jaeger UI  http://localhost:16686
	docker run -d --name jaeger \
  -e COLLECTOR_ZIPKIN_HOST_PORT=:9411 \
  -e COLLECTOR_OTLP_ENABLED=true \
  -p 6831:6831/udp \
  -p 6832:6832/udp \
  -p 5778:5778 \
  -p 16686:16686 \
  -p 4317:4317 \
  -p 4318:4318 \
  -p 14250:14250 \
  -p 14268:14268 \
  -p 14269:14269 \
  -p 9411:9411 \
  jaegertracing/all-in-one:1.43

## postgres: postgres docker
.PHONY: postgres
postgres:
	docker run -d --name postgres -p 5432:5432 -e POSTGRES_PASSWORD=123456 -e PGDATA=/var/lib/postgresql/data/pgdata -v postgres:/var/lib/postgresql/data postgres

## azuresqledge: Microsoft Azure SQL Edge docker
.PHONY: azuresqledge
azuresqledge:
	# https://mcr.microsoft.com/en-us/product/mssql/server/about mssql-server not support mac, so use it
	docker run -d --name azuresqledge -p 1433:1433 -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=12344321aA" -v azuresqledge:/var/opt/mssql-extensibility/data -v azuresqledge:/var/opt/mssql-extensibility/log -v azuresqledge:/var/opt/mssql-extensibility mcr.microsoft.com/azure-sql-edge

## httpbin: httpbin docker
.PHONY: httpbin
httpbin:
	docker run -d --name httpbin -p 80:80 kennethreitz/httpbin

## redis: redis docker
.PHONY: redis
redis:
	docker run -d --name redis -p 6379:6379 -v redis:/data redis

## rediscli: redis cli
.PHONY: rediscli
rediscli:
	docker exec -it redis redis-cli

## adminer: adminer docker
.PHONY: adminer
adminer:
	docker run -d --name adminer -p 8080:8080 adminer

## phpmyadmin: phpmyadmin docker
.PHONY: phpmyadmin
phpmyadmin:
	docker run -d --name phpmyadmin -p 8080:80 -e PMA_ARBITRARY=1 phpmyadmin

## etcd: etcd docker
.PHONY: etcd
etcd:
	docker run -d --name etcd -p 2379:2379 -p 2380:2380 -e ALLOW_NONE_AUTHENTICATION=yes -v etcd:/bitnami/etcd bitnami/etcd:latest

## mongo: mongo docker
.PHONY: mongo
mongo:
	docker run -d --name mongo -p 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=root -e MONGO_INITDB_ROOT_PASSWORD=123456 -v mongo:/data/db -v mongo:/data/configdb mongo

## mongo-express: Web-based MongoDB admin interface, MongoDB server is host
.PHONY: mongo-express
mongo-express:
	# you can also try https://www.mongodb.com/products/compass
	docker run -d --name mongo-express -p 8081:8081 -e ME_CONFIG_MONGODB_SERVER=host.docker.internal -e ME_CONFIG_MONGODB_ADMINUSERNAME=root -e ME_CONFIG_MONGODB_ADMINPASSWORD=123456 mongo-express

## elasticsearch: elasticsearch docker
.PHONY: elasticsearch
elasticsearch:
	# http://localhost:9200/  https://www.elastic.co/guide/en/elasticsearch/reference/current/security-minimal-setup.html#_enable_elasticsearch_security_features
	# Password for the 'elastic' user (at least 6 characters)
	docker run -d --name elasticsearch -p 9200:9200 -p 9300:9300 -e discovery.type=single-node -e ELASTIC_PASSWORD=123456 -e xpack.security.enabled=true -v elasticsearch:/usr/share/elasticsearch/data elasticsearch:8.6.2

## grafana: grafana docker
.PHONY: grafana
grafana:
	# default admin user credentials are admin/admin.
	docker run -d --name=grafana -p 3000:3000 grafana/grafana

## nats: NATS docker
.PHONY: nats
nats:
	docker run -d --name nats -p 4222:4222 -p 6222:6222 -p 8222:8222 nats:latest

## minio: minio docker
.PHONY: minio
minio:
	# default root credentials minioadmin:minioadmin
	# web browser http://127.0.0.1:9001
	docker run -d --name minio -p 9000:9000 -p 9001:9001 -v minio:/data minio/minio server /data --console-address ":9001"
