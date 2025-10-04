# LaTeX in Markdown for Pandoc

Visual Studio Code extension that brings LaTeX syntax highlighting to Markdown documents processed with [Pandoc](https://pandoc.org/index.html).

## Features

TODO: frontmatter にハイライトが当たっている様子のスクショ

TODO: body にハイライトが当たっている様子のスクショ

## Requirements

- Visual Studio Code v1.99.x or later

or

- Cursor 1.7.x or later

## Quick start

### Installation

TODO: VS Code 拡張のインストール

### Usage

In this extension, syntax highlight is enabled by adding the following 2 lines of comments `# ----- pandoc-latex-begin -----` and `# ----- pandoc-latex-end -----` in the frontmatter of a Pandoc-flavoured Markdown file.

After adding, the range between these comments in frontmatter is highlighted as LaTeX code. **This is a necessary step to enable syntax highlight**.

```yaml
---
# ----- pandoc-latex-begin -----

# highlighted as LaTeX code!!!

# ----- pandoc-latex-end -----
--- # <- punctuation to end frontmatter
```

Example of Markdown frontmatter that enables syntax highlight with this extension is the following. If correctly set up, LaTeX code, such as `\usepackage{graphicx}`, is highlighted.

```yaml
---
# ----- pandoc-latex-begin -----

documentclass: extarticle
papersize: a4
pagestyle: empty

geometry:
  - top=17.5mm
  - bottom=20mm
  - left=20mm
  - right=20mm

fontsize: 10pt
mainfont: "Hack Nerd Font Mono"
sansfont: "Hack Nerd Font Mono"
CJKmainfont: "Hiragino Sans W3"
monofont: "Hack Nerd Font Mono"

header-includes:
  # highlighted as LaTeX code in your editor!
  - \usepackage{xcolor}
  - \usepackage{graphicx}
  - \usepackage{titlesec}
  - \usepackage{setspace}
  - \usepackage{fontawesome5}
  - \usepackage{xfp}
  - \usepackage[normalem]{ulem}

# ----- pandoc-latex-end -----
---
```

TODO: snippets の説明 with gif

## Roadmap

- [x] 1. Highlight LaTeX syntax in Markdown
  - [x] LaTeX in Markdown frontmatter written in YAML
  - [x] LaTeX in Markdown body
- [ ] 2. Extend LSP support to LaTeX code in Markdown (hover documentation and go-to-definition).
  - [ ] LaTeX in Markdown frontmatter written in YAML
  - [ ] LaTeX in Markdown body

## Motivation

I built this extension while writing my resume with Pandoc.

I needed proper LaTeX syntax highlighting inside Markdown, both in YAML frontmatter and the body.

## References

Thanks to the following references for inspiration:

- [Pandoc User's Guide — YAML metadata blocks and `header-includes`](https://pandoc.org/MANUAL.html#metadata-blocks)
- [Pandoc User's Guide — Variables](https://pandoc.org/MANUAL.html#variables)
- [Pandoc User's Guide — raw attribute extension (`{=latex}`)](https://pandoc.org/MANUAL.html#extension-raw_attribute)
- [Visual Studio Code Extension API — Syntax Highlight Guide (Injection Grammars)](https://code.visualstudio.com/api/language-extensions/syntax-highlight-guide#injection-grammars)
- [vscode-latex-basics/markdown-latex-combined.tmLanguage.json](https://github.com/jlelong/vscode-latex-basics/blob/main/syntaxes/markdown-latex-combined.tmLanguage.json)

## License

LaTeX in Markdown for Pandoc is under the MIT License: See [LICENSE](./LICENSE) file.
