# LaTeX in Markdown for Pandoc

TODO: badges: version, downloads, installs, license

Visual Studio Code extension that brings LaTeX syntax highlighting to Markdown documents processed with [Pandoc](https://pandoc.org/index.html).

## Features

TODO: frontmatter にハイライトが当たっている様子のスクショ

TODO: body にハイライトが当たっている様子のスクショ

## Requirements

- Visual Studio Code v1.99.x or later
- (optional) Cursor 1.7.x or later

## Quick start

### Installation

This extension is available for free in the [Visual Studio Code Marketplace](https://marketplace.visualstudio.com/items?itemName=nukopy.latex-in-markdown-for-pandoc).

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

## Development

### Requirements

- Node.js v22.16.x
- Visual Studio Code v1.99.x or later
- (optional) Cursor 1.7.x or later

### Setup

```sh
git clone git@github.com:nukopy/latex-in-markdown-for-pandoc.git
cd latex-in-markdown-for-pandoc
pnpm i
```

Now, you can start developing the extension.

### Build

```sh
pnpm run build
```

If successful, the extension package `dist/latex-in-markdown-for-pandoc-<version>.vsix` is created.

### Install locally for testing

Execute command `Extensions: Install from VSIX...` in VS Code (or Cursor) and select the file `dist/latex-in-markdown-for-pandoc-<version>.vsix`.

### Prepare for publishing

1. Create [Azure DevOps organization](https://learn.microsoft.com/en-us/azure/devops/organizations/accounts/create-organization?view=azure-devops)
2. Create [Personal Access Token](https://learn.microsoft.com/en-us/azure/devops/organizations/accounts/use-personal-access-tokens-to-authenticate?view=azure-devops&tabs=Windows)
   - Copy the Personal Access Token for next step
3. Create a [publisher](https://code.visualstudio.com/api/working-with-extensions/publishing-extension#create-a-publisher)

ref: [Publishing Extensions | Visual Studio Code](https://code.visualstudio.com/api/working-with-extensions/publishing-extension)

### Publish to VS Code Marketplace

- Login to VS Code Marketplace

```sh
pnpm run login -- <publisher ID>
# input Personal Access Token
```

- Edit version in `package.json`

```diff json
{
-  "version": "0.1.0"
+  "version": "0.1.1"
}
```

- Pre-release

```sh
pnpm run publish:pre
```

- Release

```sh
pnpm run publish
```

- Unpublish

```sh
pnpm run unpublish
```

## References

Thanks to the following references for inspiration:

- [Pandoc User's Guide — YAML metadata blocks and `header-includes`](https://pandoc.org/MANUAL.html#metadata-blocks)
- [Pandoc User's Guide — Variables](https://pandoc.org/MANUAL.html#variables)
- [Pandoc User's Guide — raw attribute extension (`{=latex}`)](https://pandoc.org/MANUAL.html#extension-raw_attribute)
- [Visual Studio Code Extension API — Syntax Highlight Guide (Injection Grammars)](https://code.visualstudio.com/api/language-extensions/syntax-highlight-guide#injection-grammars)
- [vscode-latex-basics/markdown-latex-combined.tmLanguage.json](https://github.com/jlelong/vscode-latex-basics/blob/main/syntaxes/markdown-latex-combined.tmLanguage.json)

## License

LaTeX in Markdown for Pandoc is under the MIT License: See [LICENSE](./LICENSE) file.
