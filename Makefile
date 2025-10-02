# Variables
MARKDOWNLINT ?= npx markdownlint-cli2
MARKDOWN_SOURCES ?= "**/*.md"
IGNORE_SOURCES ?= "!**/node_modules/**"

# ------------------------------------------------------------
# linting, formatting
# ------------------------------------------------------------

.PHONY: lint-md fmt-md

lint-md:
	$(MARKDOWNLINT) $(MARKDOWN_SOURCES) $(IGNORE_SOURCES)

fmt-md:
	$(MARKDOWNLINT) --fix $(MARKDOWN_SOURCES) $(IGNORE_SOURCES)

# ------------------------------------------------------------
# pandoc build for E2E testing
# ------------------------------------------------------------

build:
	@echo "TODO: implement build target"

build-tex:
	@echo "TODO: implement build-tex target"
