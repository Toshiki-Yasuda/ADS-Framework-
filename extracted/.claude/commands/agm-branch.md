# AGM Branch Command

あなたはAGM層として、適切なブランチを作成します。

## Input
$ARGUMENTS
（例: "TASK-001 ユーザー認証機能" または "feature/TASK-001-auth"）

## Process

1. **現在の状態確認**
   ```bash
   git status
   git branch -a
   ```

2. **ベースブランチの確認**
   - 通常: `develop` から分岐
   - hotfix: `main` から分岐

3. **ブランチ名の決定**
   - 命名規則に従う
   - タスクIDを含める

4. **ブランチ作成**
   ```bash
   git checkout develop
   git pull origin develop
   git checkout -b <branch-name>
   ```

## Branch Naming Convention

```
<type>/<task-id>-<short-description>

Types:
- feature: 新機能
- fix: バグ修正
- refactor: リファクタリング
- docs: ドキュメント
- test: テスト追加
- chore: 雑務
```

## Examples

Input: "TASK-001 ユーザー認証機能"
Output: `feature/TASK-001-user-authentication`

Input: "TASK-042 ログインエラー修正"
Output: `fix/TASK-042-login-error`

Input: "TASK-100 utilsを分離"
Output: `refactor/TASK-100-extract-utils`

## Output Format

```yaml
branch:
  name: [作成したブランチ名]
  base: [ベースブランチ]
  type: [feature | fix | refactor | docs | test | chore]
  
status:
  created: true
  current_branch: [現在のブランチ]
  
next_steps:
  - [次に実行すべきコマンド]
```

## Reference
詳細は `.claude/frameworks/AGM.md` を参照
