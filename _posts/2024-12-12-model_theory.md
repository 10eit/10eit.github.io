---
title: "从紧致性到量词消去"
featured: true
tags: [数理逻辑, 模型论]
---

这是我《模型论导论》期末考试的笔记，Will 是一个很好的老师可惜我笨笨的 T_T

### 紧致性与 Lowenheim-Skolem 定理

我们称一个理论 $T$ 是可满足的，如果 $T$
有模型；而我们称 $T$
是有限可满足的，当且仅当对于每个子理论 $T_0 \subseteq_f T$
都有模型。

> **定理**  紧致性定理
> 如果 $T$ 是有限可满足的，那么 $T$ 是可满足的。

**例（非同构的等势模型）**
考虑 $\mathcal{L}$ 是 $\mathbb{N}$ 的语言，考虑对 $\mathcal{L}$
的扩张 $\mathcal{L}' = \mathcal{L} \cup \{ c \}$ 其中 $c$
是一个常数符号，一个 $\mathcal{L}'$ 的模型 $(M, c)$
上的理论：

$$
T = \textsf{PA} \cup \{ 0 \neq c, 1 \neq c, \ldots \}
$$

其中 $n \neq c$ 为 $1 + 1 + 1 + \ldots = c$ 的缩写。

> **定理** 
> 考虑 $\mathcal{L}$-理论 $T$，假设 $T$
> 有无穷个模型，或者更一般的，对于每个 $n < \omega$，$T$
> 都有不小于 $n$ 大小的模型。则对于任意的 $\kappa \geq \mathcal{L}$，$T$ 有大小至少为 $\kappa$ 的模型。
>
> **证明.**
> 仿照之前的证明，令 $\mathcal{L}' = \mathcal{L} \cup \\{c_{\alpha} : \alpha < \kappa\\}$，其中 $c_{\alpha}$
> 是新的常数符号，考虑公式集合 $\Sigma = \\{(c_{\alpha} \neq c_{\beta}) : \alpha < \beta < \kappa\\}$。
>
> 我们可以证明 $T \cup \Sigma$ 是有限可满足的。

### 范畴性与 Lowenheim–Skolem 定理

虽然说从 Chapter 7 开始复习，但其实预备内容就是 Chapter 6
的内容……感觉最需要好好学的应该是 Lowenheim-Skolem
定理……首先我们需要知道如何衡量一个理论的大小。

**定义**
我们称一个理论 $T$ 是
$\kappa$-范畴的（categorical），如果对于 $T$ 的所有具有基数
$\kappa$ 的模型都同构。

注意：这句话不代表 $\kappa$-范畴的理论只有大小为 $\kappa$
的模型！

Los-Vaught 判据通过 $\kappa$-范畴出了判断理论完备性的条件：

> **定理**  Los-Vaught
> 假设 $T$ 是 $\kappa$-范畴的，其中 $\kappa \geq |\mathcal{L}|$，那么：
> 1. 任意两个无限模型都是初等等价的。
> 2. 如果 $T$ 的所有模型都是无穷的，那么 $T$ 是完备的。

上面第一条命题的证明需要 Skolem
定理，虽然我也不明白为什么往往是先讲 Skolem
定理讲范畴性（categoricity）。所谓的 Skolem
定理其实来自以下观察：如果一个一阶理论存在无穷模型，那么它应该是存在任意基数的无穷模型的（注：一个例子就是 DLO，DLO 的模型可以是 $(\mathbb{Q}, \leq)$，那么这个模型就是可数的，而如果是 $(\mathbb{R}, \leq)$ 那就是不可数的。）。

