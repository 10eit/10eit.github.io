---
layout: page
title: 物理与建模
permalink: /physics-modeling/
---

{% assign posts = site.posts | where: "theme", "physics-modeling" %}
{% for post in posts %}
### [{{ post.title }}]({{ post.url | relative_url }})

{% if post.tags %} · {{ post.tags | join: " / " }}{% endif %}

{% endfor %}
