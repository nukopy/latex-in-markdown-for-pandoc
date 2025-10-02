# LaTeX in Markdown for Pandoc

## プロジェクト概要

Pandoc を利用して Markdown から PDF や LaTeX 文書を生成する際に、Markdown 内に散在する LaTeX コードを効率的に扱える VSCode 拡張を開発する。本プロジェクトは frontmatter (YAML) と本文双方に現れる LaTeX 記法を認識し、Pandoc 文書作成のワークフローを支援することを目的とする。

## 背景

- Markdown frontmatter による LaTeX プリアンブル管理 (例: `documentclass: extarticle`)
- 本文中のインラインおよびブロック LaTeX 記法の共存
- Pandoc の拡張書式 (YAML メタデータ、fenced code block、フィルタ) との併用

この構造下での LaTeX コーディングを補助する VSCode ツールが不足している。

## 対象ドキュメント

- YAML frontmatter と本文を含む Pandoc 互換 Markdown
- 例: `examples/example_resume.md` (レジュメテンプレート)

## 範囲

- VSCode 上で Markdown ファイルを開いた際の LaTeX スニペットのハイライト
- 既存の Pandoc ビルドフロー (スクリプトや CI) へ安全に組み込める拡張の設計
- 将来的には他の Pandoc 用 Markdown ファイルにも適用可能な一般化を視野に入れる

## ロードマップ

- [ ] 1. Markdown (frontmatter・本文) 中の LaTeX 記法ハイライト対応
- [ ] 2. Markdown 内 LaTeX 記法の LSP サポート (ホバーでのドキュメント表示、定義ジャンプ)
- [ ] 3. frontmatter に記述された YAML プリアンブルの LSP サポート (ホバーでのドキュメント表示、定義ジャンプ)

## 想定する開発アウトライン

- VSCode 拡張のスキャフォールド作成 (TypeScript + VS Code API)
- Markdown/LaTeX/Pandoc の構文解析に適したパーサとトークナイズ戦略の検討
- 既存 LaTeX LSP (例: texlab) との連携ポイントやカスタム拡張点の評価
- Pandoc ドキュメント作成時のコーディング効率向上を測定するユーザテスト設計

## 次のアクション

- ハイライト対象となる LaTeX パターンの洗い出し
- VSCode の language configuration / TextMate grammar の調査
- サンプルドキュメントに対する検証用テストケースの整備
