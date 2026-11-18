APP_DIR=app
CHART=helm/platform-api

.PHONY: test run docker-build lint terraform-fmt terraform-validate helm-lint

test:
	cd $(APP_DIR) && python -m pytest -q

run:
	cd $(APP_DIR) && python app.py

docker-build:
	docker build -t platform-api:local $(APP_DIR)

lint:
	python -m compileall -q $(APP_DIR)

terraform-fmt:
	cd terraform && terraform fmt -check -recursive

terraform-validate:
	cd terraform && terraform init -backend=false && terraform validate

helm-lint:
	helm lint $(CHART)
