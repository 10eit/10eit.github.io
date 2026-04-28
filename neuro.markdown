---
layout: page
title: 认知神经与科研
permalink: /neuro/
---

这里整理计算认知神经科学方向的思考、科研感受与相关记录。

{% assign posts = site.posts | where: "theme", "neuro" %}
{% for post in posts %}
### [{{ post.title }}]({{ post.url | relative_url }})

`{{ post.date | date: "%Y-%m-%d" }}`{% if post.tags %} · {{ post.tags | join: " / " }}{% endif %}

{% endfor %}
