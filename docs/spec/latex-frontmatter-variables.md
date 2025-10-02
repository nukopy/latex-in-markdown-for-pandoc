# Pandoc Variables Notes

Last updated: 2025-10-02

- reference
  - https://pandoc.org/MANUAL.html#variables
  - @docs/notes/pandoc-user-guide.20251002.html

This memo mirrors the structure of the “Variables” chapter in the Pandoc User’s Guide. For each subsection we list the variables that are most relevant when authoring Pandoc-flavoured Markdown with LaTeX frontmatter, together with short usage notes for highlight support.

## Metadata variables

ref: https://pandoc.org/MANUAL.html#metadata-variables

- `title`, `subtitle`, `author`, `date`, `abstract` — core metadata that populate templates in every writer; values can be single scalars or lists.citeturn0search0
- `toc`, `toc-title`, `toc-depth` — toggles for a generated table of contents; combine with per-writer settings such as LaTeX’s `secnumdepth`.citeturn0search0
- `include-in-header`, `include-before`, `include-before-body`, `include-after`, `include-after-body` — raw-inclusion hooks that merge with the command-line flags `-H`, `-B`, `--include-before-body`, and `--include-after-body`.

## Language variables

ref: https://pandoc.org/MANUAL.html#language-variables

- `lang`, `dir`, `otherlangs` — control document language, text direction, and multilanguage metadata; LaTeX writers pass them to babel/polyglossia configurations.citeturn0search0
- `date`, `time`, `title`, `subtitle` — re-used with locale-sensitive formatting in certain writers.citeturn0search0

## Variables for HTML

ref: https://pandoc.org/MANUAL.html#variables-for-html

- `css`, `include-before`, `include-after` — embed additional stylesheets or raw HTML; highlight as raw blocks when `{=html}` is used.citeturn0search0
- `mathjax`, `mathml`, `html-q-tags` — math and tag toggles affecting HTML output; keep in mind when building cross-format templates.citeturn0search0

## Variables for HTML math

ref: https://pandoc.org/MANUAL.html#variables-for-html-math

- `mathjax`, `mathjaxurl`, `mathjaxconfig` — define MathJax delivery, which matters when inline LaTeX is meant for HTML+JS rendering rather than PDF.citeturn0search0
- `katex`, `katex-css`, `katex-js` — alternative KaTeX assets.citeturn0search0

## Variables for HTML slides

ref: https://pandoc.org/MANUAL.html#variables-for-html-slides

- `slide-level`, `incremental`, `revealjs-url` — common toggles for reveal.js/pptx-like decks; share the same metadata keys used by the LaTeX beamer writer.citeturn0search0
- `theme`, `transition`, `highlightjs` — theme and syntax highlight assets referenced from template variables.citeturn0search0

## Variables for Beamer slides

ref: https://pandoc.org/MANUAL.html#variables-for-beamer-slides

- `theme`, `themesoption`, `colorheme`, `fonttheme` — map to `\usetheme`, `\usecolortheme`, etc. in the beamer template; highlight them when present in YAML.citeturn0search3
- `section-titles`, `navigation`, `short-title` — control structural metadata for the beamer navigation bars.citeturn0search3

## Variables for PowerPoint

ref: https://pandoc.org/MANUAL.html#variables-for-powerpoint

- `reference-doc`, `slide-level`, `incremental` — the pptx writer reuses these to merge with reference templates.citeturn0search0
- `page-size`, `page-number` — metadata that set layout and numbering behaviour in pptx exports.citeturn0search0

## Variables for LaTeX

ref: https://pandoc.org/MANUAL.html#variables-for-latex

- `documentclass`, `classoption`, `geometry`, `papersize`, `pagestyle`, `secnumdepth`, `linestretch`, `hyperrefoptions`, `indent` — control structural layout and map directly to LaTeX commands in the default template.citeturn0search3
- `fontenc`, `fontfamily`, `mainfont`, `sansfont`, `monofont`, `mathfont`, `CJKmainfont` and their `*options`/`*fallback` counterparts — font configuration for pdflatex/xelatex/lualatex pipelines.citeturn0search3
- `header-includes`, `include-in-header`, `include-before`, `include-after` — raw hooks for injecting LaTeX preamble or postamble content; emphasise fenced `{=latex}` blocks to prevent accidental Markdown parsing.citeturn0search3turn7view0

## Variables for ConTeXt

ref: https://pandoc.org/MANUAL.html#variables-for-context

- `context`, `context-variables`, `mode` — ConTeXt-specific toggles that parallel LaTeX layout switches and can appear in YAML when targeting ConTeXt output.citeturn0search0

## Variables for wkhtmltopdf

ref: https://pandoc.org/MANUAL.html#variables-for-wkhtmltopdf

- `title`, `margin-left`, `margin-right`, `margin-top`, `margin-bottom`, `header`, `footer` — forwarded to `wkhtmltopdf` CLI options when using the `--pdf-engine=wkhtmltopdf` workflow.citeturn0search0

## Variables for man pages

ref: https://pandoc.org/MANUAL.html#variables-for-man

- `title`, `section`, `header`, `footer`, `date`, `manual`, `source` — populate roff headers and footers; maintain awareness when mixing LaTeX and man outputs from the same metadata.citeturn0search0

## Variables for Texinfo

ref: https://pandoc.org/MANUAL.html#variables-for-texinfo

- `documentlanguage`, `paragraphindent`, `fillcolumn` — Texinfo-specific typography controls.citeturn0search0
- `shorttitlepage`, `contents`, `node-files` — switch navigation and indexing features in Texinfo manuals.citeturn0search0

## Variables for Typst

ref: https://pandoc.org/MANUAL.html#variables-for-typst

- `theme`, `pagestyle`, `font`, `fontsize` — Typst writer variables, analogous to LaTeX ones, used to configure the Typst template.citeturn0search0

## Variables for ms

ref: https://pandoc.org/MANUAL.html#variables-for-ms

- `title`, `author`, `date`, `abstract`, `keywords` — ms macro package fields for troff output; many reuse metadata defaults.citeturn0search0

## Variables set automatically

ref: https://pandoc.org/MANUAL.html#variables-set-automatically

- `body`, `abstract`, `toc`, `bibliography`, `links` — Pandoc sets these while building the document; avoid redefining them manually.citeturn0search0
- `header-includes`, `include-before`, `include-after` — also populated when command-line flags are present, so metadata merges with CLI inputs.citeturn8view0
