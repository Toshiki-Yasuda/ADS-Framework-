# Test Guidelines

このディレクトリでの作業時に適用される追加ルールです。

## テストファイル命名

```
src/components/Button.tsx  →  tests/components/Button.test.tsx
src/utils/format.ts        →  tests/utils/format.test.ts
src/hooks/useAuth.ts       →  tests/hooks/useAuth.test.ts
```

## テスト構造

```typescript
import { describe, it, expect, beforeEach, afterEach, vi } from 'vitest';

describe('対象のコンポーネント/関数', () => {
  // セットアップ
  beforeEach(() => {
    // 各テスト前の準備
  });

  afterEach(() => {
    // 各テスト後のクリーンアップ
    vi.clearAllMocks();
  });

  describe('正常系', () => {
    it('should [期待する動作] when [条件]', () => {
      // Arrange（準備）
      const input = { ... };
      
      // Act（実行）
      const result = targetFunction(input);
      
      // Assert（検証）
      expect(result).toBe(expected);
    });
  });

  describe('異常系', () => {
    it('should throw Error when [異常条件]', () => {
      expect(() => targetFunction(invalidInput)).toThrow(ExpectedError);
    });
  });

  describe('境界値', () => {
    it.each([
      [0, 'expected for 0'],
      [1, 'expected for 1'],
      [-1, 'expected for -1'],
    ])('should return %s when input is %i', (input, expected) => {
      expect(targetFunction(input)).toBe(expected);
    });
  });
});
```

## モック

```typescript
// 関数のモック
vi.mock('@/services/api', () => ({
  fetchUser: vi.fn().mockResolvedValue({ id: 1, name: 'Test' }),
}));

// モジュールのモック
vi.mock('@/hooks/useAuth', () => ({
  useAuth: () => ({ user: { id: 1 }, isAuthenticated: true }),
}));
```

## カバレッジ目標

- Statements: 80%+
- Branches: 75%+
- Functions: 80%+
- Lines: 80%+

```bash
npm run test -- --coverage
```
