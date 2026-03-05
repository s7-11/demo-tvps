# Vercel HTML TypeScript Project

一个可以在 Vercel 上部署的 HTML + TypeScript 项目。

## 项目结构

```
.
├── index.html          # HTML 入口文件
├── src/
│   └── main.ts        # TypeScript 源代码
├── dist/              # 编译后的 JavaScript 文件（自动生成）
├── package.json       # 项目配置
├── tsconfig.json      # TypeScript 配置
├── vercel.json        # Vercel 部署配置
└── .gitignore         # Git 忽略文件
```

## 本地开发

1. 安装依赖：
```bash
npm install
```

2. 编译 TypeScript：
```bash
npm run build
```

3. 开发模式（自动监听文件变化）：
```bash
npm run dev
```

4. 在浏览器中打开 `index.html` 查看效果

## 部署到 Vercel

### 方法一：一键部署脚本

#### Windows 用户
```powershell
# 运行 PowerShell 脚本
.deploy.ps1
```

#### Linux/macOS 用户
```bash
# 赋予脚本执行权限
chmod +x deploy.sh
# 运行脚本
./deploy.sh
```

### 方法二：通过 Vercel CLI

1. 安装 Vercel CLI：
```bash
npm i -g vercel
```

2. 登录 Vercel：
```bash
vercel login
```

3. 部署：
```bash
vercel
```

### 方法三：通过 Git

1. 将代码推送到 GitHub/GitLab/Bitbucket

2. 在 Vercel 控制台导入项目

3. Vercel 会自动检测并部署

## 功能特性

- ✅ TypeScript 类型安全
- ✅ HTML 入口文件
- ✅ 自动编译到 dist 目录
- ✅ Vercel 优化配置
- ✅ 安全头部配置
- ✅ 响应式设计

## 注意事项

- 确保在部署前运行 `npm run build` 编译 TypeScript
- HTML 文件引用的是 `./dist/main.js`，确保编译后的文件存在
- Vercel 会自动处理静态文件部署
