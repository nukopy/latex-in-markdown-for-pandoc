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

PDF_ENGINE ?= xelatex
OUTPUT_BASE_DIR ?= ./examples/output
OUTPUT_DIR_PDF ?= $(OUTPUT_BASE_DIR)/pdf
OUTPUT_DIR_TEX ?= $(OUTPUT_BASE_DIR)/tex

.PHONY: build build-tex

build-pdf:
	@if [ -z "$(FILE)" ]; then \
		echo "Usage: make build FILE=path/to/file.md"; \
		exit 1; \
	fi
	@if [ ! -f "$(FILE)" ]; then \
		echo "Input not found: $(FILE)"; \
		exit 1; \
	fi
	mkdir -p "$(OUTPUT_DIR_PDF)"; \
	OUTPUT_PATH="$(OUTPUT_DIR_PDF)/$(basename $(notdir $(FILE))).pdf"; \
	echo "Generating $$OUTPUT_PATH"; \
	pandoc "$(FILE)" --pdf-engine="$(PDF_ENGINE)" \
	  -o "$$OUTPUT_PATH" && \
	echo "Wrote $$OUTPUT_PATH"

build-tex:
	@if [ -z "$(FILE)" ]; then \
		echo "Usage: make tex FILE=path/to/file.md"; \
		exit 1; \
	fi
	@if [ ! -f "$(FILE)" ]; then \
		echo "Input not found: $(FILE)"; \
		exit 1; \
	fi
	mkdir -p "$(OUTPUT_DIR_TEX)"; \
	OUTPUT_PATH="$(OUTPUT_DIR_TEX)/$(basename $(notdir $(FILE))).tex"; \
	echo "Generating $$OUTPUT_PATH"; \
	pandoc "$(FILE)" -t latex \
	  -o "$$OUTPUT_PATH" && \
	echo "Wrote $$OUTPUT_PATH"

build: build-pdf build-tex
