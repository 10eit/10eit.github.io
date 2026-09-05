---
layout: default
title: 博客
permalink: /writing/
lang: zh-CN
description: 学习笔记或者一些教程。
---

<article class="content-container list-page writing-page">
  <header class="list-header"><h1>博客</h1><p>{{ page.description }}</p></header>

  <div class="archive-controls" role="search">
    <label class="search-field" for="article-search"><span class="visually-hidden">搜索博客</span><input id="article-search" type="search" autocomplete="off" placeholder="搜索标题或摘要…"></label>
  </div>

  <p class="result-count" id="result-count" aria-live="polite">显示全部 {{ site.posts | size }} 篇博客</p>
  <div class="entry-list" id="article-list">
    {% for post in site.posts %}
      <article class="entry-row" data-article data-search="{{ post.title | append: ' ' | append: post.content | strip_html | normalize_whitespace | downcase | escape }}">
        <time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%Y-%m-%d" }}</time>
        <div><h2><a lang="{{ post.lang | default: 'zh-CN' }}" href="{{ post.url | relative_url }}">{{ post.title }}</a></h2><p lang="{{ post.lang | default: 'zh-CN' }}">{{ post.content | strip_html | normalize_whitespace | truncate: 150 }}</p></div>
      </article>
    {% endfor %}
  </div>
  <p class="empty-state" id="empty-state" hidden>没有找到匹配的博客。</p>
</article>

<script defer src="{{ '/assets/js/archive.js' | relative_url }}"></script>
