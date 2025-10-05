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
		echo "Usage: make build-tex FILE=path/to/file.md"; \
		exit 1; \
	fi
	@if [ ! -f "$(FILE)" ]; then \
		echo "Input not found: $(FILE)"; \
		exit 1; \
	fi
	mkdir -p "$(OUTPUT_DIR_TEX)"; \
	OUTPUT_PATH="$(OUTPUT_DIR_TEX)/$(basename $(notdir $(FILE))).tex"; \
	echo "Generating $$OUTPUT_PATH"; \
	pandoc "$(FILE)" -s -t latex \
	  -o "$$OUTPUT_PATH" && \
	echo "Wrote $$OUTPUT_PATH"

build: build-pdf build-tex

# ------------------------------------------------------------
# misc
# ------------------------------------------------------------

OUTPUT_DIR_GIF ?= ./assets

# usage: make mov-to-gif FILE="assets/my-movie.mov"
# ref: https://qiita.com/yusuga/items/ba7b5c2cac3f2928f040#%E6%89%8B%E8%BB%BD%E3%81%AB%E7%B6%BA%E9%BA%97%E3%81%AAgif%E3%82%92%E4%BD%9C%E3%82%8A%E3%81%9F%E3%81%84
mov-to-gif:
	@if [ -z "$(FILE)" ]; then \
		echo "Usage: make mov-to-gif FILE=path/to/file.mov"; \
		exit 1; \
	fi
	@if [ ! -f "$(FILE)" ]; then \
		echo "Input not found: $(FILE)"; \
		exit 1; \
	fi

	# create dir
	mkdir -p "$(OUTPUT_DIR_GIF)"

	# get output path
	OUTPUT_PATH="$(OUTPUT_DIR_GIF)/$(basename $(notdir $(FILE))).gif"; \
	echo "Generating $$OUTPUT_PATH"; \
	ffmpeg -i $(FILE) \
		-filter_complex "[0:v] fps=10,scale=640:-1,split [a][b];[a] palettegen [p];[b][p] paletteuse" \
		$$OUTPUT_PATH
	echo "Wrote $$OUTPUT_PATH"
