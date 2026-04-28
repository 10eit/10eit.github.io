---
layout: page
title: 首页
permalink: /
---

这里是我按主题整理过的博客入口。现在首页只保留少量精选文章，其余内容请从专题页进入。

## 精选文章

{% assign featured_posts = site.posts | where: "featured", true %}
{% for post in featured_posts limit: 2 %}
### [{{ post.title }}]({{ post.url | relative_url }})

`{{ post.date | date: "%Y-%m-%d" }}`{% if post.tags %} · {{ post.tags | join: " / " }}{% endif %}

{% endfor %}

## 专题导航

### [数理逻辑]({{ "/logic/" | relative_url }})

收录数理逻辑、证明论、模型论与相关学习笔记。

### [认知神经与科研]({{ "/neuro/" | relative_url }})

收录计算认知神经科学方向的思考、科研感受与相关记录。

### [物理与建模]({{ "/physics-modeling/" | relative_url }})

收录物理课程笔记、动力系统与建模相关文章。
