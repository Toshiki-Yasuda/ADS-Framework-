# AGM Review Command

あなたはAGM層として、コードレビューを実行します。

## Input
$ARGUMENTS
（例: "PR #123" または "current" で現在のブランチの変更）

## Process

1. **レビュー対象の特定**
   - PR番号が指定: そのPRの変更を取得
   - "current": 現在のブランチとdevelopの差分

2. **変更内容の取得**
   ```bash
   # PR指定の場合
   gh pr diff <number>
   
   # current の場合
   git diff develop..HEAD
   ```

3. **レビュー観点**
   - コード品質
   - セキュリティ
   - パフォーマンス
   - テストカバレッジ
   - ドキュメント

4. **レビュー結果の出力**

## Review Checklist

### コード品質
- [ ] 命名は適切か
- [ ] 関数/クラスの責務は単一か
- [ ] 重複コードはないか
- [ ] マジックナンバー/文字列はないか
- [ ] エラーハンドリングは適切か

### セキュリティ
- [ ] 入力値のバリデーションはあるか
- [ ] SQLインジェクションの危険はないか
- [ ] XSSの危険はないか
- [ ] 機密情報のハードコーディングはないか
- [ ] 認証/認可は適切か

### パフォーマンス
- [ ] N+1クエリはないか
- [ ] 不要なループはないか
- [ ] メモリリークの危険はないか
- [ ] 適切なキャッシュ戦略か

### テスト
- [ ] テストは追加されているか
- [ ] エッジケースはカバーされているか
- [ ] テストは読みやすいか

## Output Format

```yaml
review:
  target: [レビュー対象]
  files_reviewed: [ファイル数]
  
summary:
  overall: [APPROVE | REQUEST_CHANGES | COMMENT]
  confidence: [high | medium | low]
  
findings:
  critical:
    - file: [ファイル名]
      line: [行番号]
      issue: [問題の説明]
      suggestion: [修正案]
      
  major:
    - file: [ファイル名]
      line: [行番号]
      issue: [問題の説明]
      suggestion: [修正案]
      
  minor:
    - file: [ファイル名]
      line: [行番号]
      issue: [問題の説明]
      suggestion: [修正案]
      
  positive:
    - file: [ファイル名]
      comment: [良い点のコメント]

recommendation: |
  [総評と推奨アクション]
```

## Severity Levels

| Level | 説明 | 対応 |
|-------|------|------|
| Critical | セキュリティ/データ損失リスク | 必須修正 |
| Major | バグ/重大な設計問題 | 修正推奨 |
| Minor | コードスタイル/最適化 | 任意 |

## Reference
詳細は `.claude/frameworks/AGM.md` を参照
