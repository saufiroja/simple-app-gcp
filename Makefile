.PHONY: run app local
run:
	@echo "Running the app in the local environment"
	@cd cmd && go run main.go

.PHONY: build docker
build:
	@echo "Building the app"
	@docker build -t app-gcp .

.PHONY: run docker
run-docker:
	@echo "Running the app in the docker environment"
	@docker run -p 8080:80 app-gcp

.PHONY: push image
push:
	@echo "Pushing the app to the docker hub"
	@docker tag app-gcp:latest saufiroja/app-gcp:latest
	@docker push saufiroja/app-gcp:latest