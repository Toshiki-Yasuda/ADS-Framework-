# ADS Framework Template

AIエージェント開発のための統合フレームワーク「ADS（Agent Director System）」のテンプレートリポジトリです。

## 🎯 概要

ADSフレームワークは、Claude CodeなどのAIコーディングアシスタントと協調して開発を行うための方法論とファイル構成を提供します。

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

## 📁 ファイル構成

```
project-root/
│
├── CLAUDE.md                    # ADS層：プロジェクト全体の方針
│
├── .claude/
│   ├── settings.json            # 権限・ツール設定
│   │
│   ├── commands/                # カスタムスラッシュコマンド
│   │   ├── ads-decide.md        # ADS: 方針判断
│   │   ├── aom-plan.md          # AOM: タスク分解・計画
│   │   ├── agm-branch.md        # AGM: ブランチ作成
│   │   ├── agm-commit.md        # AGM: コミット
│   │   ├── agm-pr.md            # AGM: PR作成
│   │   ├── agm-review.md        # AGM: コードレビュー
│   │   ├── eam-research.md      # EAM: 調査
│   │   ├── eam-implement.md     # EAM: 実装
│   │   └── eam-test.md          # EAM: テスト
│   │
│   └── frameworks/              # フレームワーク詳細定義
│       ├── ADS.md
│       ├── AOM.md
│       ├── AGM.md
│       └── EAM.md
│
├── docs/
│   └── CLAUDE.md                # ドキュメント作業時の追加指示
│
├── src/
│   └── CLAUDE.md                # ソースコード作業時の追加指示
│
└── tests/
    └── CLAUDE.md                # テスト作業時の追加指示
```

## 🚀 使い方

### 1. テンプレートとして使用

```bash
# このリポジトリをテンプレートとして新規プロジェクト作成
gh repo create my-project --template Toshiki-Yasuda/ads-framework-template

# または手動でコピー
git clone https://github.com/Toshiki-Yasuda/ads-framework-template.git my-project
cd my-project
rm -rf .git
git init
```

### 2. CLAUDE.md をカスタマイズ

ルートの `CLAUDE.md` を開き、以下を更新:

```markdown
## Project Context

- **Name**: [あなたのプロジェクト名]
- **Type**: [Web App / CLI / Library / etc.]
- **Language**: [TypeScript / Python / etc.]
- **Stack**: [React, Node.js, etc.]
```

### 3. Claude Code で開発開始

```bash
# Claude Code を起動
claude

# タスクを計画
/project:aom-plan ユーザー認証機能を実装

# ブランチ作成
/project:agm-branch feature/TASK-001-auth

# 実装
/project:eam-implement TASK-001

# テスト
/project:eam-test auth.ts

# コミット
/project:agm-commit auto

# PR作成
/project:agm-pr
```

## 📋 コマンド一覧

| コマンド | 層 | 説明 |
|---------|-----|------|
| `/project:ads-decide` | ADS | 方針判断・エスカレーション判定 |
| `/project:aom-plan` | AOM | タスクを実行可能な単位に分解 |
| `/project:agm-branch` | AGM | 命名規則に従ったブランチ作成 |
| `/project:agm-commit` | AGM | Conventional Commitsでコミット |
| `/project:agm-pr` | AGM | PR作成と説明文生成 |
| `/project:agm-review` | AGM | コードレビュー実行 |
| `/project:eam-research` | EAM | 調査・分析の実行 |
| `/project:eam-implement` | EAM | 実装の実行 |
| `/project:eam-test` | EAM | テスト作成・実行 |

## 🔧 カスタマイズ

### ブランチ戦略の変更

`.claude/frameworks/AGM.md` を編集:

```markdown
## ブランチ戦略

main
  └── feature/*
  └── fix/*
```

### コミット規約の変更

`.claude/commands/agm-commit.md` を編集して、チームの規約に合わせる。

### プロジェクト固有の指示追加

`src/CLAUDE.md` や `docs/CLAUDE.md` に、ディレクトリ固有の指示を追加。

## 📚 フレームワーク詳細

各層の詳細は以下を参照:

- [ADS.md](.claude/frameworks/ADS.md) - 全体統括層
- [AOM.md](.claude/frameworks/AOM.md) - 組織管理層
- [AGM.md](.claude/frameworks/AGM.md) - Git管理層
- [EAM.md](.claude/frameworks/EAM.md) - 実行手法層

## 🤝 Contributing

1. Fork
2. Feature branch作成
3. 変更をコミット
4. PR作成

## 📄 License

MIT

## 👤 Author

安田季記 / AY Consulting
