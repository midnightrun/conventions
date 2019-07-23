# all: all tasks required for a complete build
.PHONY: all
all: \
	circleci-config-validate \
	markdown-lint

BUILD_DIR := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))/build
FILES_DIR := $(BUILD_DIR)/files

UNAME := $(shell uname -s)
UNAME_LOWERCASE := $(shell uname -s | tr '[:upper:]' '[:lower:]')

CIRCLECI_VERSION := 0.1.5725
CIRCLECI_DIR := $(FILES_DIR)/circleci/$(CIRCLECI_VERSION)
CIRCLECI := $(CIRCLECI_DIR)/circleci

$(CIRCLECI):
	mkdir -p $(dir $@)
	curl -s -L -o $(CIRCLECI_DIR)/archive.tar.gz \
		https://github.com/CircleCI-Public/circleci-cli/releases/download/v$(CIRCLECI_VERSION)/circleci-cli_$(CIRCLECI_VERSION)_$(UNAME_LOWERCASE)_amd64.tar.gz
	tar xzf $(CIRCLECI_DIR)/archive.tar.gz -C $(CIRCLECI_DIR) --strip 1
	chmod +x $@
	touch $@

# circleci-config-validate: validate the CircleCI build config
.PHONY: circleci-config-validate
circleci-config-validate: $(CIRCLECI)
	$(CIRCLECI) config validate

PRETTIER_VERSION := 1.18.2
PRETTIER_DIR := $(FILES_DIR)/prettier/$(PRETTIER_VERSION)
PRETTIER := $(PRETTIER_DIR)/node_modules/.bin/prettier

$(PRETTIER):
	npm install --no-save --no-audit --prefix $(PRETTIER_DIR) prettier@$(PRETTIER_VERSION)
	chmod +x $@
	touch $@

# markdown-lint: lint Markdown files with markdownlint
.PHONY: markdown-lint
markdown-lint: $(PRETTIER)
	$(PRETTIER) --check **/*.md  --parser markdown
