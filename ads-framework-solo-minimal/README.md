# ADS Framework - Solo Developer Edition

**個人開発者向け軽量版** - Claude Codeと協調した効率的な開発フレームワーク

## 📖 概要

ADS Framework Solo Editionは、個人開発者のために最適化された軽量版フレームワークです。
複雑な階層構造を排除し、**Anthropic公式のベストプラクティスに準拠**した実践的なガイドラインを提供します。

### 🎯 特徴

- ✅ **超軽量**: CLAUDE.md 1ファイルのみ（481行、v1.1で拡張）
- ✅ **即戦力**: 開発に必要な全ガイドラインを凝縮
- ✅ **公式準拠**: Anthropic公式推奨に100%準拠
- ✅ **実践的**: 抽象的な階層なし、具体的な指示のみ
- ✅ **学習容易**: 20分で理解、即日から使用可能
- ✅ **品質保証**: タスク分解、エスカレーション、セキュリティチェック完備

### ⚠️ 制限事項と推奨

Solo Edition は個人開発（1-2人）向けに最適化されています。以下の場合は**Full版**の使用を推奨します:

| シナリオ | Solo Edition | Full版推奨 | 理由 |
|---------|-------------|-----------|------|
| **小規模タスク**（〜2時間） | ✅ 最適 | - | シンプルで効率的 |
| **中規模タスク**（2-8時間） | ⚠️ 可能 | - | タスク分解を手動で記録 |
| **大規模タスク**（8時間以上） | ❌ 非推奨 | ✅ 推奨 | 自動タスク分解・DAG必要 |
| **複雑な依存関係**（10個以上のタスク） | ❌ 非推奨 | ✅ 推奨 | 依存関係グラフ必要 |
| **チーム開発**（5人以上） | ❌ 非推奨 | ✅ 推奨 | 体系的なワークフロー必要 |

**重要な注意事項**:
- 🔐 **セキュリティ関連**: 実装前に必ずエスカレーションチェックリストを確認
- 📊 **大規模タスク**: 2時間超の場合は手動でYAML形式のタスク分解を記録
- 🎯 **品質重視**: コミット前チェックリストを厳守（セキュリティ、パフォーマンス、リグレッション）

### 📊 Full版との比較

| 項目 | ADS Framework Full | Solo Edition |
|------|-------------------|--------------|
| ファイル数 | 19ファイル | 1ファイル |
| 総行数 | 約2,000行 | 481行 |
| 学習時間 | 2時間 | 20分 |
| 複雑度 | 4層ヒエラルキー | フラット構造 |
| 対象 | チーム開発（5人以上） | 個人開発（1-2人） |
| 小タスク所要時間 | 5分 | 30秒 |
| タスク分解 | 完全自動（YAML） | 手動推奨（YAML形式提供） |
| エスカレーション | 自動判定 | 事前チェックリスト |
| 品質チェック | 包括的（6項目） | 包括的（9項目） |

## 🚀 クイックスタート

### バージョン選択ガイド

Solo Editionには3つのバージョンがあります:

| バージョン | 行数 | トークン | 推奨用途 |
|-----------|------|---------|---------|
| **v1.2 Hybrid** | 244行 | ~730 | **単一プロジェクト（推奨）** |
| **v1.3 Ultra-light** | 80行 | ~186 | **複数プロジェクト + Skills** |
| v1.1 Baseline | 481行 | ~1,450 | 学習用・詳細な例が必要な場合 |

#### パターン A: 単一プロジェクトのみ（推奨）
```bash
# v1.2 Hybrid を使用
cp CLAUDE-hybrid.md .claude/CLAUDE.md
```
**メリット**: シンプル、1ファイルで完結、セットアップ不要

#### パターン B: 複数プロジェクト（同じワークフロー）
```bash
# 1. Skills版をインストール（1回のみ）
mkdir -p ~/.claude/skills
cp -r example-skills/solo-dev-workflow ~/.claude/skills/

# 2. 各プロジェクトには軽量版を配置
cp CLAUDE-ultralight.md project-a/.claude/CLAUDE.md
cp CLAUDE-ultralight.md project-b/.claude/CLAUDE.md
```
**メリット**: -75%トークン、ワークフロー統一、複数PJで効率的

