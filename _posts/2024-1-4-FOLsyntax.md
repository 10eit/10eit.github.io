---
layout: post
title: "一阶逻辑的语法（证明论部分）"
date: 2024-1-4
author: 绿色猪头
tags: [Mathematical Logic, First Order Logic, Proof Theory]
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


## 一阶逻辑的语言

大家新年好，这其实是我两周前写的（$\LaTeX$ 转 markdown 有自建定理环境真是麻烦...），基本上是抄的[《数理逻辑：证明及其限度一书》](https://philosophy.fudan.edu.cn/04/c0/c20846a263360/page.htm)。
希望期末能及格.jpg

### 一阶逻辑的合式公式


**定义 1**. 

一阶逻辑的语言 $\mathcal{L}$ 由以下部分组成：括号、逻辑连词，全程量词 $\forall$（其中存在量词可以通过
$\exists \alpha=\neg(\forall \neg \alpha)$ 得到）、变元集合、常元集合与函数、谓词符号构成。

其中谓词符号一般是一个 Bool 函数，它返回真假值。

一些例子：

1.  公理化集合论的语言： $$\mathcal{L}_{set}=\{\neq,\in\}$$

2.  初等数论的语言 $\mathsf{PA}$：
    $$\mathsf{PA}=\{\neq,<,0,\mathsf{S},+,\times\}$$

3.  序关系的语言只需要一个二元谓词表示序关系。

在定义公式之前，我们需要先定义项的概念：

**定义 2**. 

令 $\mathcal{L}$ 为一个一阶语言，定义所有的项的集合为满足下列条件的最小的表达式的集合：

1.  每个变元都是项

2.  每个常数符号都是项

3.  函数在项上的应用也是一个项

例如在 $\mathsf{PA}$ 中我们有下面两个项（原书用的语言可读性太差，我们这里用 `Lisp` 写出）：

-   `(succ 0)`、

-   `(+ v_1 (succ (succ (succ 0))))`、

-   `(* (succ 0) (+ 0 succ (succ (ssuc 0))))`。

有了项以后我们可以定义 $\mathcal{L}$ 的合式公式。

**定义 3**. 

若 $t_1,\ldots,t_n$ 是 $\mathcal{L}$ 中的项，并且 $P$ 是一个$n$ 元谓词，那么我们称 $P(t_1,\ldots,t_n)$ 是一个合式公式。这样的公式被称为时原子公式。特别的 $(\neq t_1 t_2)$ 也是一个原子公式（考虑所有的等号都可以视作一个二元谓词，若两边相等则返回真）。

如果 $\alpha,\beta$ 都是合式公式，那么 $(\neg\alpha)$ 和 $(\alpha\to\beta)$ 也是合式公式。如果 $\alpha$ 是合式公式，这 $\forall v_i\alpha$ 也是。

### 一些例子

对于 $\mathsf{PA}$ 来说，我们有下面的一些公理与推论，以及他们的形式化：

1.  $0$ 不是任何自然数的后继： $$\forall x(\mathsf{S}x\neq 0).$$

2.  两个自然数的后继数相等，当且仅当这两个自然数相等。
    $$\forall x\forall y (x\neq y\leftrightarrow \mathsf{S}x\neq\mathsf{S}y)$$

3.  数学归纳法：
    $$(\phi(0)\wedge\forall x(\phi(x)\to\phi(\mathsf{S}x)))\to \forall x(\phi(x)).$$

4.  质数判定：
    $$(\mathsf{S}0<x)\wedge\forall y\forall z((y<x\wedge z<x)\to y\times z\neq x).$$

### 自由出现与约束出现

下面给出了约束变量（bounded variable）和自由变量（free variable）的区别。

**定义 4**. 

如果 $\alpha$ 是一个原子公式，$x$ 在 $\alpha$ **自由出现**当且仅当 $x$ 在 $\alpha$ 中出现；若 $\alpha$ 为 $\neg\beta$，那么 $\alpha$ 在 $x$ 中的出现情况同 $\beta$；若 $\alpha$ 为 $(\beta\to\gamma)$，则 $x$ 在 $\alpha$ 中自由出现当且仅当 $x$ 在 $\beta$ 中自由出现或者在 $\gamma$ 中自由出现；而若 $\alpha$ 形如 $\forall v_i\beta$，则 $x$ 在 $\alpha$ 中自由出现当且仅当 $x$ 在 $\beta$ 中自由出现并且 $x\neq v_i$。

如果在 $\alpha$ 中的变元不是自由出现，这我们称之为**约束出现**。如果$\alpha$ 中没有自由变元，那么我们称 $\alpha$ 是一个语句（sentence）。

**定义 5**. 

我们下面介绍项替换的概念。记 $\alpha_t^{x}$ 表示把公式中变元 $x$ 在其自由出现的部分替换为 $t$ 之后得到的公式。具体替换方法可以递归给出：

1.  如果 $\alpha$ 是原子公式，这 $\alpha_t^{x}$ 将 $\alpha$ 中所有的 $x$
    用 $t$ 替换所得的表达式。

2.  $(\neg\alpha)_t^{x}=(\neg\alpha_t^x)$

3.  $(\alpha\to\beta)^x_t=(\alpha_t^x\to\beta_t^x)$

4.  带量词的替换规则 $$(\forall y\alpha)_t^{x}=
            \begin{cases}
                \forall y(\alpha_t^x)& x\neq y\\
                \forall y\alpha & x=y
            \end{cases}$$


## 一阶逻辑的证明论

### 公理系统

与命题逻辑一样，我们定义公式序列：
$$
(\alpha_0,\alpha_1,\ldots,\alpha_n)
$$
使得 $\alpha_n=\phi$ 并对与所有的 $i\leq n$ 我们都有 $\alpha_i\in\Gamma\cup \Lambda$ 为公式集和公理集中的公式或者来自前面序列通过分离规则得到的。

首先，我们称一个公式 $\phi$ 是公式 $\psi$ 的一个**全称概括**或者概括，如果存在 $n\geq 0$ 和变元 $x_1,x_2,\ldots,x_n$ 使得：
$$
\phi=\forall x_1\forall x_2\ldots\forall x_n\psi
$$
当 $n=0$ 时，$\psi$ 的全称概括就是其本身。下面考虑一阶逻辑的推演系统与公理模式。

**定义 6**. 

对于一阶逻辑的推演系统，我们依旧只有 MP 作为推理规则，但是我们需要扩充公理模式：

1. (A1-A3)  $\mathsf{Prop}$ 中的三条公理的一阶逻辑版本；

2.  项 $t$ 可以在 $\alpha$ 中替换 $x$，那么我们有：
    $$\forall x\alpha\to\alpha_t^x$$

3.  $\forall x(\alpha\to\beta)\to(\forall x\alpha\to\forall x\beta)$

4.  若 $x$ 不在 $x$ 中自由出现，则 $\alpha\to\forall x\alpha$。

A1-A3 其实说明了一件事，那么就是所有的一阶意义下的重言式都是一阶逻辑证明系统中的一个公理模式，考虑下面的公式：
$$
(\forall y\neg Py\to\neg Px)\to(Px\to\neg\forall y\neg Py)
$$
它对应的 $\mathsf{Prop}$ 中的语句为 $(A_1\to \neg A_2)\to(A_2\to\neg A_1)$ 显然是重言式。

**定理 1**. 

如果 $\phi$ 是一个一阶意义下的重言式，也即$ \vdash\phi$，那么我们称 $\phi$ 是一阶逻辑的**内定理**。

下面考虑 A4，它被称为是替换公理。

语法层面的操作可能会影响语义，例如我们考虑下面的例子。

令 $\alpha$ 为一阶公式 $\exists y (x\neg y)$，考虑替换公理 $\forall x\alpha\to\alpha_z^{x}$ 可以得到：
$$
\forall x\exists y (x\neq y)\to\exists y (z\neq y)
$$
但是如果我们考虑 $\forall x\alpha\to\alpha_y^{x}$，我们会得到：
$$
\forall x\exists y (x\neq y)\to\exists y (y\neq y)
$$
是语义上为假的语句，由于我们替换的变元实际上是原公式中的约束变元，因此我们需要更严格定义"$t$在
$\alpha$ 中可以替换 $x$"：

**定义 7**.

1.  对于原子公式 $\alpha,t$ 中可以在 $\alpha$ 中替换 $x$。

2.  $t$ 在公式 $\neg\beta$ 中可以替换 $x$ 当且仅当 $t$ 在 $\beta$
    中可以替换 $x$；而 $t$ 在公式 $\beta\to\gamma$ 中可以替换 $x$
    需要当且仅当 $t$ 在 $\beta$ 和 $\gamma$ 中都可以替换 $x$。

3.  $t$ 在公式 $\forall y\beta$ 可以替换 $x$ 当且仅当：

    1.  $x$ 不在 $\forall y\beta$ 中自由出现；或者

    2.  $y$ 不在 $t$ 中出现，并且 $t$ 在 $\beta$ 中可以替换 $x$。

下面的命题需要替换公理。

**命题 1**. 

变元 $x$ 在任何公式 $\phi$ 中都可以替换自己，从而对于任何公式 $\phi$，我们都有 $\forall x\phi\vdash\phi$。

**证明 1**. 

即证明 $\vdash (\forall x\phi\to\phi)$，由于 $x$ 在任何公式中都可以替换自己，根据替换公理我们可以得到：
$$
\forall x\phi\to \phi_x^x
$$
 注意到 $\phi_x^x$ 就是 $\phi$ 本身。

A5-A6被称为是概括规则（一般记作 $\mathsf{Gen}$），使用这两条公理我们可以证明概括定理。用自然语言描述概括定理即：由于证明中未使用任何关于 $x$ 的假设，因此 $\forall x\alpha(x)$。

**定理 2**. 

如果 $\Gamma\vdash\phi$ 并且 $x$ 不在 $\Gamma$ 的任何公式中自由出现，则我们有 $\Gamma\vdash\forall x\phi$。

**证明 2**. 

令 $(\phi_1,\phi_2,\ldots,\phi_n)$ 为 $\phi$ 的一个推演序列。我们考虑归纳证明 $\forall i\leq n$，我们都有 $\Gamma\vdash\forall x\phi_i$。我们先假定对于所有的 $j<i$，我们已经有 $\Gamma\vdash\forall x\phi_j$，我们考虑 $\phi_i$。

1.  $\phi_i$ 是逻辑公理，那么 $\forall x \phi_i$
    也是逻辑公理（考虑上面证明的替换定理即可）。那么显然
    $\Gamma\vdash\forall \phi_i$；

2.  若 $\phi_i\in\Gamma$，此时 $x$ 不在 $\phi_i$ 中自由出现，因此根据 A4
    我们可以得到 $\phi_i\to\forall x\phi_i$，再考虑分离规则
    $\Gamma\vdash\forall \phi_i$；

3.  若 $\phi_i$ 来自 $\phi_j$ 与 $\phi_k=\phi_j\to\phi_i$
    的分离规则，根据归纳假设我们有 $\Gamma\vdash\forall \phi_j$
    与$\Gamma\vdash\forall(\phi_j\to\phi_i)$，考虑
    $$\forall(\phi_j\to\phi_i)\to(\forall x \phi_j\to\forall x\phi_i)$$
    使用两次分离规则即可得到 $\Gamma\vdash\forall x\phi_i$。

根据归纳原理，我们证明了$\Gamma\vdash\forall x\phi_n$，也即归纳定理。

下面看一个例子。

**命题 2**. 

证明：
$$
\forall x\forall y\alpha \vdash \forall y\forall x\alpha
$$
**证明 3**. 

我们考虑替换定理，我们可以得到 $\forall x\forall y\vdash\alpha$，考虑变元 $x$ 在左端不是自由出现的，因此根据概括定理：
$$
\forall x\forall y\alpha\vdash\forall x\alpha
$$
反复利用概括定理可以得到：
$$
\forall x\forall y\alpha\vdash\forall y\forall x\vdash\forall y\forall x\alpha.
$$


### 推理规则，元定理

我们先证明一个引理：

**定理 3**. 

如果 $\Gamma\vdash\alpha_i$ 其中 $1\leq i\leq n$，并且我们有 $\alpha_1\to\alpha_2\to\ldots\to\alpha_n\to\beta$ 是一阶意义下的重言式，那么我们有 $\Gamma\vdash\beta$。

引理的证明十分简单，考虑使用 $n$ 次分离规则即可。

根据上面的定理，我们知道如果需要证明 $\Gamma\vdash(\alpha\leftrightarrow\beta)$，则需要证明 $\Gamma\vdash(\alpha\to\beta)$ 与 $\Gamma\vdash(\beta\to\alpha)$ 即可，这也是 `lean` 中的 `cases` 指令。

下面我们将命题逻辑中的**演绎定理**推广到一阶逻辑中。

**定理 4**. 

$\Gamma\cup\{\gamma\}\vdash\phi$ 当且仅当 $\Gamma\vdash(\gamma\to\phi)$。

**证明 4**. 

反方向只需要使用分离规则即可。我们证明正的方向。假设 $(\phi_1,\phi_2,\ldots,\phi_n)$ 是从 $\Gamma\cup\{\gamma\}$
的一个证明序列，其中 $\phi_n=\phi$，那么我们对 $i$ 进行归纳，对于所有的 $1\leq i \leq n$，我们都有 $\Gamma\vdash (\gamma\to\phi_i)$。

当 $i=1$ 时，$\phi_1$ 或者属于 $\Gamma$ 要么是一阶公理，又或者 $\gamma$本身。考虑 $\phi_1\to(\gamma\to\phi_1)$
属于一阶公理，因此使用分离公理我们可以得到 $\Gamma\vdash(\gamma\to\phi_1)$。

假定对所有的 $k<i$ 我们都有 $\Gamma\vdash(\gamma\to\phi_k)$，考虑 $\phi_i$，相比奠基步它多了一种可能，即 $\phi_j=\phi_k\to\phi_i$ 其中 $j,k<n$，那么我们考虑 $\Gamma\vdash(\gamma\to\phi_j)$ 与 $\Gamma\vdash(\gamma\vdash(\phi_k\to\phi_i))$，使用两次分离规则即可得到证明。

演绎定理有以下两个推论：

**定理 5**. 

$\Gamma\cup\{\phi\}\vdash\neg\psi$ 当且仅当 $\Gamma\cup\{\psi\}\vdash\neg\phi$。

这被称为是**逆否命题**。

**证明 5**. 

也即想办法证明 $(\phi\to\neg\psi)\to(\psi\to\neg\phi)$。最简单的方法是直接使用真值表，另外一种方法我们考虑：
$$
(\phi\to\neg\psi)\to(\psi \to\neg\phi)
$$
 通过分离规则即可。 

下面证明的内容是反证法。

**定理 6**. 

如果 $\Gamma\cup\{\phi\}$ 不一致，那么 $\Gamma\vdash\neg\phi$。

接下来介绍以下使用演绎定理证明命题的一些经验。

1.  如果 $\phi$ 是 $(\psi\to\theta)$，那么尝试证明
    $\Gamma\cup\{\psi\}\vdash\theta$（在 `lean` 中使用 `intros` 指令）。

2.  如果 $\phi$ 是 $\forall x\psi$，如果 $x$ 不在 $\Gamma$
    中自由出现，则根据概括定理，只需要证明 $\Gamma\vdash\psi$。

3.  假设 $\phi$ 是另一个公式的否定：

    1.  如果 $\phi$ 形如 $\neg(\psi\to\theta)$，那么只需要证明
        $\Gamma\vdash\psi$ 与 $\Gamma\vdash\neg\theta$；

    2.  如果 $\phi$ 形如 $\neg\neg\psi$，那么只需要证明
        $\Gamma\vdash\psi$。

    3.  如果 $\phi$ 形如
        $\neg\forall x\psi$，那么尝试找到项替换或者随缘归谬法。

上面这些经验不一定一定有效，所以使用证明助理是一件非常有用且有效的方法（你可能不知道怎么证明就把证明些好了。）

我们做个练习。

**命题 3**. 

证明：
$$
\forall x\neg(\alpha\to\beta)\vdash \neg(\alpha\to\exists x\beta).
$$
**证明 6**. 

考虑证明 $\forall x\neg(\alpha\to\beta)\vdash\alpha$ 与 $\forall x\neg(\alpha\to\beta)\vdash\neg\exists x\beta$。考虑第一条我们知道 $\forall x\neg(\alpha\to\beta)\vdash\neg(\alpha\to\beta)$，而 $\neg(\alpha\to\beta)$ 重言蕴含 $\alpha$，因此前半段证明完毕。

下面考虑后半段的证明，$\neg\exists x\beta$ 是 公式 $\neg\neg\forall x\neg\beta$ 的缩写，那么我们只需要证明 $\forall x\neg(\alpha\to\beta)\vdash\neg\beta$，这与前式证明相同。

可能会有提问，是否存在一个算法，对于所有可以证明的 $\phi$，我们都可以提供一个证明，如果存在的话，那么一阶逻辑就是可判定的（decidable）。但是后面 Church 定理会告诉我们这样是不可能的。

### 更多的元定理

下面介绍更多的元定理方便大家写证明：

**定理 7**. 假设 $\Gamma\vdash\phi$ 而 $c$ 是一个不在 $\Gamma$ 中出现的常数符号，则存在变元 $y$ 它不在 $\phi$ 中出现，使得
$\Gamma\vdash\phi_y^{c}$。也即存在一个从 $\Gamma$ 到 $\forall y\phi_y^c$ 的不含 $c$ 的推演。

下面的引理为约束变元的替换提供了依据。

**定理 8**. 如果变元 $y$ 完全不在公式 $\phi$ 中出现，则变元 $x$
可以在公式 $\phi_y^x$ 中替换 $y$ 并且我们有： 
$$
( \phi_y^x)_x^y=\phi
$$

### 前束范式

**定义 8**. 

谓词演算的公式 $\phi$ 被称为是前束范式（prenex normal form）如果它形如：$$Q_1x_1Q_2x_2\ldots Q_kx_k B$$ 其中每个$Q_i\in\{\forall,\exists\}$ 而 $B$ 是不含量词的公式。

如果谓词公式中不包含量词，那么它也是前束范式，例如：
$$
\neg A(x)\vee B(x).
$$
再例如公式：
$$
\forall x\exists y\exists z(\neg P(x)\to(Q(y)\to R(z,y)))
$$
也是前束范式。
