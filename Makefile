# Variables
STACK_NAME = fargate-product
BUCKET_NAME = helloworldproduct
ENV ?= dev

REGISTRY_HOST = 530088275162.dkr.ecr.eu-west-1.amazonaws.com
COMMIT_ID = git rev-parse --short HEAD

# Targets

#Deploy Cloudformation
deploy-container:
	aws cloudformation create-stack \
		--stack-name $(STACK_NAME) \
		--template-body file://stack/master.yml \
		--parameters ParameterKey=NameBucket,ParameterValue=$(BUCKET_NAME) \
		--region eu-west-1

deploy-registry:
	aws cloudformation create-stack \
		--stack-name $(STACK_NAME)-registry \
		--template-body file://stack/registry.yml \
		--parameters ParameterKey=RegistryName,ParameterValue=$(STACK_NAME)-registry \
					ParameterKey=Environment,ParameterValue=$(ENV) \
		--region eu-west-1

push-images:
	docker tag 

#Docker
build:
	docker build -f docker/Dockerfile -t fargate_python .

tag:
	docker tag fargate-python:latest $(REGISTRY_HOST)/fargate-python:latest

commit:
	#$commitId = git rev-parse HEAD
	$(COMMIT_ID)
	if [ $? -eq 0 ]; then
		echo OK
	else
		echo "first commit"
	fi