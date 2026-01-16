#!/bin/bash
# v1.3 統合テストスクリプト

echo "=== v1.3 Ultra-light統合テスト ==="
echo ""

# Step 1: mainを最新化
echo "📥 Step 1: mainブランチを更新..."
git checkout main
git pull origin main

# Step 2: v1.3ファイルの存在確認
echo ""
echo "📁 Step 2: v1.3ファイルの確認..."
if [ -f "ads-framework-solo-minimal/CLAUDE-ultralight.md" ]; then
    echo "✅ CLAUDE-ultralight.md: 存在"
    wc -l ads-framework-solo-minimal/CLAUDE-ultralight.md
else
    echo "❌ CLAUDE-ultralight.md: 存在しない"
fi

if [ -f "ads-framework-solo-minimal/CLAUDE-ultralight-sample.md" ]; then
    echo "✅ CLAUDE-ultralight-sample.md: 存在"
    wc -l ads-framework-solo-minimal/CLAUDE-ultralight-sample.md
else
    echo "❌ CLAUDE-ultralight-sample.md: 存在しない"
fi

# Step 3: VERSION_COMPARISON.mdの確認
echo ""
echo "📊 Step 3: VERSION_COMPARISON.mdにv1.3が含まれているか..."
if grep -q "v1.3 Ultra-light" comparison/VERSION_COMPARISON.md; then
    echo "✅ v1.3の記載あり"
    grep "v1.3 Ultra-light" comparison/VERSION_COMPARISON.md | head -3
else
    echo "❌ v1.3の記載なし"
fi

# Step 4: READMEの更新確認
echo ""
echo "📖 Step 4: READMEのバージョン選択ガイド確認..."
if grep -q "v1.3 Ultra-light" ads-framework-solo-minimal/README.md; then
    echo "✅ v1.3の記載あり"
else
    echo "❌ v1.3の記載なし"
fi

# Step 5: バージョン一覧
echo ""
echo "📋 Step 5: 全バージョンファイル確認..."
ls -lh ads-framework-solo-minimal/CLAUDE*.md

echo ""
echo "=== テスト完了 ==="
echo "全て✅なら、v1.3は正常に統合されています！"
