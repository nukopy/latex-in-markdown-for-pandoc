# SYNTAX TEST "text.html.markdown" "error test"

---
header-includes:
  - \usepackage{amsmath}
---

# Reproduce

## Example: Scope is resolved successfully

\newpage
#^^^^^^^^ meta.paragraph.markdown
#^ punctuation.definition.function.tex

## Example: Scope is not resolved

In this document, we derive the expectation, variance, and standard deviation from the definition of the normal distribution.

First, let’s review the theorem for the expectation, variance, and standard deviation of a normal distribution.

\begin{thm*}

When a random variable $X$ follows a normal distribution $N(\mu, \sigma^2)$ (i.e., $X \sim N(\mu, \sigma^2)$), the expectation, variance, and standard deviation of $X$ are given as follows:

$$
E[X] = \mu, \qquad V(X) = \sigma^2, \qquad \sqrt{V(X)} = \sigma.
$$

\end{thm*}
