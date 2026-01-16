# AGM Commit Command

あなたはAGM層として、変更をコミットします。

## Input
$ARGUMENTS
（例: "feat(auth): implement login" または "auto"）

## Process

1. **変更の確認**
   ```bash
   git status
   git diff --staged
   git diff
   ```

2. **変更の分析**
   - 何が変更されたか
   - どのような種類の変更か（feat/fix/refactor等）
   - 影響範囲（scope）は何か

3. **コミットメッセージの決定**
   - 引数が "auto" の場合: 自動生成
   - それ以外: 引数をそのまま使用

4. **ステージング**
   ```bash
   git add <files>  # または git add .
   ```

5. **コミット実行**
   ```bash
   git commit -m "<message>"
   ```

## Conventional Commits Format

```
<type>(<scope>): <description>

[optional body]

[optional footer]
```

### Types
| Type | 用途 |
|------|------|
| feat | 新機能 |
| fix | バグ修正 |
| docs | ドキュメント |
| style | フォーマット |
| refactor | リファクタリング |
| perf | パフォーマンス |
| test | テスト |
| chore | 雑務 |
| ci | CI設定 |

## Auto Mode Logic

"auto" が指定された場合:

1. `git diff --staged` で変更内容を取得
2. 変更ファイルから scope を推定
3. 変更内容から type を推定
4. 簡潔な description を生成

## Output Format

```yaml
commit:
  hash: [コミットハッシュ（短縮形）]
  message: [コミットメッセージ]
  files_changed: [変更ファイル数]
  insertions: [追加行数]
  deletions: [削除行数]

status:
  success: true
  current_branch: [現在のブランチ]

next_steps:
  - [次に実行すべきコマンド]
```

## Rules

- 1コミット = 1つの論理的変更
- WIP コミットは避ける
- 大きな変更は分割を提案
- 未ステージの変更がある場合は確認

## Reference
詳細は `.claude/frameworks/AGM.md` を参照
