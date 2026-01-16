# ADS Framework 比較資料

このディレクトリには、ADS Framework の Full版 と Solo Edition の詳細な比較資料が含まれています。

## 📁 含まれるファイル

### COMPARISON.md
Full版とSolo Editionの徹底比較ドキュメント

**含まれる内容**:
1. 概要比較表（ファイル数、学習時間等）
2. ファイル構成比較
3. ワークフロー比較（実例付き）
4. 学習コスト比較
5. コスト比較（Claude API使用料）
6. 機能比較表
7. 使い分けガイド
8. 移行パス（Solo ⇔ Full）
9. 実例比較
10. 学習リソース
11. 決定フローチャート

### VERSION_COMPARISON.md
Solo Edition 3バージョン（v1.0/v1.1/v1.2）の詳細比較

**含まれる内容**:
- v1.0 Initial（250行）- 過度に簡略化、非推奨
- v1.1 Baseline（481行）- 完全版、安定
- v1.2 Hybrid（244行）- パフォーマンス最適化版、**推奨**
- 各バージョンのトークン使用量と品質比較
- 推奨マトリクスと移行パス
- パフォーマンステスト結果（6シナリオ）

### POWER_DOWN_ANALYSIS.md
v1.0の簡略化による機能損失の詳細分析

**含まれる内容**:
- 7つのパワーダウン問題（CRITICAL 2件、MAJOR 3件）
- タスク分解自動化の喪失
- エスカレーション自動検出の喪失
- v1.1での修正内容

### PERFORMANCE_OPTIMIZATION_ANALYSIS.md
トークン使用量の分析とv1.2最適化案

**含まれる内容**:
- セクション別トークン分析
- Ultra-light版（237行）vs Hybrid版（280行）の比較
- 最適化戦略（冗長部分の削除、例の圧縮）
- 推定パフォーマンス向上（-42%〜-51%トークン削減）

### PERFORMANCE_VS_EXPLAINABILITY.md
性能最適化が説明品質に与える影響の研究

**含まれる内容**:
- 6つのテストシナリオでの品質評価
- v1.1 vs v1.2の説明明瞭度比較
- 平均-5.8%の品質低下で-42%のトークン削減
- ハイブリッドアプローチの妥当性検証

### FURTHER_IMPROVEMENTS.md
Solo Edition v1.1以降の改善機会9項目

**含まれる内容**:
- サンプルプロジェクト作成（優先度: CRITICAL）
- Skills使用ガイド、チュートリアル作成
- CI/CD統合例、ベストプラクティス集
- 各項目の実装難易度と所要時間見積もり

## 🎯 このドキュメントの使い方

### 新規プロジェクト開始時
```bash
# 1. Full版 vs Solo Edition の選択
cat COMPARISON.md | grep -A 20 "決定フローチャート"

# 2. Solo Edition内でのバージョン選択（推奨: v1.2 Hybrid）
cat VERSION_COMPARISON.md | grep -A 10 "Recommendation"

# 条件に応じて選択:
# - Solo Edition v1.2 → /ads-framework-solo-minimal/CLAUDE-hybrid.md
# - Solo Edition v1.1 → /ads-framework-solo-minimal/CLAUDE.md
# - Full版 → /extracted/
```

### 既存プロジェクトの見直し
```bash
# 「使い分けガイド」セクションを確認
# プロジェクトが成長したら Full版への移行を検討

# Solo Edition利用中でパフォーマンス改善を検討している場合
cat PERFORMANCE_OPTIMIZATION_ANALYSIS.md  # トークン削減分析
cat PERFORMANCE_VS_EXPLAINABILITY.md      # 品質影響評価
```

### チーム導入時
```bash
# 「学習コスト比較」を参照
# チームサイズに応じた学習時間を見積もり

# さらなる改善を検討する場合
cat FURTHER_IMPROVEMENTS.md  # 9つの改善機会を確認
```

### Solo Edition バージョン選択時
```bash
# v1.0/v1.1/v1.2の詳細比較
cat VERSION_COMPARISON.md

# 推奨: v1.2 Hybrid（244行、-50%トークン、94%品質維持）
```

## 📊 クイック比較

