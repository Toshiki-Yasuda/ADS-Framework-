# ADS Framework Template - 引き継ぎドキュメント

## 📋 プロジェクト概要

**ADS Framework Template** - Claude CodeなどのAIコーディングアシスタントと協調して開発を行うためのテンプレートリポジトリ。

### ADSフレームワークとは

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

## 🎯 設計思想

### Claudeの認知モデルとの融合

```
Claudeの認知フロー           ADSフレームワーク
────────────────            ─────────────────
1. 私は何者か？      ←→    ADS: 方針・価値観・品質基準
2. 何をすべきか？    ←→    AOM: タスク・優先度・担当
3. どう記録するか？  ←→    AGM: Git・履歴・協調
4. どうやるか？      ←→    EAM: 手法・パターン・最適化
```

### コンテキスト効率の原則

| 情報 | 配置場所 | 読み込みタイミング |
|------|----------|-------------------|
| プロジェクト方針 | `/CLAUDE.md` | 常時（自動） |
| 層の詳細定義 | `.claude/frameworks/` | コマンド実行時（明示的参照） |
| 実行手順 | `.claude/commands/` | スラッシュコマンド時 |
| ディレクトリ固有 | `src/CLAUDE.md` 等 | 該当ディレクトリ作業時 |

## 📁 ファイル構成

```
ads-framework-template/
├── CLAUDE.md                    # ADS層：プロジェクト方針（200行以下推奨）
├── README.md                    # リポジトリ説明
├── HANDOVER.md                  # このファイル（引き継ぎ用）
├── .gitignore
│
├── .claude/
│   ├── settings.json            # 権限設定
│   │
│   ├── frameworks/              # 詳細定義（参照用）
│   │   ├── ADS.md               # 全体統括層
│   │   ├── AOM.md               # 組織管理層
│   │   ├── AGM.md               # Git管理層
│   │   └── EAM.md               # 実行手法層
│   │
│   └── commands/                # スラッシュコマンド
│       ├── ads-decide.md        # /project:ads-decide
│       ├── aom-plan.md          # /project:aom-plan
│       ├── agm-branch.md        # /project:agm-branch
│       ├── agm-commit.md        # /project:agm-commit
│       ├── agm-pr.md            # /project:agm-pr
│       ├── agm-review.md        # /project:agm-review
│       ├── eam-research.md      # /project:eam-research
│       ├── eam-implement.md     # /project:eam-implement
│       └── eam-test.md          # /project:eam-test
│
├── docs/
│   └── CLAUDE.md                # ドキュメント作業時の指示
│
├── src/
│   └── CLAUDE.md                # ソースコード作業時の指示
│
└── tests/
    └── CLAUDE.md                # テスト作業時の指示
```

## 🔄 標準ワークフロー

```
ユーザー: 「○○を実装して」
    ↓
ADS層（CLAUDE.md自動読み込み）
    → 方針確認
    ↓
/project:aom-plan [タスク]
    → タスク分解、DAG構築
    ↓
/project:agm-branch [ブランチ名]
    → ブランチ作成
    ↓
/project:eam-implement [タスク]
    → 実装実行
    ↓
/project:eam-test [対象]
    → テスト作成・実行
    ↓
/project:agm-commit auto
    → コミット（メッセージ自動生成）
    ↓
/project:agm-pr
    → PR作成
```

## 🛠️ 使用方法

### テンプレートとして使用

```bash
# GitHub Template として使用
gh repo create my-project --template Toshiki-Yasuda/ads-framework-template

# または手動でクローン
git clone https://github.com/Toshiki-Yasuda/ads-framework-template.git my-project
cd my-project
rm -rf .git
git init
```

### カスタマイズポイント

1. **CLAUDE.md**: プロジェクト固有の情報を更新
2. **AGM.md**: チームのブランチ戦略・コミット規約に合わせる
3. **settings.json**: 許可するツールを調整

## 📚 参考資料

- [Claude Code Best Practices](https://www.anthropic.com/engineering/claude-code-best-practices)
- [Claude Code GitHub Actions](https://code.claude.com/docs/en/github-actions)
- [Model Context Protocol](https://modelcontextprotocol.io/)

## 📊 今回の検討で得られた知見

### Anthropic公式のベストプラクティス

1. **CLAUDE.mdは簡潔に**（200行以下推奨）
2. **詳細は参照で**（「詳細は .claude/frameworks/AOM.md を参照」）
3. **動的読み込みを活用**（子ディレクトリのCLAUDE.md）
4. **カスタムコマンドで再利用**（.claude/commands/）

### AGM層追加の根拠

- GitHub操作の一元管理
- ブランチ戦略の自動化
- Conventional Commits の徹底
- PR/レビューの効率化

### 調査した公式ドキュメント

- anthropics/claude-code-action
- @modelcontextprotocol/server-github
- AGENTS.md仕様（業界標準化進行中）

---

## 🔗 Claude Code Web 引き継ぎプロンプト

以下をClaude Code Webに貼り付けて開発を継続:

```
# ADS Framework Template 開発引き継ぎ

## リポジトリ
https://github.com/Toshiki-Yasuda/ads-framework-template

## 概要
Claude CodeなどのAIコーディングアシスタントと協調して開発を行うためのテンプレート。
ADS/AOM/AGM/EAMの4層構造でAIエージェントの動作を最適化。

## ファイル構成
- CLAUDE.md: プロジェクト方針（ADS層）
- .claude/frameworks/: 各層の詳細定義
- .claude/commands/: スラッシュコマンド定義
- src/tests/docs/CLAUDE.md: ディレクトリ固有指示

## 利用可能コマンド
- /project:ads-decide - 方針判断
- /project:aom-plan - タスク分解
- /project:agm-branch - ブランチ作成
- /project:agm-commit - コミット
- /project:agm-pr - PR作成
- /project:agm-review - レビュー
- /project:eam-research - 調査
- /project:eam-implement - 実装
- /project:eam-test - テスト

## 開発開始
git clone git@github.com:Toshiki-Yasuda/ads-framework-template.git
cd ads-framework-template

上記を理解した上で、開発を続けてください。
```

---

作成日: 2026-01-14
作成者: Claude（季記さんとの協働）
