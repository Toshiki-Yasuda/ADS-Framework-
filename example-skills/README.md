# ADS Framework - Example Skills

個人開発者向けのClaude Code Skillsサンプル集

## 📚 概要

このディレクトリには、ADS Frameworkの個人開発版で使用できるSkillsのサンプルが含まれています。

**Skillsとは？**
- Claude Codeの公式機能で、再利用可能なワークフローや知識を定義
- `~/.claude/skills/` に配置することで、全プロジェクトで共通利用
- プロジェクト固有のCLAUDE.mdとは独立して管理

## 🚀 使い方

### ステップ1: Skillsをインストール

```bash
# 個人用Skillsディレクトリにコピー
mkdir -p ~/.claude/skills
cp -r solo-dev-workflow ~/.claude/skills/

# または、シンボリックリンクを作成
ln -s /path/to/ADS-Framework-/example-skills/solo-dev-workflow ~/.claude/skills/
```

### ステップ2: Skillsが認識されていることを確認

```bash
# Claude Codeでスキル一覧を確認
claude --list-skills

# または、Claude Code内で
/skills
```

出力例:
```
Available Skills:
- solo-dev-workflow (個人開発者向けの効率的な開発ワークフロー)
```

### ステップ3: Skillsを使用

Skillsは以下の2つの方法で使用できます:

#### 方法A: 自動適用（推奨）
Claude Codeが自動的に適切なSkillを判断して適用します。

```bash
cd /path/to/your/project
claude "ユーザー認証機能を実装して"
# → solo-dev-workflow が自動的に適用される
```

#### 方法B: 明示的に指定
特定のSkillを明示的に指定することもできます。

```bash
# Skill名を指定（未実装の可能性あり - Anthropic公式ドキュメント確認推奨）
claude --skill solo-dev-workflow "タスクを実行"
```

## 📁 含まれるSkills

### 1. solo-dev-workflow

**概要**: 個人開発者向けの5ステップ開発ワークフロー

**含まれる内容**:
- タスク実装の5ステップ（調査→計画→実装→テスト→コミット）
- Git運用ルール（ブランチ戦略、Conventional Commits）
- エラーハンドリングパターン
- パフォーマンス最適化ガイドライン
- セキュリティチェックリスト
- トラブルシューティング

**適用タイミング**:
- 新機能の実装
- バグ修正
- リファクタリング
- テスト追加

**ファイル**:
- `solo-dev-workflow/SKILL.md` - メインSkill定義（約500行）

**使用例**:
```bash
# 新機能実装
claude "JWTトークン認証を実装して"
→ 5ステップワークフローが自動適用
→ テスト作成、Conventional Commits形式でコミット

# バグ修正
claude "getUserData()のnullチェックを追加して"
→ 調査→修正→テスト→コミットの流れで実行

# リファクタリング
claude "utils/date.tsをリファクタリングして"
→ 既存テスト確認→段階的変更→テスト確認の流れ
```

## 🎯 Skillsを使うメリット

### 1. DRY原則（Don't Repeat Yourself）
```
❌ Skillsなし:
プロジェクトA/CLAUDE.md に開発フロー記述（200行）
プロジェクトB/CLAUDE.md に開発フロー記述（200行）
プロジェクトC/CLAUDE.md に開発フロー記述（200行）
→ 同じ内容を3回記述、修正も3回必要

✅ Skillsあり:
~/.claude/skills/solo-dev-workflow/SKILL.md（500行）
プロジェクトA,B,C の CLAUDE.md は超軽量（50行）
→ 1箇所の修正で全プロジェクトに反映
```

### 2. プロジェクトCLAUDE.mdの軽量化
```
Before:
CLAUDE.md: 250行（ワークフロー詳細含む）

After (Skillsに分離):
CLAUDE.md: 50行（プロジェクト固有情報のみ）
~/.claude/skills/solo-dev-workflow/SKILL.md: 500行（全プロジェクト共通）
```

### 3. 一貫性の向上
```
全プロジェクトで同じワークフローを適用
→ コミットメッセージ形式が統一
→ テスト品質が統一
→ コードレビューが容易
```

## 📊 Skillsと CLAUDE.md の使い分け

| 内容 | 配置場所 | 例 |
|------|---------|-----|
| **プロジェクト固有情報** | `CLAUDE.md` | プロジェクト概要、よく使うコマンド、ディレクトリ構造 |
| **開発ワークフロー** | `~/.claude/skills/` | 5ステップ開発フロー、Git運用ルール |
| **コーディング規約** | `CLAUDE.md` または `Skills` | 言語固有ならCLAUDE.md、汎用的ならSkills |
| **エラーハンドリング** | `~/.claude/skills/` | パターンは共通なのでSkills |
| **セキュリティ** | `~/.claude/skills/` | チェックリストは共通なのでSkills |

### 具体例: TypeScriptプロジェクト

