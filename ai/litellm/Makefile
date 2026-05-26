# 文档 https://docs.litellm.ai/docs/proxy/docker_quick_start#pre-requisites

# 加载 .env 环境变量
ifneq (,$(wildcard ./.env))
	include .env
	export
endif

pre_run:
# 	https://ghcr.io/berriai/litellm-database
# 	docker pull ghcr.io/berriai/litellm-database:$(LITELLM_VERSION)
# 	docker pull docker.litellm.ai/berriai/litellm:$(LITELLM_VERSION)

# run
run:
	# api: http://127.0.0.1:4000/
	# ui: http://127.0.0.1:4000/ui/  默认用户名密码 admin MASTER_KEY环境变量值
	docker compose up -d
