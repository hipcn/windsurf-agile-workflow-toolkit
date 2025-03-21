# Windsurf 自动规则生成与敏捷工作流模板

> 本项目是基于 [cursor-auto-rules-agile-workflow](https://github.com/bmadcode/cursor-auto-rules-agile-workflow) 改编的 Windsurf 版本。感谢原作者 [@bmadcode](https://github.com/bmadcode) 的优秀工作。

**重要更新说明**

Windsurf 作为革命性的 AI 编程 IDE，提供了独特的规则生成和管理机制。本模板旨在帮助开发者通过自然语言快速建立和维护 AI 代码生成规则。

> 💡 **注意：** 关于 Windsurf 敏捷工作流系统的完整指南，请参见 [敏捷工作流文档](docs/agile-readme.md)。

## 模板核心特性

通过精细的规则和自定义工作流，你可以充分发挥 Windsurf AI 代理的潜力。本模板确保：

- 规则能自动且准确地应用
- 支持按需精确使用规则
- 持续优化 AI 代理的学习和改进能力

## 快速开始

### 方式一：交互式初始化（推荐）

```bash
# Windows PowerShell
git clone https://github.com/hipcn/windsurf-agile-workflow-toolkit.git
cd windsurf-agile-workflow-toolkit
.\init-project.ps1

# Linux/Mac
git clone https://github.com/hipcn/windsurf-agile-workflow-toolkit.git
cd windsurf-agile-workflow-toolkit
chmod +x init-project.sh
./init-project.sh
```

交互式初始化脚本会：
- 引导您输入项目信息
- 自动创建必要的目录结构
- 复制并配置所有模板
- 初始化 Git 仓库
- 提供后续步骤指导

### 方式二：手动配置

```bash
# Windows
.\apply-rules.bat D:\path\to\your\project

# Linux/Mac
./apply-rules.sh /path/to/your/project

示例：
# Windows
.\apply-rules.bat D:\Projects\openmanus

# Linux/Mac
./apply-rules.sh /home/user/projects/openmanus
```

## 项目结构

```
your-project/
├── .ai/                    # AI 辅助开发工作目录
├── .windsurf/             # Windsurf 配置和模板
│   └── templates/         # 项目模板
│       ├── template-prd.md     # 产品需求文档模板
│       ├── template-arch.md    # 架构设计文档模板
│       └── template-story.md   # 用户故事模板
├── xnotes/                # 项目笔记和文档
└── .gitignore            # Git 忽略配置
```

## 使用方法

1. 选择适合您的初始化方式（交互式或手动）
2. 按照指引完成项目设置
3. 开始使用 AI 代理管理您的项目！

## 常见问题

### 如何开始一个新项目？
使用交互式初始化脚本是最简单的方式。脚本会引导您完成所有必要的设置。

### 如何迁移现有项目？
1. 克隆此仓库
2. 运行交互式初始化脚本
3. 选择您的现有项目目录
4. 按照提示完成迁移

### 遇到问题怎么办？
- 检查 [敏捷工作流文档](docs/agile-readme.md)
- 查看 `.windsurf/templates` 中的示例
- 在 Issues 中提问

## 致谢与许可

### 项目来源
本项目是基于 [cursor-auto-rules-agile-workflow](https://github.com/bmadcode/cursor-auto-rules-agile-workflow) 改编的 Windsurf 版本。我们对原作者 [@bmadcode](https://github.com/bmadcode) 表示诚挚的感谢，他们的工作为本项目奠定了重要基础。

### 主要改进
- 将工作流工具从 Cursor 迁移到 Windsurf
- 优化并本地化了所有文档和模板
- 改进了工作流程和规则系统
- 增强了模板的可用性和灵活性
- 添加交互式项目初始化功能

### 许可证
本项目遵循与原项目相同的开源许可证。如有任何许可相关问题，请参考原项目或联系原作者。

## License

MIT
