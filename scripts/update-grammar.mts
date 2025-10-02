/**
 * This script is adapted from the original script by James Yu.
 *
 * ref: https://github.com/James-Yu/LaTeX-Workshop/blob/00b8106f6081466d26cb14891dd05a82cd60ad34/dev/update-grammar.mjs
 *
 * License: MIT
 * https://github.com/James-Yu/LaTeX-Workshop/blob/00b8106f6081466d26cb14891dd05a82cd60ad34/LICENSE.txt
 */

/* global console */

import { mkdir, writeFile } from "node:fs/promises";
import path from "node:path";
import { fileURLToPath } from "node:url";
import { download, getCommitSha } from "vscode-extend-language";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const syntaxDir = path.resolve(__dirname, "..", "syntaxes");

const latexBasicsRepo = "jlelong/vscode-latex-basics";

interface GrammarSource {
  upstreamPath: string;
  outputName?: string;
  ref?: string;
}

const grammarSources: GrammarSource[] = [
  {
    upstreamPath: "syntaxes/markdown-latex-combined.tmLanguage.json",
    outputName: "markdown-latex-combined.tmLanguage.json",
  },
];

async function ensureSyntaxDir(): Promise<void> {
  await mkdir(syntaxDir, { recursive: true });
}

async function downloadFile({
  repo,
  upstreamPath,
  outputName,
  ref = "main",
}: {
  repo: string;
  upstreamPath: string;
  outputName?: string;
  ref?: string;
}): Promise<boolean> {
  const url = `https://raw.githubusercontent.com/${repo}/${ref}/${upstreamPath}`;
  const content = await download(url);
  if (!content) {
    console.log("Cannot retrieve", url);
    return false;
  }

  const outputPath = path.join(
    syntaxDir,
    outputName ?? path.basename(upstreamPath),
  );
  await writeFile(outputPath, content);
  console.log("Updated", outputPath);
  return true;
}

async function updateGrammars(): Promise<void> {
  const sha = await getCommitSha(latexBasicsRepo);
  if (sha) {
    console.log(`Updating grammar files from ${latexBasicsRepo}@${sha}`);
  } else {
    console.log(
      "Unable to read last commit information; falling back to main branch",
    );
  }

  for (const source of grammarSources) {
    await downloadFile({ repo: latexBasicsRepo, ...source });
  }
}

async function main(): Promise<void> {
  await ensureSyntaxDir();
  await updateGrammars();
}

await main();
