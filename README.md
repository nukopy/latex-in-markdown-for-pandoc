# LaTeX Highlight in Markdown for Pandoc

Visual Studio Code extension that brings LaTeX syntax highlighting to Markdown documents processed with [Pandoc](https://pandoc.org/index.html).

## Features

TODO: frontmatter にハイライトが当たっている様子のスクショ

TODO: body にハイライトが当たっている様子のスクショ

## Quick start

### Install

TODO: VS Code 拡張のインストール

### Usage

TODO: snippets を使う

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
