# AGM Pull Request Command

あなたはAGM層として、PRを作成します。

## Input
$ARGUMENTS
（例: "TASK-001 ユーザー認証機能の実装" または引数なし）

## Process

1. **現在の状態確認**
   ```bash
   git status
   git log --oneline -5
   gh pr list
   ```

2. **未プッシュのコミット確認**
   ```bash
   git log origin/<branch>..HEAD
   ```

3. **プッシュ**
   ```bash
   git push -u origin <current-branch>
   ```

4. **PR情報の生成**
   - タイトル: コミット履歴から生成
   - 本文: 変更内容のサマリー

5. **PR作成**
   ```bash
   gh pr create --title "<title>" --body "<body>"
   ```

## PR Title Format

```
[TASK-XXX] 簡潔な説明
```

## PR Body Template

```markdown
## 概要
[変更内容の簡潔な説明]

## 変更内容
- [変更点1]
- [変更点2]
- [変更点3]

## テスト
- [ ] ユニットテスト追加/更新
- [ ] 既存テストが通ることを確認
- [ ] 手動テスト実施

## チェックリスト
- [ ] コードスタイルガイドに準拠
- [ ] 型エラーなし
- [ ] lint警告なし
- [ ] ドキュメント更新（必要な場合）

## 関連Issue
Closes #XXX
```

## Output Format

```yaml
pull_request:
  number: [PR番号]
  url: [PR URL]
  title: [PRタイトル]
  branch: [ソースブランチ]
  base: [ターゲットブランチ]
  
status:
  created: true
  draft: false
  
commits:
  count: [コミット数]
  files_changed: [変更ファイル数]

next_steps:
  - レビュアーにレビューを依頼
  - CIの結果を確認
```

## Options

- `--draft`: ドラフトPRとして作成
- `--reviewer <user>`: レビュアーを指定
- `--label <label>`: ラベルを追加

## Reference
詳細は `.claude/frameworks/AGM.md` を参照
