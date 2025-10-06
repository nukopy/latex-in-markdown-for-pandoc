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
  - \renewcommand{\proofname}{証明}
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

\begin{thm*}

$X \sim N(\mu, \sigma^2)$ に対して期待値は $E[X] = \mu$ である。

\end{thm*}

\begin{proof}
正規分布の定義より、確率密度関数は

$$
p(x) = \frac{1}{\sqrt{2\pi \sigma^2}} \exp\left(-\frac{(x-\mu)^2}{2\sigma^2}\right)
$$

と表される。期待値は定義から

\begin{align*}
E[X]
&= \int_{-\infty}^{\infty} x \, p(x) \, \diff x \\
&= \int_{-\infty}^{\infty} \bigl((x-\mu) + \mu\bigr) p(x) \, \diff x \\
&= \mu \int_{-\infty}^{\infty} p(x) \, \diff x + \int_{-\infty}^{\infty} (x-\mu) p(x) \, \diff x.
\end{align*}

正規分布は確率密度関数の積分が 1 であるため、第一項は $\mu$ となる。第二項は変数変換 $y = \frac{x-\mu}{\sigma}$ を用いると

\begin{align*}
\int_{-\infty}^{\infty} (x-\mu) p(x) \, \diff x
&= \frac{1}{\sqrt{2\pi}} \int_{-\infty}^{\infty} \sigma y \exp\left(-\frac{y^2}{2}\right) \diff y \\
&= \frac{\sigma}{\sqrt{2\pi}} \int_{-\infty}^{\infty} y \exp\left(-\frac{y^2}{2}\right) \diff y.
\end{align*}

被積分関数 $y \exp(-y^2/2)$ は奇関数であり、積分区間 $(-\infty, \infty)$ は対称であるため、この積分は 0 となる。したがって

$$
E[X] = \mu + 0 = \mu
$$

が得られる。
\end{proof}

\newpage

### 正規分布の分散の導出

\begin{thm*}

$X \sim N(\mu, \sigma^2)$ に対して分散は $V(X) = \sigma^2$ である。

\end{thm*}

\begin{proof}
分散の定義から

$$
V(X) = E\bigl[(X-\mu)^2\bigr] = \int_{-\infty}^{\infty} (x-\mu)^2 p(x) \, \diff x
$$

となる。期待値の導出と同様に $y = \frac{x-\mu}{\sigma}$ と置くと

\begin{align*}
V(X)
&= \frac{1}{\sqrt{2\pi}} \int_{-\infty}^{\infty} (\sigma y)^2 \exp\left(-\frac{y^2}{2}\right) \diff y \\
&= \frac{\sigma^2}{\sqrt{2\pi}} \int_{-\infty}^{\infty} y^2 \exp\left(-\frac{y^2}{2}\right) \diff y.
\end{align*}

ここで積分を評価するために、偶関数性を利用して積分区間を $[0, \infty)$ へ制限し、部分積分を適用する。

\begin{align*}
\int_{-\infty}^{\infty} y^2 \exp\left(-\frac{y^2}{2}\right) \diff y
&= 2 \int_0^{\infty} y^2 \exp\left(-\frac{y^2}{2}\right) \diff y \\
&= 2 \left[ -y \exp\left(-\frac{y^2}{2}\right) \right]_0^{\infty} + 2 \int_0^{\infty} \exp\left(-\frac{y^2}{2}\right) \diff y.
\end{align*}

境界項は 0 に収束するため消える。また、ガウス積分（正規分布の正規化条件）\footnote{\href{https://mathlandscape.com/gauss-integral/}{Web サイト: 数学の景色 - ガウス積分のさまざまな形とその証明 5 つ}}より

$$
\int_{-\infty}^{\infty} \exp\left(-\frac{y^2}{2}\right) \diff y = \sqrt{2\pi}
$$

が成り立つので、半区間の積分はその半分であり、$\int_0^{\infty} \exp(-y^2/2) \diff y = \sqrt{2\pi}/2$ となる。以上から

$$
\int_{-\infty}^{\infty} y^2 \exp\left(-\frac{y^2}{2}\right) \diff y = 2 \cdot \frac{\sqrt{2\pi}}{2} = \sqrt{2\pi}
$$

が得られる。したがって

$$
V(X) = \frac{\sigma^2}{\sqrt{2\pi}} \times \sqrt{2\pi} = \sigma^2
$$

が示された。
\end{proof}

\newpage

### 正規分布の標準偏差の導出

標準偏差の定義は、分散の平方根 $\sqrt{V(X)}$ である。分散が $V(X) = \sigma^2$ と導出されたことから、

$$
\sqrt{V(X)} = \sqrt{\sigma^2} = \sigma
$$

が直ちに得られる。
