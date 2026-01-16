# AGM: Agent Git Management

## 概要

AGM（Agent Git Management）は、Git/GitHubの操作を一元管理する層。
開発ワークフローの一貫性を維持し、協調作業を円滑にする。

## 責務

| 責務 | 説明 |
|------|------|
| ブランチ戦略 | 命名規則、作成タイミング、マージ方針 |
| コミット管理 | メッセージ生成、粒度制御 |
| PR管理 | 作成、説明文生成、レビュー依頼 |
| Issue管理 | トリアージ、ラベリング、アサイン |
| 履歴管理 | ログ検索、変更追跡 |

## ブランチ戦略

```
main              ← 本番環境（保護）
  │
  └── develop     ← 開発統合
        │
        ├── feature/TASK-XXX-description   # 新機能
        ├── fix/TASK-XXX-description       # バグ修正
        ├── refactor/TASK-XXX-description  # リファクタ
        ├── docs/TASK-XXX-description      # ドキュメント
        └── test/TASK-XXX-description      # テスト追加
```

### ブランチ命名規則

```
<type>/<task-id>-<short-description>

例:
feature/TASK-001-user-authentication
fix/TASK-042-login-error-handling
refactor/TASK-100-extract-utils
```

## コミット規約（Conventional Commits）

```
<type>(<scope>): <description>

[optional body]

[optional footer]
```

### Type一覧

| Type | 用途 |
|------|------|
| feat | 新機能 |
| fix | バグ修正 |
| docs | ドキュメントのみの変更 |
| style | コードの意味に影響しない変更（空白、フォーマット等） |
| refactor | バグ修正でも機能追加でもないコード変更 |
| perf | パフォーマンス改善 |
| test | テストの追加・修正 |
| chore | ビルドプロセスやツールの変更 |
| ci | CI設定の変更 |

### 例

```
feat(auth): implement JWT authentication

- Add JWT token generation
- Add token validation middleware
- Add refresh token endpoint

Closes #123
```

## PR規約

### タイトル
```
[TASK-XXX] 簡潔な説明
```

### 本文テンプレート
```markdown
## 概要
[変更内容の簡潔な説明]

## 変更内容
- [変更点1]
- [変更点2]

## テスト
- [ ] ユニットテスト追加/更新
- [ ] 手動テスト実施

## スクリーンショット（UI変更がある場合）
[画像]

## 関連Issue
Closes #XXX
```

## GitHub CLI コマンド

```bash
# Issue
gh issue create --title "タイトル" --body "本文"
gh issue list
gh issue view [番号]
gh issue close [番号]

# PR
gh pr create --title "タイトル" --body "本文"
gh pr list
gh pr view [番号]
gh pr checkout [番号]
gh pr merge [番号]

# ブランチ
gh repo clone [owner/repo]
gh repo view
```

## 自動化トリガー

| イベント | アクション |
|---------|-----------|
| PR作成 | CI実行、レビュー依頼 |
| PR更新 | CI再実行 |
| レビュー承認 | マージ可能化 |
| mainマージ | 自動デプロイ（設定時） |
| Issue作成 | 自動ラベリング（設定時） |

## マージ戦略

| ブランチ | マージ方法 |
|---------|-----------|
| feature → develop | Squash merge |
| fix → develop | Squash merge |
| develop → main | Merge commit |
| hotfix → main | Merge commit + Cherry-pick to develop |
