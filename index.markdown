---
layout: page
title: 首页
permalink: /
---

欢迎欢迎.jpg

## 精选文章

{% assign featured_posts = site.posts | where: "featured", true %}
{% for post in featured_posts limit: 2 %}
### [{{ post.title }}]({{ post.url | relative_url }})

`{{ post.date | date: "%Y-%m-%d" }}`{% if post.tags %} · {{ post.tags | join: " / " }}{% endif %}

{% endfor %}

## 专题导航

### [数理逻辑/TCS]({{ "/logic/" | relative_url }})

收录数理逻辑、理论计算机与相关学习笔记。

### [认知科学]({{ "/neuro/" | relative_url }})

收录计算认知神经科学方向的思考与相关记录。

### [物理与建模]({{ "/physics-modeling/" | relative_url }})

收录物理课程笔记、动力系统与建模相关文章。
