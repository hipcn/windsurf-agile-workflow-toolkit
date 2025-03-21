@echo off
setlocal EnableDelayedExpansion
chcp 65001 >nul

REM 检查是否提供了目标目录
if "%~1"=="" (
    echo 错误：请提供目标项目目录
    echo 用法：%~nx0 ^<目标项目目录^>
    exit /b 1
)
set "TARGET_DIR=%~1"

REM 创建目标目录（如果不存在），并初始化 README.md
if not exist "%TARGET_DIR%\" (
    echo 创建新项目目录：%TARGET_DIR%
    mkdir "%TARGET_DIR%"
    (
        echo # 新项目
        echo.
        echo 本项目已使用敏捷工作流支持和自动规则生成进行配置，来自 [windsurf-auto-rules-agile-workflow](https://github.com/bmadcode/windsurf-auto-rules-agile-workflow)
        echo.
        echo 有关工作流文档，请参见 [工作流规则](docs/workflow-rules.md)
    ) > "%TARGET_DIR%\README.md"
)

REM 创建 .windsurf/rules 目录
if not exist "%TARGET_DIR%\.windsurf\rules\" (
    mkdir "%TARGET_DIR%\.windsurf\rules"
)

REM 创建 .windsurf/templates 目录
if not exist "%TARGET_DIR%\.windsurf\templates\" (
    mkdir "%TARGET_DIR%\.windsurf\templates"
)

REM 复制核心规则文件（不覆盖已存在的文件）
echo 复制核心规则文件...
for %%F in (.windsurf\rules\*.mdc) do (
    if not exist "%TARGET_DIR%\.windsurf\rules\%%~nxF" (
        copy "%%F" "%TARGET_DIR%\.windsurf\rules\" >nul
    )
)

REM 复制模板文件
echo 复制模板文件...
xcopy ".windsurf\templates\*.*" "%TARGET_DIR%\.windsurf\templates\" /E /I /Y >nul

REM 创建 docs 目录并生成工作流规则文档
if not exist "%TARGET_DIR%\docs\" (
    mkdir "%TARGET_DIR%\docs"
)