### Full版 vs Solo Edition

| 項目 | Full版 | Solo Edition v1.2 |
|------|--------|------------------|
| **ファイル数** | 19 | 1 |
| **行数** | 約2,000行 | 244行 |
| **学習時間** | 2時間 | 15分 |
| **対象** | チーム（5人以上） | 個人（1-2人） |
| **セットアップ** | 30分 | 2分 |
| **トークン使用** | ~6,000 | ~730 (-88%) |

### Solo Edition バージョン比較

| 項目 | v1.1 Baseline | v1.2 Hybrid (推奨) |
|------|--------------|-------------------|
| **行数** | 481行 | 244行 (-49%) |
| **トークン** | ~1,450 | ~730 (-50%) |
| **説明品質** | 100% | 94% (-6%) |
| **用途** | 学習用・詳細重視 | 本番用・性能重視 |

詳細は `COMPARISON.md` および `VERSION_COMPARISON.md` を参照してください。

## 🚀 推奨フロー

### パターン1: ゼロから始める（推奨フロー）
```
1. COMPARISON.md を読む（20分）- Full版 vs Solo Edition
2. VERSION_COMPARISON.md を読む（5分）- Solo Edition バージョン選択
3. 決定フローチャートで判定
4. 推奨: Solo Edition v1.2 Hybrid を選択
5. ads-framework-solo-minimal/QUICKSTART.md で5分で開始
```

### パターン2: 既存プロジェクトに導入
```
1. COMPARISON.md の「使い分けガイド」を読む
2. プロジェクトの現状を評価
   - チーム人数: 1-2人 → Solo v1.2、3-4人 → Solo v1.1 + Skills、5人以上 → Full
   - プロジェクト規模
   - 開発期間
3. 適切なバージョンを選択
4. 「移行パス」セクションに従って導入
```

### パターン3: Full版 ⇔ Solo Edition 間の移行
```
1. COMPARISON.md の「移行パス」セクションを読む
2. 移行手順に従う
3. 移行コスト（時間）を見積もる
4. 段階的に実施
```

### パターン4: Solo Edition バージョンアップ（v1.1 → v1.2）
```
1. VERSION_COMPARISON.md を読む（5分）
2. PERFORMANCE_VS_EXPLAINABILITY.md で品質影響を確認（5分）
3. .claude/CLAUDE.md を CLAUDE-hybrid.md に置き換え
4. 実際のタスクで動作確認
5. 問題なければ継続使用（-50%トークン削減の恩恵）
```

## 💡 よくある質問

### Q1: Solo Edition から始めて、後で Full版に移行できる？
**A**: はい、可能です。`COMPARISON.md` の「Solo Edition → Full版への移行」セクションを参照してください。移行コストは約20-30時間です。

### Q2: どちらか迷ったらどうする？
**A**: **迷ったら Solo Edition v1.2 Hybrid から始めてください**。学習コストが低く、必要になったら Full版に移行できます。

### Q3: Solo Edition の v1.1 と v1.2、どちらを使うべき？
**A**: **v1.2 Hybrid を推奨**します。理由：
- 50%少ないトークン使用量（コンテキスト高速化）
- 94%の説明品質維持（-6%のみの低下）
- 本番環境での使用に最適化
- v1.1は学習用または詳細な例が必要な場合のみ

詳細は `VERSION_COMPARISON.md` 参照。

### Q4: チーム3人の場合は？
**A**: Solo Edition v1.2 + Skills の併用を推奨します。Full版は5人以上のチームに最適化されています。

### Q5: v1.2で説明品質が下がるのが心配です
**A**: `PERFORMANCE_VS_EXPLAINABILITY.md` のテスト結果によると、平均-5.8%の品質低下で-50%のトークン削減を実現。Claude Codeは簡潔なガイドラインを自身の知識で補完するため、実用上の問題はありません。6シナリオで検証済み。

### Q6: コストの差はどれくらい？
**A**: Claude API使用料で月間100タスクの場合：
- Full版: $20.70
- Solo Edition v1.1: $15.20（-27%）
- Solo Edition v1.2: $7.60（-63%）

詳細は `COMPARISON.md` および `PERFORMANCE_OPTIMIZATION_ANALYSIS.md` 参照。

