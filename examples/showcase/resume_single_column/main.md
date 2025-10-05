---
# ------------------------------------------------------------
# document class
# ------------------------------------------------------------

documentclass: extarticle

# ------------------------------------------------------------
# page settings
# ------------------------------------------------------------

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
# Update \basefontsize when this value changes
fontsize: 10pt

# font family
mainfont: "Hack Nerd Font Mono"
sansfont: "Hack Nerd Font Mono"
CJKmainfont: "Hiragino Sans W3"
monofont: "Hack Nerd Font Mono"

# ------------------------------------------------------------
# includes
# ------------------------------------------------------------

# ----- pandoc-latex-begin -----

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
  # Uncomment when indentation is required
  # - \usepackage{indentfirst}

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
  # Update fontsize: xpt when this value changes
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

  # space: configure width for half-width space characters
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
    \newcommand{\LinkedInBlackIcon}{\raisebox{-0.2em}{\includegraphics[height=0.9em]{examples/showcase/resume_single_column/assets/LinkedInBlackLogo.png}}}

  # Zenn icon
  - |
    \newcommand{\ZennBlackIcon}{\raisebox{-0.2em}{\includegraphics[height=0.9em]{examples/showcase/resume_single_column/assets/ZennBlackLogo.png}}}

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

# ----- pandoc-latex-end -----
---

# Joke Jordan

\faEnvelope\ \nolinkurl{joke.jordan@example.com} \textbar{}
\faGithub\ \href{https://example.com}{jokejordan} \textbar{}
\LinkedInBlackIcon\ \href{https://example.com}{Joke Jordan} \textbar{}
\ZennBlackIcon\ \href{https://example.com}{jokejordan}

## Skills

### Backend & Languages

- Go (standard library first: `context`, `net/http`, `database/sql`, generics; profiling with `pprof`)
- Rust (`tokio`, `axum`, `tracing`, `serde`; FFI basics with `cbindgen`)
- Python (SRE/automation tooling), Bash
- SQL (PostgreSQL): indexing, query plans, partitioning, VACUUM/ANALYZE hygiene

### Cloud & Orchestration

- AWS (ECS/Fargate, EKS, EC2, ALB/NLB, IAM, VPC, S3, CloudFront, RDS/Aurora)
- Containers (Docker/BuildKit, multi-stage builds, OCI, GHCR/ECR)
- IaC (Terraform/OpenTofu/Terragrunt, `tflint`, `tfsec`, drift detection)

### Observability & Reliability

- OpenTelemetry (traces/metrics/logs, OTLP exporters, manual + auto-instrumentation)
- Observability stack: Prometheus, Grafana, Tempo, Loki, Mimir, CloudWatch
- SLO/SLI design, error budgets, incident response; p95/p99 latency tuning
- Performance analysis: `pprof`, eBPF/bcc, flame graphs, Rust `tracing` spans

### Platform & Tooling

- CI/CD (GitHub Actions, ArgoCD/Flux; canary & blue-green, progressive delivery)
- Security (least-privilege IAM, IRSA, OPA/Gatekeeper, supply chain: SBOM, `cosign`)
- Networking (HTTP/2, gRPC, mTLS, service mesh: Istio/Linkerd)

## Experience

### Dummy Stub Inc. - Software Engineer

\employmenttype{Freelance}
\jobmeta{Jul 2025}{Present}{Remote}

Led container platform modernization and observability standardization across Go/Rust services. Reduced API p95 latency by **35%** for a multi-billion-request/month estate.

- Planned ECS (Fargate) → EKS migration; phased stateless workloads first. Split ALB/NLB data paths to increase peak throughput **1.4×**.
- Rolled out OpenTelemetry SDKs (Go/Rust) with Tempo/Loki backends; established service-level traceability and cross-service root cause workflows.
- Defined SLOs (availability/latency/error rate) and an error-budget release gate.
- Used `pprof` + eBPF to find CPU hot paths; refactored middleware to zero-alloc, improving p95 by **35%**.
- Re-structured Terraform monorepo by `env`/`region`; enforced `tflint`/`tfsec` in CI and added drift detection.

\newpage

### Mock Spy Co., Ltd. - Software Engineer

\employmenttype{Permanent}
\jobmeta{Apr 2022}{May 2025}{Tokyo, Japan | Hybrid}

Owned high-traffic Go microservices and embedded an observability-first culture; cut MTTR by **60%**.

- Standardized dual-stack APIs (gRPC + JSON). Adopted `connect-go` for protocol compatibility.
- Combined OTel auto-instrumentation with hand-crafted spans to expose N+1 patterns; reduced DB query volume **40%**.
- Shipped blue-green on ECS with WAF staged rules; auto-rollback via CloudWatch → EventBridge → Lambda.
- Built CI matrices (Go/Rust/lint/SBOM) on GitHub Actions; reduced build time **30%**.
- Re-partitioned Aurora PostgreSQL and redesigned indexes; report query p95 from **2.1 s → 480 ms**.

### Fake Inc. - Software Engineer

\employmenttype{Permanent}
\jobmeta{Apr 2018}{May 2021}{Kyoto, Japan | Hybrid}

Gradually decomposed a monolith to Go services with operational simplicity as a first-class goal.

- Extracted Rails features into Go services behind an API gateway for incremental migration.
- Moved logging from CloudWatch Logs to Loki; standardized structured logs with `trace_id`/`span_id`/`req_id`.
- Introduced SLOs and on-call runbooks; accelerated first-response and lowered MTTR.
- Codified VPC/ALB/RDS with Terraform; eliminated manual changes.

## Education

### Bachelor of Pharmaceutical Sciences

Tokyo University of Test Doubles, School of Pharmaceutical Sciences

\jobmeta{Apr 2013}{Mar 2017}{Chiba, Japan}

## Certifications

- AWS Certified Solutions Architect - Associate (Active)
- Applied Information Technology Engineer (Dec 2022)
- AtCoder: Rating 914, Green tier (ID: jokejordan)
- TOEFL iBT: 81 (Jan 2020)

## Languages

- Japanese: Native
- English: Business

## Additional Information

- HHKB enthusiast
