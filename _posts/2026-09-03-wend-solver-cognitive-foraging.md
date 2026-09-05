---
title: "Wend Solver 与 Cognitive Foraging"
date: 2026-09-03
lang: zh-CN
tags: [算法, 认知科学]
---

最近沉迷玩领英上的小游戏，发现比我之前用 duolingo 学拉丁语的 streak 还要长了：

![LinkedIn 游戏连续天数]({{ '/assets/images/wend-solver-linkedin-streak.jpg' | relative_url }})

玩 Zip 和 Queen 的时候还是挺开心的，但是每次玩 Wend 的时候总能耗时个两三分钟，简单来说 Wend 这个游戏就是找到几个固定长度的、一笔画能覆盖的词语，大概效果如下：

![Wend 游戏棋盘示例]({{ '/assets/images/wend-solver-puzzle.jpg' | relative_url }})

这不禁让人思考：我们有什么办法让机器很快的求解这个问题呢？

### 问题的形式化与理论情况

Wend 简单来说就是对于输入字符矩阵 $$S\in\Sigma^{N\times N}$$ 和一个布尔 mask 矩阵 $$M\in\{0,1\}^{N\times N}$$（其中数字 1 代表方格内不允许访问的格点），以及给定答案长度限制 $$L=\{\ell_1,\ell_2,\ldots, \ell_K\}$$，且满足所有答案长度之和等于 $$N^2$$ 减去 mask 的个数。将所有未被 mask 的格子视为格点图 $$G=(V,E)$$ 的顶点，边连接上下左右相邻格子。任务是寻找 $$K$$ 条两两顶点不相交的简单图 $$P_1,\ldots,P_K$$，使得 $$\vert P_k\vert =\ell_k$$、所有路径恰好覆盖 $$V$$，且沿每条路径读取的字符串属于词典 $$D$$。

对于这个问题判定的复杂度我们可以考虑一个很直观的想法，如果目标只有一个词，且该词长度等于所有可访问格点数，那么任何合法解都必然对应 $$(G,V)$$ 上的一条 Hamiltonian path。格点图上的 Hamiltonian Path 判定问题已经被 Papadimitriou 等人证明是 NP-Complete 的。直观上，Wend 至少包含了这一类困难情况：如果只要求寻找一个长度恰好覆盖所有可访问格点的单词，那么合法答案本身就对应一条 Hamiltonian path。另一方面，给定一个候选解之后，我们又可以在多项式时间内检查路径是否合法、是否覆盖所有格点以及对应字符串是否属于词典。因此可以把 Wend 视为一个 NP-Complete 类型的组合搜索问题。

> **Hamilton Paths in Grid Graphs.** Alon Itai, Christos H. Papadimitriou, and Jayme Luiz Szwarcfiter. SIAM Journal on Computing, 1982.

当然这里考虑的不是一个 real-world setting 下的问题，因为对于每个 LinkedIn Wend 小游戏解是必然存在的，讨论它的 decision problem 是没有意义的。

我们上面的 sketch 里其实用的 generalized Wend 假定的是 `aaaaa` 这样的序列是合法的，但这显然不符合游戏规则，一个可能更贴近现实版本的规约可以考虑：

> 如果考虑合法英文单词的话考虑格点图上的 $$P^3$$-partition：把图所有顶点划分成若干条互不相交的三顶点路径，然后用 `aha` 和 `hah` 构建字典，限制单词长度为三。构建格点图上的奇偶染色，走 `odd-even-odd` 和 `even-odd-even` 映射就行。
>
> from ChatGPT

### 一个暴力解

回到一个**有确定回答问题**的搜索算法上。Wend 的一个最朴素的 brute-force solver 可以分两步完成：首先，对每个目标长度 $$\ell$$ 和每个非 mask 格子作为起点，使用 DFS 枚举所有长度为 $$\ell$$ 的不重复四邻域路径，并检查路径对应字符串是否属于 $$D$$，从而得到全部合法候选 $$(w,P)$$；随后枚举这些候选路径的组合，逐个选择与已选路径不重叠、长度仍有剩余配额的候选，直到所有格子均被恰好覆盖且所有长度均被使用一次。记 $$\sum \ell_k=n$$，那么这个算法的复杂度来源是：

