#!/bin/bash

# 检查是否提供了目标目录
if [ $# -eq 0 ]; then
    echo "错误：请提供目标项目目录"
    echo "用法：./apply-rules.sh <目标项目目录>"
    exit 1
fi

# 获取目标目录路径
TARGET_DIR="$1"

# 如果目标目录不存在，则创建它
if [ ! -d "$TARGET_DIR" ]; then
    echo "📁 创建新项目目录：$TARGET_DIR"
    mkdir -p "$TARGET_DIR"
    
    # 为新项目初始化 README
    cat > "$TARGET_DIR/README.md" << 'EOL'
# 新项目

本项目已使用敏捷工作流支持和自动规则生成进行配置，来自 [windsurf-auto-rules-agile-workflow](https://github.com/bmadcode/windsurf-auto-rules-agile-workflow)。

有关工作流文档，请参见 [工作流规则](docs/workflow-rules.md)。
EOL
fi

# 创建 .windsurf/rules 目录（如果不存在）
mkdir -p "$TARGET_DIR/.windsurf/rules"

# 创建 .windsurf/templates 目录（如果不存在）
mkdir -p "$TARGET_DIR/.windsurf/templates"

# 复制核心规则文件
echo "📦 复制核心规则文件..."
cp -n .windsurf/rules/*.mdc "$TARGET_DIR/.windsurf/rules/"

# 复制模板文件
echo "📦 复制模板文件..."
cp -r .windsurf/templates/* "$TARGET_DIR/.windsurf/templates/"

# 创建 docs 目录（如果不存在）
mkdir -p "$TARGET_DIR/docs"

# 创建工作流文档
cat > "$TARGET_DIR/docs/workflow-rules.md" << 'EOL'
# Windsurf 工作流规则

本项目已更新为使用来自 [windsurf-auto-rules-agile-workflow](https://github.com/bmadcode/windsurf-auto-rules-agile-workflow) 的自动规则生成器。

> **注意**：此脚本可以在任何时候安全地重新运行，以更新模板规则到最新版本。它不会影响或覆盖您创建的任何自定义规则。

## 核心功能

- 自动规则生成
- 标准化文档格式
- AI 行为控制和优化
- 灵活的工作流集成选项

## 工作流集成选项

### 1. 自动规则应用（推荐）
核心工作流规则已自动安装在 `.windsurf/rules/` 中：
- `901-prd.mdc` - 产品需求文档标准
- `902-arch.mdc` - 架构文档标准
- `903-story.mdc` - 用户故事标准
- `801-workflow-agile.mdc` - 完整的敏捷工作流（可选）

这些规则在处理相应文件类型时会自动应用。

### 2. 基于记事本的工作流
对于更灵活的方法，请使用 `xnotes/` 中的模板：
1. 启用记事本选项
2. 创建一个新记事本（例如“敏捷”）
3. 复制 `xnotes/workflow-agile.md` 的内容
4. 在对话中使用 `@记事本名称`

> 💡 **提示**：记事本方法适用于：
> - 初始项目设置
> - 故事实现
> - 集中的开发会话
> - 减少上下文开销

## 入门

1. 查看 `xnotes/` 中的模板
2. 选择您喜欢的工作流方法
3. 开始使用 AI 并自信地工作！

有关演示和教程，请访问：[BMad Code 视频](https://youtube.com/bmadcode)
EOL

# 更新 .gitignore（如果需要）
if [ -f "$TARGET_DIR/.gitignore" ]; then
    if ! grep -q "\.windsurf/rules/_\*\.mdc" "$TARGET_DIR/.gitignore"; then
        echo -e "\n# 私有个人用户 Windsurf 规则\n.windsurf/rules/_*.mdc" >> "$TARGET_DIR/.gitignore"
    fi
else
    echo -e "# 私有个人用户 Windsurf 规则\n.windsurf/rules/_*.mdc" > "$TARGET_DIR/.gitignore"
fi

# 创建 xnotes 目录并复制模板
echo "📝 设置记事本模板..."
mkdir -p "$TARGET_DIR/xnotes"
cp -r xnotes/* "$TARGET_DIR/xnotes/"

# 更新 .windsurfignore（如果需要）
if [ -f "$TARGET_DIR/.windsurfignore" ]; then
    if ! grep -q "^xnotes/" "$TARGET_DIR/.windsurfignore"; then
        echo -e "\n# 项目笔记和模板\nxnotes/" >> "$TARGET_DIR/.windsurfignore"
    fi
else
    echo -e "# 项目笔记和模板\nxnotes/" > "$TARGET_DIR/.windsurfignore"
fi

# 创建或更新 .windsurfindexingignore
if [ -f "$TARGET_DIR/.windsurfindexingignore" ]; then
    if ! grep -q "^\.windsurf/templates/" "$TARGET_DIR/.windsurfindexingignore"; then
        echo -e "\n# 模板 - 可访问但不索引\n.windsurf/templates/" >> "$TARGET_DIR/.windsurfindexingignore"
    fi
else
    echo -e "# 模板 - 可访问但不索引\n.windsurf/templates/" > "$TARGET_DIR/.windsurfindexingignore"
fi

echo "✨ 部署完成！"
echo "📁 核心规则：$TARGET_DIR/.windsurf/rules/"
echo "📁 模板：$TARGET_DIR/.windsurf/templates/"
echo "📝 记事本模板：$TARGET_DIR/xnotes/"
echo "📄 文档：$TARGET_DIR/docs/workflow-rules.md"
echo "🔒 更新 .gitignore、.windsurfignore 和 .windsurfindexingignore"
echo ""
echo "下一步："
echo "1. 查看文档 docs/workflow-rules.md"
echo "2. 选择您喜欢的工作流方法"
echo "3. 启用 Windsurf 记事本（如果使用灵活工作流选项）"
echo "4. 要开始新项目，请使用 xnotes/project-idea-prompt.md 作为模板"
echo "   来编写您对 AI 代理的初始消息"