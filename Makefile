# all: all tasks required for a complete build
.PHONY: all
all: \
	markdown-lint

BUILD_DIR := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))/build
FILES_DIR := $(BUILD_DIR)/files

UNAME := $(shell uname -s)
UNAME_LOWERCASE := $(shell uname -s | tr '[:upper:]' '[:lower:]')

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
