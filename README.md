# 一个咕咕咕的博客

（2023 年暑假更新）我目前是复旦大学一名大二本科生，我对计算神经科学与数理逻辑都感兴趣。这是我的博客，我会发一些
自己的学习笔记与自己对一些其他事情的感想，计划是会同时使用**中文**与**英文**。以及我对排版也很感兴趣，我使用 $\LaTeX$。

(2023 Summer Updated) I am currently a sophomore student at Fudan Univerisity, and I am very interested in Computational Neuroscience and Mathematical Logic. In this blog, I will post my notes and some ideas on other things than these two topics. I will use both **Chinese** and **English**. I am also interested in typography, and I am a $\LaTeX$ user.

## Site design

The current bilingual layout is inspired by the restrained academic structure of [al-folio](https://github.com/alshedivat/al-folio). The Chinese interface uses [MiSans](https://hyperos.mi.com/font), and the English interface uses Lato Regular. MiSans is embedded as a web font and is used under Xiaomi's MiSans font license.

## 公式书写

网站使用 GitHub Pages 的 Kramdown/GFM 解析器，公式交给 MathJax 3.2.2 SVG 输出。行内公式写作 `文字 $$x^2$$ 文字`，独立公式将 `$$` 放在前后两行。这里行内的双美元符号是 Kramdown 的语法，普通 Markdown 编辑器的预览可能与网页不同。

公式里的绝对值或基数使用 `\lvert x\rvert`（或 `\vert x\vert`），避免裸 `|` 被识别为表格。集合直接写 `\{a,b\}`，不需要额外的 Markdown 双重转义。代码中的美元符号不参与公式渲染。

验证正式 Markdown 解析：`ruby tests/math_rendering_test.rb`（需要 Gemfile 中的 kramdown 和 kramdown-parser-gfm）。