(
    echo # Windsurf 工作流规则
    echo.
    echo 本项目已使用来自 [windsurf-auto-rules-agile-workflow](https://github.com/bmadcode/windsurf-auto-rules-agile-workflow) 的自动规则生成器。
    echo.
    echo ^> **注意**：此脚本可以在任何时候安全地重新运行，以更新模板规则到最新版本。它不会影响或覆盖您创建的任何自定义规则。
    echo.
    echo ## 核心功能
    echo.
    echo - 自动规则生成
    echo - 标准化文档格式
    echo - AI 行为控制和优化
    echo - 灵活的工作流集成选项
    echo.
    echo ## 工作流集成选项
    echo.
    echo ### 1^. 自动规则应用（推荐）
    echo 核心工作流规则已自动安装在 ^.windsurf/rules/：
    echo - `901-prd^.mdc` - 产品需求文档标准
    echo - `902-arch^.mdc` - 架构文档标准
    echo - `903-story^.mdc` - 用户故事标准
    echo - `801-workflow-agile^.mdc` - 完整的敏捷工作流（可选）
    echo.
    echo 这些规则将自动应用于相应的文件类型。
    echo.
    echo ### 2^. 记事本工作流
    echo 为了更灵活的方法，请使用 `xnotes/` 中的模板：
    echo 1^. 启用记事本
    echo 2^. 创建一个新的记事本（例如“敏捷”）
    echo 3^. 复制 `xnotes/workflow-agile^.md` 的内容
    echo 4^. 在对话中使用 `@notepad-name`
    echo.
    echo ^> **提示**：记事本方法适用于：
    echo ^> - 初始项目设置
    echo ^> - 故事实现
    echo ^> - 集中的开发会话
    echo ^> - 减少上下文开销
    echo.
    echo ## 入门
    echo.
    echo 1^. 查看 `xnotes/` 中的模板
    echo 2^. 选择您喜欢的工作流方法
    echo 3^. 启用 Windsurf 记事本（如果使用灵活工作流选项）
    echo 4^. 要开始新项目，请使用 `xnotes/project-idea-prompt^.md` 作为模板
    echo    来编写您的初始消息给 AI 代理
) > "%TARGET_DIR%\docs\workflow-rules.md"

REM 更新 .gitignore（如果需要）
if not exist "%TARGET_DIR%\.gitignore" (
    (
        echo # 私有个人用户 Windsurf 规则
        echo .windsurf/rules/_*.mdc
        echo.
        echo # 文档和模板
        echo xnotes/
        echo docs/
    ) > "%TARGET_DIR%\.gitignore"
) else (
    findstr /C:".windsurf/rules/_*.mdc" "%TARGET_DIR%\.gitignore" >nul
    if errorlevel 1 (
        echo. >> "%TARGET_DIR%\.gitignore"
        echo # 私有个人用户 Windsurf 规则 >> "%TARGET_DIR%\.gitignore"
        echo .windsurf/rules/_*.mdc >> "%TARGET_DIR%\.gitignore"
        echo. >> "%TARGET_DIR%\.gitignore"
        echo # 文档和模板 >> "%TARGET_DIR%\.gitignore"
        echo xnotes/ >> "%TARGET_DIR%\.gitignore"
        echo docs/ >> "%TARGET_DIR%\.gitignore"
    )
)

REM 创建 xnotes 目录并复制模板
echo 设置记事本模板...
if not exist "%TARGET_DIR%\xnotes\" (
    mkdir "%TARGET_DIR%\xnotes"
)
xcopy "xnotes\*.*" "%TARGET_DIR%\xnotes\" /E /I /Y >nul

REM 更新 .windsurfignore
if exist "%TARGET_DIR%\.windsurfignore" (
    findstr /C:"xnotes/" "%TARGET_DIR%\.windsurfignore" >nul
    if errorlevel 1 (
        (
            echo.
            echo # 项目笔记和模板
            echo xnotes/
        ) >> "%TARGET_DIR%\.windsurfignore"
    )
) else (
    (
        echo # 项目笔记和模板
        echo xnotes/
    ) > "%TARGET_DIR%\.windsurfignore"
)

REM 创建或更新 .windsurfindexingignore
if exist "%TARGET_DIR%\.windsurfindexingignore" (
    findstr /C:".windsurf/templates/" "%TARGET_DIR%\.windsurfindexingignore" >nul
    if errorlevel 1 (
        (
            echo.
            echo # 模板 - 可访问但不索引
            echo .windsurf/templates/
        ) >> "%TARGET_DIR%\.windsurfindexingignore"
    )
) else (
    (
        echo # 模板 - 可访问但不索引
        echo .windsurf/templates/
    ) > "%TARGET_DIR%\.windsurfindexingignore"
)

REM 删除 test.txt 文件（如果存在）
if exist "%TARGET_DIR%\test.txt" (
    del "%TARGET_DIR%\test.txt"
)

echo.
echo ✨ 部署完成！
echo 📁 核心规则：%TARGET_DIR%\.windsurf\rules\
echo 📁 模板：%TARGET_DIR%\.windsurf\templates\
echo 📝 记事本模板：%TARGET_DIR%\xnotes\
echo 📄 文档：%TARGET_DIR%\docs\workflow-rules.md
echo 🔒 更新 .gitignore

echo.
echo 下一步：
echo 1. 查看文档 docs\workflow-rules.md
echo 2. 选择您喜欢的工作流方法
echo 3. 启用 Windsurf 记事本（如果使用灵活工作流选项）
echo 4. 要开始新项目，请使用 xnotes\project-idea-prompt.md 作为模板

endlocal
