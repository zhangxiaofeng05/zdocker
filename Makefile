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
