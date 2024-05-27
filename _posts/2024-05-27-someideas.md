---
layout: post
title: "一些甜品级科研的感悟"
date: 2024-05-27
author: 绿色猪头
tags: [受苦]
---
<head>
    <script src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML" type="text/javascript"></script>
    <script type="text/x-mathjax-config">
        MathJax.Hub.Config({
            tex2jax: {
            skipTags: ['script', 'noscript', 'style', 'textarea', 'pre'],
            inlineMath: [['$','$']]
            }
        });
    </script>
</head>

做甜品科研已经做了快一年了，一个直观感受就是我确实不适合做科研，因为我没有那种 insights 能把好东西想出来，但是粪一点的 idea 我也不喜欢。找工作当然在任何时候都是一个很合理的选项。

但是至少还是看了下这个行业科研现状长啥样，觉得有的东西得理清楚一点。

首先要思考的是**计算神经科学**和**计算认知神经科学**的区别。

必须得说去年的时候魔怔复杂系统那一套/统计物理学那一套，其实和之前魔怔控制论那一套更喜欢强化学习差不多，其实都是一种 taste 的问题，似乎之前一直很喜欢用很简单很精美的 toy model 去模仿认知行为，这是我认为的**计算神经科学**的内容，或者我们可以这么归类：

1. 非线性动力学（LIF/HH/FitzHugh-Nagumo等等）和网络动力学（Wilson-Cowan/fast and slow aka Morris-Lecar model）来模拟神经元集群的动力学特征。我的看法就是这玩意涌现出啥我都不奇怪，但是这种 implementation 有数学人那种自嗨的感觉，例如某全脑计算模型（跑
2. 神经形态计算（neuromorphic computing）这玩意不熟，但是觉得一直是 EE 和（工程/应用）物理人的天下
3. 统计物理派最喜欢的东西感觉有两个，一个是 Ising Model，一个是 spontaneous symmetry breaking，无论是加上 RNN 还是 LLM 基本都是统计新派的做法，你问我统计物理人老派做法是啥？那当然是 Bayesian Inference(Markovian Blankets) 那一套。虽然我在参加 NMA 之前对 Bayesian 的了解少之甚少，甚至大一因为没学会 Gibbs Samping 自闭了一小会，但是后来我确实觉得这种东西更多是一种 philosophical 的观念问题，接受了那种观念理解之后就是十分 trivial 的。

控制论或者说是后来继承大统的强化学习，其实后者只做了一个对人类学习/决策的模仿，它只模仿了人类决策的试错的表象，但是没有实际模拟人类做决策的过程，但是至少足够的 biological plausiable，虽然死路一条但是是复合我理想的**计算认知神经科学**的 principle 的。

**计算认知神经科学**的重点一定是**认知**而不是在其他两个上，只做计算完全可以去转行做 LLM+ Agent 去投 ACL 故事会；只做神经为什么不跟生物人一起搞全神经元记录，发不了 cell 堆了这么高维的数据也能去忽悠物理批数学批发个 Phys Rev X/Letters。

**认知**至少要体现在下面两个方面，不分先后：

* 能够体现**人类**特有的功能
* 模型能够模仿人类的行为学结果

不想写了，先写到这里。