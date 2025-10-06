---
# ----- pandoc-latex-begin -----

# ------------------------------------------------------------
# document class
# ------------------------------------------------------------

documentclass: extarticle
title: "正規分布の期待値（平均）、分散、標準偏差とその導出"
author: "統計太郎"
date: 2025-10-06

# ------------------------------------------------------------
# page settings
# ------------------------------------------------------------

papersize: a4
geometry:
  - top=10mm
  - bottom=15mm
  - left=22mm
  - right=22mm

pagestyle: plain

# ------------------------------------------------------------
# font
# ------------------------------------------------------------

fontsize: 11pt
CJKmainfont: "Hiragino Sans W3"

# ------------------------------------------------------------
# includes
# ------------------------------------------------------------

header-includes:
  - \usepackage{amssymb}
  - \usepackage{mathtools}
  - \usepackage{bm}
  - \usepackage{setspace}
  - \setlength{\parskip}{0.75em}
  - \setstretch{1.25}
  - |
    \newcommand{\E}{\mathbb{E}}
  - |
    \newcommand{\Var}{\mathrm{Var}}
  - |
    \newcommand{\diff}{\mathrm{d}}
  - |
    \numberwithin{equation}{section}

  # for definition, theorem
  - \usepackage{amsmath}
  - \usepackage{amsthm}
  - \theoremstyle{plain}
  - \newtheorem{thm}{定理}
  - \newtheorem*{thm*}{定理}
  - \theoremstyle{definition}
  - \newtheorem{dfn}{定義}
  - \newtheorem*{dfn*}{定義}
# ----- pandoc-latex-end -----
---

\maketitle

\tableofcontents

## 参考

本ドキュメントは以下の資料を参考に作成している。

- Web サイト: [数学の景色 - 正規分布の期待値(平均)・分散・標準偏差とその導出証明](https://mathlandscape.com/normal-distrib-ev/)
- Web サイト: [数学の景色 - 【LaTeX】定理環境 amsthm パッケージの使い方を徹底解説](https://mathlandscape.com/latex-amsthm/)

\newpage

## イントロダクション：正規分布の期待値、分散、標準偏差

本ドキュメントでは、正規分布の定義から期待値、分散、標準偏差を導出する。

まずは正規分布の期待値、分散、標準偏差の定理を確認する。

\begin{thm*}

確率変数 $X$ が正規分布 $N(\mu, \sigma^2)$ に従うとき（$X \sim N(\mu, \sigma^2)$）、$X$ の期待値、分散、標準偏差はそれぞれ次のとおりとなる。

$$
E[X] = \mu, \qquad V(X) = \sigma^2, \qquad \sqrt{V(X)} = \sigma.
$$

\end{thm*}

## 正規分布の定義

まず、正規分布の確率密度関数の定義を確認する。

\begin{dfn*}

$X$ を確率変数、$\mu \in \mathbb{R}$、$\sigma > 0$ とする。$X$ の確率密度関数が

$$
p(x) = \frac{1}{\sqrt{2\pi \sigma^2}} \exp\left(-\frac{(x-\mu)^2}{2\sigma^2}\right)
$$

となるとき、$X$ は正規分布 $N(\mu, \sigma^2)$（normal distribution）に従うといい、$X \sim N(\mu, \sigma^2)$ と表す。

\end{dfn*}

\newpage

## 正規分布の期待値、分散、標準偏差の導出

### 正規分布の期待値（平均）の導出

TODO: 期待値の導出

<!--
期待値の定義 $\E[X] = \int_{-\infty}^{\infty} x p(x) \, \diff x$ に基づいて計算します。

\begin{align*}
\E[X]
&= \int*{-\infty}^{\infty} x p(x) \, \diff x \\
&= \frac{1}{\sqrt{2\pi \sigma^2}} \int*{-\infty}^{\infty} x \exp\left(-\frac{(x-\mu)^2}{2\sigma^2}\right) \diff x \\
&= \frac{1}{\sqrt{2\pi \sigma^2}} \int*{-\infty}^{\infty} \bigl((x-\mu) + \mu\bigr) \exp\left(-\frac{(x-\mu)^2}{2\sigma^2}\right) \diff x \\
&= \frac{1}{\sqrt{2\pi \sigma^2}} \int*{-\infty}^{\infty} (x-\mu) \exp\left(-\frac{(x-\mu)^2}{2\sigma^2}\right) \diff x \\[-0.25em]
&\quad+ \mu \cdot \frac{1}{\sqrt{2\pi \sigma^2}} \int\_{-\infty}^{\infty} \exp\left(-\frac{(x-\mu)^2}{2\sigma^2}\right) \diff x.
\end{align*}

第 1 項について $y = \dfrac{x-\mu}{\sigma}$ とおくと、

\begin{align*}
\frac{1}{\sqrt{2\pi \sigma^2}} \int*{-\infty}^{\infty} (x-\mu) \exp\left(-\frac{(x-\mu)^2}{2\sigma^2}\right) \diff x
&= \frac{\sigma}{\sqrt{2\pi}} \int*{-\infty}^{\infty} y \exp\left(-\frac{y^2}{2}\right) \diff y \\
&= 0,
\end{align*}

となります。これは被積分関数が奇関数であり、$y$ 軸対称に打ち消し合うためです。また第 2 項はガウス積分 $\int_{-\infty}^{\infty} \exp(-y^2/2) \diff y = \sqrt{2\pi}$ を用いると $1$ になります。したがって $\E[X] = \mu$ が導かれます。 -->

### 正規分布の分散の導出

TODO: 正規分布の分散の導出

<!-- 分散の定義 $\Var(X) = \E\!\bigl[(X-\E[X])^2\bigr]$ と先ほど求めた $\E[X] = \mu$ を用います。

\begin{align*}
\Var(X)
&= \int*{-\infty}^{\infty} (x-\mu)^2 p(x) \, \diff x \\
&= \frac{1}{\sqrt{2\pi \sigma^2}} \int*{-\infty}^{\infty} (x-\mu)^2 \exp\left(-\frac{(x-\mu)^2}{2\sigma^2}\right) \diff x.
\end{align*}

ここでも $y = \dfrac{x-\mu}{\sigma}$ とおくと、

\begin{align*}
\Var(X)
&= \frac{\sigma^2}{\sqrt{2\pi}} \int\_{-\infty}^{\infty} y^2 \exp\left(-\frac{y^2}{2}\right) \diff y.
\end{align*}

積分は部分積分を用いて評価できます。

\begin{align*}
\int*{-\infty}^{\infty} y^2 \exp\left(-\frac{y^2}{2}\right) \diff y
&= \left[-y \exp\left(-\frac{y^2}{2}\right)\right]_{-\infty}^{\infty} + \int\_{-\infty}^{\infty} \exp\left(-\frac{y^2}{2}\right) \diff y \\
&= 0 + \sqrt{2\pi}.
\end{align_}

したがって

$$
\Var(X) = \frac{\sigma^2}{\sqrt{2\pi}} \cdot \sqrt{2\pi} = \sigma^2.
$$ -->

### 正規分布の標準偏差の導出

標準偏差の定義は、分散の平方根 $\sqrt{V(X)}$ である。分散が $\sigma^2$ と導出されたことから、

$$
\sqrt{V(X)} = \sqrt{\sigma^2} = \sigma
$$

が直ちに得られる。