> **定理**  Lowenheim-Skolem
> 对于任意的一阶语言 $\mathcal{L}$，如果它有无穷结构
> $M$，则对于任意无穷基数 $\kappa \geq | \mathcal{L} |$，存在
> $\mathcal{L}$ 的一个结构 $N$ 使得 $| N | = \kappa$，且：
> 1. 如果 $\kappa < |M | $ 则 $N$ 是 $M$ 的初等子结构。
> 2. 如果 $\kappa > | M |$ 则 $N$ 是 $M$ 的初等扩张。
> Lowenheim-Skolem 定理的直观是对于给定的结构
> $M$，我们可以构造出不同势的子结构或者初等扩张，一阶语言无法控制它的无穷模型的基数。这也告诉我们为什么不能得到一阶理论的绝对范畴。

Lowenheim-Skolem 定理引出的一些问题。

**命题（Skolem 佯谬）**
$\textsf{ZFC}$ 是一个可数的一阶语言理论，那么根据
Skolem 定理，$\textsf{ZFC}$ 存在一个可数模型，但是
Cantor 定理也是 $\textsf{ZFC}$
的定理，因此该模型内存在一个不可数集合，也即 $P(\omega)$。

Skolem
佯谬引发了对绝对性（absoluteness）的讨论，下面给出绝对范畴（absolutely
categorical）的定义：

**定义**
一个理论 $T$
被称为是绝对范畴的，当且仅当它存在同构意义上的唯一模型。

> **定理** 
> 如果 $T$ 是绝对范畴的，那么这个唯一模型是有限的。
>
> **证明.**
> 考虑反证法，如果不是有限的，那么 Skolem
> 定理能找到一堆各种基数的无限模型，而 Skolem
> 定理可以保证这些模型里面有不同构的。

以及之前遗留的对 Los-Vaught 判据的证明：

**证明.**
1. 对于两个无穷模型 $M_1, M_2$，通过 Skolem 定理我们可以把他们两个都降到 $\kappa$ 大小的初等子结构，再根据范畴性得到两个子结构之间的初等等价性，从而可以推的所有的无穷模型都是初等等价的。
2. 这个的证明不需要 Skolem 定理，只需要注意到 $T$ 是完备的当且仅当 $T$ 的任意两个模型都是初等等价的。

下面看几个例子。

**例**
对于 $\kappa < | \mathbb{R} |$ 的基数，实有序域上的理论不是
$\kappa$-范畴的。

**定义（DLO）**
线序被称为是稠密的，当且仅当对于任意的 $x < y$，存在
$z$ 使得 $x < y < z$。
> **定理（Cantor）**  
> DLO 是 $\aleph_0$-范畴的：任意两个可数的 DLO 模型都是同构的。
>
> **证明.**  
> 这个定理的证明比较关键。由于这里考虑的模型都是可数的，因此假设
> $a_1,\ldots$ 是对 $M$ 的枚举，而 $b_1,\ldots$ 是对 $N$ 的枚举。
> 我们通过 back-and-forth 方法构造有限部分同构的递增序列：
>
> $$A_0 \subseteq A_1 \subseteq \cdots \subseteq M$$
>
> $$B_0 \subseteq B_1 \subseteq \cdots \subseteq N$$
>
> $$f_0 \subseteq f_1 \subseteq \cdots$$
>
> 其中 $A_i,B_i$ 都是有限子集，$f_i:A_i\to B_i$ 是保序双射，满足：
>
> 1. 如果 $i=0$，那么 $A_0=B_0=\emptyset$；
> 2. 如果 $i=2k-1$，那么令 $a_k$ 加入定义域；
> 3. 如果 $i=2k$，那么令 $b_k$ 加入值域。
>
> 具体来说，假设 $f_i:A_i\to B_i$ 已经构造完成。
>
> 当 $i=2k-1$ 时，如果 $a_k\in A_i$，则令 $f_{i+1}=f_i$。否则考虑 $a_k$ 在有限集 $A_i$ 中的位置。设
>
> $$L=\{a\in A_i:a<a_k\},\qquad R=\{a\in A_i:a_k<a\}.$$
>
> 若 $L$ 和 $R$ 都非空，令 $a^-=\max L$，$a^+=\min R$。因为 $f_i$ 保序，所以
>
> $$f_i(a^-)<f_i(a^+).$$
>
> 由于 $N$ 是稠密线序，存在 $b\in N$ 使得
>
> $$f_i(a^-)<b<f_i(a^+).$$
>
> 若 $L=\emptyset$，则只需要取 $b<f_i(a^+)$；若 $R=\emptyset$，则只需要取 $f_i(a^-)<b$；若二者都为空，则任取 $b\in N$。由于线序无端点，以上元素都存在。于是定义
>
> $$f_{i+1}=f_i\cup\{(a_k,b)\}.$$
>
> 这样得到的 $f_{i+1}$ 仍然是有限保序双射。
>
> 当 $i=2k$ 时，对 $b_k$ 做对称操作。如果 $b_k\in B_i$，则令 $f_{i+1}=f_i$。否则考虑 $b_k$ 在 $B_i$ 中的位置，并在 $M$ 中找到相应位置的 $a$，定义
>
> $$f_{i+1}=f_i\cup\{(a,b_k)\}.$$
>
> 同理，由 $M$ 的稠密性和无端点性，这样的 $a$ 总能找到，并且 $f_{i+1}$ 仍然是有限保序双射。
>
> 最后令
>
> $$f=\bigcup_{i<\omega} f_i.$$
>
> 由于每个 $a_k$ 都会在某个奇数阶段被加入定义域，每个 $b_k$ 都会在某个偶数阶段被加入值域，所以 $f$ 是从 $M$ 到 $N$ 的双射。又因为每个 $f_i$ 都保序，所以 $f$ 也保序。因此 $f$ 是线序同构。
>
> 所以任意两个可数 DLO 模型同构，DLO 是 $\aleph_0$-范畴的。
> 
根据 Cantor 定理，由 Los-Vaught 判据我们知道 DLO 是完备的。

