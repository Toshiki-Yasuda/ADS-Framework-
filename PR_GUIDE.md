# GitHub PR作成ガイド

## PRとは？

**Pull Request（プルリクエスト）** = ブランチの変更をmainに取り込むリクエスト

### なぜ必要？
- mainブランチは保護されている（直接pushできない）
- コードレビューのプロセス
- 変更内容の記録・追跡

## 作成手順（画像で見るイメージ）

### ステップ1: URLにアクセス

```
https://github.com/Toshiki-Yasuda/ADS-Framework-/compare/main...claude/review-repository-structure-ST39K
```

または、GitHub上で:
1. リポジトリトップページ
2. "Pull requests" タブ
3. "New pull request" ボタン

### ステップ2: ブランチを確認

画面に表示される:
```
base: main  ← ここに取り込む
compare: claude/review-repository-structure-ST39K  ← この変更を
```

下にスクロールすると、変更されたファイルの一覧と差分が表示されます:
```
✅ Files changed (5)
- ads-framework-solo-minimal/CLAUDE-ultralight.md (新規)
- ads-framework-solo-minimal/CLAUDE-ultralight-sample.md (新規)
- test-v1.3-integration.sh (新規)
- comparison/VERSION_COMPARISON.md (更新)
- comparison/README.md (更新)
```

### ステップ3: PR情報を入力

**Title (タイトル):**
```
feat(solo): add v1.3 Ultra-light version with Skills integration
```

**Description (説明):**
`PR_DESCRIPTION.md` の内容をコピー&ペースト:

```bash
# リポジトリ内で確認
cat PR_DESCRIPTION.md
```

### ステップ4: PRを作成

1. "Create pull request" ボタンをクリック
2. PR番号が発行される（例: #1, #2など）

### ステップ5: レビュー & マージ

**レビュー（オプション）:**
- 変更内容を確認
- コメントを追加
- 承認（Approve）

**マージ:**
1. "Merge pull request" ボタンをクリック
2. "Confirm merge" をクリック
3. 完了！ ✅

mainブランチにv1.3の変更が取り込まれます。

## マージ後の確認

```bash
# mainブランチに切り替え
git checkout main

# 最新の変更を取得
git pull origin main

# 統合テスト実行
bash test-v1.3-integration.sh
```

全て ✅ が表示されれば成功です！

## よくある質問

### Q1: PRとコミットの違いは？
- **コミット**: ローカルでの変更の記録
- **PR**: GitHubでブランチをマージするリクエスト

### Q2: 自分のPRを自分でマージできる？
- はい！個人リポジトリなら可能です
- チームプロジェクトでは他の人のレビューが必要なことも

### Q3: PRを作成せずに直接mainにpushできない？
- mainブランチが保護されている場合は不可
- 保護設定を解除すれば可能だが、推奨されない

### Q4: PR作成後に追加のコミットをしたい場合は？
- 同じブランチにコミット&pushすれば自動的にPRに追加される
- PRを閉じる必要はない

## トラブルシューティング

### エラー: "No commits between main and your branch"
→ ブランチがmainと同じ状態。変更をコミット&pushしてください

### エラー: "Conflicts"
→ mainブランチと競合があります。マージが必要:
```bash
git checkout claude/review-repository-structure-ST39K
git merge main
# 競合を解決
git commit
git push
```

### PR作成ボタンが見つからない
→ 以下のURLに直接アクセス:
```
https://github.com/Toshiki-Yasuda/ADS-Framework-/compare/main...claude/review-repository-structure-ST39K
```

## 参考リンク

- [GitHub公式: Pull Requestについて](https://docs.github.com/ja/pull-requests/collaborating-with-pull-requests)
- [GitHub公式: PRの作成方法](https://docs.github.com/ja/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request)
