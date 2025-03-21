# PowerShell 交互式初始化脚本

function Show-Welcome {
    Write-Host "`n欢迎使用 Windsurf 敏捷工作流工具包！" -ForegroundColor Cyan
    Write-Host "这个脚本将帮助您快速设置项目环境。`n" -ForegroundColor Cyan
}

function Get-ProjectInfo {
    $projectName = Read-Host "请输入项目名称"
    $projectPath = Read-Host "请输入项目路径 (按回车使用当前目录)"
    
    if ([string]::IsNullOrEmpty($projectPath)) {
        $projectPath = Get-Location
    }
    
    return @{
        Name = $projectName
        Path = $projectPath
    }
}

function Initialize-Directory {
    param (
        [string]$path,
        [string]$name
    )
    
    Write-Host "`n正在初始化项目目录..." -ForegroundColor Green
    
    # 创建必要的目录
    $directories = @(
        ".windsurf",
        ".windsurf/templates",
        ".ai",
        "xnotes"
    )
    
    foreach ($dir in $directories) {
        $fullPath = Join-Path $path $dir
        if (-not (Test-Path $fullPath)) {
            New-Item -ItemType Directory -Path $fullPath | Out-Null
            Write-Host " 创建目录: $dir" -ForegroundColor Green
        }
    }
}

function Copy-Templates {
    param (
        [string]$targetPath
    )
    
    Write-Host "`n正在复制模板文件..." -ForegroundColor Green
    
    # 复制模板文件
    $templateFiles = @(
        "template-prd.md",
        "template-arch.md",
        "template-story.md"
    )
    
    foreach ($file in $templateFiles) {
        $sourcePath = Join-Path $PSScriptRoot ".windsurf/templates/$file"
        $targetFilePath = Join-Path $targetPath ".windsurf/templates/$file"
        
        if (Test-Path $sourcePath) {
            Copy-Item $sourcePath $targetFilePath -Force
            Write-Host " 复制模板: $file" -ForegroundColor Green
        }
    }
}

function Copy-ConfigFiles {
    param (
        [string]$targetPath
    )
    
    Write-Host "`n正在复制配置文件..." -ForegroundColor Green
    
    $configFiles = @{
        ".gitignore" = "Git 忽略文件"
        ".windsurfignore" = "Windsurf 忽略文件"
        ".windsurfindexingignore" = "Windsurf 索引忽略文件"
    }
    
    foreach ($file in $configFiles.Keys) {
        $sourcePath = Join-Path $PSScriptRoot $file
        $targetFilePath = Join-Path $targetPath $file
        
        if (Test-Path $sourcePath) {
            Copy-Item $sourcePath $targetFilePath -Force
            Write-Host " 复制配置: $file ($($configFiles[$file]))" -ForegroundColor Green
        }
    }
}

function Initialize-Git {
    param (
        [string]$path
    )
    
    Write-Host "`n正在初始化 Git 仓库..." -ForegroundColor Green
    
    Push-Location $path
    
    if (-not (Test-Path ".git")) {
        git init
        Write-Host " Git 仓库已初始化" -ForegroundColor Green
    }
    
    Pop-Location
}

function Show-NextSteps {
    param (
        [string]$projectName
    )
    
    Write-Host "`n 项目初始化完成！" -ForegroundColor Cyan
    Write-Host "`n接下来的步骤：" -ForegroundColor Yellow
    Write-Host "1. 进入项目目录"
    Write-Host "2. 编辑 .ai/prd.md 文件，开始定义您的项目需求"
    Write-Host "3. 使用 Windsurf AI 代理开始开发"
    Write-Host "`n祝您开发愉快！`n" -ForegroundColor Cyan
}

# 主程序
Show-Welcome
$projectInfo = Get-ProjectInfo
Initialize-Directory -path $projectInfo.Path -name $projectInfo.Name
Copy-Templates -targetPath $projectInfo.Path
Copy-ConfigFiles -targetPath $projectInfo.Path
Initialize-Git -path $projectInfo.Path
Show-NextSteps -projectName $projectInfo.Name