### インストール

```bash
# テンプレートとして使用
git clone https://github.com/Toshiki-Yasuda/ADS-Framework-.git
cd ADS-Framework-/ads-framework-solo-minimal

# パターンAの場合
cp CLAUDE-hybrid.md /path/to/your/project/.claude/CLAUDE.md

# パターンBの場合
cp CLAUDE-ultralight.md /path/to/your/project/.claude/CLAUDE.md
```

### 使い方

1. **バージョンを選択してCLAUDE.mdを配置**
   ```bash
   mkdir -p .claude
   # パターンA: cp CLAUDE-hybrid.md .claude/CLAUDE.md
   # パターンB: cp CLAUDE-ultralight.md .claude/CLAUDE.md
   ```

2. **プロジェクト固有情報を編集**
   ```bash
   # .claude/CLAUDE.md を開いて以下を更新:
   # - プロジェクト概要
   # - よく使うコマンド（npm scripts等）
   # - ディレクトリ構造
   # - プロジェクト固有ルール
   ```

3. **Claude Codeで開発開始**
   ```bash
   cd /path/to/your/project
   claude "ユーザー認証機能を実装して"
   ```

## 📁 ファイル構成

```
your-project/
├── CLAUDE.md           # これだけ！（250行）
├── .gitignore          # 標準的な設定
├── README.md           # プロジェクトの説明
├── package.json        # 依存関係
└── src/                # ソースコード
    ├── components/
    ├── utils/
    └── __tests__/
```

## 📚 CLAUDE.md に含まれる内容

### 1. 開発環境セットアップ
- 必要な環境
- よく使うコマンド

### 2. コード規約
- スタイル基準（インデント、行幅等）
- TypeScript設定
- 命名規則
- ディレクトリ構造

### 3. Git運用ルール
- ブランチ戦略（feature/fix/docs等）
- Conventional Commits形式
- コミット前チェックリスト

### 4. 開発ワークフロー（5ステップ）
1. **調査**: 変更箇所の特定
2. **計画**: 変更内容の整理
3. **実装**: コードの変更
4. **テスト**: 品質保証（80%カバレッジ目標）
5. **コミット**: 変更の記録

### 5. エラーハンドリング
- 基本原則
- エラーの種類と対処

### 6. パフォーマンス最適化
- 基本方針（測定してから最適化）
- チェックポイント

### 7. セキュリティ
- 必須対策（環境変数、入力検証等）
- 禁止事項

### 8. ドキュメント
- コメント規則（JSDoc）
- README必須セクション

### 9. エスカレーション条件
- 人間の判断が必要な場合

### 10. トラブルシューティング
- よくある問題と解決方法

## 💡 使用例

### 例1: 新機能の実装

```bash
claude "ユーザープロフィール編集機能を実装して"
```

**Claude Codeの動作**:
1. CLAUDE.mdを自動読み込み
2. 5ステップワークフロー（調査→計画→実装→テスト→コミット）に従って実行
3. Conventional Commits形式で自動コミット: `feat(profile): implement user profile edit`

### 例2: バグ修正

```bash
claude "null pointer exception in getUserData() を修正して"
```

**Claude Codeの動作**:
1. 調査フェーズ: 関連コードを検索
2. 計画フェーズ: 修正箇所を特定
3. 実装フェーズ: nullチェックを追加
4. テストフェーズ: エッジケースのテスト追加
5. コミットフェーズ: `fix(api): add null check for getUserData`

### 例3: リファクタリング

```bash
claude "utils/date.ts のコードを整理して"
```

**Claude Codeの動作**:
1. 既存テストが存在することを確認
2. 小さく段階的にリファクタリング
3. 各ステップでテストが通ることを確認
4. `refactor(utils): extract date formatting logic`

## 🎓 Anthropic公式準拠ポイント

Solo Editionは、以下のAnthropic公式ベストプラクティスに完全準拠:

