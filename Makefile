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
	docker run -d --name rabbitmq -p 15672:15672 -p 5672:5672 rabbitmq:3.11.0-management

## postgres: postgres docker
.PHONY: postgres
postgres:
	docker run -d --name postgres -p 5432:5432 -e POSTGRES_PASSWORD=123456 -v postgresql:/var/lib/postgresql postgres

