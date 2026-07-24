#!/bin/bash
set -e
mkdir -p publications posts

cat > '_quarto.yml' << 'QUARTO_EOF'
project:
  type: website
  output-dir: docs

website:
  title: "Dr. Saif Ali Khan"
  site-url: "https://ak-saif.github.io"
  description: "Assistant Professor — infectious disease modeling with statistics & machine learning"
  navbar:
    logo: logo.png
    background: "#16213E"
    foreground: "#F5F5F2"
    left:
      - href: about.qmd
        text: About
      - href: background.qmd
        text: Background
      - href: publications.qmd
        text: Publications
      - href: talks.qmd
        text: Talks
      - href: videos.qmd
        text: Videos
    right:
      - icon: twitter-x
        href: https://x.com/dsaifstats
        aria-label: X (Twitter)
      - icon: linkedin
        href: https://www.linkedin.com/in/dsaifstats/
        aria-label: LinkedIn
      - icon: github
        href: https://github.com/ak-saif
        aria-label: GitHub
      - icon: rss
        href: index.xml
        aria-label: RSS feed
  page-footer:
    center: "© Dr. Saif Ali Khan · built with Quarto"
    border: false

format:
  html:
    theme: [cosmo, styles.scss]
    include-in-header: font-links.html
    toc: false
    grid:
      body-width: 780px
QUARTO_EOF

cat > 'font-links.html' << 'QUARTO_EOF'
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Source+Serif+4:wght@400;600;700&family=Inter:wght@400;500;600&family=IBM+Plex+Mono:wght@400;500&display=swap" rel="stylesheet">
QUARTO_EOF

cat > 'styles.scss' << 'QUARTO_EOF'
/*-- scss:defaults --*/
$body-bg: #F5F5F2;
$body-color: #16213E;
$link-color: #7A2E3D;
$link-hover-color: #5C2230;

$font-family-sans-serif: "Inter", -apple-system, BlinkMacSystemFont, sans-serif;
$font-family-monospace: "IBM Plex Mono", "SFMono-Regular", Consolas, monospace;
$headings-font-family: "Source Serif 4", "Iowan Old Style", Georgia, serif;
$headings-font-weight: 600;
$headings-color: #16213E;

$border-color: #DFDCD3;

/*-- scss:rules --*/

body { line-height: 1.65; }

.navbar {
  font-family: $font-family-monospace;
  font-size: 0.85rem;
  letter-spacing: 0.02em;
}
.navbar-brand-container { gap: 10px; }
.navbar-logo { border-radius: 50%; }

// eyebrow-style page kicker, used via a div in .qmd content
.eyebrow {
  font-family: $font-family-monospace;
  font-size: 0.75rem;
  letter-spacing: 0.12em;
  text-transform: uppercase;
  color: #7A2E3D;
  margin-bottom: 4px;
}

// pull-quote style tagline on the About page
.tagline {
  font-family: $headings-font-family;
  font-style: italic;
  font-size: 1.25rem;
  color: #5C2230;
  border-left: 3px solid #C9A66B;
  padding-left: 1rem;
  margin: 1rem 0 1.5rem;
}

// skill / qualification chips
.chip {
  display: inline-block;
  font-family: $font-family-monospace;
  font-size: 0.72rem;
  color: #4A5268;
  border: 1px solid $border-color;
  border-radius: 999px;
  padding: 2px 10px;
  margin: 4px 6px 0 0;
}

// About page (trestles template) portrait framing
.about-entity .about-image {
  border-radius: 50% !important;
  outline: 2px solid #C9A66B;
  outline-offset: 5px;
}

// listing (publications / posts) tweaks
.quarto-listing .listing-item .listing-title {
  font-family: $headings-font-family;
  font-weight: 600;
}
.quarto-listing .listing-date {
  font-family: $font-family-monospace;
  color: #7A2E3D;
}
.quarto-listing-category {
  font-family: $font-family-monospace;
  font-size: 0.8rem;
}
.quarto-listing-category.active {
  color: #7A2E3D;
  font-weight: 600;
}

// venue / doi line inside individual publication pages
.venue-line {
  font-style: italic;
  color: #4A5268;
  margin-bottom: 0.25rem;
}

