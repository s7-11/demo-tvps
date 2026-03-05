# 一键部署脚本 - 部署到 Vercel

Write-Host "🚀 开始部署到 Vercel..." -ForegroundColor Green

# 检查 Node.js 是否安装
if (-not (Get-Command node -ErrorAction SilentlyContinue)) {
    Write-Host "❌ 错误: Node.js 未安装，请先安装 Node.js" -ForegroundColor Red
    exit 1
}

# 检查 npm 是否安装
if (-not (Get-Command npm -ErrorAction SilentlyContinue)) {
    Write-Host "❌ 错误: npm 未安装，请先安装 npm" -ForegroundColor Red
    exit 1
}

# 安装依赖
Write-Host "📦 安装项目依赖..." -ForegroundColor Yellow
npm install
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ 错误: 依赖安装失败" -ForegroundColor Red
    exit 1
}

# 构建项目
Write-Host "🔨 构建项目..." -ForegroundColor Yellow
npm run build
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ 错误: 项目构建失败" -ForegroundColor Red
    exit 1
}

# 检查 Vercel CLI 是否安装
if (-not (Get-Command vercel -ErrorAction SilentlyContinue)) {
    Write-Host "📦 安装 Vercel CLI..." -ForegroundColor Yellow
    npm install -g vercel
    if ($LASTEXITCODE -ne 0) {
        Write-Host "❌ 错误: Vercel CLI 安装失败" -ForegroundColor Red
        exit 1
    }
}

# 部署到 Vercel
Write-Host "🚀 部署到 Vercel..." -ForegroundColor Yellow
vercel --prod
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ 错误: 部署失败" -ForegroundColor Red
    exit 1
}

Write-Host "✅ 部署成功！" -ForegroundColor Green
Write-Host "🌐 项目已部署到 Vercel" -ForegroundColor Cyan
