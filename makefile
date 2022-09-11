# Used by `image`, `push` & `deploy` targets, override as required
IMAGE_REG ?= ghcr.io
IMAGE_REPO ?= benc-uk/python-demoapp
IMAGE_TAG ?= latest

# Used by `deploy` target, sets Azure webap defaults, override as required
AZURE_RES_GROUP ?= temp-demoapps
AZURE_REGION ?= uksouth
AZURE_SITE_NAME ?= pythonapp-$(shell git rev-parse --short HEAD)

# Used by `test-api` target
TEST_HOST ?= localhost:8000

# Don't change
SRC_DIR := .

.PHONY: help lint lint-fix image push run deploy undeploy clean test-api .EXPORT_ALL_VARIABLES
.DEFAULT_GOAL := help

help:  ## 💬 This help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

create:  ## Create virtual enviornment
	chmod +x create_venv.sh \
	&& ./create_venv.sh

install:  ## ⚙️ Install dependencies
	make create \
	&& . $(SRC_DIR)/venv/bin/activate \
	&& pip install -U pip \
	&& pip install -r requirements.txt

pre-commit:     ## 🔎 Run pre-commit hooks
	make create \
	&& make install \
	&& git add -A \
	&& pre-commit run --all-files

test:     ## 🎯 Unit tests
	make create \
	&& make install \
	&& pytest -v test_functions.py -s --disable-pytest-warnings

run:      ## 🏃 Run the server locally using Python & fastapi
	make create \
	&& make install \
	&& python $(SRC_DIR)/app.py
