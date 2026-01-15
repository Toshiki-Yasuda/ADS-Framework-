# AGM（Agent Git Management）リサーチレポート

## 調査概要
ADSフレームワークに「GitHub/Git管理」を新層として統合するためのベストプラクティス調査

---

## 1. Anthropic公式のGitHub統合

### 1.1 Claude Code GitHub Actions
**公式ツール**: `anthropics/claude-code-action`

**主な機能**:
- `@claude` メンションでPR/Issueに自動対応
- コードレビュー・実装・バグ修正を自動化
- `CLAUDE.md` でプロジェクト規約を定義
- SSE/WebSocketなしで動作（シンプル）

**トリガー例**:
```yaml
on:
  issue_comment:
    types: [created]
  pull_request_review_comment:
    types: [created]
```

**ユースケース**:
- PRの自動レビュー
- Issue → 実装 → PR作成の自動化
- 定期レポート生成（Daily Digest）
- コードスタイル統一

### 1.2 Claude Code ベストプラクティス（公式）

**推奨ワークフロー**:
```
1. Explore（調査）→ 2. Plan（計画）→ 3. Code（実装）→ 4. Commit（コミット）
```

**Gitとの連携**:
- `gh` CLI統合でIssue/PR操作
- コミットメッセージの自動生成
- リベース・マージコンフリクト解決
- git履歴検索（「誰がこの機能を作った？」）

**CLAUDE.md の活用**:
```markdown
# Bash commands
- npm run build: Build the project

# Code style
- Use ES modules (import/export) syntax

# Workflow
- Be sure to typecheck when you're done
```

### 1.3 MCP（Model Context Protocol）

**GitHub MCP Server**:
```json
{
  "mcpServers": {
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "<YOUR_TOKEN>"
      }
    }
  }
}
```

**提供機能**:
- リポジトリ操作
- Issue/PR管理
- コード検索
- ファイル読み書き

---

## 2. 業界のベストプラクティス

### 2.1 AGENTS.md / CLAUDE.md 標準化

**背景**: 20,000以上のリポジトリで採用。OpenAI、Google、Anthropic、Cursorがサポート

**Git Workflow定義例**:
```markdown
## Branching Strategy
Pattern: `<JIRA_TICKET_NUMBER>-<brief-description>`

## Commit Guidelines
- Format: "TICKET-123 | Brief description"
- Keep commit messages concise but descriptive

## Build Process
1. ./gradlew clean
2. ./gradlew compileJava compileTestJava
3. ./gradlew spotlessApply
4. ./gradlew test
5. ./gradlew build
```

### 2.2 AI駆動のGitワークフロー

**自動化可能な操作**:
| 操作 | AI活用度 | ツール例 |
|------|---------|---------|
| ブランチ作成 | ◎ | gh, MCP |
| コミットメッセージ生成 | ◎ | Claude Code |
| PR作成・説明 | ◎ | GitHub Actions |
| コードレビュー | ◎ | Claude, CodeRabbit |
| マージ判断 | △ | 人間の承認必要 |
| リリースノート生成 | ◎ | Claude Code |
| コンフリクト解決 | ○ | Claude Code |

### 2.3 GitHub Actions + AI の組み合わせ

**PR自動レビュー構成**:
```yaml
name: AI Code Review
on:
  pull_request:
    types: [opened, synchronize]

jobs:
  review:
    runs-on: ubuntu-latest
    steps:
      - uses: anthropics/claude-code-action@v1
        with:
          anthropic_api_key: ${{ secrets.ANTHROPIC_API_KEY }}
          prompt: "Review this PR for security issues"
```

**Issue → 実装 → PR の完全自動化**:
```
1. Issue作成（人間 or 自動）
2. Claude が Issue を分析
3. ブランチ作成（feature/ISSUE-123-xxx）
4. 実装・テスト
5. PR作成（説明文自動生成）
6. レビュー（人間 or AI）
7. マージ
```

---

## 3. 先進的な事例

### 3.1 Multi-Agent Git Workflow

**Theia AI + MCP の例**:
```
Git Agent のシステムプロンプト:
- git_add, git_commit, git_create_branch
- git_diff_staged, git_diff_unstaged
- git_log, git_reset, git_status
- git_checkout, git_diff, git_show
```

**実現される自動化**:
1. ユーザーがGitHub Issueを指定
2. AIがブランチを作成
3. 実装完了後、自動コミット
4. PR作成（意味のある説明付き）

### 3.2 Graphite（Stacked PRs）

**アプローチ**: 大きなPRを小さな「スタック」に分解

**AI + Stacked PRs の利点**:
- 200行のPRなら高精度レビュー
- 2000行のPRはAIでも精度低下
- 小さい単位で反復改善

### 3.3 n8n + AI ワークフロー

**構成例**:
```
GitHub Webhook → n8n → Claude API → GitHub API
```

**ユースケース**:
- PR作成時に自動レビュー
- Issue作成時に自動ラベリング
- マージ時にSlack通知 + Changelog更新

---

## 4. AGM層の設計提案

### 4.1 位置づけ

