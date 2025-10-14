run:
	# web browser: (客户端连接也使用这个url) http://127.0.0.1:8000
	# github地址: https://github.com/snailyp/gemini-balance
	docker run -d --name gemini-balance \
		-p 8000:8000 \
		-e API_KEYS='["your-gemini-api-key-1","your-gemini-api-key-2"]' \
		-e ALLOWED_TOKENS='["your-access-token-1","your-access-token-2"]' \
		-e DATABASE_TYPE=sqlite \
		-e SQLITE_DATABASE=default_db \
		-e TZ=Asia/Shanghai \
		-v ./data:/app/data \
		ghcr.io/snailyp/gemini-balance:latest