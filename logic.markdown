---
layout: page
title: 数理逻辑
permalink: /logic/
---

{% assign posts = site.posts | where: "theme", "logic" %}
{% for post in posts %}
### [{{ post.title }}]({{ post.url | relative_url }})

{% if post.tags %} · {{ post.tags | join: " / " }}{% endif %}

{% endfor %}