1. 所有的 candidate path 枚举，考虑除了起始点以往剩下最多延申 3 个方向，那么枚举这件事本身的计算就是 $$O(n\sum_{k}3^{\ell_k})$$
2. 检查 candidate path 是否合法是常数的，我们不考虑。假设检查出了 $$C$$ 条合法路径。
3. 从 $$C$$ 中选择出 $$K$$ 条路径检查条件，计算复杂度大概是 $$O(C^K)$$。

因此最后我们知道这个暴力算法的复杂度是大概是 $$O(n3^{\ell_{\max}}K+C^K)$$，稍微大一点就会很头疼的指数算法。

> 老师，可以再快一点吗？

我们可以先从英语的前缀开始优化，我们知道上面 DFS 并不是一定要对四个邻域都做，因为在遍历深度 $$\ell_k$$ 之前，可能整条路径和他们的衍生都是不合法的了，因此先对词典 $$D$$ 的前缀进行统计，这样可以去掉部分的 DFS 起始点。但是其实这并不能显著降低算法的复杂度。

### 现实世界的 heuristic

前缀优化会带来一个更自然的想法：我们能否找到一条路径，它**天生成功的概率就比较大**呢？

这里我们直接假设已经维护好了一个英文词典 $$D$$，并且已经把常见的词形变化（inflection）展开进去，例如复数、过去式、现在分词、比较级等等都直接作为合法单词处理。这样一来，英文单词本身就提供了一个很强的先验信息：例如已经走出了 `th`，那么下一个字母显然更可能是 `e` 而不是 `q`。

因此，可以把词典按照目标单词长度维护成 Trie，并在每个前缀节点上记录还有多少合法单词可以继续完成。假设当前已经走出了字符串前缀 $$p$$，对于一个相邻候选格点 $$v$$，我们可以定义

$$
\begin{aligned}
P_{\text{lex}}(v)
&\propto
\left|
\left\{
w^{\in D}:
\begin{array}{l}
|w|=\ell, w\\
\text{ starts with }pS[v]
\end{array}
\right\}
\right|
\end{aligned}
$$

它衡量的就是：**如果现在走向 $$v$$，当前前缀最后能够补成一个合法英文单词的可能性有多大。** 如果词典里还维护了真实词频，那么甚至可以不简单地数单词个数，而是对所有满足该前缀的单词词频求和。这样搜索就从“随机选择一个邻居继续 DFS”，变成了一个带有英语语言先验的 greedy search。

不过，只考虑单词概率依然不够，因为 Wend 还有一个很烦人的条件：所有格子最后都必须被恰好覆盖。一个局部看起来非常像英语单词的选择，很可能把某几个格子关在角落里，导致后面的词再也走不到。因此，在 lexical score 之外还可以加入一个很浅的图搜索作为 lookahead：对于每个候选下一步，只向前搜索两到四格，统计仍然同时满足 Trie 前缀和 self-avoiding path 的 continuation 数量；与此同时检查走过这些格子之后，剩余图中是否出现孤立点、过小的连通块，或者某个连通块的大小根本无法由剩余答案长度组合得到。

于是每一步实际上是在最大化

$$
\begin{aligned}
\mathrm{Score}(v)
={}&
\alpha\log P_{\text{lex}}(v)\\
&+\beta\log P_{\text{lookahead}}(v)\\
&+\gamma\,\mathrm{Feasibility}(v),
\end{aligned}
$$

也就是同时问一句：**这个方向像不像一个英文单词，以及走过去以后棋盘还像不像有解。**

对于多个待求的单词长度，也可以优先处理候选路径最少、约束最强的长度，类似 constraint satisfaction problem 中的 minimum remaining values heuristic。

我让 ChatGPT 给我写了一个这样的代码让他求解上面的 Wend 题目，当然最后写的是 Beam Search，但是贪心的想法是起点。