接下来我们讨论随机图。

**定义**
随机图的理论 $T_{\text{rand}}$ 由图公理和下面的公理集合
$\\{ \phi_{n, m} : n, m \in \mathbb{N} \\}$ 组成，其中公理 $\phi_{n,m}$ 定义为：

$$
\forall y_1, \cdots, y_{n + m}  \left( \bigwedge_{i = 1}^{n + m - 1}
\bigwedge_{j = i + 1}^{n + m} y_i \neq y_j \right) \rightarrow \\ \exists x
\left( \bigwedge_{i = 1}^n x E y_i \wedge \bigwedge_{i = n + 1}^{n + m}
\neg (x E y_i) \wedge \bigwedge_{i = 1}^{n + m} (x \neq y_i) \right)
$$

上面的式子十分吓人，事实上一个图 $(V, E)$ 能作为
$T_{\operatorname{rand}}$ 的模型，当且仅当对于任意的有限子集 $S_1, S_2 \subseteq V$ 且 $S_1 \cap S_2 = \emptyset$，存在一个不属于两个子集中的顶点使得它与 $S_1$
中的每个顶点相邻而不和 $S_2$ 中的顶点相邻。

考虑图论中的句子 $\varphi$，记 $P_N (\varphi)$ 为 $\varphi$
在顶点集为 $\\{ 1, 2, \cdots, N \\}$
的随机图上满足的概率，那么对于公理 $\phi_{n, m}$
而言我们可以得到估计：

$$
P_N (\neg \phi_{n, m}) \leq \left[ \prod_{i < n + m} (N - i) \right] \cdot
\left[ 1 - \left( \frac{1}{2} \right)^{n + m} \right]^{N - (n + m)}
$$

当 $N \rightarrow + \infty$ 时，我们可以得到 $\lim_{N \rightarrow \infty} P_N (\neg \phi_{n, m}) = 0$ 对于任意的 $\phi_{n, m}$
都成立，因此我们可以认为随机图理论在任意无穷图上是可满足的。

### 量词消去（I）

我们知道一个公式是无量词的当且仅当它没有 $\forall$和
$\exists$，我们称一个理论 $T$
是可以量词消去的，对于每一个 $\varphi$
而言我们都可以找到一个与之等价的无量词公式使得：