| 公式推奨 | Solo Edition | 状態 |
|---------|--------------|------|
| CLAUDE.md < 500行 | 250行 | ✅ |
| Be specific | "2スペース", "80%カバレッジ" | ✅ |
| Use structure | Markdownセクション整理 | ✅ |
| Include commands | npm scripts明記 | ✅ |
| Start small | 1ファイルのみ | ✅ |
| Progressive growth | 必要に応じて拡張可能 | ✅ |

**参考**: [Claude Code Memory Best Practices](https://code.claude.com/docs/en/memory.md)

## 📈 段階的な拡張パス

プロジェクトが成長したら、以下の順で拡張可能:

### Phase 1: Minimal（現在）
```
CLAUDE.md のみ
```
**適用**: プロジェクト開始〜1,000行

### Phase 2: Light
```
CLAUDE.md + .claude/settings.json
```
**適用**: 1,000行〜10,000行、秘密情報を扱い始めたら

**settings.json 追加例**:
```json
{
  "permissions": {
    "allow": ["Bash(npm:*)", "Bash(git:*)", "Read(**)", "Edit(**)", "Write(**)"],
    "deny": ["Read(.env)", "Read(.env.*)", "Read(secrets/**)"]
  }
}
```

### Phase 3: Skills
```
CLAUDE.md + 個人用Skills (~/.claude/skills/)
```
**適用**: 複数プロジェクトで共通ワークフローを再利用したい場合

### Phase 4: Team Edition
```
ADS Framework Full版に移行
```
**適用**: チーム規模5人以上になったら

## 🔧 カスタマイズ方法

### 1. よく使うコマンドを追加
```markdown
## よく使うコマンド
```bash
npm run dev          # 開発サーバー起動
npm run storybook    # Storybook起動  ← 追加
```
```

### 2. プロジェクト固有のルールを追加
```markdown
## プロジェクト固有ルール
- APIレスポンスは必ず `ApiResponse<T>` 型でラップ
- エラーは `AppError` クラスを継承
```

### 3. チェックリストを追加
```markdown
## デプロイ前チェックリスト
- [ ] 環境変数が設定されているか
- [ ] DBマイグレーションが実行されているか
- [ ] E2Eテストが通るか
```

## 🆚 どちらを選ぶべきか？

### Solo Edition を選ぶべき人
- ✅ 個人開発者
- ✅ 小規模プロジェクト（〜10,000行）
- ✅ 迅速なプロトタイピング
- ✅ シンプルさを重視

### Full版を選ぶべき人
- ✅ チーム開発（5人以上）
- ✅ 大規模プロジェクト（10,000行以上）
- ✅ 長期運用（6ヶ月以上）
- ✅ 厳格な品質管理が必要

## 📖 参考資料

### 公式ドキュメント
- [Claude Code Documentation](https://code.claude.com/docs)
- [Anthropic API Documentation](https://docs.anthropic.com/)

### 関連標準
- [Conventional Commits](https://www.conventionalcommits.org/)
- [Semantic Versioning](https://semver.org/)
- [AGENTS.md Standard](https://github.com/anthropics/claude-code)

### 開発ガイド
- [TypeScript Handbook](https://www.typescriptlang.org/docs/)
- [Testing Best Practices](https://testingjavascript.com/)
- [Git Best Practices](https://git-scm.com/book/en/v2)

## 🤝 コントリビューション

改善提案は歓迎します！

```bash
# Issueを作成
https://github.com/Toshiki-Yasuda/ADS-Framework-/issues

# Pull Request
git checkout -b feature/improve-solo-edition
# 変更を加える
git commit -m "docs(solo): improve quick start guide"
git push origin feature/improve-solo-edition
```

## 📄 ライセンス

MIT License

## 🙏 謝辞

- **Anthropic** - Claude Code公式ドキュメントとベストプラクティス
- **Conventional Commits** - コミットメッセージ標準
- **コミュニティ** - フィードバックと貢献

---

**作成日**: 2026-01-15
**バージョン**: 1.0.0
**メンテナー**: Toshiki Yasuda
**ベース**: ADS Framework Full版
**準拠**: Anthropic公式ベストプラクティス
