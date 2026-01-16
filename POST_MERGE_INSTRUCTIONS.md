# v1.3 Ultra-light マージ後の確認手順

## 統合テスト実行

マージ完了後、以下のコマンドを実行してください:

```bash
# Step 1: mainブランチに切り替え
git checkout main

# Step 2: 最新のmainをpull
git pull origin main

# Step 3: 統合テストを実行
bash test-v1.3-integration.sh
```

## 期待される結果

全て ✅ が表示されること:

```
=== v1.3 Ultra-light統合テスト ===

📥 Step 1: mainブランチを更新...
Already on 'main'
Already up to date.

📁 Step 2: v1.3ファイルの確認...
✅ CLAUDE-ultralight.md: 存在
80 ads-framework-solo-minimal/CLAUDE-ultralight.md
✅ CLAUDE-ultralight-sample.md: 存在
62 ads-framework-solo-minimal/CLAUDE-ultralight-sample.md

📊 Step 3: VERSION_COMPARISON.mdにv1.3が含まれているか...
✅ v1.3の記載あり

📖 Step 4: READMEのバージョン選択ガイド確認...
✅ v1.3の記載あり

📋 Step 5: 全バージョンファイル確認...
(全てのCLAUDE*.mdファイルのリスト)

=== テスト完了 ===
全て✅なら、v1.3は正常に統合されています！
```

## トラブルシューティング

### ❌ ファイルが存在しない
→ マージが完了していない可能性。GitHubでPRのマージを再確認

### ❌ VERSION_COMPARISON.mdにv1.3の記載なし
→ ブランチが古い可能性。`git pull origin main` を再実行

### ❌ 行数が一致しない
→ ファイルが正しくマージされていない。差分を確認:
```bash
git diff origin/claude/review-repository-structure-ST39K ads-framework-solo-minimal/CLAUDE-ultralight.md
```

## 次のステップ

統合テストが全て ✅ なら、v1.3 Ultra-lightの準備完了です！

### v1.3を使い始める

```bash
# Skills版をインストール (一度だけ)
mkdir -p ~/.claude/skills
cp -r example-skills/solo-dev-workflow ~/.claude/skills/

# プロジェクトでテンプレートを使用
cp ads-framework-solo-minimal/CLAUDE-ultralight.md your-project/.claude/CLAUDE.md
# テンプレートを編集してプロジェクト固有情報を記入
```

詳細は `ads-framework-solo-minimal/README.md` を参照してください。
