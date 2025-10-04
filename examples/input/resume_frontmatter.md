---
# meta
title: Simple

# ------------------------------------------------------------
# document class
# ------------------------------------------------------------

documentclass: extarticle

# ------------------------------------------------------------
# page settings
# ------------------------------------------------------------
hogehoge
# paper size
papersize: a4

# margins
geometry:
  - top=17.5mm
  - bottom=20mm
  - left=20mm
  - right=20mm

# no page
pagestyle: empty

# ------------------------------------------------------------
# font
# ------------------------------------------------------------

# font size
# ここを書き換えたら \basefontsize の値も書き換える
fontsize: 10pt

# font family
mainfont: "Hack Nerd Font Mono"
sansfont: "Hack Nerd Font Mono"
CJKmainfont: "Hiragino Sans W3"
monofont: "Hack Nerd Font Mono"

# ------------------------------------------------------------
# includes
# ------------------------------------------------------------

header-includes:
  # packages
  - \usepackage{xcolor}
  - \usepackage{graphicx}
  - \usepackage{titlesec}
  - \usepackage{setspace}
  - \usepackage{fontawesome5}
  - \usepackage{xfp}
  - \usepackage[normalem]{ulem}
  - \usepackage{enumitem}
  # インデントが必要なときはコメントアウトを解除
  # - \usepackage{indentfirst}

  # 段落間のスペースを設定
  - \setlength{\parskip}{0.75em}

  # global line spacing
  - \setstretch{1.25}

  # list style
  - |
    \setlist[itemize]{topsep=\fpeval{-\basefontsize*0.5}pt, partopsep=0pt, parsep=0pt, itemsep=\fpeval{\basefontsize*0.35}pt, after=\vspace{\fpeval{\basefontsize*0.5}pt}}

  # ------------------------------------------------------------
  # macros
  # ------------------------------------------------------------

  # colors
  - |
    \definecolor{titleblack}{HTML}{000000}
    \definecolor{sectiongreen}{HTML}{137A63}
    \definecolor{pagebg}{HTML}{F0F0F0}

  # background color
  - |
    \pagecolor{pagebg}

  # font size: common
  # ここを書き換えたら fontsize: xpt の値も書き換える
  - |
    \newcommand{\basefontsize}{10pt}

  # font size: h1
  - |
    \newcommand{\HeadingOneFont}{\fontsize{\fpeval{\basefontsize*1.50}pt}{\fpeval{\basefontsize*1.50*1.2}pt}\selectfont}

  # font size: h2
  - |
    \newcommand{\HeadingTwoFont}{\fontsize{\fpeval{\basefontsize*1.35}pt}{\fpeval{\basefontsize*1.35*1.2}pt}\selectfont}

  # font size: h3
  - |
    \newcommand{\HeadingThreeFont}{\fontsize{\fpeval{\basefontsize*1.15}pt}{\fpeval{\basefontsize*1.15*1.2}pt}\selectfont}

  # font size: body
  - |
    \newcommand{\BodyFont}{\fontsize{\fpeval{\basefontsize}pt}{\fpeval{\basefontsize}pt}\selectfont}

  # space: 半角スペースの幅の設定
  - |
    \setlength{\spaceskip}{\fpeval{\basefontsize*0.35}pt plus 0.15pt minus 0.1pt}
    \setlength{\xspaceskip}{\spaceskip}

  # ------------------------------------------------------------
  # macros for resume format
  # ------------------------------------------------------------

  # employment type
  - |
    \newcommand{\employmenttype}[1]{%
      {\BodyFont
      \noindent\makebox[\linewidth]{%
        \textcolor{black}{#1}\hfill
      }}\par\vspace{-\fpeval{\basefontsize*0.5}pt}
    }

  # job meta data
  # usage: \jobmeta{Apr 2013}{Mar 2017}{Tokyo, Japan | Remote}
  - |
    \newcommand{\jobmeta}[3]{%
      {\BodyFont
      \noindent\makebox[\linewidth][l]{%
        \hspace{0.5pt}\textcolor{black}{\faIcon[regular]{calendar}}\ #1~-~#2\hfill\textcolor{black}{\faMapMarker*}\ #3%
      }}\par\vspace{-\fpeval{\basefontsize*0.4}pt}
    }

  # LinkedIn icon
  - |
    \newcommand{\LinkedInBlackIcon}{\raisebox{-0.2em}{\includegraphics[height=0.9em]{assets/icons/LinkedInBlackLogo.png}}}

  # Zenn icon
  - |
    \newcommand{\ZennBlackIcon}{\raisebox{-0.2em}{\includegraphics[height=0.9em]{assets/icons/ZennBlackLogo.png}}}

  # ------------------------------------------------------------
  # heading styles
  # ------------------------------------------------------------

  # h1
  - |
    \titleformat{\section}{\color{titleblack}\HeadingOneFont\bfseries}{\thesection}{1em}{}
    \titlespacing*{\section}{0pt}{*0}{*0.25}

  # h2
  - |
    \titleformat{\subsection}{\color{sectiongreen}\HeadingTwoFont\bfseries}{\thesubsection}{1em}{}
    \titlespacing*{\subsection}{0pt}{*1}{*0.25}

  # h3: black and bold
  - |
    \titleformat{\subsubsection}{\color{black}\HeadingThreeFont\bfseries}{\thesubsubsection}{1em}{}
    \titlespacing*{\subsubsection}{0pt}{*1}{*0.5}

  # link underline
  - |
    \AtBeginDocument{\let\originalhref\href\renewcommand{\href}[2]{\originalhref{#1}{\uline{#2}}}}
---

$\LaTeX$

```latex
\begin{equation}
  \label{eq:simple}
  y = mx + b
\end{equation}
```

```go
package main

func main() {
  fmt.Println("Hello, World!")
}
```
