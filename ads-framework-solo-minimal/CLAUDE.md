# ADS Framework - Solo Developer Edition

## プロジェクト概要
個人開発者向けの軽量版ADS Framework。Claude Codeと協調した効率的な開発を実現。

**コンセプト**: 複雑な階層構造を排除し、実践的なガイドラインに集約。

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
```typescript
// 変数・関数: camelCase
const userName = 'Alice';
function getUserData() {}

// 型・クラス・インターフェース: PascalCase
type UserProfile = {};
class UserService {}
interface ApiResponse {}

// 定数: UPPER_SNAKE_CASE
const API_BASE_URL = 'https://api.example.com';
const MAX_RETRY_COUNT = 3;

// ファイル名: kebab-case
user-profile.ts
api-client.ts
```

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

## 開発ワークフロー

### 基本フロー（5ステップ）

#### 1. 調査フェーズ
**目的**: 変更箇所の特定と影響範囲の把握

**実施内容**:
```bash
# 関連コードを検索
grep -r "関数名" src/

# ファイル内容を確認
cat src/path/to/file.ts

# Git履歴を確認
git log --oneline --follow src/path/to/file.ts
```

**成果物**:
- 変更が必要なファイルのリスト
- 依存関係の把握

#### 2. 計画フェーズ
**目的**: 変更内容の整理と順序決定

**実施内容**:
- 変更するファイルをリストアップ
- 変更の順序を決定（依存関係の少ないものから）
- 必要なテストケースを洗い出し

**成果物**:
- タスクリスト（3-5個の具体的なステップ）

**大規模タスク（2時間超）の場合は構造化**:
```yaml
goal: [最終目標の簡潔な説明]
estimated_hours: [合計見積もり時間]

tasks:
  - id: 1
    title: [タスク名]
    estimated_minutes: [見積もり]
    dependencies: []

  - id: 2
    title: [タスク名]
    estimated_minutes: [見積もり]
    dependencies: [1]  # タスク1完了後に実行

  - id: 3
    title: [タスク名]
    estimated_minutes: [見積もり]
    dependencies: [1]  # タスク1完了後に実行（タスク2と並列可能）

実行順序:
  1. タスク1
  2. タスク2とタスク3（並列実行可能）
```

**エスカレーション判定**（計画段階で確認）:
- タスク数が10個以上 → 人間に確認（分解しすぎ）
- 合計見積もりが8時間以上 → 人間に確認（大規模すぎ）
- 依存関係が複雑（循環依存等） → 人間に確認

#### 3. 実装フェーズ
**目的**: コードの変更

**原則**:
- **小さく段階的に**: 1度に1ファイルずつ変更
- **即座に確認**: 変更後すぐに動作確認
- **エラー即修正**: エラーが出たら次に進まない

**避けるべきこと**:
- ❌ 複数ファイルを同時に大幅変更
- ❌ 動作未確認で次の変更に進む
- ❌ エラーを後回しにする

#### 4. テストフェーズ
**目的**: 品質保証

**実施内容**:
```bash
# 既存テストの実行
npm test

# 新しいテストの追加（必須）
# テストファイル: __tests__/[module-name].test.ts

# カバレッジ確認
npm run test:coverage
```

**テスト作成ルール**:
```typescript
// Arrange-Act-Assert パターン
describe('ユーザー認証', () => {
  it('正常系: 有効なトークンで認証成功', () => {
    // Arrange: テストデータ準備
    const validToken = 'valid-jwt-token';

    // Act: 実行
    const result = authenticate(validToken);

    // Assert: 検証
    expect(result.isAuthenticated).toBe(true);
  });

  it('異常系: 無効なトークンで認証失敗', () => {
    const invalidToken = 'invalid-token';
    const result = authenticate(invalidToken);
    expect(result.isAuthenticated).toBe(false);
  });

  it('境界値: 空文字列でエラー', () => {
    expect(() => authenticate('')).toThrow();
  });
});
```

**カバレッジ目標**:
- 関数カバレッジ: **80%以上**
- 分岐カバレッジ: **75%以上**
- 重要な機能（認証、決済等）: **90%以上**

#### 5. コミット＆レビューフェーズ
**目的**: 変更の記録と品質確認

