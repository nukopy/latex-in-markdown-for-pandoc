/*---------------------------------------------------------------------------------------------
 *  Copyright (c) Microsoft Corporation. All rights reserved.
 *  Licensed under the MIT License. See License.txt in the project root for license information.
 *--------------------------------------------------------------------------------------------*/

import { writeFileSync } from "node:fs";
import { join } from "node:path";

const BASE_URL =
  "https://raw.githubusercontent.com/microsoft/vscode/refs/heads/main/extensions";

interface TestFixturesTmLanguageJson {
  readonly scopeName: string;
  readonly url: string;
}

// fixtures of TextMate syntaxes (.tmLanguage.json) required by package.test.json
// syntaxes downloaded from https://github.com/microsoft/vscode/tree/main/extensions
const TEST_FIXTURES_TMLANGUAGE_JSON: TestFixturesTmLanguageJson[] = [
  {
    scopeName: "text.tex.latex",
    url: `${BASE_URL}/latex/syntaxes/LaTeX.tmLanguage.json`,
  },
  {
    scopeName: "text.html.markdown",
    url: `${BASE_URL}/markdown-basics/syntaxes/markdown.tmLanguage.json`,
  },
  {
    scopeName: "text.html.basic",
    url: `${BASE_URL}/html/syntaxes/html.tmLanguage.json`,
  },
];

// output
const OUTPUT_DIR = join(__dirname, "..", "tests", "fixtures", "syntaxes");

async function main() {
  for (const fixture of TEST_FIXTURES_TMLANGUAGE_JSON) {
    try {
      const response = await fetch(fixture.url);
      const data = await response.json();
      writeFileSync(
        join(OUTPUT_DIR, `${fixture.scopeName}.tmLanguage.json`),
        JSON.stringify(data, null, 2),
      );
      console.log(`Updated .tmLanguage.json: scopeName=${fixture.scopeName}`);
    } catch (error) {
      console.error(`Failed to update ${fixture.scopeName}: ${error}`);
    }
  }
}

(async () => {
  await main();
})();
