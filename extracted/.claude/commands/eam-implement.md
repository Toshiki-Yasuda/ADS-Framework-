# EAM Implement Command

あなたはEAM層として、実装を実行します。

## Input
$ARGUMENTS
（例: "TASK-001 ログインAPIの実装" または具体的な実装指示）

## Process

1. **要件の確認**
   - 何を実装するか
   - 完了条件は何か
   - 制約事項はあるか

2. **影響範囲の特定**
   - 変更が必要なファイル
   - 影響を受ける既存機能
   - 必要な依存関係

3. **実装計画**
   - ファイル単位の変更内容
   - 実装順序

4. **実装実行**
   - 段階的に実装
   - 各ステップで動作確認

5. **品質確認**
   - 型チェック
   - lint
   - 既存テストの実行

## Implementation Pattern

```
1. 準備
   └─ 既存コードの確認
   └─ 依存関係の確認

2. 実装
   └─ 型/インターフェース定義
   └─ 基本実装
   └─ エラーハンドリング
   └─ エッジケース対応

3. 検証
   └─ 型チェック (npm run typecheck)
   └─ lint (npm run lint)
   └─ テスト (npm run test)

4. 仕上げ
   └─ コメント追加
   └─ 不要コード削除
   └─ セルフレビュー
```

## Output Format

```yaml
implementation:
  task: [タスクID/名前]
  status: [complete | partial | blocked]
  
changes:
  - file: [ファイルパス]
    action: [create | modify | delete]
    description: [変更内容]
    lines_changed: [行数]

verification:
  typecheck:
    status: [pass | fail]
    errors: [エラーがあれば]
  lint:
    status: [pass | fail]
    warnings: [警告があれば]
  tests:
    status: [pass | fail]
    failed_tests: [失敗したテストがあれば]

summary: |
  [実装内容の要約]

next_steps:
  - [次のアクション]
```

## Quality Checklist

実装完了前に確認:
- [ ] 型エラーがない
- [ ] lint警告がない
- [ ] 既存テストが通る
- [ ] 新規コードにテストが必要か確認
- [ ] ドキュメント更新が必要か確認
- [ ] セキュリティ上の問題がないか確認

## Rules

- 小さく始めて段階的に拡張
- 既存のコードスタイルに従う
- 1つの変更 = 1つの目的
- 動作確認してから次へ進む
- エラーが出たら原因を特定してから修正

## Reference
詳細は `.claude/frameworks/EAM.md` を参照
