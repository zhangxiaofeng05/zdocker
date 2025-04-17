# github: https://github.com/rajnandan1/kener
# deployment: https://kener.ing/docs/deployment

.PHONY: deps
deps:
	mkdir database uploads

.PHONY: run
run:
# web: http://localhost:3000
	docker run -d --name kener \
  -v kener:/app/ \
	--env-file .env \
  -p 3000:3000 \
  rajnandan1/kener
