---
# ----- pandoc-latex-begin -----

# The code below is treated as normal YAML
documentclass: extarticle
papersize: a4
pagestyle: empty
geometry:
  - top=17.5mm
  - bottom=20mm
  - left=20mm
  - right=20mm

# font
fontfamily: serif
fontsize: 12pt

# metadata
title: "Basic of statistics"
author: "Statistics Taro"
date: 2025-10-06

# The code below is highlighted as LaTeX code in your editor!
header-includes:
  - \usepackage{xcolor}
  - \usepackage{graphicx}
  - \usepackage{titlesec}
  - \usepackage{setspace}
# ----- pandoc-latex-end -----
---

## Variance

$$
s^2 = \frac{1}{n} \sum_{i=1}^n {(x_i - \overline{x})^2}
$$

## normal distribution

$$
f(x) = \frac{1}{\sqrt{2\pi\sigma^2}}e^\frac{-(x-\mu)^2}{2\sigma^2}
$$
