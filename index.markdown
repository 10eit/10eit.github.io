---
layout: default
title: Yanlin Fu
permalink: /
lang: zh-CN
description: 个人主页。
---

<article class="home-page content-container">
  <header class="about-header">
    <h1>Yanlin Fu</h1>
    <p class="subtitle">认知科学 & 人工智能</p>
  </header>

  <div class="about-grid">
    <div class="about-copy">
      <p>我目前在一家BCI初创工作，此前在复旦大学就读核物理本科（辅修理论计算机与计算认知神经科学），并从事计算认知神经科学相关研究。</p>
      <p>我希望理解人类认知行为背后的机制，以及形式系统、计算模型和神经影像能否帮助我们更准确地描述智能。这里主要收录的是我的学习笔记与研究心得。</p>
      <p class="social-links"><a href="mailto:yanlin.fu2002@gmail.com">Email</a><a href="https://github.com/10eit">GitHub</a><a href="https://www.linkedin.com/in/yanlin-fu-4b6886222">CV</a></p>
    </div>
    <aside class="profile-meta" aria-label="个人信息">
      <p><strong>研究兴趣</strong><br>认知科学<br>可解释性研究<br>市场微观结构</p>
      <p><strong>偏好语言</strong><br>中文 / English</p>
    </aside>
  </div>

  <section class="home-section">
    <h2>经历</h2>
    <div class="news-list">
      <div><time>2026.5-现在</time><p>在一家BCI初创担任算法工程师。</p></div>
      <div><time>2026.1-2026.4</time><p> 在一家私募做量化研究实习。</p></div>
      <div><time>2023.9-2025.12</time><p> 在复旦大学类脑智能科学与技术研究院做本科生RA。</p></div>
    </div>
  </section>

  <!-- <section class="home-section">
    <h2>内容</h2>
    <div class="topic-list">
      <a href="{{ '/research/' | relative_url }}"><strong>研究</strong><span>数理逻辑、计算认知神经科学、物理与建模的技术笔记</span></a>
      <a href="{{ '/ideas/' | relative_url }}"><strong>想法</strong><span>关于科研、认知与技术的观察、随笔和未完成的问题</span></a>
      <a href="{{ '/miscellany/' | relative_url }}"><strong>小玩意儿</strong><span>工具、小项目，以及值得留存的站外链接</span></a>
    </div>
  </section> -->

  <section class="home-section">
    <h2><a href="{{ '/writing/' | relative_url }}">近期博客</a></h2>
    <div class="post-table">
      {% for post in site.posts limit: 5 %}
        <div><time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%Y-%m-%d" }}</time><a href="{{ post.url | relative_url }}">{{ post.title }}</a></div>
      {% endfor %}
    </div>
  </section>

  <section class="home-section friend-section">
    <h2>友链</h2>
    <div class="friend-links">
      <div class="friend-link friend-link-placeholder">
        <strong class="friend-name">朋友的名字</strong>
        <span class="friend-description">一句简短介绍</span>
        <span class="friend-domain">example.com</span>
      </div>

      <!-- 新增友链时复制下面这段，并替换链接、名字、介绍和域名：
      <a class="friend-link" href="https://example.com" target="_blank" rel="noopener noreferrer">
        <strong class="friend-name">朋友的名字</strong>
        <span class="friend-description">一句简短介绍</span>
        <span class="friend-domain">example.com ↗</span>
      </a>
      -->
    </div>
  </section>
</article>
