# Source Code Guidelines

このディレクトリでの作業時に適用される追加ルールです。

## コーディング規約

### 命名規則
- ファイル名: `kebab-case.ts`
- クラス名: `PascalCase`
- 関数名/変数名: `camelCase`
- 定数: `UPPER_SNAKE_CASE`
- 型/インターフェース: `PascalCase`（Prefixなし）

### ファイル構成
```typescript
// 1. インポート（外部 → 内部の順）
import { external } from 'external-package';
import { internal } from '@/internal';

// 2. 型定義
interface Props { ... }
type State = { ... }

// 3. 定数
const DEFAULT_VALUE = 100;

// 4. メイン実装
export function Component() { ... }

// 5. ヘルパー関数（必要な場合）
function helper() { ... }
```

### エラーハンドリング
```typescript
// 推奨: カスタムエラークラス
class ValidationError extends Error {
  constructor(message: string) {
    super(message);
    this.name = 'ValidationError';
  }
}

// try-catch は具体的なエラーをキャッチ
try {
  await operation();
} catch (error) {
  if (error instanceof ValidationError) {
    // 処理
  }
  throw error; // 未知のエラーは再throw
}
```

## 品質チェック

コード変更後は必ず実行:

```bash
npm run typecheck  # 型チェック
npm run lint       # lint
npm run test       # テスト
```
