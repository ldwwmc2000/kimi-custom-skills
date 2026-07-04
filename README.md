# Kimi 自定义 Skills 仓库

集中管理和自动更新 Kimi 自定义 Skills。

## Skills 列表

| Skill | 大小 | 描述 | 源地址 |
|-------|------|------|--------|
| chinese-grant-writer | ~142 KB | 国自然基金申请书写作技能集（含4个子技能） | [HuiyuLi-2000/Chinese-Grant-Writer-Skills](https://github.com/HuiyuLi-2000/Chinese-Grant-Writer-Skills) |
| visiomaster | ~2.1 MB | Visio 图形重建工具包 | [rss3208/visiomaster](https://github.com/rss3208/visiomaster) |
| paper-framework-figure-studio-pro | ~12 MB | 论文框架图制图 Skill | [c-narcissus/paper-framework-figure-studio-pro](https://github.com/c-narcissus/paper-framework-figure-studio-pro) |
| image-to-editable-ppt | ~116 KB | 图片转可编辑 PPT | [ningzimu/image-to-editable-ppt-skill](https://github.com/ningzimu/image-to-editable-ppt-skill) |

## 快速安装

### 方式一：手动下载
点击 [Releases](https://github.com/ldwwmc2000/kimi-custom-skills/releases) 页面，下载最新的 `.skill` 文件，在 Kimi 中导入即可。

### 方式二：自动更新脚本
```bash
# 克隆仓库
git clone https://github.com/ldwwmc2000/kimi-custom-skills.git
cd kimi-custom-skills

# 一键更新所有 Skills
bash scripts/update-skills.sh
```

### 方式三：GitHub Actions 自动更新
仓库已配置每周自动检查更新，更新后的 `.skill` 文件会自动发布到 Releases。

## 目录结构

```
/
├── skills/              # 所有 .skill 文件
│   ├── chinese-grant-writer.skill
│   ├── visiomaster.skill
│   ├── paper-framework-figure-studio-pro.skill
│   └── image-to-editable-ppt.skill
├── scripts/             # 管理和更新脚本
│   └── update-skills.sh
├── .github/
│   └── workflows/       # 自动更新工作流
│       └── auto-update.yml
└── README.md            # 本文件
```