```
ADS (Agent Director System) - 全体統括
 │
 ├── AOM (Agent Organization Management) - 組織管理
 │    └── タスク分解、エージェント割り当て、進捗監視
 │
 ├── AGM (Agent Git Management) - Git/GitHub管理 ← NEW
 │    └── ブランチ戦略、PR/Issue管理、CI/CD連携
 │
 └── EAM (Effective Agent Method) - 実行手法
      └── 調査→実装→レビューのパイプライン
```

### 4.2 AGMの責務

| 責務 | 具体的な機能 |
|------|-------------|
| **ブランチ戦略** | 命名規則、作成タイミング、マージ方針 |
| **コミット管理** | メッセージ生成、粒度制御、署名 |
| **PR管理** | 作成、レビュー依頼、自動レビュー |
| **Issue管理** | トリアージ、ラベリング、アサイン |
| **CI/CD連携** | テスト実行、デプロイトリガー |
| **履歴管理** | ログ検索、変更追跡、blame分析 |

### 4.3 AGMの実装アプローチ

**Option A: MCP Server として実装**
```json
{
  "mcpServers": {
    "agm": {
      "command": "npx",
      "args": ["-y", "@ads/agm-server"],
      "env": {
        "GITHUB_TOKEN": "<TOKEN>",
        "BRANCH_STRATEGY": "feature/<ticket>-<desc>",
        "COMMIT_FORMAT": "conventional"
      }
    }
  }
}
```

**Option B: GitHub Actions として実装**
```yaml
# .github/workflows/agm.yml
name: AGM Workflow
on:
  issues:
    types: [opened, labeled]
  pull_request:
    types: [opened, synchronize]
  
jobs:
  agm:
    uses: ads-framework/agm-action@v1
    with:
      mode: auto  # auto | review | implement
```

**Option C: CLAUDE.md 拡張として実装**
```markdown
# AGM Configuration

## Branch Strategy
- Feature: feature/<ticket>-<description>
- Bugfix: fix/<ticket>-<description>
- Release: release/v<version>

## Commit Convention
- feat: 新機能
- fix: バグ修正
- docs: ドキュメント
- refactor: リファクタリング

## PR Rules
- Draft first, then ready for review
- Require 1 approval for feature branches
- Auto-merge for documentation changes

## CI/CD Integration
- Run tests on PR open/sync
- Deploy to staging on merge to develop
- Deploy to production on merge to main
```

### 4.4 AOM × AGM の連携

```
[AOM: タスク受付]
    ↓
[AGM: ブランチ作成] feature/TASK-123-implement-login
    ↓
[EAM: 実装] Claude Code で実装
    ↓
[AGM: コミット] "feat(auth): implement login flow"
    ↓
[AGM: PR作成] 説明文自動生成
    ↓
[AOM: レビュー割り当て] reviewer: @senior-dev
    ↓
[AGM: マージ] squash merge → develop
    ↓
[AOM: 完了報告] Issue close, Slack通知
```

---

## 5. 推奨アクション

### 5.1 短期（すぐ実施可能）

1. **CLAUDE.md にGit規約を追加**
   - ブランチ命名規則
   - コミットメッセージフォーマット
   - PR作成ガイドライン

2. **Claude Code GitHub Actions 導入**
   - `@claude` でのPRレビュー
   - Issue → 実装の半自動化

3. **GitHub MCP Server 設定**
   - Claude DesktopでGitHub操作を統合

### 5.2 中期（1-2週間）

1. **AGM設計ドキュメント作成**
   - 責務の明確化
   - AOM/EAMとのインターフェース定義

2. **プロトタイプ実装**
   - カスタムMCP Server
   - または GitHub Actions workflow

3. **AOM IDE Studio への統合**
   - AGM状態の可視化
   - Git操作のUI

### 5.3 長期（1ヶ月以上）

1. **AGM SDK/ライブラリ化**
   - 再利用可能なコンポーネント
   - 設定の外部化

2. **マルチリポジトリ対応**
   - モノレポ対応
   - 依存関係管理

3. **エンタープライズ機能**
   - 監査ログ
   - 承認ワークフロー
   - セキュリティスキャン統合

---

## 6. 結論

**GitHubをADSフレームワークに統合する価値は非常に高い**

理由:
1. **開発の中心がGitHub** - コード、Issue、PR、CI/CDすべてがここに集約
2. **公式サポートが充実** - Anthropic公式のGitHub Actions、MCP Serverあり
3. **業界標準の形成** - AGENTS.md/CLAUDE.mdの標準化が進行中
4. **自動化の余地が大きい** - ブランチ作成からマージまで大半が自動化可能

**AGM層の追加により**:
- AOMがタスク管理に集中
- EAMが実装に集中
- AGMがGit/GitHub操作を一元管理

**結果として**:
- 開発者の認知負荷が下がる
- 一貫したGitワークフローが実現
- AIエージェントとの協調が円滑に

---

## 参考リンク

- [Claude Code GitHub Actions](https://code.claude.com/docs/en/github-actions)
- [Claude Code Best Practices](https://www.anthropic.com/engineering/claude-code-best-practices)
- [Model Context Protocol](https://modelcontextprotocol.io/)
- [MCP GitHub Server](https://github.com/modelcontextprotocol/servers)
- [AGENTS.md Specification](https://agents-md.org/)

---

作成日: 2026-01-14
作成者: Claude（季記さんとの協働）
