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

## 🎯 このドキュメントの使い方

### 新規プロジェクト開始時
```bash
# COMPARISON.md の「決定フローチャート」を参照
cat COMPARISON.md | grep -A 20 "決定フローチャート"

# 条件に応じて選択:
# - Solo Edition → /ads-framework-solo-minimal/
# - Full版 → /extracted/
```

### 既存プロジェクトの見直し
```bash
# 「使い分けガイド」セクションを確認
# プロジェクトが成長したら Full版への移行を検討
```

### チーム導入時
```bash
# 「学習コスト比較」を参照
# チームサイズに応じた学習時間を見積もり
```

## 📊 クイック比較

| 項目 | Full版 | Solo Edition |
|------|--------|--------------|
| **ファイル数** | 19 | 1 |
| **学習時間** | 2時間 | 15分 |
| **対象** | チーム（5人以上） | 個人（1-2人） |
| **セットアップ** | 30分 | 2分 |

詳細は `COMPARISON.md` を参照してください。

## 🚀 推奨フロー

### パターン1: ゼロから始める
```
1. COMPARISON.md を読む（20分）
2. 決定フローチャートで判定
3. 該当するバージョンのディレクトリへ移動
4. そのディレクトリの README.md を読む
5. 使い始める
```

### パターン2: 既存プロジェクトに導入
```
1. COMPARISON.md の「使い分けガイド」を読む
2. プロジェクトの現状を評価
   - チーム人数
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

## 💡 よくある質問

### Q1: Solo Edition から始めて、後で Full版に移行できる？
**A**: はい、可能です。`COMPARISON.md` の「Solo Edition → Full版への移行」セクションを参照してください。移行コストは約20-30時間です。

### Q2: どちらか迷ったらどうする？
**A**: **迷ったら Solo Edition から始めてください**。学習コストが低く、必要になったら Full版に移行できます。

### Q3: チーム3人の場合は？
**A**: Solo Edition + Skills の併用を推奨します。Full版は5人以上のチームに最適化されています。

### Q4: コストの差はどれくらい？
**A**: Claude API使用料で月間100タスクの場合、Full版 $20.70 vs Solo Edition $15.20（約27%削減）。詳細は `COMPARISON.md` の「コスト比較」セクション参照。

## 📖 関連ドキュメント

### Solo Edition
- `/ads-framework-solo-minimal/README.md` - Solo Edition の使い方
- `/ads-framework-solo-minimal/CLAUDE.md` - 実際の設定ファイル

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

1. **COMPARISON.md を読む**（20分）
   - 全体像の把握
   - 使い分けの理解

2. **実例を確認**（10分）
   - 「実例比較」セクション
   - Todoアプリの例、ECサイトの例

3. **決定する**（5分）
   - 決定フローチャート使用
   - 最終推奨表を参照

4. **該当バージョンで開始**
   - Solo Edition: 15分で学習完了
   - Full版: 2時間で基礎習得

## 🔗 リンク

- [ADS Framework リポジトリ](https://github.com/Toshiki-Yasuda/ADS-Framework-)
- [Anthropic公式ドキュメント](https://code.claude.com/docs)
- [Conventional Commits](https://www.conventionalcommits.org/)

---

**作成日**: 2026-01-15
**更新日**: 2026-01-15
**バージョン**: 1.0.0