$$
T \vdash \forall \bar{x} : \varphi (\bar{x}) \leftrightarrow \varphi'
(\bar{x}) .
$$

**例**
考虑结构 $(\mathbb{R}, +, \cdot, -, 0, 1, \leq)$ 也即 R
上定义的偏序环，它是有量词消去的。

**例**
如果 $M \models T$ 且 $T$ 存在量词消去，则 $\operatorname{Th}(M)$ 存在量词消去（注：好容易忘记记号啊，对于结构 $M$，所谓的 $\operatorname{Th}(M)$（被称为是 $M$ 的完备理论）被定义为：

$$
\operatorname{Th}(M) := \{ \varphi : \varphi 是一个 \mathcal{L} 语句且 M \models \varphi \}
$$

）。

**证明.**
也即说明对于每一个 $\varphi \in \operatorname{Th}(M)$，我们都可以找到一个对应无量词 $\varphi'$。

接下来我们不加证明的利用一个事实：复数域上的完备理论存在量词消去。

> **定理** 
> 如果 $D \subseteq \mathbb{C}^1$ 是可定义的，那么 $D$ 或者
> $\mathbb{C} \backslash D$ 是有限的。
>
> **证明.**
> 考虑 $\mathcal{F}$ 为所有使得 $D \subseteq \mathbb{C}$ 是有限或者余有限的类。我们需要证明 $D \in \mathcal{F}$。根据量词消去，我们可以得到 $D = \varphi(\mathbb{C})$
> 对于某些无量词公式而言。而我们知道无量词公式本身是原子公式的布尔组合，因此我们不妨假设
> $\varphi$ 就是原子的。
>
> 那么 $\varphi$应当是多项式等式，例如 $P (x) = Q (x)$。如果
> $P - Q \equiv 0$，那么显然 $\varphi(\mathbb{C}) = \mathbb{C}$，否则 $\varphi(\mathbb{C})$
> 给出了一组多项式方程的根，这是有限的，也即 $\varphi(\mathbb{C}) \in \mathcal{F}$。

上面的定理给出了如下的定义：

**定义**
对于 $\mathcal{L}$-理论 $T$
而言，我们称他是强极小的（strongly
minimal）如果对于任意的 $\mathcal{M} \models T$，我们都有

目前不给出证明直接用的 Facts：

> **定理** 
> DLO 存在量词消去。

利用上面的定理，我们可以得到下面的结论：

> **定理** 
> 如果 $M$ 是 DLO 的模型，且 $D \subseteq M$ 是可定义的，那么
> $D$ 是单点和开区间的有限并。

下面这个例子来自课本 7.1 习题。

**命题**
纯环语言 $\mathcal{L}_{\mathrm{ring}}=\\{+,\cdot,-,0,1\\}$ 下，实数域 $\mathbb{R}$ 的完备理论 $\operatorname{Th}(\mathbb{R})$ 不存在量词消去。

**证明.**
这里需要先区分语言：如果在有序环语言 $\\{+,\cdot,-,0,1,\leq\\}$ 中讨论实闭域理论，那么它是有量词消去的；下面的结论指的是纯环语言。

考虑一元公式

$$
\varphi(x) := \exists y\,(y^2=x).
$$

在 $\mathbb{R}$ 中，$\varphi(\mathbb{R})=[0,+\infty)$，因为一个实数有平方根当且仅当它非负。

若 $\operatorname{Th}(\mathbb{R})$ 在纯环语言中有量词消去，则存在无量词公式 $\psi(x)$ 使得

$$
\operatorname{Th}(\mathbb{R}) \vdash \forall x\,(\varphi(x) \leftrightarrow \psi(x)).
$$

