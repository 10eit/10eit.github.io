---
layout: page
title: 认知神经与科研
permalink: /neuro/
---

{% assign posts = site.posts | where: "theme", "neuro" %}
{% for post in posts %}
### [{{ post.title }}]({{ post.url | relative_url }})

{% if post.tags %} · {{ post.tags | join: " / " }}{% endif %}

{% endfor %}
