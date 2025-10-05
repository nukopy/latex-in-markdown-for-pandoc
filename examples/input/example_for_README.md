---
# ----- pandoc-latex-begin -----

documentclass: extarticle
papersize: a4
geometry:
  - top=17.5mm
  - bottom=20mm
  - left=20mm
  - right=20mm
pagestyle: empty

# font
fontsize: 10pt
mainfont: "Hack Nerd Font Mono"
sansfont: "Hack Nerd Font Mono"
CJKmainfont: "Hiragino Sans W3"
monofont: "Hack Nerd Font Mono"

# header includes
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

  # background color
  - |
    \pagecolor{pagebg}

  # Set paragraph spacing
  - \setlength{\parskip}{0.75em}

  # global line spacing
  - \setstretch{1.25}

  # list style
  - |
    \setlist[itemize]{
      topsep=\fpeval{-\basefontsize*0.5}pt,
      partopsep=0pt,
      parsep=0pt,
      itemsep=\fpeval{\basefontsize*0.35}pt,
      after=\vspace{\fpeval{\basefontsize*0.5}pt}
    }

  # colors
  - |
    \definecolor{titleblack}{HTML}{000000}
    \definecolor{sectiongreen}{HTML}{137A63}
    \definecolor{pagebg}{HTML}{F0F0F0}

  # job meta data
  # usage: \jobmeta{Apr 2013}{Mar 2017}{Tokyo, Japan | Remote}
  - |
    \newcommand{\jobmeta}[3]{%
      {\BodyFont
      \noindent\makebox[\linewidth][l]{%
        \hspace{0.5pt}\textcolor{black}{\faIcon[regular]{calendar}}\ #1~-~#2\hfill\textcolor{black}{\faMapMarker*}\ #3%
      }}\par\vspace{-\fpeval{\basefontsize*0.4}pt}
    }

# ----- pandoc-latex-end -----
---

# title
