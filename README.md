# LaTeX in Markdown for Pandoc

## Project Overview

We are building a VSCode extension that helps authors manage LaTeX code embedded in Markdown when publishing documents with Pandoc. The extension targets LaTeX fragments that appear both in YAML frontmatter and in the Markdown body, streamlining the writing flow from Markdown to PDF or native LaTeX outputs.

## Background

- Pandoc projects often keep LaTeX preambles in Markdown frontmatter (e.g., `documentclass: extarticle`).
- Inline and block-level LaTeX syntax coexists with regular Markdown prose.
- Pandoc-specific features such as YAML metadata blocks, fenced code attributes, and filters add extra structure to parse.

Despite this setup, there is limited tooling inside VSCode that understands Pandoc-flavored Markdown and offers dedicated LaTeX authoring assistance.

## Target Documents

- Pandoc-compatible Markdown files that contain YAML frontmatter and Markdown content.
- Example: `examples/example_resume.md` (resume template).

## Scope

- Provide syntax highlighting for LaTeX snippets when opening Markdown files in VSCode.
- Design the extension so it integrates safely with existing Pandoc build pipelines (scripts and CI).
- Keep broader Pandoc Markdown documents in mind for future extension and reuse.

## Roadmap

- [ ] 1. Highlight LaTeX syntax in Markdown (frontmatter and body).
- [ ] 2. Deliver LSP capabilities for LaTeX within Markdown (hover documentation and go-to-definition).
- [ ] 3. Extend LSP support to LaTeX preamble content declared in YAML frontmatter (hover documentation and go-to-definition).

## Development Outline

- Scaffold the VSCode extension (TypeScript + VS Code API).
- Evaluate parsers/tokenizers that can recognize Markdown, LaTeX, and Pandoc constructs in a unified pass.
- Investigate integration points with existing LaTeX LSP servers (e.g., texlab) and identify required customizations.
- Plan user validation to measure productivity gains during Pandoc document authoring.

## Next Actions

- Enumerate LaTeX patterns that require highlighting.
- Review VSCode language configuration and TextMate grammar options.
- Prepare test documents (including `examples/example_resume.md`) for validation.
