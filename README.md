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

### 方式一：从 Releases 下载（推荐）
点击右侧 [Releases](https://github.com/ldwwmc2000/kimi-custom-skills/releases) 下载最新的 `.skill` 文件，在 Kimi 中导入即可。

### 方式二：一键更新脚本
```bash
# 克隆仓库
git clone https://github.com/ldwwmc2000/kimi-custom-skills.git
cd kimi-custom-skills

# 一键拉取最新 Skills 并打包
bash scripts/update-skills.sh
```

### 方式三：手动安装
```bash
# 国自然基金写作技能（整合包）
bash scripts/update-skills.sh chinese-grant-writer

# Visio 图形重建
bash scripts/update-skills.sh visiomaster

# 论文框架图制图
bash scripts/update-skills.sh paper-framework-figure-studio-pro

# 图片转可编辑PPT
bash scripts/update-skills.sh image-to-editable-ppt
```

## 已安装 Skills 详细信息

### 1. chinese-grant-writer（国自然基金写作）
**触发场景：** 撰写 NSFC、NSSFC、省部级自科/社科申请书

**包含子技能：**
| 子技能 | 负责章节 |
|--------|---------|
| fund-research-content-writer | 研究目标 / 研究内容 / 关键科学问题 |
| fund-technical-route-writer | 研究方法 / 技术路线 / 创新和特色 |
| fund-background-writer | 立项依据 / 研究意义 |
| fund-literature-review-writer | 国内外研究现状 / 文献评述 |

**使用流程：** 研究内容设计 → 技术路线撰写 → 立项依据撰写 → 文献综述撰写

### 2. visiomaster（Visio 图形重建）
**触发场景：** 将流程图、架构图、论文模块图从图片重建为可编辑 Visio

**核心能力：**
- 图像 → 可编辑 .vsdx（保留形状、文字、连接线）
- 同时导出 .svg 和 .png
- 支持严格复刻模式（source-faithful）
- 内置视觉审查闭环

**适用：** 流程框图、系统架构图、论文模块图/注意力机制图

### 3. paper-framework-figure-studio-pro（论文框架图制图）
**触发场景：** 为论文 method overview、architecture diagram 制图

**核心能力：**
- 多样化候选草案生成
- ACM/IEEE/AAAI 线稿风格
- S0-S5 流水线（论文理解 → 风格选择 → 草图 → 候选 → 优化 → 终审）

### 4. image-to-editable-ppt（图片转可编辑PPT）
**触发场景：** 将截图式/图片式幻灯片转为可编辑 PPT

**核心能力：**
- 图片/PDF → 可编辑 .pptx
- 文字恢复为原生文本框
- 简单几何恢复为 PPT 形状
- 复杂视觉元素保留为独立图片资产

## 目录结构

```
/
├── skills/              # 打包好的 .skill 文件
│   ├── chinese-grant-writer.skill
│   ├── visiomaster.skill
│   ├── paper-framework-figure-studio-pro.skill
│   └── image-to-editable-ppt.skill
├── scripts/
│   └── update-skills.sh # 一键更新脚本
├── .github/
│   └── workflows/       # 自动更新工作流（计划中）
└── README.md            # 本文件
```

## 自动更新计划

- **每周一 UTC 02:00** 自动检查各 Skills 源仓库的更新
- 检测到更新后自动重新打包并发布到 Releases
- 支持 [手动触发](https://github.com/ldwwmc2000/kimi-custom-skills/actions) 立即更新
