# Documentation Guidelines

このディレクトリでの作業時に適用される追加ルールです。

## ドキュメント構成

```
docs/
├── README.md           # ドキュメントの目次
├── getting-started.md  # 入門ガイド
├── architecture.md     # アーキテクチャ説明
├── api/               # API リファレンス
│   ├── overview.md
│   └── endpoints/
├── guides/            # ハウツーガイド
│   ├── authentication.md
│   └── deployment.md
└── contributing.md    # コントリビューションガイド
```

## Markdownスタイル

### 見出し
- `#` はファイルタイトルのみ（1回）
- `##` 以降で構造化
- 階層は3段階まで（`###` まで）

### コードブロック
- 言語を必ず指定: \`\`\`typescript
- 長いコードは折りたたみを検討

### リンク
- 相対パスを使用: `[リンク](./other-doc.md)`
- 外部リンクは新しいタブ指示なし（Markdownの標準動作に従う）

## テンプレート

### API エンドポイント
```markdown
## POST /api/users

ユーザーを作成します。

### Request

\`\`\`typescript
{
  name: string;
  email: string;
}
\`\`\`

### Response

\`\`\`typescript
{
  id: number;
  name: string;
  email: string;
  createdAt: string;
}
\`\`\`

### Errors

| Code | Description |
|------|-------------|
| 400 | Invalid request body |
| 409 | Email already exists |
```

### ガイド
```markdown
# ガイドタイトル

## 概要
[このガイドで何ができるようになるか]

## 前提条件
- [必要な知識/セットアップ]

## 手順

### 1. 最初のステップ
[説明]

### 2. 次のステップ
[説明]

## まとめ
[振り返り]

## 次のステップ
- [関連ガイドへのリンク]
```
