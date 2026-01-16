#!/bin/bash
# v1.3マージ確認スクリプト

echo "🔄 mainブランチに切り替え..."
git checkout main

echo ""
echo "📥 最新の変更を取得..."
git pull origin main

echo ""
echo "🧪 統合テストを実行..."
bash test-v1.3-integration.sh

echo ""
echo "✅ 完了！全て✅が表示されていれば、v1.3の統合成功です。"
