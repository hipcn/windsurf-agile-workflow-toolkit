# Windsurf 自动规则生成与敏捷工作流模板

**重要更新说明**

Windsurf 作为革命性的 AI 编程 IDE，提供了独特的规则生成和管理机制。本模板旨在帮助开发者通过自然语言快速建立和维护 AI 代码生成规则。

> 💡 **注意：** 关于 Windsurf 敏捷工作流系统的完整指南，请参见 [敏捷工作流文档](docs/agile-readme.md)。

## 模板核心特性

通过精细的规则和自定义工作流，你可以充分发挥 Windsurf AI 代理的潜力。本模板确保：

- 规则能自动且准确地应用
- 支持按需精确使用规则
- 持续优化 AI 代理的学习和改进能力

## 快速开始 A - 使用敏捷工作流和规则生成器创建新项目

```bash
# 克隆仓库
git clone https://github.com/bmadcode/windsurf-auto-rules-agile-workflow.git
cd windsurf-auto-rules-agile-workflow

# 应用到新项目
./apply-rules.sh /path/to/your/project

示例：
./apply-rules.sh ~/projects/my-project
```

## 快速开始 B - 为现有项目添加规则生成器

```bash
# 克隆仓库
git clone https://github.com/bmadcode/windsurf-auto-rules-agile-workflow.git
cd windsurf-auto-rules-agile-workflow

# 应用规则到项目
./apply-rules.sh /path/to/your/project
```

## 规则生成工作流

```mermaid
graph TD
    subgraph 用户行为
        A[用户发现需要改进<br>AI行为] --> B[用户提出规则<br>创建/更新请求]
        H[用户继续<br>开发] --> A
    end

    subgraph AI代理行为
        B --> C[AI分析请求]
        C --> D[AI创建/更新<br>规则文件]
        D --> E[AI应用规则<br>格式化标准]
        E --> F[AI验证规则]
        F --> G[AI确认规则<br>实现]
    end

    subgraph 持续改进
        G --> H
    end
end
```

## 规则生成示例

- "为 TypeScript 文件创建注释标准规则"
- "确保 TypeScript 文件中有适当的错误处理"
- "更新测试标准，要求覆盖率达到 80%"
- "创建导入组织规则，按组和字母顺序排列"

## 开始使用

1. 克隆此仓库或将其用作项目模板
2. 保留 `.windsurf` 目录及其内容
3. 开始使用 AI 代理管理你的规则！

## License

MIT
