---
layout: page
title: 物理与建模
permalink: /physics-modeling/
---

这里整理物理课程笔记、动力系统与建模相关文章。

{% assign posts = site.posts | where: "theme", "physics-modeling" %}
{% for post in posts %}
### [{{ post.title }}]({{ post.url | relative_url }})

`{{ post.date | date: "%Y-%m-%d" }}`{% if post.tags %} · {{ post.tags | join: " / " }}{% endif %}

{% endfor %}
