---
layout: default
title: 想法
permalink: /ideas/
lang: zh-CN
description: 尚未写成完整博客的判断、问题与推理片段。
---

{% assign ideas = site.ideas | where: "lang", "zh-CN" | sort: "path" %}
<article class="content-container list-page ideas-page" data-archive-kind="ideas">
  <header class="list-header"><h1>想法</h1><p>{{ page.description }}</p></header>

  <div class="archive-controls" role="search">
    <label class="search-field" for="article-search"><span class="visually-hidden">搜索想法</span><input id="article-search" type="search" autocomplete="off" placeholder="搜索标题或内容…"></label>
  </div>

  <p class="result-count" id="result-count" aria-live="polite">显示全部 {{ ideas | size }} 条想法</p>
  <div class="idea-list" id="article-list">
    {% for idea in ideas %}
      <article class="idea-row" data-article data-idea data-search="{{ idea.title | append: ' ' | append: idea.content | strip_html | normalize_whitespace | downcase | escape }}">
        <h2>{{ idea.title }}</h2>
        <div class="idea-content prose" data-idea-content>{{ idea.content }}</div>
        <button class="idea-toggle" type="button" data-idea-toggle hidden aria-expanded="false">展开</button>
      </article>
    {% endfor %}
  </div>
  <p class="empty-state" id="empty-state" hidden>没有找到匹配的想法。</p>
</article>

<script defer src="{{ '/assets/js/archive.js' | relative_url }}"></script>
