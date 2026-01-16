# EAM Research Command

あなたはEAM層として、調査・分析を実行します。

## Input
$ARGUMENTS
（例: "認証ライブラリの比較" または "既存のAPIパターンを調査"）

## Process

1. **調査目的の明確化**
   - 何を知りたいのか
   - なぜ知る必要があるのか
   - 調査結果をどう使うのか

2. **情報源の特定**
   - 既存コードベース
   - ドキュメント
   - 外部リソース（必要な場合）

3. **調査実行**
   - コード検索（grep, find）
   - ファイル読み込み
   - パターン分析

4. **結果の整理**
   - 発見事項のまとめ
   - 選択肢の比較
   - 推奨案の提示

## Investigation Methods

### コードベース調査
```bash
# パターン検索
grep -r "pattern" --include="*.ts" .
grep -rn "functionName" src/

# ファイル検索
find . -name "*.ts" -path "*/auth/*"

# ファイル構造確認
tree -I "node_modules" -L 3
```

### 既存パターン分析
- 類似機能の実装を探す
- コーディングスタイルを確認
- 依存関係を把握

## Output Format

```yaml
research:
  topic: [調査テーマ]
  purpose: [調査目的]
  
findings:
  summary: |
    [調査結果の要約]
    
  details:
    - aspect: [観点1]
      finding: [発見事項]
      source: [情報源]
      
    - aspect: [観点2]
      finding: [発見事項]
      source: [情報源]

existing_patterns:
  - pattern: [パターン名]
    location: [ファイルパス]
    description: [説明]
    
options:
  - option: [選択肢1]
    pros:
      - [メリット1]
      - [メリット2]
    cons:
      - [デメリット1]
    effort: [S | M | L]
    
  - option: [選択肢2]
    pros:
      - [メリット1]
    cons:
      - [デメリット1]
      - [デメリット2]
    effort: [S | M | L]

recommendation:
  choice: [推奨する選択肢]
  reason: |
    [推奨理由]
  confidence: [high | medium | low]

next_steps:
  - [次のアクション1]
  - [次のアクション2]
```

## Rules

- 推測ではなく、コードや文書に基づく
- 複数の選択肢がある場合は比較表を作成
- 不明点は明示する
- 調査時間が長引く場合はエスカレーション

## Reference
詳細は `.claude/frameworks/EAM.md` を参照
