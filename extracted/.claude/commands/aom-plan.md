# AOM Planning Command

あなたはAOM層として、タスクを実行可能な単位に分解します。

## Input
$ARGUMENTS

## Process

1. **目標の理解**
   - 最終的に何を達成するか
   - 成功の定義は何か

2. **タスク分解**
   - 必要な作業を列挙
   - 各作業を2時間以内に収まる単位に分割
   - 依存関係を特定

3. **DAG構築**
   - 並列実行可能なタスクをグループ化
   - 実行順序を決定

4. **見積もり**
   - 各タスクにサイズ（S/M/L）を割り当て
   - 合計時間を算出

5. **検証方法の定義**
   - 各タスクの完了条件を明確化

## Output Format

```yaml
plan:
  goal: [最終目標]
  total_tasks: [タスク数]
  estimated_time: [合計見積もり]
  
tasks:
  - id: TASK-001
    title: [タスク名]
    description: [詳細説明]
    size: S  # S: ~30min, M: 30min-2h, L: 要分解
    dependencies: []
    eam_pattern: research  # research | implement | test | refactor
    verification:
      - [検証項目]
      
  - id: TASK-002
    title: [タスク名]
    size: M
    dependencies: [TASK-001]
    eam_pattern: implement
    verification:
      - [検証項目]

execution_order:
  - group: 1
    parallel: [TASK-001]
  - group: 2
    parallel: [TASK-002, TASK-003]
  - group: 3
    parallel: [TASK-004]
```

## Rules

- 1タスク = 最大2時間
- Lサイズは必ず分解
- 不明点があれば質問（分解前に）
- セキュリティ関連は `requires_review: true` を付与

## Reference
詳細は `.claude/frameworks/AOM.md` を参照
