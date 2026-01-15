# クイックスタート: 5分で始めるADS Framework Solo Edition

このガイドでは、実際のタスクを通じてフレームワークの使い方を体験します。

## 前提条件

- Claude Code CLI がインストール済み
- Git、Node.js（または使用する言語）がインストール済み
- 5分の時間

## ステップ1: セットアップ（30秒）

```bash
# プロジェクトディレクトリで
mkdir -p .claude
cp path/to/CLAUDE.md .claude/CLAUDE.md

# または、このリポジトリから直接
cp ads-framework-solo-minimal/CLAUDE.md .claude/CLAUDE.md
```

**確認**: `.claude/CLAUDE.md` が存在することを確認
```bash
ls -la .claude/
```

## ステップ2: 最初のタスク（4分）

実際に簡単なタスクを実行してみましょう。

### 例: ユーティリティ関数の作成

**タスク**: 日付をフォーマットする関数を作成

```bash
claude "src/utils/date.ts にISO8601形式の日付を 'YYYY-MM-DD' 形式に変換する関数を作成して"
```

### Claude Codeが自動的に行うこと

フレームワークに従って、Claude Codeは以下を実行します:

1. **調査フェーズ**
   - 既存の `src/utils/` を確認
   - 類似の関数がないかチェック
   - 依存関係を確認

2. **計画フェーズ**
   - 変更ファイルをリストアップ
   - 実装方針を説明
   - エスカレーション判定（この場合は不要）

3. **実装フェーズ**
   ```typescript
   // src/utils/date.ts
   export function formatDate(isoDate: string): string {
     const date = new Date(isoDate);
     const year = date.getFullYear();
     const month = String(date.getMonth() + 1).padStart(2, '0');
     const day = String(date.getDate()).padStart(2, '0');
     return `${year}-${month}-${day}`;
   }
   ```

4. **テストフェーズ**
   ```typescript
   // src/utils/__tests__/date.test.ts
   import { formatDate } from '../date';

   describe('formatDate', () => {
     it('should format ISO8601 to YYYY-MM-DD', () => {
       expect(formatDate('2024-03-15T10:30:00Z')).toBe('2024-03-15');
     });
   });
   ```

5. **コミットフェーズ**
   - `git status` で確認
   - `npm test` 実行
   - Conventional Commits形式でコミット:
   ```
   feat(utils): add date formatting function

   Add formatDate() to convert ISO8601 dates to YYYY-MM-DD format.
   Includes unit tests with 100% coverage.
   ```

## ステップ3: エスカレーション判定の体験

次に、エスカレーションが必要なケースを試します。

```bash
claude "ユーザー認証システムにJWT認証を追加して"
```

### Claude Codeの反応

フレームワークの**エスカレーションチェックリスト**に従い、以下を検出:
- ✅ セキュリティ関連（認証）
- ✅ 外部ライブラリ追加（JWT）

**結果**: 実装前に確認を求めてきます:

```
⚠️ エスカレーションチェックリスト
以下の項目に該当するため、実装前に確認させてください:

- [x] セキュリティ関連か（認証、暗号化、権限、API秘密鍵）
- [x] 外部サービス連携追加か（新しいAPIキー、OAuth等）

実装方針:
1. jsonwebtoken ライブラリを使用
2. 環境変数でシークレットキーを管理
3. httpOnly cookieでトークン保存

この方針で進めてよろしいですか？
```

これにより、重要な変更で事前確認できます。

## ステップ4: 大規模タスクの体験

2時間以上かかるタスクでは、自動的にYAML形式で分解されます。

```bash
claude "ECサイトのショッピングカート機能を実装して"
```

### Claude Codeの反応

