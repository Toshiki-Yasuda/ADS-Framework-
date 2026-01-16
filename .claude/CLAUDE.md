# ADS Framework - Solo Developer Edition (v1.3 Ultra-light)

**Version**: v1.3 Ultra-light
**Optimization**: Skills併用でトークン最小化（プロジェクト固有情報のみ）

---

**✅ Skills**: `.claude/skills/solo-dev-workflow/` から共通ワークフロー自動適用

---

## プロジェクト概要
個人開発者向けの軽量版ADS Framework。複数バージョン（v1.0〜v1.3）を提供し、プロジェクト規模に応じた最適なClaude Code設定を実現するフレームワーク研究プロジェクト。

## よく使うコマンド
```bash
# ドキュメント確認
cat ads-framework-solo-minimal/CLAUDE*.md
wc -l ads-framework-solo-minimal/*.md

# バージョン比較
cat comparison/VERSION_COMPARISON.md
cat comparison/EVALUATION_SUMMARY.md

# テスト実行
bash test-v1.3-integration.sh

# Git操作
git status
git log --oneline -10
git diff
```

## 技術スタック
- **ドキュメント**: Markdown (GitHub Flavored)
- **バージョン管理**: Git
- **テスト**: Bash scripts
- **Claude Code**: Skills integration

## ディレクトリ構造
```
ADS-Framework-/
├── .claude/
│   ├── CLAUDE.md                       # このファイル（v1.3）
│   └── skills/solo-dev-workflow/       # 共通ワークフロー（520行）
├── ads-framework-solo-minimal/
│   ├── CLAUDE.md                       # v1.1 Baseline (481行)
│   ├── CLAUDE-hybrid.md                # v1.2 Hybrid (244行)
│   ├── CLAUDE-ultralight.md            # v1.3 Template (80行)
│   └── CLAUDE-ultralight-sample.md     # v1.3 Sample
├── comparison/                          # バージョン比較分析
├── example-skills/                      # Skillsテンプレート
└── test-v1.3-integration.sh            # 統合テスト
```

## プロジェクト固有ルール

### バージョン管理戦略
4つのバージョンを提供:
- **v1.0 Initial**: 250行（非推奨・参考用）
- **v1.1 Baseline**: 481行（学習・トレーニング用）
- **v1.2 Hybrid**: 244行（単一プロジェクト推奨）
- **v1.3 Ultra-light**: 80行（複数プロジェクト最適）

### ドキュメント規約
- **行数制限**: 各バージョンで厳密に管理
- **トークン計算**: 1行 ≈ 3トークンで見積もり
- **メトリクス記録**: 変更時は必ずVERSION_COMPARISON.mdを更新

### ファイル命名規則
```
CLAUDE.md              # v1.1 Baseline
CLAUDE-hybrid.md       # v1.2 Hybrid
CLAUDE-ultralight.md   # v1.3 Ultra-light
```

### テスト要件
新バージョン追加時:
1. 統合テストスクリプト作成（test-v*.sh）
2. VERSION_COMPARISON.md更新
3. EVALUATION_SUMMARY.md更新
4. README.md更新

### コミットメッセージ規約（プロジェクト固有）
```
feat(solo): v1.X追加
docs(comparison): 比較分析更新
test: 統合テストスクリプト追加
```

### Skills統合ルール
- **共通ワークフロー**: `.claude/skills/solo-dev-workflow/SKILL.md`
- **プロジェクト固有情報**: このファイル（CLAUDE.md）に記載
- **Skillsの変更時**: サンプル（CLAUDE-ultralight-sample.md）も更新

---

**Note**: 開発ワークフロー（5ステップ）、Git運用、エラーハンドリング、セキュリティチェック等は
`.claude/skills/solo-dev-workflow/SKILL.md` から自動適用されます。