> GitHub 链接：[https://github.com/10eit/WendSolver/tree/main](https://github.com/10eit/WendSolver/tree/main)

### 人类求解的认知过程

现在我们已经告诉了机器该如何做这个任务，那么我们自己又是怎么玩这个小游戏的呢？我们先介绍一下这类小游戏的一个老祖宗。

与这个任务很像的是一个叫做 Verbal Fluency Task（VFT）的任务，也即在给定时间内说出尽可能多的同一类别词语，例如现在要求你说出不同国家名字，或者尽可能多地说出 `th` 开头的单词。

![Verbal Fluency Task 中的 cluster-switch 行为]({{ '/assets/images/wend-solver-verbal-fluency.png' | relative_url }})

一个很经典的发现是，人并不会在整个词汇空间中均匀搜索，而是表现出明显的 cluster-switch 行为：先在一个语义或者词形相近的局部区域内连续检索，当这里越来越难产生新答案之后，再跳到另一个 cluster。把记忆检索理解成这种“在局部区域采集资源、资源耗尽后换地方”的过程，也就是所谓的 cognitive foraging。

> **Clustering and switching as two components of verbal fluency: evidence from younger and older healthy adults.** Troyer AK, Moscovitch M, Winocur G. Neuropsychology. 1997 Jan;11(1):138-46. doi: 10.1037//0894-4105.11.1.138. PMID: 9055277.

这种区分在神经科学上也并不只是一个行为层面的比喻。经典的脑损伤研究发现，VFT 中的 clustering 与颞叶支持的词汇、语义表征关系更密切，而在不同 cluster 之间进行 switching 则更加依赖额叶执行控制：额叶损伤患者往往不是完全找不到相关词，而是更容易停留在已经接近耗尽的搜索区域，难以及时换一种检索策略。

更直接的证据来自 2023 年的一篇 PNAS，fMRI 内完成语义和字母 VFT（和 Wend 有些相同之处），发现从一个 cluster 切换到另一个 cluster 时，海马和后部小脑的活动显著增强；而且这种活动在当前 cluster 内搜索的过程中逐渐升高，并在发生 switch 后重新下降。换句话说，大脑似乎确实存在某种动态的“这里越来越找不到东西了，要不要换地方”的监控过程，而不仅仅是在语义空间中进行一次随机游走。

![语义与语音觅食切换过程中的神经活动]({{ '/assets/images/wend-solver-brain-activation.png' | relative_url }})

> **Neural evidence of switch processes during semantic and phonetic foraging in human memory.** N.B. Lundin, J.W. Brown, B.T. Johns, M.N. Jones, J.R. Purcell, W.P. Hetrick, B.F. O’Donnell, & P.M. Todd. Proc. Natl. Acad. Sci. U.S.A. 120 (42) e2312462120, [https://doi.org/10.1073/pnas.2312462120](https://doi.org/10.1073/pnas.2312462120) (2023).

Wend 可以看作一个更复杂的版本：我们不仅需要在 lexical space 中寻找高概率的单词，还需要同时在二维的 visual-spatial space 中寻找一条可行路径。例如看到 `th` 以后，多年的语言经验会让 `the-`、`thi-` 等相连接的词根自动获得更高优先级；但如果沿着某个高概率单词继续走会留下孤立格点，又需要放弃当前候选并切换到另一条路径。因此人类求解时可能不是在所有路径之间平均地进行 DFS，而更像是在语言和空间共同定义的几个高概率区域之间不断执行 exploit→depletion→switch→exploit 的过程。

从这个角度看，前面 solver 里的 $$P_{\text{lex}}$$、$$P_{\text{lookahead}}$$ 和 $$\mathrm{Feasibility}$$ 的构造就变得无比的自然。我们其实就是用代码对 human heuristic 做了一个非常粗糙的工程实现！程序需要显式计算这些分数，而母语者经过长期语言学习后，很多统计规律早已经内化进了自己的词汇表征和搜索策略里。

### 如何反向出题？

讲了很多求解的故事，最后我们回到问题的反面。事实上反向出题比求解本身更容易，只需要你选好几个长度，然后想办法设置相应长度的 disjoint path 就可以了。我们考虑一个问题，如何避免多解？

这里除了最无脑的生成-求解循环之外，我们考虑一个很 naive 的想法，就是我们在 candidate pool 里面进行约束，尽可能选择 substring 重叠度低的词语，重叠度高的词语我们选择将他们放到图较远的两个位置。一个简单的算法流程大概是：

```text
1. 从 dictionary 采样一批长度满足要求的 words
2. 根据 substring overlap 建 complete weighted graph
   edge weight = lexical collision
3. 选一个 pairwise collision 尽量小的 K-word subset
4. 在 grid 上生成 K 条 disjoint paths
5. 把 collision 高的 word pairs 尽量放远
6. 对所有 path boundary edge：
       如果跨边以后仍是合法 Trie prefix
       → 加 penalty
7. local search / simulated annealing 调 path layout
8. 最后用 exact solver 检查 uniqueness
```

当然 substring overlap 只能作为一个 cheap surrogate。因为真正导致多解的还是字符布局、格点邻接关系和 alternative path coverage 的共同作用，因此最终仍然需要 exact solver 搜索是否存在第二个完整解。
