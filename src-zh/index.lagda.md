```agda
module index where
```

# 1Lab

本网站是一个**可探索的形式化**实验：它提供了一个广泛的形式化数学库，并且所有参考资源可供探索。 我们使用_文学编程_构建数学库，使我们能够以两种方式解释数学概念：代码与描述性文字互为补充，用户可以自由选择在严格形式化和直观解释之间的平衡。

<!--
```agda
open import 1Lab.Univalence
open import 1Lab.Equiv
open import 1Lab.HLevel
open import 1Lab.Type
open import 1Lab.Path
open import Cat.Base
_ = Precategory
```
-->

1Lab 并非只是_另一个范畴论库_，它旨在成为结构主义数学的一个易于理解的介绍，并在同伦类型论（homotopy type theory）的框架下进行形式化。我们使用定理证明工具来校验和组织我们的工作。 由于我们采用 Agda 进行形式化处理，因此无论当我们提到某个特定的原则（如泛等性 `univalence`{.Agda}）、宏观的概念（如[[幺半范畴|monoidal
categories]]）、还是具体的观察（如[[满射是商映射|surjections are
quotient maps]]）时，都能明确它的定义。

::: mathpar

```agda
_ : ∀ {ℓ} {A B : Type ℓ} → is-equiv (path→equiv {A = A} {B})
_ = univalence
```

:::

上面的代码片段是对“泛等性”`univalence`{.Agda}的重述，它展示了如何探索形式化内容。 Every mention of a
non-local name in the code above is a link to its definition (try
clicking on `path→equiv`{.Agda}!) --- on hover, you're presented with a
pop-up of their types. 我们形式化的所有内容都配有解释性文字，就像这里一样，其中包含通往证明中涉及的高级概念的链接，例如[[宇宙|universe]]、[[路径|path]]类型以及[[等价|equivalences]]。

我们已经开发出一个规模庞大的数学形式化库，围绕范畴论及其“邻近”领域：包括抽象代数、序理论、逻辑学以及综合同伦论。 与下面列出的一些[其他资源]不同，1Lab 对其类型论基础持有明确的立场：我们采用 @CCHM 风格的**立方类型论**，并自由假设[[**命题降级**]]。

由于库的规模较大，直接进入某个特定主题可能会让人望而生畏，因此我们在易用性方面投入了大量精力。 最简单的查找方式是使用搜索功能。 只要启用了 JavaScript，你可以按 <kbd>Ctrl+K</kbd>/<kbd>Cmd+K</kbd> 调出搜索提示。 任何有名称的内容都可以通过搜索找到：

- 页面可以通过其模块名称（如 [Algebra.Ring]）或标题（如 [Abelian groups]）进行查找。 These are organised
  hierarchically like an ordinary software library: Foundational results
  are under `1Lab`, a variety of data types are under `Data`, abstract
  algebra is under `Algebra`, category theory is under `Cat`, etc.

- Sections within a page can be looked up by their title, like _[The
  canonical self-indexing > As a fibration][selfindex]_. 请注意，模糊匹配意味着输入前缀是可选的，它只会在搜索结果中显示，以便你知道将前往哪里。

- 具体_概念_可以通过特定的缩写查找，例如 [[adjunctions compose]] 或 [[composition of adjunctions]]。

- 库中的每个定义都可以通过其标识符查找，例如 `Precategory`{.Agda}。

[Algebra.Ring]: Algebra.Ring.html
[Abelian groups]: Algebra.Group.Ab.html
[selfindex]: Cat.Displayed.Instances.Slice.html#as-a-fibration

虽然库的规模使得无法列出每个页面的清单，但我们努力编纂了标准参考资料中出现的结果，你可以查看每本书的索引：

- [HoTT](HoTT.html) 页面对应于《同伦类型论：泛等数学基础》 [-@HoTT]一书，在 1Lab 中也称为 _HoTT 之书_；

- [Borceux](Borceux.html) 页面对应于《范畴代数手册》第一卷 [-@Borceux:vol1]；

- [Elephant](Elephant.html) 页面对应于 Johnstone 的《大象素描：拓扑理论概要》 [-@Elephant]。

由于这些页面也被编入了搜索索引，你可以通过搜索这些书的名称或章节号来导航到书中某个特定部分。例如，尝试搜索“[_Freudenthal 纬悬定理_][hott86]”或“章节 [_A1.3_][elephanta13]”。

