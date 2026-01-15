# EAM Test Command

あなたはEAM層として、テストを作成・実行します。

## Input
$ARGUMENTS
（例: "auth.ts のユニットテスト作成" または "TASK-001 のテスト"）

## Process

1. **テスト対象の特定**
   - どの機能/ファイルをテストするか
   - 既存のテストはあるか

2. **テストケース設計**
   - 正常系
   - 異常系
   - 境界値
   - エッジケース

3. **テストコード作成**
   - テストファイルの作成/更新
   - Arrange-Act-Assert パターン

4. **テスト実行**
   ```bash
   npm run test
   npm run test -- --coverage
   ```

5. **結果確認**
   - 全テスト通過
   - カバレッジ確認

## Test Design Template

```typescript
describe('[対象の説明]', () => {
  // 正常系
  describe('正常系', () => {
    it('should [期待する振る舞い] when [条件]', () => {
      // Arrange
      // Act
      // Assert
    });
  });

  // 異常系
  describe('異常系', () => {
    it('should throw error when [異常条件]', () => {
      // Arrange
      // Act & Assert
    });
  });

  // 境界値
  describe('境界値', () => {
    it('should handle [境界条件]', () => {
      // Test boundary conditions
    });
  });
});
```

## Test Naming Convention

```
it('should [期待する結果] when [条件]')

例:
- should return user data when valid id is provided
- should throw AuthError when token is expired
- should return empty array when no results found
```

## Output Format

```yaml
testing:
  target: [テスト対象]
  test_file: [テストファイルパス]
  
test_cases:
  created:
    - name: [テスト名]
      type: [normal | error | boundary | edge]
      description: [テスト内容]
  
  total: [作成したテスト数]

execution:
  command: [実行したコマンド]
  status: [pass | fail]
  
  results:
    total: [総テスト数]
    passed: [成功数]
    failed: [失敗数]
    skipped: [スキップ数]
    
  coverage:
    statements: [%]
    branches: [%]
    functions: [%]
    lines: [%]

failed_tests:
  - name: [失敗したテスト名]
    reason: [失敗理由]
    fix_suggestion: [修正案]

next_steps:
  - [次のアクション]
```

## Coverage Targets

| 指標 | 目標 |
|------|------|
| Statements | 80%+ |
| Branches | 75%+ |
| Functions | 80%+ |
| Lines | 80%+ |

## Test Types

### Unit Test
- 単一の関数/クラスをテスト
- 外部依存はモック化
- 高速に実行

### Integration Test
- 複数のコンポーネントの連携をテスト
- 実際のDB/APIを使用（テスト環境）

### E2E Test
- ユーザーシナリオをテスト
- ブラウザ/UIを操作

## Rules

- テスト名は期待する振る舞いを表現
- 1テスト = 1つの検証（推奨）
- モックは最小限に
- テストも読みやすいコードに
- 失敗したテストは必ず原因を特定

## Reference
詳細は `.claude/frameworks/EAM.md` を参照
