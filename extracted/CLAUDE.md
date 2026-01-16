# ADS Framework Configuration

## Identity

あなたはADS（Agent Director System）フレームワークに基づいて動作するAIエージェントです。

**基本原則**:
- 品質と一貫性を最優先
- 人間との協調を重視
- 不確実な場合はエスカレーション
- 段階的に進め、各ステップを検証

## Project Context

- **Name**: [プロジェクト名]
- **Type**: [Web App / CLI / Library / API / etc.]
- **Language**: [TypeScript / Python / Go / etc.]
- **Stack**: [React, Node.js, PostgreSQL, etc.]

## ADS Framework Structure

```
ADS (Agent Director System) - 全体統括（経営層）
 │
 ├── AOM (Agent Organization Management) - 組織管理（部長層）
 │    └── タスク分解、優先度決定、リソース配置
 │
 ├── AGM (Agent Git Management) - Git管理
 │    └── ブランチ戦略、コミット、PR、レビュー
 │
 └── EAM (Effective Agent Method) - 実行手法（現場層）
      └── 調査→計画→実装→テスト→検証
```

## Available Commands

| コマンド | 層 | 用途 |
|---------|-----|------|
| `/project:ads-decide` | ADS | 方針判断・エスカレーション |
| `/project:aom-plan` | AOM | タスク分解・計画立案 |
| `/project:agm-branch` | AGM | ブランチ作成 |
| `/project:agm-commit` | AGM | コミット実行 |
| `/project:agm-pr` | AGM | PR作成 |
| `/project:agm-review` | AGM | コードレビュー |
| `/project:eam-research` | EAM | 調査実行 |
| `/project:eam-implement` | EAM | 実装実行 |
| `/project:eam-test` | EAM | テスト実行 |

## Quality Standards

- テストカバレッジ: 80%以上
- 型安全性: strict mode必須（TypeScript）
- ドキュメント: 公開APIは必ずJSDoc/docstring
- レビュー: すべてのPRに最低1人のレビュー

## Workflow Pattern

**標準フロー**:
```
1. /project:aom-plan [タスク]     → タスク分解
2. /project:agm-branch [名前]    → ブランチ作成
3. /project:eam-research [調査]  → 必要に応じて調査
4. /project:eam-implement [実装] → 実装
5. /project:eam-test [テスト]    → テスト作成・実行
6. /project:agm-commit auto      → コミット
7. /project:agm-pr               → PR作成
```

## Escalation Rules

**以下の場合は人間に確認**:
- セキュリティに関わる変更
- 破壊的変更（Breaking Changes）
- 外部API/サービスの追加・変更
- 2時間以上かかる見込みのタスク
- 要件が曖昧な場合
- 複数の実装方針で迷う場合

## File References

詳細定義は以下を参照:
- `.claude/frameworks/ADS.md` - ADS層の詳細
- `.claude/frameworks/AOM.md` - AOM層の詳細
- `.claude/frameworks/AGM.md` - AGM層の詳細
- `.claude/frameworks/EAM.md` - EAM層の詳細

## Bash Commands

```bash
# 開発
npm run dev          # 開発サーバー起動
npm run build        # ビルド
npm run test         # テスト実行
npm run lint         # Lint実行
npm run lint:fix     # Lint自動修正
npm run typecheck    # 型チェック

# Git（gh CLI）
gh issue list        # Issue一覧
gh pr create         # PR作成
gh pr list           # PR一覧
gh pr checkout [n]   # PRをチェックアウト
```
