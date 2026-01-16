---
name: solo-dev-workflow
description: 個人開発者向けの効率的な開発ワークフロー
version: 1.0.0
author: ADS Framework
---

# Solo Developer Workflow

個人開発者がClaude Codeと協調して効率的に開発を進めるためのワークフロー定義。

## タスク実装の5ステップ

### Step 1: 調査フェーズ (Research)

**目的**: 変更箇所の特定と影響範囲の把握

**実施内容**:
1. 関連コードの検索
   - `grep` で関数名・変数名を検索
   - `Read` で既存ファイルの内容を確認
   - 依存関係を把握

2. Git履歴の確認
   - `git log --oneline --follow [file]` で変更履歴を確認
   - 過去の変更意図を理解

3. テストコードの確認
   - 既存のテストケースを確認
   - カバレッジを確認

**成果物**:
- 変更が必要なファイルのリスト
- 依存関係の理解
- 影響範囲の把握

---

### Step 2: 計画フェーズ (Plan)

**目的**: 変更内容の整理と実装順序の決定

**実施内容**:
1. タスク分解
   - 大きなタスクを小さなステップに分割（各ステップ30分以内）
   - 依存関係を考慮した順序決定

2. リスク評価
   - セキュリティリスク（認証、暗号化等）
   - パフォーマンスリスク（大量データ処理等）
   - 破壊的変更の有無

3. テスト戦略
   - 必要なテストケースを洗い出し
   - 正常系・異常系・境界値を考慮

**成果物**:
- 3-5個の具体的なステップリスト
- リスク評価結果
- テストケースリスト

**エスカレーション条件**:
以下の場合は人間に確認:
- セキュリティに関わる変更
- データベーススキーマ変更
- 破壊的変更（Breaking Changes）
- 2時間以上かかる見積もり
- 複数の実装方法があり、トレードオフが大きい

---

### Step 3: 実装フェーズ (Implement)

**目的**: コードの変更

**基本原則**:
1. **小さく段階的に**
   - 1度に1ファイルずつ変更
   - 1つの変更は50行以内を目安
   - 大きな変更は複数のコミットに分割

2. **即座に確認**
   - 変更後すぐに動作確認
   - エラーが出たら次に進まない
   - 型チェック・Lintを実行

3. **クリーンなコード**
   - デバッグコード（console.log等）は削除
   - 不要なコメントは削除
   - コードフォーマッターを実行

**実装パターン**:

#### パターンA: 新機能追加
```typescript
// 1. 型定義を追加
// 2. インターフェース/抽象を定義
// 3. 実装を追加
// 4. エクスポート
```

#### パターンB: バグ修正
```typescript
// 1. バグの原因を特定
// 2. 最小限の修正を適用
// 3. 同じ問題が他にないか確認
// 4. 再発防止のテストを追加
```

#### パターンC: リファクタリング
```typescript
// 1. 既存テストが存在することを確認
// 2. 小さく段階的に変更
// 3. 各ステップでテストが通ることを確認
// 4. 最後に不要なコードを削除
```

**避けるべきこと**:
- ❌ 複数ファイルを同時に大幅変更
- ❌ 動作未確認で次の変更に進む
- ❌ エラーを後回しにする
- ❌ 型を `any` で逃げる
- ❌ 過度な抽象化・早すぎる最適化

---

### Step 4: テストフェーズ (Test)

**目的**: 品質保証とバグの早期発見

**実施内容**:
1. 既存テストの実行
   ```bash
   npm test
   npm run lint
   npm run typecheck
   ```

2. 新しいテストの作成（必須）
   - **Arrange-Act-Assert** パターンに従う
   - 正常系・異常系・境界値をカバー
   - テストケース名は日本語でわかりやすく

3. カバレッジ確認
   ```bash
   npm run test:coverage
   ```
   - 関数カバレッジ: 80%以上
   - 重要な機能: 90%以上

**テストテンプレート**:
```typescript
describe('機能名', () => {
  // 正常系
  it('正常系: 期待される動作をする', () => {
    // Arrange: テストデータ準備
    const input = createTestData();

    // Act: 実行
    const result = targetFunction(input);

    // Assert: 検証
    expect(result).toBe(expectedValue);
  });

  // 異常系
  it('異常系: 無効な入力でエラーをスローする', () => {
    const invalidInput = null;
    expect(() => targetFunction(invalidInput)).toThrow();
  });

  // 境界値
  it('境界値: 空配列で空配列を返す', () => {
    const result = targetFunction([]);
    expect(result).toEqual([]);
  });

  // エッジケース
  it('エッジケース: 大量データでも正常に動作する', () => {
    const largeData = Array(10000).fill(1);
    const result = targetFunction(largeData);
    expect(result).toBeDefined();
  });
});
```