**タスク分解YAML**を自動生成:
```yaml
goal: ショッピングカート機能の実装
estimated_hours: 4

tasks:
  - id: 1
    title: データモデル設計（Cart, CartItem）
    estimated_minutes: 30
    dependencies: []

  - id: 2
    title: カートAPI実装（CRUD操作）
    estimated_minutes: 60
    dependencies: [1]

  - id: 3
    title: カート永続化（LocalStorage/DB）
    estimated_minutes: 45
    dependencies: [2]

  - id: 4
    title: UIコンポーネント作成
    estimated_minutes: 60
    dependencies: [2]

  - id: 5
    title: 統合テスト
    estimated_minutes: 45
    dependencies: [3, 4]
```

**エスカレーション判定**: 合計4時間 → **人間に確認を求めます**

## フレームワークの主要機能まとめ

### ✅ 自動で守られること

1. **コード品質**
   - Lint、型チェック、テスト実行を自動確認
   - カバレッジ目標（80%以上）を推奨

2. **セキュリティ**
   - 秘密情報のハードコード検出
   - SQLインジェクション、XSSパターンの警告

3. **Git運用**
   - Conventional Commits形式の強制
   - コミット前チェックリスト実行

4. **エスカレーション**
   - セキュリティ・金銭・DB変更を自動検出
   - 2時間以上のタスクで確認要求

### 📋 手動で行うこと

1. **プロジェクト固有設定**
   - CLAUDE.md の「よく使うコマンド」セクションを編集
   - ディレクトリ構造を実際の構成に合わせる

2. **大規模タスク管理**
   - 2時間超のタスクは人間が最終判断
   - タスク分解YAMLをレビュー

## トラブルシューティング

### Q: Claude CodeがCLAUDE.mdを読まない

**A**: `.claude/CLAUDE.md` の配置を確認
```bash
ls -la .claude/CLAUDE.md
# 存在しない場合は配置
mkdir -p .claude && cp path/to/CLAUDE.md .claude/
```

### Q: エスカレーション判定が厳しすぎる

**A**: CLAUDE.md の「エスカレーション条件」セクションを調整
```markdown
## エスカレーション条件

### 必須エスカレーション（調整可能）
- 🔐 セキュリティ関連の変更
- ⏱️ 4時間以上かかる見積もり  # 2時間から変更
```

### Q: テストカバレッジ目標を変更したい

**A**: CLAUDE.md の「開発ワークフロー > 4. テスト」を編集
```markdown
**カバレッジ目標**:
- 関数: 70%以上  # 80%から変更
- 分岐: 65%以上  # 75%から変更
```

## 次のステップ

- [README.md](./README.md) - 詳細な機能説明
- [CLAUDE.md](./CLAUDE.md) - 完全なガイドライン
- [Full版との比較](./README.md#-full版との比較) - チーム開発用途の検討

## ヒント

### プロジェクトカスタマイズ

実際のプロジェクトでは、CLAUDE.mdの以下を編集:

1. **「よく使うコマンド」セクション**
   ```markdown
   ## よく使うコマンド
   ```bash
   # 開発
   npm run dev          # 開発サーバー起動
   npm run build        # 本番ビルド

   # あなたのプロジェクト固有コマンドを追加
   npm run db:migrate   # DBマイグレーション
   npm run seed         # テストデータ投入
   ```

2. **「ディレクトリ構造」セクション**
   ```markdown
   ### ディレクトリ構造
   ```
   src/
   ├── features/       # あなたのプロジェクト構造
   ├── shared/
   └── ...
   ```
   ```

3. **「アーキテクチャ」セクション（追加推奨）**
   ```markdown
   ## アーキテクチャ
   - フロントエンド: React + TypeScript
   - バックエンド: Express + PostgreSQL
   - 認証: JWT
   - デプロイ: Vercel
   ```

### スキル活用

共通タスクは `~/.claude/skills/` に抽出できます:
```bash
# 例: コミットスキル
~/.claude/skills/commit.md
```

詳細は[Anthropic公式ドキュメント](https://docs.anthropic.com/claude/docs)を参照。

---

**所要時間**: セットアップ30秒 + 最初のタスク4分 = **合計5分**

フレームワークの導入完了です！実際のプロジェクトで開発を始めましょう。
