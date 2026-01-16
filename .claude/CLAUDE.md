# ADS Framework - Solo Developer Edition (Hybrid/Performance-Optimized)

**Version**: v1.2 Hybrid
**Optimization**: -50% lines (481→241) while maintaining explanation quality
**Target**: Optimal performance/explainability balance for Claude Code

## プロジェクト概要
個人開発者向けの軽量版ADS Framework。Claude Codeと協調した効率的な開発を実現。

**コンセプト**: 複雑な階層構造を排除し、実践的なガイドラインに集約。AIパフォーマンス重視で冗長な例を削減。

## 開発環境セットアップ

### 必要な環境
- Node.js 20+ または使用する言語の最新LTS
- Git 2.40+
- エディタ: VS Code / Cursor 推奨

### よく使うコマンド
```bash
# 開発
npm run dev          # 開発サーバー起動
npm run build        # 本番ビルド
npm test             # テスト実行
npm run lint         # Lint実行
npm run typecheck    # 型チェック

# Git
git status           # 状態確認
git log --oneline -10  # 最近のコミット
```

## コード規約

### スタイル基準
- **インデント**: 2スペース（タブ不可）
- **行幅**: 最大100文字
- **セミコロン**: 必須（JavaScript/TypeScript）
- **クォート**: シングルクォート優先

### TypeScript設定
```json
{
  "strict": true,
  "noImplicitAny": true,
  "strictNullChecks": true
}
```

### 命名規則
- **変数・関数**: camelCase (`userName`, `getUserData()`)
- **型・クラス**: PascalCase (`UserProfile`, `UserService`)
- **定数**: UPPER_SNAKE_CASE (`API_BASE_URL`, `MAX_RETRY_COUNT`)
- **ファイル名**: kebab-case (`user-profile.ts`, `api-client.ts`)

### ディレクトリ構造
```
src/
├── components/      # UIコンポーネント
├── hooks/          # カスタムフック
├── utils/          # ユーティリティ関数
├── types/          # 型定義
├── api/            # API呼び出し
└── __tests__/      # テストファイル
```

## Git運用ルール

### ブランチ戦略
```
main                      # 本番環境（保護ブランチ）
├── feature/xxx           # 新機能開発
├── fix/xxx               # バグ修正
├── refactor/xxx          # リファクタリング
├── docs/xxx              # ドキュメント更新
└── test/xxx              # テスト追加
```

**ブランチ命名例**:
```
feature/user-authentication
fix/null-pointer-in-api
refactor/extract-validation-logic
docs/update-readme
test/add-user-service-tests
```

### コミットメッセージ (Conventional Commits)

**フォーマット**:
```
<type>(<scope>): <subject>

[optional body]

[optional footer]
```

**Type一覧**:
- `feat`: 新機能
- `fix`: バグ修正
- `docs`: ドキュメント変更のみ
- `style`: コードの意味に影響しない変更（フォーマット、セミコロン等）
- `refactor`: バグ修正や機能追加を伴わないコード改善
- `perf`: パフォーマンス改善
- `test`: テストの追加・修正
- `chore`: ビルドプロセスやツールの変更

**コミット例**:
```bash
feat(auth): implement JWT token authentication
fix(api): add null check for user data
docs(readme): update installation steps
refactor(utils): extract date formatting logic
test(user): add edge case tests for validation
```

### コミット前チェックリスト
**必須確認事項**:
- [ ] `npm test` が全て通る
- [ ] `npm run lint` でエラーなし
- [ ] `npm run typecheck` で型エラーなし
- [ ] **セキュリティ脆弱性がないか**（XSS, SQLインジェクション, 認証抜け等）
- [ ] **既存機能が壊れていないか**（リグレッションテスト実施）
- [ ] **パフォーマンスが劣化していないか**（大量データでの動作確認）
- [ ] `git diff` で意図しない変更が含まれていない
- [ ] デバッグコード（console.log等）を削除済み
- [ ] ドキュメント・コメントが更新されているか

## 開発ワークフロー（5ステップ）

### 1. 調査
関連コードを検索（grep）、Git履歴確認、影響範囲を把握