纯环语言中的一元无量词公式是若干多项式等式 $p(x)=0$ 的布尔组合。对于 $\mathbb{R}$ 上的一元多项式而言，若 $p(x)$ 非零，则零点集有限；若 $p(x)$ 为零多项式，则零点集是整个 $\mathbb{R}$。因此任意一元无量词可定义集只能由有限集合和余有限集合通过有限次布尔运算得到，最终仍然是有限集或余有限集。

但 $[0,+\infty)$ 既不是有限集，也不是余有限集。因此它不可能由纯环语言中的一元无量词公式定义。这与量词消去假设矛盾，所以 $\operatorname{Th}(\mathbb{R})$ 在纯环语言中不存在量词消去。

接下来我们考虑量词消去和初等嵌入之间的关系。下面假设
$T$ 有量词消去。

> **定理** 
> 如果 $M, N$ 都是 $T$ 的模型，那么：
> 1. 如果 $f : M \rightarrow N$ 是一个嵌入，那么它一定是初等嵌入。
> 2. 如果 $M$ 是 $N$ 的子结构，那么必然是初等子结构。
> **证明.**
> 考虑下面的引理：
>
> **引理**
> 结构之间的嵌入是保无量词公式的。也即考虑 $f : M \rightarrow N$ 是嵌入，参数 $(a_1, \ldots, a_n) \in M$，那么对于无量词公式 $\varphi (x_1, \ldots, x_n)$
> 而言，$M \models \varphi (a_1, \ldots, a_n)$ 当且仅当 $N \models \varphi (f (a_1), \ldots, f (a_n))$。

本命题可以得到一个很常用的推论，这个推论也是之前的思考题。

**推论**
如果 $T$ 存在量词消去且 $M$ 是 $T$ 的模型，则子结构 $A \subseteq M$ 是初等的当且仅当 $A \models T$。

下面的常用事实来自前面的命题：$\mathbb{Q}$ 和开区间 $(0,1)$ 都是 $(\mathbb{R}, \leq)$ 上的初等子结构，因为他们都是 DLO
的模型。

**例**
存在与 $(\mathbb{R}, \leq)$ 等势的非同构初等子结构。这是
Skolem 定理的直接推论。

**例**
超实数 $\overline{\mathbb{R}}$（hyperreals）上的偏序是
$(\mathbb{R}, \leq)$ 的初等扩张。

**例**
随机图的理论是存在量词消去的，因此考虑随机图理论的模型
$M$ 和随机图的顶点 $a$，我们有 $M \backslash \\{ a \\} \prec M$。

**例**
整数上偏序的理论不存在量词消去。

**例**
Marker 上的一个练习题：
1. $(\mathbb{Z}, s)$ 的理论存在量词消去，其中 $s (x) = x + 1$，且该理论是强最小的。
2. 但是 $(\mathbb{N}, s)$ 的理论不存在量词消去。

先引入一个方便叙述的概念。

**定义（模型完备性）**
一个 $\mathcal{L}$-理论 $T$ 是模型完备的（model
complete），当且仅当对于所有的 $M \prec N$

**另外的表述**：$T$
是模型完备的当且仅当所有的嵌入都是初等嵌入。

一个直观的理解是，你不能通过改变模型的大小来改变公式的真值。

考虑 $T$ 是一个一阶理论，下面的几种说法是等价的：

> **定理** 
> 以下几种说法是等价的：
> 1. $T$ 是模型完备的。
> 2. 每个 $T$ 的模型都是存在封闭的（existentially closed）（注：我们称 $T$ 的模型 $M$ 是存在封闭的，如果对于 $T$ 的任意其他模型 $N$，嵌入 $M \hookrightarrow N$。）。
> 3. 对于 $T$ 的模型 $A, B$ 而言，考虑 $f : A \hookrightarrow B$，存在一个对 $A$ 的初等扩张 $D$ 使得 $f$ 与嵌入 $g : B \rightarrow D$ 交换。

### 完备类型

