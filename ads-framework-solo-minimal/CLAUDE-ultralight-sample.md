# My Todo App

## プロジェクト概要
Reactベースのシンプルなタスク管理アプリケーション

## よく使うコマンド
```bash
npm run dev          # 開発サーバー起動 (localhost:3000)
npm run build        # 本番ビルド
npm test             # テスト実行
npm run lint         # ESLint実行
npm run typecheck    # TypeScript型チェック
```

## 技術スタック
- React 18 + TypeScript
- Vite
- Tailwind CSS
- Vitest

## ディレクトリ構造
```
src/
├── components/      # Reactコンポーネント
│   ├── TodoList.tsx
│   └── TodoItem.tsx
├── hooks/          # カスタムフック
│   └── useTodos.ts
├── types/          # 型定義
│   └── todo.ts
└── utils/          # ユーティリティ
    └── storage.ts
```

## プロジェクト固有ルール

### データモデル
```typescript
interface Todo {
  id: string;
  title: string;
  completed: boolean;
  createdAt: Date;
}
```

### コンポーネント規約
- すべてのコンポーネントはTypeScriptで記述
- Propsは明示的に型定義（Props suffix）
- デフォルトエクスポートは使用しない（named exportのみ）

### 状態管理
- グローバル状態不要（全てローカルstate）
- LocalStorageでデータ永続化

### スタイリング
- Tailwind CSS utility classes使用
- カスタムCSSは最小限

### テスト
- コンポーネントテスト: Vitest + Testing Library
- カバレッジ目標: 80%以上
