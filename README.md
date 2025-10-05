# LaTeX in Markdown for Pandoc

<p align="center">
  <img src="./assets/icon.png" alt="LaTeX in Markdown for Pandoc" width="256">
</p>

[![Version badge][version-badge]][version-url]
[![Downloads badge][downloads-badge]][downloads-url]
[![Installs badge][installs-badge]][installs-url]
[![MIT license badge][mit-badge]][mit-url]

[version-badge]: https://img.shields.io/visual-studio-marketplace/v/nukopy.latex-in-markdown-for-pandoc
[version-url]: https://marketplace.visualstudio.com/items?itemName=nukopy.latex-in-markdown-for-pandoc
[downloads-badge]: https://img.shields.io/visual-studio-marketplace/d/nukopy.latex-in-markdown-for-pandoc
[downloads-url]: https://vsmarketplacebadge.apphb.com/downloads-short/nukopy.latex-in-markdown-for-pandoc.svg
[installs-badge]: https://img.shields.io/visual-studio-marketplace/i/nukopy.latex-in-markdown-for-pandoc
[installs-url]: https://marketplace.visualstudio.com/items?itemName=nukopy.latex-in-markdown-for-pandoc
[mit-badge]: https://img.shields.io/badge/license-MIT-blue.svg
[mit-url]: https://github.com/nukopy/latex-in-markdown-for-pandoc/blob/main/LICENSE

<p align="center">
  <a href="#features">Features</a>
  |
  <a href="#installation">Installation</a>
  |
  <a href="#usage">Usage</a>
  |
  <a href="#how-it-works">How it works</a>
</p>

Visual Studio Code extension that brings LaTeX syntax highlighting to Markdown documents processed with [Pandoc](https://pandoc.org/index.html).

## Features

LaTeX code in both the Markdown frontmatter and body will be highlighted with this extension.

You can keep using your favorite theme. Features are shown below:

- Highlight LaTeX syntax in Markdown for Pandoc
  - LaTeX in Markdown frontmatter written in YAML
  - LaTeX in Markdown body

### Frontmatter highlight

Frontmatter highlight in dark theme ([Atom One Dark](https://vscodethemes.com/e/akamud.vscode-theme-onedark/atom-one-dark)):

![Frontmatter highlight in dark theme](./docs/images/features-highlight-frontmatter-dark.png)

Frontmatter highlight in light theme ([Bold Light (rainglow)](https://vscodethemes.com/e/daylerees.rainglow/bold-light-rainglow)):

![Frontmatter highlight in light theme](./docs/images/features-highlight-frontmatter-light.png)

### Body highlight

Body highlight in dark theme:

![Body highlight in dark theme](./docs/images/features-highlight-body-dark.png)

Body highlight in light theme:

![Body highlight in light theme](./docs/images/features-highlight-body-light.png)

## Quickstart

### Installation

This extension is available for free in the [Visual Studio Code Marketplace](https://marketplace.visualstudio.com/items?itemName=nukopy.latex-in-markdown-for-pandoc).

If you're Cursor user, you cannot install this extension from the marketplace now (planned to be supported in the future).

However, you can install it from `.vsix` file. See the section [Install locally](#install-locally) for details.

### Usage

Once the installation is complete, LaTeX code written in the Markdown body will be highlighted. However, one more step is required to **enable highlighting LaTeX in the frontmatter**.

LaTeX syntax highlight in the frontmatter is enabled by adding the following 2 lines of YAML comments at the beginning and end of the frontmatter of a Pandoc-flavoured Markdown file.

- `# ----- pandoc-latex-begin -----`
- `# ----- pandoc-latex-end -----`

After adding these comments, the range between them in frontmatter is highlighted as LaTeX code. **This is a necessary step to enable LaTeX syntax highlight in the frontmatter**. We provide [utility snippets](#utility-snippets) to easily add these comments.

If correctly set up, LaTeX code, such as `\usepackage{graphicx}`, in the frontmatter is highlighted in your editor.

Markdown frontmatter should look like the following:

```yaml
---
# ----- pandoc-latex-begin -----

# The code below is treated as normal YAML
documentclass: extarticle
papersize: a4
pagestyle: empty
geometry:
  - top=17.5mm
  - bottom=20mm
  - left=20mm
  - right=20mm

# The code below is highlighted as LaTeX code in your editor!
header-includes:
  - \usepackage{xcolor}
  - \usepackage{graphicx}
  - \usepackage{titlesec}
  - \usepackage{setspace}

# ----- pandoc-latex-end -----
--- # <- punctuation to end frontmatter
```

### Utility snippets

This extension provides utility snippets to easily add the comments above.

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

### Install locally

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