**CLAUDE.md（50行）**:
```markdown
# My Awesome App

## プロジェクト概要
ユーザー管理アプリ

## よく使うコマンド
- `npm run dev` - 開発サーバー起動
- `npm test` - テスト実行

## ディレクトリ構造
src/
├── components/
├── hooks/
└── utils/

## プロジェクト固有ルール
- APIレスポンスは `ApiResponse<T>` でラップ
- エラーは `AppError` クラスを継承
```

**~/.claude/skills/solo-dev-workflow/SKILL.md（500行）**:
```markdown
- 5ステップワークフロー
- Git運用ルール
- エラーハンドリングパターン
- パフォーマンス最適化
- セキュリティチェックリスト
（全プロジェクト共通の詳細なガイド）
```

## 🔧 カスタマイズ方法

### 個人用にカスタマイズする

1. **Skillsをコピー**
   ```bash
   cp -r solo-dev-workflow ~/.claude/skills/my-workflow
   ```

2. **SKILL.mdを編集**
   ```bash
   vim ~/.claude/skills/my-workflow/SKILL.md
   ```

3. **変更例**:
   ```markdown
   # 自分のコミットスタイルに変更
   ## コミットメッセージ
   - 日本語でコミット: `feat: ユーザー認証を実装`
   - 絵文字を使用: `✨ feat(auth): implement login`

   # 自分のテスト基準に変更
   ## カバレッジ目標
   - 関数カバレッジ: 90%以上（より厳密に）
   ```

### 複数のSkillsを作成

```bash
~/.claude/skills/
├── solo-dev-workflow/       # 基本ワークフロー
│   └── SKILL.md
├── frontend-react/          # React固有のルール
│   └── SKILL.md
├── backend-nodejs/          # Node.js/Express固有のルール
│   └── SKILL.md
└── security-audit/          # セキュリティ監査用
    └── SKILL.md
```

各プロジェクトで適切なSkillが自動選択されます。

## 📖 公式ドキュメント

Skillsの詳細は、Anthropic公式ドキュメントを参照:
- [Claude Code Skills Documentation](https://code.claude.com/docs/en/skills.md)
- [Claude Code Memory Documentation](https://code.claude.com/docs/en/memory.md)

## 🆚 比較: Skills vs プロジェクトCLAUDE.md

### Skillsを使うべき場合
- ✅ 複数のプロジェクトで再利用したい
- ✅ 開発ワークフローが確立している
- ✅ チーム全体で統一したい（共有Skillsとして）

### プロジェクトCLAUDE.mdを使うべき場合
- ✅ プロジェクト固有の情報（API仕様、環境変数等）
- ✅ 1回限りのルール
- ✅ 頻繁に変更される情報

### 両方を組み合わせる（推奨）
```
~/.claude/skills/solo-dev-workflow/  ← 共通ワークフロー（不変）
your-project/CLAUDE.md               ← プロジェクト固有情報（可変）
```

## 💡 ベストプラクティス

### 1. Skillsは安定してから作成
```
新しいワークフローを試す段階:
→ CLAUDE.md に記述

2-3プロジェクトで使って安定したら:
→ Skills に移行
```

### 2. Skillsのバージョン管理
```markdown
---
name: solo-dev-workflow
version: 1.0.0  ← バージョンを明記
---
```

変更履歴をコメントで残す:
```markdown
## 変更履歴
- v1.0.0 (2026-01-15): 初版
- v1.1.0 (2026-02-01): テストカバレッジ目標を80%→85%に変更
```

### 3. Skillsのドキュメント化
```markdown
## このSkillを使用すると
- 自動的に5ステップワークフローが適用されます
- Conventional Commits形式でコミットされます
- カバレッジ80%以上のテストが作成されます
```

## 🤔 よくある質問

### Q1: Skillsとカスタムコマンドの違いは？
**A**:
- **Skills**: Anthropic公式機能、全プロジェクトで再利用
- **カスタムコマンド (`.claude/commands/`)**: 非公式、プロジェクト固有

**推奨**: Anthropic公式のSkillsを使用してください。

### Q2: Skillsはいつ適用される？
**A**: Claude Codeが文脈から自動判断するか、明示的に指定します。

### Q3: 複数のSkillsが競合したら？
**A**: Claude Codeが最も関連性の高いSkillを選択します。

### Q4: Skillsを無効化するには？
**A**: `~/.claude/skills/` から削除またはリネーム（例: `solo-dev-workflow.disabled/`）

## 📝 次のステップ

1. **Skillsをインストール**
   ```bash
   cp -r solo-dev-workflow ~/.claude/skills/
   ```

2. **既存プロジェクトで試す**
   ```bash
   cd /path/to/your/project
   claude "小さなバグ修正をして"
   ```

3. **自分用にカスタマイズ**
   ```bash
   vim ~/.claude/skills/solo-dev-workflow/SKILL.md
   ```

4. **複数プロジェクトで活用**
   - 新規プロジェクトを作成
   - CLAUDE.mdは最小限に
   - Skillsで共通ワークフローを適用

---

**作成日**: 2026-01-15
**バージョン**: 1.0.0
**ベース**: Anthropic公式Skills仕様準拠
