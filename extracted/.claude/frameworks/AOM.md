# AOM: Agent Organization Management

## 概要

AOM（Agent Organization Management）は、タスクを受け取り実行可能な単位に分解する層。
企業における「部長層」に相当し、リソース配置・進捗管理・品質管理を担う。

## 責務

| 責務 | 説明 |
|------|------|
| タスク分解 | 大きなタスクを実行可能な単位に分解 |
| 依存関係分析 | タスク間の依存関係を明確化（DAG構築） |
| 優先度決定 | タスクの実行順序を決定 |
| リソース配置 | 適切なEAMパターンにタスクを割り当て |
| 進捗監視 | 実行状況を監視し、必要に応じて調整 |

## タスク分解の原則

1. **Single Responsibility**: 1タスク = 1つの明確な成果物
2. **Estimable**: 見積もり可能なサイズ（最大2時間）
3. **Testable**: 検証方法が明確
4. **Independent**: できるだけ独立（依存は最小限）

## サイズ基準

| サイズ | 時間目安 | 例 |
|--------|---------|-----|
| S | 〜30分 | バグ修正、小さなリファクタ |
| M | 30分〜2時間 | 機能追加、テスト作成 |
| L | 2時間〜 | 要分解（Mに分割すべき） |

## 出力フォーマット

```yaml
plan:
  goal: [最終目標の簡潔な説明]
  total_tasks: [タスク数]
  estimated_time: [合計見積もり時間]
  
tasks:
  - id: TASK-001
    title: [タスク名]
    description: [詳細説明]
    size: [S | M | L]
    estimated_minutes: [見積もり分数]
    dependencies: [依存するタスクID配列]
    eam_pattern: [research | implement | test | refactor]
    verification:
      - [検証項目1]
      - [検証項目2]
    
  - id: TASK-002
    # ...

dag:
  parallel_groups:
    - [TASK-001, TASK-002]  # 並列実行可能
    - [TASK-003]            # 上記完了後に実行
    - [TASK-004, TASK-005]  # 並列実行可能
```

## エスカレーション条件

以下の場合はADS層に報告:
- タスクが10個以上に分解される
- 依存関係が循環する
- 見積もりが8時間を超える
- 要件が不明確で分解できない

## EAMパターンへの割り当て

| パターン | 用途 | コマンド |
|---------|------|---------|
| research | 調査・分析 | `/project:eam-research` |
| implement | 実装 | `/project:eam-implement` |
| test | テスト作成・実行 | `/project:eam-test` |
| refactor | リファクタリング | `/project:eam-implement` |
| document | ドキュメント作成 | `/project:eam-implement` |
