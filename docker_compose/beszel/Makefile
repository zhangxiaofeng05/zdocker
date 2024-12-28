## beszel: beszel docker
.PHONY: beszel
beszel:
	# web browser: http://127.0.0.1:8090
	# github地址: https://github.com/henrygd/beszel
	# 添加新客户端 名称: localhost  主机/IP: host.docker.internal 更新docker-compose.yml文件,启动 AGENT 服务,再添加客户端
	# 文档: https://beszel.dev/zh/guide/getting-started
	docker run -d --name beszel -p 8090:8090 -v beszel:/beszel_data henrygd/beszel:0.9

## beszel_agent: beszel agent docker
beszel_agent:
	docker compose -p beszel_agent up -d