**テスト失敗時の対処**:
1. エラーメッセージを詳細に確認
2. 失敗したテストのみを再実行
3. デバッグログを追加して原因特定
4. 修正後、全テストを再実行

---

### Step 5: コミット＆レビューフェーズ (Commit & Review)

**目的**: 変更の記録と品質確認

**実施内容**:

#### 5-1. 変更確認
```bash
git status           # 変更ファイル一覧
git diff             # 変更内容の詳細
```

**確認ポイント**:
- [ ] 意図した変更のみが含まれているか
- [ ] デバッグコードが残っていないか
- [ ] 不要なコメントが削除されているか
- [ ] フォーマッターが適用されているか

#### 5-2. コミットメッセージ生成

**Conventional Commits形式**:
```
<type>(<scope>): <subject>

[optional body]

[optional footer]
```

**Type判定ルール**:
- `feat`: 新しい機能の追加
- `fix`: バグ修正
- `docs`: ドキュメントのみの変更
- `style`: コードの意味に影響しない変更（フォーマット等）
- `refactor`: バグ修正や機能追加を伴わないコード改善
- `perf`: パフォーマンス改善
- `test`: テストの追加・修正
- `chore`: ビルドプロセス・ツールの変更

**Scope判定ルール**:
- 変更したファイルのディレクトリ名（例: `auth`, `api`, `utils`）
- 機能名（例: `user-profile`, `login`）

**Subject作成ルール**:
- 現在形で記述（"add" not "added"）
- 先頭は小文字
- 50文字以内
- 末尾にピリオド不要

**コミットメッセージ自動生成例**:
```bash
# 変更内容を分析
git diff --staged

# 判定例1: src/auth/login.ts を修正
→ type: feat (新規) or fix (修正)
→ scope: auth
→ subject: implement JWT authentication

# 最終メッセージ
feat(auth): implement JWT authentication

# 判定例2: README.md を更新
→ type: docs
→ scope: なし（ドキュメントルート）
→ subject: update installation steps

# 最終メッセージ
docs: update installation steps

# 判定例3: utils/date.ts をリファクタリング
→ type: refactor
→ scope: utils
→ subject: extract date formatting logic

# 最終メッセージ
refactor(utils): extract date formatting logic
```

#### 5-3. セルフレビュー
```bash
git add [files]
git commit -m "..."
git show HEAD        # コミット内容を確認
```

**セルフレビューチェックリスト**:
- [ ] コミットメッセージは明確か
- [ ] 変更は論理的なまとまりになっているか
- [ ] テストが追加されているか
- [ ] ドキュメント（コメント・README）が更新されているか
- [ ] セキュリティ上の問題がないか

#### 5-4. プッシュ（オプション）
```bash
# ブランチにプッシュ
git push origin feature/xxx

# Pull Request作成（必要に応じて）
gh pr create --title "..." --body "..."
```

---

## Git運用ルール

### ブランチ命名規則
```
main                          # 本番環境（保護ブランチ）
├── feature/[description]     # 新機能
├── fix/[description]         # バグ修正
├── refactor/[description]    # リファクタリング
├── docs/[description]        # ドキュメント
└── test/[description]        # テスト追加
```

**命名例**:
- `feature/user-authentication`
- `fix/null-check-in-api`
- `refactor/extract-validation`
- `docs/update-readme`
- `test/add-edge-cases`

### マージ戦略
```bash
# feature/* → main: Squash merge
git merge --squash feature/xxx

# 緊急修正: Fast-forward merge
git merge --ff-only hotfix/xxx
```

---

## エラーハンドリングパターン

### パターン1: API呼び出し
```typescript
async function fetchData(id: string): Promise<Data> {
  try {
    const response = await api.get(`/data/${id}`);
    return response.data;
  } catch (error) {
    if (error instanceof ApiError) {
      // APIエラー: ログ + 再スロー
      logger.error('API error:', error.message);
      throw new DataFetchError(`Failed to fetch data: ${id}`);
    }
    // 想定外エラー: そのまま再スロー
    throw error;
  }
}
```