### Q7: v1.0は使えますか？
**A**: **非推奨**です。`POWER_DOWN_ANALYSIS.md` で特定された2つのCRITICAL問題（タスク分解自動化の喪失、エスカレーション検出の喪失）により、v1.1以降を使用してください。

## 📖 関連ドキュメント

### Solo Edition
- `/ads-framework-solo-minimal/README.md` - Solo Edition の使い方
- `/ads-framework-solo-minimal/QUICKSTART.md` - 5分で始めるチュートリアル
- `/ads-framework-solo-minimal/CLAUDE.md` - v1.1 Baseline（481行）
- `/ads-framework-solo-minimal/CLAUDE-hybrid.md` - v1.2 Hybrid（244行、推奨）

### 比較・分析ドキュメント（このディレクトリ）
- `COMPARISON.md` - Full版 vs Solo Edition の徹底比較
- `VERSION_COMPARISON.md` - Solo Edition 3バージョン比較（**重要**）
- `POWER_DOWN_ANALYSIS.md` - v1.0の問題分析
- `PERFORMANCE_OPTIMIZATION_ANALYSIS.md` - トークン最適化分析
- `PERFORMANCE_VS_EXPLAINABILITY.md` - 性能vs品質のトレードオフ研究
- `FURTHER_IMPROVEMENTS.md` - 9つの改善機会

### Full版
- `/extracted/README.md` - Full版の使い方
- `/extracted/HANDOVER.md` - Full版の設計思想
- `/extracted/.claude/frameworks/` - 各層の詳細定義

### Skills
- `/example-skills/README.md` - Skills の使い方
- `/example-skills/solo-dev-workflow/SKILL.md` - 個人開発ワークフロー

## 📈 データに基づく推奨

### 個人開発（1人）
- **推奨**: Solo Edition
- **理由**: 学習コスト 98%削減、セットアップ時間 93%削減

### 小規模チーム（2-4人）
- **推奨**: Solo Edition + Skills
- **理由**: シンプルさを保ちつつ、共通ワークフローで効率化

### 中規模チーム（5-10人）
- **推奨**: Full版（段階的導入）
- **理由**: 体系的なワークフローとレビュープロセスが必要

### 大規模チーム（10人以上）
- **推奨**: Full版（完全導入）
- **理由**: 複雑なタスク管理と依存関係の可視化が必須

## 🎓 学習リソース

### フェーズ1: 概要理解（25分）

1. **COMPARISON.md を読む**（20分）
   - Full版 vs Solo Edition の全体像
   - 使い分けの理解

2. **VERSION_COMPARISON.md を読む**（5分）
   - Solo Edition 3バージョンの比較
   - **推奨**: v1.2 Hybrid（244行、性能最適化版）

### フェーズ2: 深掘り（オプション、30分）

3. **POWER_DOWN_ANALYSIS.md**（10分）
   - v1.0で何が失われたか
   - v1.1で何が修正されたか

4. **PERFORMANCE_OPTIMIZATION_ANALYSIS.md**（10分）
   - トークン使用量の詳細分析
   - v1.2最適化の根拠

5. **PERFORMANCE_VS_EXPLAINABILITY.md**（10分）
   - 性能向上と品質低下のトレードオフ
   - 6シナリオでのテスト結果

### フェーズ3: 実践開始（10分）

6. **実例を確認**
   - COMPARISON.mdの「実例比較」セクション
   - Todoアプリの例、ECサイトの例

7. **決定する**
   - 決定フローチャート使用
   - 最終推奨表を参照

8. **該当バージョンで開始**
   - Solo Edition v1.2: 5分で開始（QUICKSTART.md参照）
   - Solo Edition v1.1: 15分で学習完了
   - Full版: 2時間で基礎習得

## 🔗 リンク

- [ADS Framework リポジトリ](https://github.com/Toshiki-Yasuda/ADS-Framework-)
- [Anthropic公式ドキュメント](https://code.claude.com/docs)
- [Conventional Commits](https://www.conventionalcommits.org/)

---

**作成日**: 2026-01-15
**更新日**: 2026-01-15
**バージョン**: 1.0.0
