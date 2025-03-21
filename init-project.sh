#!/bin/bash

# 设置颜色
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m' # 无颜色

# 显示欢迎信息
show_welcome() {
    echo -e "\n${CYAN}欢迎使用 Windsurf 敏捷工作流工具包！${NC}"
    echo -e "${CYAN}这个脚本将帮助您快速设置项目环境。${NC}\n"
}

# 获取项目信息
get_project_info() {
    read -p "请输入项目名称: " project_name
    read -p "请输入项目路径 (按回车使用当前目录): " project_path
    
    if [ -z "$project_path" ]; then
        project_path=$(pwd)
    fi
    
    echo "project_name=$project_name"
    echo "project_path=$project_path"
}

# 初始化目录
initialize_directory() {
    local path=$1
    local name=$2
    
    echo -e "\n${GREEN}正在初始化项目目录...${NC}"
    
    # 创建必要的目录
    directories=(".windsurf" ".windsurf/templates" ".ai" "xnotes")
    
    for dir in "${directories[@]}"; do
        if [ ! -d "$path/$dir" ]; then
            mkdir -p "$path/$dir"
            echo -e "${GREEN}✓ 创建目录: $dir${NC}"
        fi
    done
}

# 复制模板文件
copy_templates() {
    local target_path=$1
    
    echo -e "\n${GREEN}正在复制模板文件...${NC}"
    
    # 复制模板文件
    template_files=("template-prd.md" "template-arch.md" "template-story.md")
    
    for file in "${template_files[@]}"; do
        if [ -f ".windsurf/templates/$file" ]; then
            cp ".windsurf/templates/$file" "$target_path/.windsurf/templates/"
            echo -e "${GREEN}✓ 复制模板: $file${NC}"
        fi
    done
}

# 复制配置文件
copy_config_files() {
    local target_path=$1
    
    echo -e "\n${GREEN}正在复制配置文件...${NC}"
    
    declare -A config_files
    config_files[".gitignore"]="Git 忽略文件"
    config_files[".windsurfignore"]="Windsurf 忽略文件"
    config_files[".windsurfindexingignore"]="Windsurf 索引忽略文件"
    
    for file in "${!config_files[@]}"; do
        if [ -f "$file" ]; then
            cp "$file" "$target_path/"
            echo -e "${GREEN}✓ 复制配置: $file (${config_files[$file]})${NC}"
        fi
    done
}

# 初始化 Git
initialize_git() {
    local path=$1
    
    echo -e "\n${GREEN}正在初始化 Git 仓库...${NC}"
    
    cd "$path"
    
    if [ ! -d ".git" ]; then
        git init
        echo -e "${GREEN}✓ Git 仓库已初始化${NC}"
    fi
    
    cd - > /dev/null
}

# 显示下一步操作
show_next_steps() {
    local project_name=$1
    
    echo -e "\n${CYAN}🎉 项目初始化完成！${NC}"
    echo -e "\n${YELLOW}接下来的步骤：${NC}"
    echo "1. 进入项目目录"
    echo "2. 编辑 .ai/prd.md 文件，开始定义您的项目需求"
    echo "3. 使用 Windsurf AI 代理开始开发"
    echo -e "\n${CYAN}祝您开发愉快！${NC}\n"
}

# 主程序
show_welcome

# 获取项目信息并解析
eval $(get_project_info)

# 执行初始化步骤
initialize_directory "$project_path" "$project_name"
copy_templates "$project_path"
copy_config_files "$project_path"
initialize_git "$project_path"
show_next_steps "$project_name"