// simple table-based timeline for Background page
.timeline {
  width: 100%;
  border-collapse: collapse;
}
.timeline td {
  padding: 12px 0;
  border-top: 1px solid $border-color;
  vertical-align: top;
}
.timeline td.years {
  font-family: $font-family-monospace;
  font-size: 0.82rem;
  color: #7A2E3D;
  white-space: nowrap;
  padding-right: 20px;
  width: 150px;
}
.timeline .place { color: #4A5268; font-style: italic; font-size: 0.92rem; }
.timeline .detail { color: #4A5268; font-size: 0.92rem; }

// Videos page cards
.video-card {
  margin-bottom: 2.5rem;
}
.video-card h3 {
  font-size: 1.1rem;
  margin-bottom: 0.75rem;
}
.video-card .ratio {
  border-radius: 4px;
  overflow: hidden;
  border: 1px solid $border-color;
}
QUARTO_EOF

cat > 'index.qmd' << 'QUARTO_EOF'
---
title: "Notes & Writing"
listing:
  contents: posts
  type: default
  sort: "date desc"
  categories: true
  feed: true
page-layout: full
---

Notes, articles, and commentary — new posts appear here automatically, newest first.
QUARTO_EOF

cat > 'about.qmd' << 'QUARTO_EOF'
---
title: "Dr. Saif Ali Khan"
subtitle: "Assistant Professor, Directorate of Online Education · Manipal Academy of Higher Education, Manipal"
image: photo.jpg
about:
  template: trestles
  image-shape: round
  image-width: 15em
  links:
    - icon: envelope
      text: Email
      href: "mailto:you@university.edu"     # replace with your real email
    - icon: twitter-x
      text: X (Twitter)
      href: https://x.com/dsaifstats
    - icon: linkedin
      text: LinkedIn
      href: https://www.linkedin.com/in/dsaifstats/
    - icon: github
      text: GitHub
      href: https://github.com/ak-saif
    - icon: mortarboard-fill
      text: Google Scholar
      href: "https://scholar.google.com/citations?user=3isZscUAAAAJ&hl=en&authuser=2"
    - icon: person-vcard
      text: ORCID
      href: https://orcid.org/0000-0003-1722-728X
    - icon: diagram-3
      text: ResearchGate
      href: https://www.researchgate.net/profile/Saif-Ali-Khan-7
    - icon: graph-up
      text: Web of Science
      href: https://www.webofscience.com/wos/author/record/QJW-3591-2026
    - icon: search
      text: Scopus
      href: "https://www.scopus.com/authid/detail.uri?authorId=58719727500"
    - icon: file-earmark-person
      text: CV
      href: CV_with_publication.docx
---

::: {.tagline}
I model how infectious diseases spread — using statistics and machine learning to see outbreaks coming.
:::

I work at the intersection of statistical modeling and machine learning, focused on infectious
disease dynamics — from dengue and monkeypox to lumpy skin disease and COVID-19. My Ph.D.
examined disease spread through compartmental, time-series, and ML approaches, and I continue
that work applying predictive analytics to public health and agricultural forecasting problems.

### Research interests

::: {.skills}
[Data Science & Predictive Analytics]{.chip} [Machine Learning]{.chip} [Time Series Analysis]{.chip}
[Statistical Modeling]{.chip} [Mathematical Epidemiology]{.chip} [Python (Pandas, Scikit-learn, Statsmodels)]{.chip}
[Data Visualization (Matplotlib, Seaborn)]{.chip} [Excel]{.chip} [Jamovi]{.chip}
:::

### Qualifications

::: {.skills}
[GATE — Data Science & AI (2024)]{.chip} [O Level — NIELIT (2022)]{.chip}
:::
QUARTO_EOF

cat > 'background.qmd' << 'QUARTO_EOF'
---
title: "Background"
---

::: {.eyebrow}
Education
::: 

```{=html}
<table class="timeline">
<tr>
  <td class="years">Jul 2022 – Nov 2025</td>
  <td>
    <strong>Ph.D. in Statistics</strong><br>
    <span class="place">Babasaheb Bhimrao Ambedkar University, Lucknow</span><br>
    <span class="detail">Thesis: Infectious Disease Modeling Through Distinct Statistical &amp; Machine Learning Techniques</span>
  </td>
</tr>
<tr>
  <td class="years">2018 – 2020</td>
  <td>
    <strong>M.Sc. in Statistics</strong><br>
    <span class="place">Aligarh Muslim University, Aligarh · GPA 7.69/10</span><br>
    <span class="detail">Dissertation: Image Classification of Skin Lesion</span>
  </td>
</tr>
<tr>
  <td class="years">2015 – 2018</td>
  <td>
    <strong>B.Sc. (Hons) in Statistics</strong><br>
    <span class="place">Aligarh Muslim University, Aligarh · GPA 7.84/10</span><br>
    <span class="detail">Dissertation: Effectiveness of Choice-Based Credit System (Survey Report)</span>
  </td>
</tr>
</table>
```

::: {.eyebrow style="margin-top:2.5rem;"}
Experience
:::

```{=html}
<table class="timeline">
<tr>
  <td class="years">Nov 2025 – present</td>
  <td>
    <strong>Assistant Professor</strong><br>
    <span class="place">Directorate of Online Education, Manipal Academy of Higher Education, Manipal</span>
  </td>
</tr>
<tr>
  <td class="years">Jun 2023 – Oct 2024</td>
  <td>
    <strong>Research Assistant</strong> (UPCST-funded project)<br>
    <span class="place">Department of Statistics, BBAU, Lucknow</span><br>
    <span class="detail">Project: Statistical modeling for COVID-19 spread using different approaches.
    Designed compartmental and statistical models for COVID-19 transmission; applied time series
    and ML models for prediction.</span>
  </td>
</tr>
</table>
```
QUARTO_EOF

cat > 'publications.qmd' << 'QUARTO_EOF'
---
title: "Publications"
listing:
  contents: publications
  type: default
  sort: "date desc"
  categories: true
  fields: [title, author, date, categories]
  date-format: "YYYY"
  feed: false
page-layout: full
---

Click any title for the abstract and DOI. Use the categories on the right to filter by topic.
QUARTO_EOF

cat > 'talks.qmd' << 'QUARTO_EOF'
---
title: "Talks & Presentations"
---

::: {.eyebrow}
2024
:::

**Predicting Lumpy Skin Disease Outbreak: A Comparative Study of Machine Learning Across Affected Countries**\
International Conference on Advances in Geometry, Algebra, Analysis and Artificial Intelligence
(ICAGAAAI-2024), Integral University, Lucknow · Nov 7–9, 2024

**Workshop on Computational Oncology** (participant)\
Department of Mathematics, Indian Institute of Technology Patna · April 19–21, 2024

::: {.eyebrow style="margin-top:2rem;"}
2023
:::

**A Comparative Study of Trends for Dengue Outbreaks and Mortality in India Using Different
Machine Learning Models**\
International Conference on Innovations in Science, Management and Technology (ICISMT),
Chaudhary Devi Lal University, Sirsa · Aug 17–18, 2023

<!--
To add a recorded talk with a video embed, use:

::: {.ratio .ratio-16x9}
<iframe src="https://www.youtube.com/embed/VIDEO_ID" allowfullscreen></iframe>
:::
-->
QUARTO_EOF

cat > 'videos.qmd' << 'QUARTO_EOF'
---
title: "Videos"
---

Only two videos on the channel so far — more will be added over time.

::: {.video-card}
### Video 1  <!-- TODO: replace with the real title -->

::: {.ratio .ratio-16x9}
<iframe src="https://www.youtube.com/embed/y2_ywIawXg8" title="YouTube video" allowfullscreen></iframe>
:::
:::

::: {.video-card}
### Video 2  <!-- TODO: replace with the real title -->

::: {.ratio .ratio-16x9}
<iframe src="https://www.youtube.com/embed/ymqG-HBjlXk" title="YouTube video" allowfullscreen></iframe>
:::
:::
QUARTO_EOF

cat > 'publications/dengue-2026.qmd' << 'QUARTO_EOF'
---
title: "A Comparative State-wise Assessment of Dengue Incidence and Deaths in India Using Annual Surveillance Data"
author: "Khan, S.A., Yadav, S.K., Akhter, Y."
date: 2026-01-01
categories: [dengue, surveillance, epidemiology]
---

::: {.venue-line}
Discover Public Health, 23, article 981
:::

**DOI:** [10.1186/s12982-026-02396-x](https://doi.org/10.1186/s12982-026-02396-x)

A state-wise comparative assessment of dengue incidence and mortality across India using
annual surveillance data.
QUARTO_EOF

cat > 'publications/lumpy-skin-disease-2026.qmd' << 'QUARTO_EOF'
---
title: "Analyzing Global Threat of Lumpy Skin Disease Virus Infection: A Comparative Study of a Time Series Model and Machine Learning Models Across 10 High-Risk Countries"
author: "Khan, S.A., Yadav, S.K., Akhter, Y."
date: 2026-01-02
categories: [lumpy skin disease, time series, machine learning]
---

::: {.venue-line}
Current Microbiology, 83, 389
:::

**DOI:** [10.1007/s00284-026-04982-3](https://doi.org/10.1007/s00284-026-04982-3)

Compares time series and machine learning models for forecasting lumpy skin disease virus
spread across ten high-risk countries.
QUARTO_EOF

cat > 'publications/socioeconomic-clustering-2026.qmd' << 'QUARTO_EOF'
---
title: "Decoding Socio-economic Disparities in Uttar Pradesh: A Spatio-temporal Analysis Using Wroclaw Taxonomy and K-means Unsupervised Machine Learning Clustering"
author: "Singh, V., Hajare, G.C., Khan, S.A., Kumari, A."
date: 2026-01-03
categories: [clustering, socio-economic, spatio-temporal]
---

::: {.venue-line}
Mathematical Population Studies, 1–23
:::

**DOI:** [10.1080/08898480.2025.2612641](https://doi.org/10.1080/08898480.2025.2612641)

Applies Wroclaw Taxonomy and K-means clustering to map spatio-temporal socio-economic
disparities across Uttar Pradesh.
QUARTO_EOF

cat > 'publications/apple-forecasting-2025.qmd' << 'QUARTO_EOF'
---
title: "Traditional and Machine Learning Models for Forecasting Apple Production and Cultivation Area"
author: "Khan, S.A., Sharma, D.K., Shukla, A.K., Verma, M.R., Sharma, A., Yadav, S.K."
date: 2025-01-01
categories: [forecasting, machine learning, agriculture]
---

::: {.venue-line}
Applied Fruit Science, 67, 402
:::

**DOI:** [10.1007/s10341-025-01639-6](https://doi.org/10.1007/s10341-025-01639-6)

Compares traditional statistical and machine learning approaches for forecasting apple
production and cultivation area.
QUARTO_EOF

cat > 'publications/egg-production-2025.qmd' << 'QUARTO_EOF'
---
title: "Machine Learning Models for Analysis and Prediction of Optimal Egg Production"
author: "Khan, S.A., Shukla, A.K., Yadav, S.K., Vishwakarma, G.K."
date: 2025-01-02
categories: [machine learning, agriculture, prediction]
---

::: {.venue-line}
Quality & Quantity, 60, 1705
:::

**DOI:** [10.1007/s11135-025-02309-1](https://doi.org/10.1007/s11135-025-02309-1)

Machine learning approaches applied to analyze and predict optimal egg production.
QUARTO_EOF

cat > 'publications/omicron-2024.qmd' << 'QUARTO_EOF'
---
title: "Taking Cues from Machine Learning, Compartmental and Time Series Models for SARS-CoV-2 Omicron Infection in Indian Provinces"
author: "Yadav, S.K., Khan, S.A., Tiwari, M., Kumar, A., Kumar, V., Akhter, Y."
date: 2024-01-01
categories: [covid-19, epidemiology, time series]
---

::: {.venue-line}
Spatial and Spatio-Temporal Epidemiology, 48, 100634
:::

**DOI:** [10.1016/j.sste.2024.100634](https://doi.org/10.1016/j.sste.2024.100634)

Combines machine learning, compartmental, and time series models to study SARS-CoV-2 Omicron
spread across Indian provinces.
QUARTO_EOF

cat > 'publications/monkeypox-2023.qmd' << 'QUARTO_EOF'
---
title: "Modeling Global Monkeypox Infection Spread Data: A Comparative Study of Time Series Regression and Machine Learning Models"
author: "Singh, V., Khan, S.A., Yadav, S.K., Akhter, Y."
date: 2023-01-01
categories: [monkeypox, time series, machine learning]
---

::: {.venue-line}
Current Microbiology, 81(1), Article 15
:::

**DOI:** [10.1007/s00284-023-03531-6](https://doi.org/10.1007/s00284-023-03531-6)

A comparative study of time series regression and machine learning models applied to global
monkeypox spread data.
QUARTO_EOF

cat > 'posts/README.md' << 'QUARTO_EOF'
# Adding a new post

1. Duplicate `posts/_example-post.qmd` (or make a new folder `posts/my-post-name/`).
2. Give it a front matter block:

```yaml
---
title: "Your post title"
date: 2026-08-01
categories: [optional, tags]
---
```

3. Write the post in Markdown below the `---`.
4. Remove `draft: true` if present (the example post has it set so it won't show until you're ready).
5. Run `quarto render` — it appears automatically on the Writing page, newest first.
QUARTO_EOF

cat > 'posts/_example-post.qmd' << 'QUARTO_EOF'
---
title: "Example post — copy this file to get started"
date: 2026-01-01
categories: [example]
draft: true
---

Delete this front matter comment and write your real post here. Remove `draft: true`
once you're ready to publish it, then re-render the site.
QUARTO_EOF

if [ -f writing.qmd ]; then rm writing.qmd; echo "Removed old writing.qmd (homepage now serves this role)"; fi
echo "All files created/updated."
echo "Make sure photo.jpg, logo.png, and CV_with_publication.docx are in this folder."
echo "Then run: quarto preview"
