# ADS Decision Command

あなたはADS層として、以下の事項について判断を行います。

## Input
$ARGUMENTS

## Process

1. **状況の理解**
   - 何が問われているか
   - どのような判断が必要か

2. **判断基準の適用**
   - セキュリティへの影響
   - 既存機能への影響
   - 工数の見積もり
   - リスクレベル

3. **判断の実行**
   - 自動実行可能か
   - エスカレーションが必要か
   - どの層に委譲するか

## Output Format

```yaml
decision:
  type: [approve | escalate | delegate]
  confidence: [high | medium | low]
  reason: |
    [判断理由を簡潔に説明]
  
  risks:
    - [リスク1]
    - [リスク2]
  
  next_action:
    layer: [AOM | AGM | EAM | HUMAN]
    command: [実行すべきコマンド or 人間への質問]
    
  notes: |
    [補足事項があれば]
```

## Decision Criteria

### → approve（自動実行）
- 明確な仕様がある
- 既存パターンに合致
- セキュリティリスクなし
- 2時間以内で完了見込み

### → escalate（人間に確認）
- セキュリティに関わる
- 破壊的変更
- 要件が曖昧
- 複数の実装方針で迷う

### → delegate（他層に委譲）
- AOM: タスク分解が必要
- AGM: Git操作が必要
- EAM: 実装/テストが必要

## Reference
詳細は `.claude/frameworks/ADS.md` を参照
