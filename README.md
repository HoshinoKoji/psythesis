# PsyThesis：北师大心理学部毕业论文非官方模板

本模板为撰写心理学部毕业论文的LaTeX用户而设计。由于作者水平有限，标准部分内容语焉不详，且LaTeX与Microsoft Word在排版逻辑上存在天然差异，最终的编译结果在排版细节上与Microsoft Word必然不同，不保证所有样式完全符合格式要求。

## 目录结构

仓库现有文件包括：
- `example.tex`，样例文件源码，使用`zhlipsum`和`lipsum`宏包生成填充文字。
- `zh-fontset.tex`，为CTeX设置字体的部分，用户应根据需要自行调整。
- `math-fontset.tex`，为设置数学字体的部分，同上。
- `en-fontset.tex`，为设置西文字体的部分，用户不应调整。
- `psythesis.cls`，提供论文样式和命令的文档类。

## 使用说明

推荐编译环境为TeX Live，最小依赖尚未整理。

在完整安装了所有宏包的情况下，`example.tex`无需修改，可以直接编译以预览论文样式。