**実施内容**:
```bash
# 変更確認
git status
git diff

# ステージング
git add src/path/to/changed-file.ts

# コミット
git commit -m "feat(auth): implement user login"

# セルフレビュー
git show HEAD
```

**セルフレビューチェックリスト**:
- [ ] 変更の意図が明確か
- [ ] 不要な変更が含まれていないか
- [ ] テストが追加されているか
- [ ] ドキュメント（コメント）が更新されているか

## エラーハンドリング

### 基本原則
```typescript
// ✅ Good: エラーを適切にハンドリング
async function fetchUserData(userId: string): Promise<User> {
  try {
    const response = await api.get(`/users/${userId}`);
    return response.data;
  } catch (error) {
    if (error instanceof ApiError) {
      logger.error('API error:', error.message);
      throw new UserFetchError(`Failed to fetch user: ${userId}`);
    }
    throw error;
  }
}

// ❌ Bad: エラーを握りつぶす
async function fetchUserData(userId: string) {
  try {
    return await api.get(`/users/${userId}`);
  } catch {
    return null; // エラー情報が失われる
  }
}
```

### エラーの種類と対処
- **想定内エラー**: try-catch + ユーザーへの通知
- **想定外エラー**: エラーログ + 再スロー
- **致命的エラー**: システムダウン + アラート

## パフォーマンス最適化

### 基本方針
- **測定してから最適化**: 感覚でなくプロファイラを使う
- **ボトルネックに集中**: 全体の20%が80%の時間を占める
- **早すぎる最適化は悪**: 可読性を優先

### チェックポイント
```typescript
// ✅ メモ化で再計算を避ける
const expensiveCalculation = useMemo(() => {
  return heavyComputation(data);
}, [data]);

// ✅ 大きなリストは仮想化
<VirtualList items={10000items} />

// ❌ 不要な再レンダリング
const Component = () => {
  const data = {value: 1}; // 毎回新しいオブジェクト
  return <Child data={data} />;
};
```

## セキュリティ

### 必須対策
- **環境変数**: 秘密情報は `.env` ファイル（Git管理外）
- **入力検証**: ユーザー入力は全て検証・サニタイズ
- **SQL/NoSQLインジェクション**: パラメータ化クエリ必須
- **XSS対策**: 出力エスケープ必須
- **認証トークン**: httpOnly cookie または secure storage

### 禁止事項
```typescript
// ❌ 絶対にやってはいけない
const API_KEY = 'sk-1234567890'; // ハードコード
const query = `SELECT * FROM users WHERE id = ${userId}`; // SQLインジェクション
innerHTML = userInput; // XSSの危険
```

## ドキュメント

### コメント規則
```typescript
/**
 * ユーザーデータを取得する
 *
 * @param userId - ユーザーID
 * @param options - 取得オプション
 * @returns ユーザー情報
 * @throws {UserNotFoundError} ユーザーが存在しない場合
 *
 * @example
 * ```typescript
 * const user = await fetchUser('user-123', { includeProfile: true });
 * ```
 */
async function fetchUser(userId: string, options?: FetchOptions): Promise<User> {
  // 実装
}
```

### README.md必須セクション
1. プロジェクト概要
2. セットアップ方法
3. 使い方
4. 開発方法
5. テスト方法
6. ライセンス

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

## トラブルシューティング

### テストが失敗する
```bash
# 詳細ログで確認
npm test -- --verbose

# 特定のテストのみ実行
npm test -- path/to/test.test.ts

# キャッシュクリア
npm run test:clear-cache
```

### ビルドが失敗する
```bash
# 依存関係を再インストール
rm -rf node_modules package-lock.json
npm install

# 型エラーを確認
npm run typecheck

# 詳細ログでビルド
npm run build -- --verbose
```

### Gitコンフリクト
```bash
# 現在の状態を確認
git status

# マージツールで解決
git mergetool

# または手動で編集後
git add [resolved-file]
git commit
```

## 参考資料

- [Claude Code Official Docs](https://code.claude.com/docs)
- [Conventional Commits](https://www.conventionalcommits.org/)
- [TypeScript Handbook](https://www.typescriptlang.org/docs/)
- [Testing Best Practices](https://testingjavascript.com/)

---

**作成日**: 2026-01-15
**バージョン**: 1.0.0 (Solo Developer Edition)
**ベース**: Anthropic公式ベストプラクティス準拠
