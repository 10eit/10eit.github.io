---
layout: page
title: 数理逻辑
permalink: /logic/
---

这里整理数理逻辑、证明论、模型论相关的文章。

{% assign posts = site.posts | where: "theme", "logic" %}
{% for post in posts %}
### [{{ post.title }}]({{ post.url | relative_url }})

`{{ post.date | date: "%Y-%m-%d" }}`{% if post.tags %} · {{ post.tags | join: " / " }}{% endif %}

{% endfor %}
