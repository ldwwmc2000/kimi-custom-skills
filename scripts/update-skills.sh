#!/bin/bash
# Kimi 自定义 Skills 自动更新脚本
# 使用方法: bash scripts/update-skills.sh

set -e

SKILLS_DIR="skills"
TEMP_DIR=$(mktemp -d)
trap "rm -rf $TEMP_DIR" EXIT

# 定义所有 Skills 及其 GitHub 源仓库
declare -A SKILL_REPOS=(
    ["chinese-grant-writer"]="https://github.com/HuiyuLi-2000/Chinese-Grant-Writer-Skills"
    ["visiomaster"]="https://github.com/rss3208/visiomaster"
    ["paper-framework-figure-studio-pro"]="https://github.com/c-narcissus/paper-framework-figure-studio-pro"
    ["image-to-editable-ppt"]="https://github.com/ningzimu/image-to-editable-ppt-skill"
)

# Skill 对应的子目录（默认 "" 表示根目录）
declare -A SKILL_SUBDIRS=(
    ["chinese-grant-writer"]=""
    ["visiomaster"]=""
    ["paper-framework-figure-studio-pro"]=""
    ["image-to-editable-ppt"]="skills/image-to-editable-ppt"
)

echo "========================================"
echo "  Kimi Custom Skills Updater"
echo "========================================"
echo ""

# 创建输出目录
mkdir -p "$SKILLS_DIR"

# 遍历更新每个 Skill
for skill_name in "${!SKILL_REPOS[@]}"; do
    repo_url="${SKILL_REPOS[$skill_name]}"
    subdir="${SKILL_SUBDIRS[$skill_name]}"
    skill_file="$SKILLS_DIR/$skill_name.skill"
    
    echo "[1/4] 检查更新: $skill_name"
    echo "      源: $repo_url"
    
    # 克隆仓库到临时目录
    clone_dir="$TEMP_DIR/$skill_name"
    echo "      克隆仓库..."
    if git clone --depth 1 "$repo_url" "$clone_dir" 2>/dev/null; then
        
        # 如果指定了子目录，进入该目录
        if [ -n "$subdir" ] && [ -d "$clone_dir/$subdir" ]; then
            source_dir="$clone_dir/$subdir"
        else
            source_dir="$clone_dir"
        fi
        
        # 使用 skill-creator 的 package_skill.py 打包
        echo "      打包 Skill..."
        if python3 /app/.agents/skills/skill-creator/scripts/package_skill.py "$source_dir" "$SKILLS_DIR/" 2>/dev/null; then
            echo "      ✅ 更新成功: $skill_name"
        else
            echo "      ⚠️  打包失败，尝试直接复制..."
            # 如果源仓库已有 .skill 文件，直接复制
            if [ -f "$clone_dir"/*.skill ]; then
                cp "$clone_dir"/*.skill "$skill_file"
                echo "      ✅ 复制成功: $skill_name"
            else
                echo "      ❌ 更新失败: $skill_name"
            fi
        fi
    else
        echo "      ❌ 克隆失败: $repo_url"
    fi
    echo ""
done

echo "========================================"
echo "  更新完成！"
echo "========================================"
echo ""
echo "已安装的 Skills:"
ls -lh "$SKILLS_DIR"/*.skill 2>/dev/null || echo "  (暂无)"
echo ""
echo "使用方式:"
echo "  1. 在 Kimi 中导入 skills/ 目录下的 .skill 文件"
echo "  2. 或将本仓库设置为自动同步源"