**定义（完备类型（Complete Type））**
考虑 $M$ 是一个 $\mathcal{L}$-结构与 $\bar{a}$ 是一个
$n$-元组，我们定义 $\bar{a}$ 的类型（记作 $\operatorname{tp}(\bar{a})$）为 $\mathcal{L}$-语句 $\varphi (x_1, \cdots, x_n)$
的集合，其元素均满足 $M \models \varphi (\bar{a})$。

一个直观理解是，一个元组（参数对）的类型就是在语境
$M$ 下满足该赋值的所有语句集合。

考虑 $M = (\mathbb{R}, +, \cdot, -, 0, 1, \leq)$，则 $\operatorname{tp} (3)$
可以是下面的公式：

$$
x = 1 + 1 + 1, 0 \leq x, \exists y, y^2 = x, \ldots
$$

理论 $T$ 上的完备 $n$-类型记作 $S_n(T)$，下面的命题是等价的：

> **定理** 
> 考虑 $p (\bar{x})$ 是 $T$ 上的 $n$
> 元偏类型，则下面的命题等价：
> 1. $p (\bar{x})$ 是 $T$ 上的完备 $n$-类型。
> 2. 对任意 $L$-公式 $\varphi(\bar{x})$，要么 $\varphi(\bar{x}) \in p(\bar{x})$，要么 $\neg \varphi(\bar{x}) \in p(\bar{x})$。
> 3. $p(\bar{x})$ 是 **极大一致的**：若 $q(\bar{x})$ 是 $T$ 上的偏类型且 $p(\bar{x}) \subseteq q(\bar{x})$，则 $p(\bar{x}) = q(\bar{x})$。

### 量词消去（II）

本章节核心内容是下面的技术性条件。

> **定理** 
> 假设 $A$ 是一个结构，$M, N$ 都是 $T$ 在 $A$
> 扩张上的模型，则我们有：
>
> $$S_1^{\operatorname{qfree}, M} (A) = S_1^{\operatorname{qfree}, N} .$$
>
> 也就是说，我们可以通过分析 $T$
> 的模型的无量词1-类型来判断 $T$ 是否可以被量词消去。

### 代数闭域

接下来考虑的原型问题是 $\mathbb{F} [x]$
上的多项式方程是否存在解的问题。

**定义（多项式环）**
考虑 $R$ 是一个环，则定义 $R [x]$ 为形如 $a_n x^n + a_{n - 1} x^{n - 1} + \cdots + a_0$ 的系数 $a_i \in R$ 的多项式。

**引理（除法引理）**
考虑 $K$ 是一个域，设 $A (x), B (x) \in K [x]$ 且 $B (x)$
非零。则存在多项式 $R (x) \in K [x]$ 使得：

$$
A (x) \equiv R (x)  \left( \text{mod} B (x) \right)
$$

且 $\deg R (x) < \deg B (x)$。

考虑归纳法即可，首先考虑首一多项式 $B (x)$ 的系数小于 $A(x)$，也即 $m = \deg B (x) \leq \deg A (x) = n$，考虑定义

$$
A_2 (x) = A (x) - a_n x^{n - m} B (x)
$$

也即可以得到 $\deg A_2 (x) < n = \deg A (x)$

下面的讨论都固定 $K$ 是一个域。

> **定理** 
> 对于 $a \in K$，一个多项式 $P (x) \in K [x]$ 可以被分解为 $(x- a) Q (x)$ 的形式当且仅当 $P (a) = 0$。
>
> **证明.**
> 定理的一侧是平凡的，我们考虑若 $P (a) = 0$
> 是否意味着可以找到 $Q(x)$，根据除法引理我们知道必然存在一个 $R (x) \in K [x]$
> 满足：
>
> $$\deg R (x) < \deg (x - a) = 1$$
>
> 满足 $P (x) \equiv R (x) \operatorname{mod} x - a$，那么也就是说 $R (x)$
> 是某个常数 $c$，因此我们得到：
>
> $$P (x) = (x - a) Q (x) + R (x) = (x - a) Q (x) + c$$
>
> 由于 $P (a) = 0$，因此 $c = 0$，证明完毕。