### 2. 計画
**通常タスク**: 変更ファイルをリスト化、実行順序を決定、テストケース洗い出し

**大規模タスク（2時間超）はYAML形式で構造化**:
```yaml
goal: [最終目標]
estimated_hours: [合計]
tasks:
  - id: 1
    title: [タスク名]
    estimated_minutes: [見積もり]
    dependencies: []
  - id: 2
    dependencies: [1]  # タスク1完了後
```

**エスカレーション判定**（計画段階で必須）:
- タスク10個以上 → 人間に確認（複雑すぎ）
- 合計8時間以上 → 人間に確認（大規模すぎ）
- 循環依存 → 人間に確認

### 3. 実装
原則: 小さく段階的に（1ファイルずつ）、即座に確認、エラー即修正

避けるべきこと: 複数ファイル同時変更、動作未確認で次へ、エラー後回し

### 4. テスト
**実行**: `npm test` → 新規テスト追加（Arrange-Act-Assert） → `npm run test:coverage`

**カバレッジ目標**:
- 関数: 80%以上
- 分岐: 75%以上
- 重要機能（認証・決済）: 90%以上

**理由**: バグ早期発見、リファクタリング安全性確保、ドキュメント代替

### 5. コミット
`git status` → `git diff` 確認 → Conventional Commits形式でコミット → セルフレビュー

**チェック**: 変更意図明確か、不要な変更なしか、テスト追加済みか、ドキュメント更新済みか

## エラーハンドリング

### 基本原則
- ✅ **適切**: `try-catch` で型チェック → ログ → カスタムエラーをthrow
- ❌ **NG**: 空の `catch` でエラー握りつぶし、情報損失

### 対処パターン
- **想定内**: try-catch + ユーザー通知
- **想定外**: ログ + 再スロー
- **致命的**: システムダウン + アラート

## パフォーマンス最適化

原則: 測定してから最適化、ボトルネックに集中、早すぎる最適化は避ける

## セキュリティ

### 必須対策
- **環境変数**: 秘密情報は `.env` ファイル（Git管理外）
- **入力検証**: ユーザー入力は全て検証・サニタイズ
- **SQL/NoSQLインジェクション**: パラメータ化クエリ必須
- **XSS対策**: 出力エスケープ必須
- **認証トークン**: httpOnly cookie または secure storage

### 禁止事項
- ❌ API鍵のハードコード
- ❌ 文字列連結でのSQLクエリ構築（インジェクション危険）
- ❌ `innerHTML`への未検証ユーザー入力（XSS危険）

## ドキュメント

- 公開API: JSDoc必須（@param, @returns, @throws記載）
- README.md: プロジェクト概要、セットアップ、使い方、テスト方法を含める

## エスカレーション条件

**重要**: 実装を開始する**前に**以下をチェックしてください。

### 実装前チェックリスト（必須）

タスクを受け取ったら、実装を始める前に以下を確認:

- [ ] **セキュリティ関連か**（認証、暗号化、権限、API秘密鍵）
- [ ] **金銭関連か**（決済、課金、請求）
- [ ] **データベーススキーマ変更か**
- [ ] **破壊的変更か**（既存APIの変更、後方互換性の破壊）
- [ ] **外部サービス連携追加か**（新しいAPIキー、OAuth等）
- [ ] **2時間以上かかる見積もりか**
- [ ] **要件が曖昧・不明確か**

**1つでも該当したら、実装前に人間に確認してください。**

---

以下の場合は**人間の判断を仰ぐ**:

### 必須エスカレーション
- 🔐 セキュリティ関連の変更（認証、暗号化、権限）
- 💳 金銭に関わる処理（決済、課金）
- 🗄️ データベーススキーマ変更
- 🚨 破壊的変更（Breaking Changes）
- 🔑 外部APIキー・認証情報の追加
- ⏱️ 2時間以上かかる見積もり

### 推奨エスカレーション
- 複数の実装方法があり、トレードオフが大きい
- 要件が曖昧・不明確
- 外部ライブラリの大幅なバージョンアップ
- パフォーマンスへの影響が大きい変更

