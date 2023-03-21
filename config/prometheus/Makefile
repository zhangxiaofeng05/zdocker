# https://prometheus.io/docs/prometheus/latest/installation/#using-docker
# https://docs.docker.com/config/daemon/prometheus/
# https://medium.com/lucjuggery/docker-daemon-metrics-in-prometheus-7c359c7ff550

cwd  := $(shell pwd)

default: prometheus

.PHONY: prometheus
prometheus:
	# http://localhost:9090
	docker run \
	-d  \
	--name prometheus \
    -p 9090:9090 \
    -v $(cwd)/prometheus.yml:/etc/prometheus/prometheus.yml \
    prom/prometheus