### パターン2: ユーザー入力検証
```typescript
function validateEmail(email: string): string {
  if (!email) {
    throw new ValidationError('Email is required');
  }
  if (!EMAIL_REGEX.test(email)) {
    throw new ValidationError('Invalid email format');
  }
  return email.toLowerCase();
}
```

### パターン3: リソースのクリーンアップ
```typescript
async function processFile(path: string): Promise<void> {
  const file = await openFile(path);
  try {
    await processContent(file);
  } finally {
    await file.close(); // 必ずクローズ
  }
}
```

---

## パフォーマンス最適化ガイドライン

### 基本方針
1. **測定してから最適化** - 感覚でなくプロファイラを使う
2. **ボトルネックに集中** - 効果の大きい部分だけ最適化
3. **早すぎる最適化は悪** - 可読性を優先

### チェックポイント
- [ ] 不要な再レンダリングを避ける（React: `useMemo`, `useCallback`）
- [ ] 大きなリストは仮想化（`react-window`, `react-virtualized`）
- [ ] 画像は最適化（WebP, lazy loading）
- [ ] バンドルサイズを監視（Webpack Bundle Analyzer）

---

## セキュリティチェックリスト

### 必須対策
- [ ] 環境変数で秘密情報を管理（`.env` ファイル、Git管理外）
- [ ] ユーザー入力は全て検証・サニタイズ
- [ ] SQLインジェクション対策（パラメータ化クエリ）
- [ ] XSS対策（出力エスケープ）
- [ ] CSRF対策（トークン検証）
- [ ] 認証トークンは安全に保存（httpOnly cookie）

### 禁止事項
```typescript
// ❌ 絶対にやってはいけない
const API_KEY = 'sk-1234567890';  // ハードコード
const query = `SELECT * FROM users WHERE id = ${userId}`;  // SQLインジェクション
element.innerHTML = userInput;  // XSS
```

---

## トラブルシューティング

### テストが失敗する
```bash
# 詳細ログで確認
npm test -- --verbose

# 特定のテストのみ実行
npm test -- path/to/test.test.ts

# キャッシュクリア
rm -rf node_modules/.cache
npm test
```

### ビルドが失敗する
```bash
# 依存関係を再インストール
rm -rf node_modules package-lock.json
npm install

# 型エラーを確認
npm run typecheck -- --listFiles
```

### Gitコンフリクト
```bash
# 状態確認
git status

# マージツール起動
git mergetool

# 手動解決後
git add [resolved-file]
git commit
```

---

## ワークフロー適用例

### 例1: 新機能実装「ユーザー認証」

```
ユーザー: "JWTトークン認証を実装して"

Step 1 (調査):
→ 既存の認証コードを検索
→ 使用可能なライブラリを調査（jsonwebtoken）
→ 影響範囲: src/auth/, src/middleware/

Step 2 (計画):
→ タスク分解:
  1. JWT生成関数の実装
  2. JWT検証ミドルウェアの実装
  3. ログインエンドポイントの更新
  4. テスト追加
→ リスク: セキュリティ関連 → エスカレーション不要（標準的な実装）

Step 3 (実装):
→ src/auth/jwt.ts に生成・検証関数を実装
→ src/middleware/auth.ts に認証ミドルウェアを実装
→ src/api/login.ts を更新
→ 各ステップで動作確認

Step 4 (テスト):
→ __tests__/auth/jwt.test.ts を作成
→ 正常系・異常系・境界値をカバー
→ カバレッジ: 85% (目標達成)

Step 5 (コミット):
→ git diff で変更確認
→ コミットメッセージ自動生成:
   "feat(auth): implement JWT authentication"
→ git commit & push
```

### 例2: バグ修正「APIのnullチェック」

```
ユーザー: "getUserData()のnull pointer exceptionを修正して"

Step 1 (調査):
→ src/api/users.ts の getUserData() を確認
→ エラーログを確認
→ 原因: response.data.user が undefined の場合の処理なし

Step 2 (計画):
→ タスク: nullチェックの追加
→ リスク: なし（軽微な修正）

Step 3 (実装):
→ src/api/users.ts に nullチェックを追加
→ 動作確認

Step 4 (テスト):
→ __tests__/api/users.test.ts にエッジケースを追加
→ テスト通過

Step 5 (コミット):
→ コミットメッセージ:
   "fix(api): add null check for getUserData"
```

---

**このSkillを使用すると**:
個人開発における標準的な開発フローが自動的に適用され、品質の高いコード作成とGit管理が実現されます。
