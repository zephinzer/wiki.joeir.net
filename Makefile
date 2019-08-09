IMAGE_PATH=zephinzer/knowledge

run:
	docker run \
		--volume $$(pwd)/mkdocs.yml:/app/mkdocs.yml \
		--volume $$(pwd)/docs:/app/docs \
		--publish 12345:12345 \
		$(IMAGE_PATH):latest \
		serve \
			--dev-addr=0.0.0.0:12345

build:
	docker build --tag $(IMAGE_PATH):latest .