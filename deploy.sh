#!/bin/bash

# 一键部署脚本 - 部署到 Vercel

echo "🚀 开始部署到 Vercel..."

# 检查 Node.js 是否安装
if ! command -v node &> /dev/null; then
    echo "❌ 错误: Node.js 未安装，请先安装 Node.js"
    exit 1
fi

# 检查 npm 是否安装
if ! command -v npm &> /dev/null; then
    echo "❌ 错误: npm 未安装，请先安装 npm"
    exit 1
fi

# 安装依赖
echo "📦 安装项目依赖..."
npm install
if [ $? -ne 0 ]; then
    echo "❌ 错误: 依赖安装失败"
    exit 1
fi

# 构建项目
echo "🔨 构建项目..."
npm run build
if [ $? -ne 0 ]; then
    echo "❌ 错误: 项目构建失败"
    exit 1
fi

# 检查 Vercel CLI 是否安装
if ! command -v vercel &> /dev/null; then
    echo "📦 安装 Vercel CLI..."
    npm install -g vercel
    if [ $? -ne 0 ]; then
        echo "❌ 错误: Vercel CLI 安装失败"
        exit 1
    fi
fi

# 部署到 Vercel
echo "🚀 部署到 Vercel..."
vercel --prod
if [ $? -ne 0 ]; then
    echo "❌ 错误: 部署失败"
    exit 1
fi

echo "✅ 部署成功！"
echo "🌐 项目已部署到 Vercel"
