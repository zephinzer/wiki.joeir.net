IMAGE_PATH=zephinzer/wiki
PORT=12345

run: build
	docker run \
		--volume $$(pwd):/app \
		--publish $(PORT):$(PORT) \
		$(IMAGE_PATH):latest \
		serve \
			--dev-addr=0.0.0.0:$(PORT)

build:
	docker build --tag $(IMAGE_PATH):latest .

deploy:
	git fetch
	git fetch origin gh-pages
	docker build \
		--build-arg USER_ID=$$(id -u) \
		--tag wiki-joeir-net/dontpushme .
	docker run -it \
		--volume ~/.ssh:/home/$$(id -u)/.ssh \
		--volume $$(pwd):/app \
		--user $$(id -u) \
		wiki-joeir-net/dontpushme \
		gh-deploy

publish_from_container:
	ssh -o FingerprintHash=sha256 -o StrictHostKeyChecking=no gitlab.com
	make publish

#####################################################

serve:
	mkdocs serve --dev-addr=127.0.0.1:$(PORT)

static:
	mkdocs build -s -v -d $$(pwd)/site

publish:
	mkdocs gh-deploy

ssh:
	mkdir -p ./ssh
	ssh-keygen -t rsa -b 4096 -f ./ssh/id_rsa -q -N ""

#####################################################

visit_repo:
	open https://github.com/zephinzer/net.joeir.wiki.
