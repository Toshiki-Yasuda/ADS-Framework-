# ADS Framework - Solo Developer Edition (Ultra-light / Skills併用版)

**Version**: v1.3 Ultra-light
**Target**: 複数プロジェクトでSkills版と併用
**Optimization**: -87% tokens (1,450→186) - プロジェクト固有情報のみ

---

**⚠️ 使用前の準備**:
このテンプレートはSkills版との併用を前提としています。
```bash
# Skills版をインストール
mkdir -p ~/.claude/skills
cp -r /path/to/ADS-Framework-/example-skills/solo-dev-workflow ~/.claude/skills/
```

---

# [プロジェクト名]

## プロジェクト概要
[1-2文で説明: 何を作るプロジェクトか]

例: Reactベースのタスク管理アプリケーション

## よく使うコマンド
```bash
[開発サーバー起動コマンド]     # 例: npm run dev
[ビルドコマンド]               # 例: npm run build
[テスト実行コマンド]           # 例: npm test
[Lint実行コマンド]             # 例: npm run lint
[型チェックコマンド]           # 例: npm run typecheck
```

## 技術スタック
- [フロントエンド技術]          # 例: React 18 + TypeScript
- [ビルドツール]                # 例: Vite
- [スタイリング]                # 例: Tailwind CSS
- [テストフレームワーク]        # 例: Vitest

## ディレクトリ構造
```
src/
├── [主要ディレクトリ1]/       # 例: components/ - Reactコンポーネント
├── [主要ディレクトリ2]/       # 例: hooks/ - カスタムフック
├── [主要ディレクトリ3]/       # 例: types/ - 型定義
└── [主要ディレクトリ4]/       # 例: utils/ - ユーティリティ
```

## プロジェクト固有ルール

### データモデル
```typescript
// 主要な型定義（プロジェクト固有）
interface [主要な型] {
  // フィールド定義
}
```

### コーディング規約（プロジェクト固有）
- [規約1]  # 例: すべてのコンポーネントはTypeScriptで記述
- [規約2]  # 例: デフォルトエクスポートは使用しない
- [規約3]  # 例: Propsは明示的に型定義（Props suffix）

### 状態管理
- [状態管理方針]  # 例: グローバル状態不要（全てローカルstate）
- [永続化方針]    # 例: LocalStorageでデータ永続化

### スタイリング
- [スタイリング方針]  # 例: Tailwind CSS utility classes使用
- [制約事項]          # 例: カスタムCSSは最小限

### テスト
- [テストツール]      # 例: Vitest + Testing Library
- [カバレッジ目標]    # 例: 80%以上

---

**注**: 開発ワークフロー、Git運用ルール、エラーハンドリング、セキュリティチェック等は
`~/.claude/skills/solo-dev-workflow/SKILL.md` から自動適用されます。