[hott86]: HoTT.html#the-freudenthal-suspension-theorem
[elephanta13]: Elephant.html#a1.3-regular-categories

## 参与方式

我们的目标是让泛等性数学对所有感兴趣的人都易于接触，无论其文化背景、年龄、教育背景、种族、性别认同或性别表达如何。 **HoTT 是为所有人开放的，我们致力于营造一个友好、包容的环境。**

尽管 1Lab 主要由[作者们][authors]维护，但首先它是一个社区项目。 实际的形式化工作是在 [GitHub] 上进行的，而讨论则在 [Discord] 上展开。 We welcome all contributions, though we would kindly ask that
anyone submitting a substantial change discuss it on Discord first.

[GitHub]: https://github.com/the1lab/1lab
[Discord]: https://discord.gg/eQDNM26uKP
[authors]: Authors.html

我们欢迎所有领域的贡献，不仅限于已经涉及的领域或上文提到的那些领域。 我们在实分析方面的缺少成果并不是因为实分析被禁止，而仅仅是因为它不是作者们的专业领域。 我们很乐意帮助任何人形式化并撰写他们喜爱的主题，但请注意，开发所有相关的理论可能是一个相当大的工作量。

## 技术

1Lab 的实现离不开众多免费的开源项目。 除了我们最为依赖的证明助手 [Agda](https://github.com/agda/agda)（本项目没有任何部分重新分发）外，我们还要感谢以下开源项目，它们对我们项目的实现至关重要：

- **字体**：我们使用 [Julia Mono] ([许可证][LICENSE.JuliaMono]) 作为等宽字体，因为它涵盖了大多数 Unicode 字符。 The textual content can be
  read in either [Inria Sans] ([license][LICENSE.InriaSans]) or [EB
  Garamond][EB
    Garamond] ([license][LICENSE.EBGaramond]), according to the user's
  preference. All of these fonts are distributed under the terms of the
  [SIL Open Font License, v1.1][OFL].

- **文本**：我们以 Markdown 编写文本内容，并使用 [Pandoc] 渲染，随后通过各种过滤器来实现图表、折叠公式、突出显示的 div/details 等功能。 尽管我们大量使用了 Pandoc，但项目中并未分发任何部分。

- **数学**：我们在构建时使用 [KaTeX](https://katex.org) 排版数学公式。 虽然渲染是在预处理阶段完成的，但我们分发了 KaTeX 的 CSS 和字体。 KaTeX 根据 MIT 许可证分发，相关许可副本可以[在此][LICENSE.KaTeX]找到。

- **图标**：我们的 favicon 是来自 [Noto Emoji](https://github.com/googlefonts/noto-emoji) 的冰块表情符号，使用 Apache License 2.0 许可证分发；你可以在[这里][LICENSE.Noto]找到副本。 其他图标来自 [octicons](https://github.com/primer/octicons)，使用 MIT 许可证发布，你可以在[这里][LICENSE.Octicons]找到许可证的副本。

- **图表**：我们的图表使用 [quiver] 创建，并通过 [LaTeX] 和 [pdftocairo]（Poppler 项目的一部分）渲染为 SVG。 我们未分发这些项目的任何部分。

- **网站**：我们提供的所有 JavaScript 都是免费且开源的软件，其中大部分是我们自行开发的，你可以在我们的 GitHub 上找到相关内容。 我们使用 [fast-fuzzy] 库为搜索对话框提供支持，使用 MIT 许可证发布，你可以在\[这里]\[LICENSE.fastfuzzy]找到许可证的副本。

  尽管我们的内容不需要 JavaScript 即可阅读，但它的确可以提升读者的体验，让我们能够提供如切换主题、搜索关键字、查阅网站地图、悬停提示等等便捷的功能。 如果你因担心隐私泄露而禁用了 JavaScript 的运行，请放心：1Lab 不会跟踪你的活动，也不会收集任何与你的身份相关的任何信息。

[quiver]: https://q.uiver.app
[LaTeX]: https://tug.org/texlive
[pdftocairo]: https://poppler.freedesktop.org
[Pandoc]: https://pandoc.org
[Julia Mono]: https://juliamono.netlify.app/
[Inria Sans]: https://github.com/BlackFoundryCom/InriaFonts
[EB Garamond]: https://github.com/georgd/EB-Garamond
[OFL]: https://openfontlicense.org/
[LICENSE.JuliaMono]: static/licenses/LICENSE.JuliaMono.txt
[LICENSE.InriaSans]: static/licenses/LICENSE.InriaSans.txt
[LICENSE.EBGaramond]: static/licenses/LICENSE.EBGaramond.txt
[LICENSE.Noto]: static/licenses/LICENSE.Noto.txt
[LICENSE.Octicons]: static/licenses/LICENSE.Octicons.txt
[LICENSE.KaTeX]: static/licenses/LICENSE.KaTeX.txt
[LICENSE.fast-fuzzy]: static/licenses/LICENSE.fast-fuzzy.txt
[KaTeX]: https://katex.org
[fast-fuzzy]: https://www.npmjs.com/package/fast-fuzzy
[our GitHub]: https://github.com/the1lab/1lab/tree/main/support/web/js

## 其它资源

以下是一些关于同伦类型论的免费在线资源，它们的呈现方式（和公理化方法）可能对特定读者更有吸引力。 请查看它们！

- 前面提到的[《同伦类型论：泛等性数学基础》](https://homotopytypetheory.org/book) [-@HoTT]一书分为两个部分：一部分是同伦类型论实践的入门介绍，另一部分是泛等数学在范畴论、同伦论、集合论和实分析中的应用初探。

- Egbert Rijke 最近的《同伦类型论入门》[-@Rijke:2022]是一部更全面的导论，涵盖了依值类型论的实践，尤其是同伦类型论，无需预先具备相关知识；该书还包括泛等数学在代数、组合数学和同伦论中的应用。

- Martin Escardó 的[《使用 Agda 的泛等性数学基础入门》][martin]使用定理证明器生成讲义，与 1Lab 不同，其结构是按顺序编排的。 Escardó 对 Agda 中的形式化采取了一种相对不寻常的方式，使用它作为一个非常基础（“极简”）类型论的证明助手。 他的讲义包括了如何实际操作最纯粹形式的类型论的介绍。

- \[agda-unimath 库]是一个与 1Lab 非常相似的项目，但它使用的是_公理化_的同伦类型论，而非我们偏好的立方类型论。 该项目目前由 Egbert Rijke、Fredrik Bakke 和 Vojtěch Štěpančík 维护，内容涵盖了广泛的本科数学主题，并在泛等组合数学领域提供了大量创新成果的形式化。

- \[TypeTopology 库]主要由 Escardó 编写，但也有一些合作成果，主要用于形式化构造性数学中的_创新_成果。 其作者将其描述为一个_数学黑板_；与其使用证明助手来记录和验证已有知识，他们主要使用 Agda 来帮助发现新想法。

[*agda-unimath* library]: https://unimath.github.io/agda-unimath/HOME.html
[martin]: https://www.cs.bham.ac.uk/~mhe/HoTT-UF-in-Agda-Lecture-Notes/HoTT-UF-Agda.html
[*TypeTopology* library]: https://www.cs.bham.ac.uk/~mhe/TypeTopology/

# 重点主题

尽管我们不可能在此列出 1Lab 中的每个页面， 不过下面这些我们已经形式化的核心概念也许可以作为你探索这些领域的新手村。

## 类型论

`1Lab` 命名空间下的模块是类型论的引子。 它们提供了 Agda 所需的基本概念定义，并为我们掌握高级数学知识提供了坚实的概念基础。 以下是通向[[泛等性原理|univalence]]证明的一些关键模块：

```agda
open import 1Lab.Type        -- Basics of type universes
open import 1Lab.Path        -- The key idea in cubical type theory
open import 1Lab.HLevel      -- The hierarchy of homotopy n-types
open import 1Lab.Equiv       -- Equivalences, the notion of sameness for types
open import 1Lab.Univalence  -- The proof of univalence, and a few equivalents
```

### 元编程

为了支持形式化的其余部分，我们不仅撰写数学，还写了_元_数学。 这些所谓的_策略_教会了 Agda 去处理更多的_显然_部分，使我们能够专注于真正有趣的内容。 这些页面主要对那些对 Agda 的使用方法感兴趣的读者有吸引力。因此，它们的代码多于解释。

```agda
open import 1Lab.Reflection.HLevel
  -- Some h-level proofs are mechanically derivable from the structure
  -- of a type --- this tactic discharges those proof obligations.

open import 1Lab.Extensionality
  -- Given only a type, this type computes a "best" extensional equality
  -- to use at a given point of the formalisation, narrowing an identity
  -- to the data that matters.

open import 1Lab.Reflection.Induction
  -- While Agda natively supports inductive types and pattern matching,
  -- it's often useful to have explicit elimination principles. This
  -- tactic automatically writes them.
```

## 范畴论

1Lab 最初是其中一位作者通过形式化范畴论学习该领域的项目；不出所料，它吸引了其他范畴论学者，并且成为该库中最全面的部分。 以下文件涵盖了该领域的核心内容：

```agda
open import Cat.Base                -- Core definitions
open import Cat.Univalent           -- Univalent categories
open import Cat.Functor.Base        -- Functor categories
open import Cat.Functor.Adjoint     -- Adjoint functors
open import Cat.Functor.Equivalence -- Equivalences of categories
```

While there's way too much category theory to list, these are some of
the cooler things we have formalised.

### Bicategory theory

Try as we might, univalent mathematics do not let us consider a
1-category of general categories: we would have to focus on the [[strict
categories]], which are quite rare in comparison to the [[univalent
categories]]. However, we can fit them into a higher-dimensional
structure: a [[**bicategory**]].

```agda
open import Cat.Bi.Base -- The basic definitions
```

In addition to their importance as an organizational principle, we can
prove a theorem that exposes a funny circularity in category theory: a
[[strict category]] is given by a [[monad]] in the bicategory of spans
of [[sets]].

```agda
open import Cat.Bi.Instances.Spans
open import Cat.Bi.Diagram.Monad.Spans
```

### 积闭范畴

To a type theorist, a [[Cartesian closed]] category is exactly a
simply-typed lambda calculus. To cement this connection, we have an
implementation of normalisation-by-evaluation for STLC, whose
correctness is established relative to its semantics in an arbitrary
CCC:

```agda
open import Cat.CartesianClosed.Lambda
```

### Regular categories

[[Regular categories]] are often defined as those which have a
well-behaved calculus of relations --- we have a proof that the
relations in a regular category form a [[bicategory]], and so have
associative and unital composition.

```agda
open import Cat.Regular -- Regular categories
open import Cat.Bi.Instances.Relations
  -- The bicategory of relations in a regular category
```

A related concept is that of [[allegories]], which, rather than
axiomatising the structure which _leads to_ a calculus of relations,
axiomatises the behaviour of the relations directly:

```agda
open import Cat.Allegory.Base -- Allegories
open import Cat.Allegory.Instances.Mat
  -- The allegory of matrices with values in a frame
```

### 幺半范畴

A [[monoidal category]] is the higher-dimensional counterpart of a
[[monoid]] --- a _category_ with an associative and unital composition
_functor_. These are equivalently the $\hom$-categories in a
[[bicategory]].

```agda
open import Cat.Monoidal.Base
```

Monoidal categories turn out to involve quite a lot of data ---
constructing them in a proof assistant is onerous. In addition to the
first formalisation of the Day convolution in a type-theoretic proof
assistant, we also have a proof that every category with finite
[[products]] is monoidal.

```agda
open import Cat.Monoidal.Instances.Day
open import Cat.Monoidal.Instances.Cartesian
```

### Internal category theory

We can _internalise_ the construction of [[strict categories]], beyond
$\Sets$, to any category with sufficient structure --- this results in
**internal category theory**.

```agda
open import Cat.Internal.Base
```

## Displayed categories

A [[displayed category]] (over $\cB$) is a type-theoretic repackaging of
the data of a category $\cE$ and a functor $\pi : \cE \to \cB$. Since
quite a few structures can be presented as categories-with-functors,
displayed categories are used quite a lot in the 1Lab in an
organizational role.

```agda
open import Cat.Displayed.Base            -- Displayed categories
open import Cat.Displayed.Univalence.Thin -- As categories of structured objects
```

However, displayed categories really come into their own to formalise
the concept of [[fibration]] --- a much nicer presentation of a
_functorial family of categories_ over $\cB$.

```agda
open import Cat.Displayed.Cartesian          -- Definition of fibrations
open import Cat.Displayed.Cartesian.Indexing -- From fibrations to families
```

These families of categories arise naturally in the study of type
theories, and of logics as a special case.

```agda
open import Cat.Displayed.Comprehension -- An axiomatisation of context extension
open import Cat.Displayed.Doctrine      -- An axiomatisation of regular logic
```

### 示例

The following examples of displayed categories are particularly notable
to motivate the subject.

```agda
open import Cat.Displayed.Instances.Slice      -- Canonical self-indexing
open import Cat.Displayed.Instances.Family     -- Family fibration
open import Cat.Displayed.Instances.Subobjects -- Fibration of subobjects
```

Fibrations are also intimately connected with the study of [[internal
categories]], in particular through the construction of the
externalisation.

```agda
open import Cat.Displayed.Instances.Externalisation
```

## 序论

The study of sets equipped with a notion of precendence, or containment;
while the theory of [[partial orders]] is naturally seen as a
restriction of the theory of categories, formalising these concepts
separately leads to cleaner mathematics.

```agda
open import Order.Base -- Definitions
```

By asking for the existence of operations assigning [[meets]] and
[[joins]], we can use posets to formalise structures in both logic and
geometry: [[frames]] and [[lattices]].

```agda
open import Order.Frame
open import Order.Lattice
```

### 域论

Domain theory is the study of posets that are complete under various
classes of [[least upper bounds]]. Domains naturally lead to
formalisations of _partiality_, which makes them important tools in the
semantics of programming languages.

```agda
open import Order.DCPO         -- Directed-complete partial orders
open import Order.DCPO.Free    -- Free DCPOs and free pointed DCPOs
open import Order.DCPO.Pointed -- Pointed directed-complete partial orders
```

## 综合同伦论

**Synthetic homotopy theory** is the name given to the application of
type theory to the study of homotopy invariants of spaces --- in fancier
words, for speaking to $\infty$-groupoids in their own terms.

```agda
open import Homotopy.Base          -- Basic definitions
open import Homotopy.Connectedness -- Connected types
```

The most famous result in synthetic homotopy theory is the fundamental
group of the circle, defined as a higher inductive type. But we also
have a formalisation that any group is the fundamental group of a
specific space:

```agda
open import Homotopy.Space.Circle
open import Homotopy.Space.Delooping
```

We have also recorded a few facts about the following spaces:

```agda
open import Homotopy.Space.Torus  -- The torus
open import Homotopy.Space.Sphere -- Spheres of arbitrary dimension
open import Homotopy.Space.Sinfty -- The infinite-dimensional sphere
open import Homotopy.Space.Suspension -- Suspensions
```

## 代数

Formalisations of some of the basic notions in abstract algebra, such as
[[monoids]], [[groups]], [[rings]], and [[modules]] over these. Groups,
rings, and modules have further theory developed, but even then, we
freely admit that no deep results in algebra are formalised here.

```agda
open import Algebra.Monoid
open import Algebra.Group
open import Algebra.Ring
open import Algebra.Ring.Module
```

### 群论

Groups are an abstraction of the idea of _symmetry_ --- which is central
to homotopy type theory. See also [synthetic homotopy theory] above.

```agda
open import Algebra.Group.Free     -- Free groups
open import Algebra.Group.Action   -- Group actions
open import Algebra.Group.Cayley   -- Cayley's theorem
open import Algebra.Group.Concrete -- Groups as higher types
```

We also have a few results about the large-scale categorical structure
of $\Ab$, the category of abelian (or commutative) groups:

```agda
open import Algebra.Group.Ab                -- Abelian groups, and the category Ab
open import Algebra.Group.Ab.Tensor         -- Tensor product of abelian groups
open import Algebra.Group.Ab.Abelianisation -- Abelianisations
```

## Recent additions {#recently-added}

These are the ten most recent commits to the repository, which
introduced new modules. Looking through these would be a good way to
find which of the topics above are currently seeing activity!

::: {#recent-additions}
:::

<!-- Mastodon author links: !-->

<div style="display: none;">
<a rel="me" href="https://types.pl/@amy"></a>
<a rel="me" href="https://types.pl/@totbwf"></a>
</div>
