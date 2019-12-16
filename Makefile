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
	docker build \
		--file ./tools/deployer/Dockerfile \
		--tag dontpushme .
	docker run \
		--volume ~/.ssh/id_rsa:/root/.ssh/id_rsa \
		-it dontpushme

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