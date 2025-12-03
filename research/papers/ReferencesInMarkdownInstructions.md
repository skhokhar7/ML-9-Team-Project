# Writing Scientific Papers in Markdown with Mendeley and GitHub

This repository is configured to let you write scientific papers in Markdown (or Quarto) while managing references with **Mendeley**.  
Your paper can be automatically built into a polished PDF using **GitHub Actions**.

---

## 1. Overview

| Tool | Purpose |
|------|----------|
| **Mendeley** | Manage and organize references |
| **BibTeX (.bib)** | Stores citation data exported from Mendeley |
| **Markdown / Quarto** | Write your paper with citations like `[@doe2023]` |
| **Pandoc / Quarto Renderer** | Converts Markdown to PDF, HTML, or DOCX |
| **GitHub Actions** | Automatically builds your paper into a PDF on push |

---

## 2. Setting up Mendeley for Reference Management

1. Open **Mendeley Reference Manager** (or the older Mendeley Desktop).
2. Add your references and papers as usual.
3. Go to **Settings → BibTeX** and enable **"BibTeX file synchronization."**
4. Choose **“Create one BibTeX file for all documents.”**
5. Set the output location to your project folder, for example:
   ```
   /path/to/your-repo/references.bib
   ```

Mendeley will now automatically keep `references.bib` up to date whenever you add or edit references.

Commit this file to your repository (e.g., `git add references.bib`).

---

## 3. Writing Your Paper in Markdown or Quarto

Create a file named `paper.qmd` (Quarto) or `paper.md` (Markdown):

```markdown
---
title: "Example Scientific Paper"
author: "Your Name"
bibliography: references.bib
format: pdf
---

## Abstract

This paper explores an approach for using Markdown and Mendeley to create reproducible, reference-driven research documents.

## Introduction

The use of Markdown for scientific communication has grown rapidly [@doe2023; @smith2022].

## Methods

Following the work of Jones et al. [@jones2021], we employed a Quarto rendering workflow.

## Results

Our pipeline produced an automatically formatted reference list.

## References
```

Use citation keys from your Mendeley `.bib` file inside square brackets with an `@` prefix (e.g. `[@doe2023]`).

---

## 4. Rendering the Paper Locally

### Option A: Using **Quarto** (recommended)
Install Quarto from [https://quarto.org](https://quarto.org).

Render your document to PDF:
```bash
quarto render paper.qmd
```

To produce HTML instead:
```bash
quarto render paper.qmd --to html
```

### Option B: Using **Pandoc**
If you prefer raw Markdown and Pandoc:
```bash
pandoc paper.md --citeproc --bibliography=references.bib -o paper.pdf
```

---

## 5. Automating Builds with GitHub Actions

You can have GitHub automatically generate your paper every time you push changes.

Create a file named `.github/workflows/build-paper.yml` with the following content:

```yaml
name: Build Paper

on:
  push:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3

      - name: Install Quarto
        uses: quarto-dev/quarto-actions/setup@v2

      - name: Render Paper
        run: quarto render paper.qmd --to pdf

      - name: Upload PDF Artifact
        uses: actions/upload-artifact@v4
        with:
          name: paper-pdf
          path: paper.pdf
```

Every push to the `main` branch will:
1. Render your `paper.qmd` file into `paper.pdf`
2. Upload the finished PDF as a downloadable artifact under the **Actions** tab

---

## 6. Repository Structure

```
.
├── paper.qmd              # Your main document
├── references.bib         # Exported automatically by Mendeley
├── images/                # Figures and diagrams (optional)
├── .github/
│   └── workflows/
│       └── build-paper.yml
└── INSTRUCTIONS.md        # This instruction file
```

---

## 7. Tips

- Use standard Markdown syntax for figures:
  ```markdown
  ![Caption for the figure](images/figure1.png)
  ```
- To include equations, use LaTeX-style math:
  ```markdown
  $$E = mc^2$$
  ```
- Keep `references.bib` version-controlled so collaborators have the same citation data.
- You can render to multiple formats at once:
  ```bash
  quarto render paper.qmd --to pdf,html,docx
  ```

---

## 8. Troubleshooting

| Problem | Solution |
|----------|-----------|
| PDF rendering fails | Ensure LaTeX is installed (e.g., [TinyTeX](https://yihui.org/tinytex/)) |
| Citations show as `[@key]` | Check that `references.bib` is in the same directory and listed in YAML front matter |
| References missing | Verify the citation key matches what’s in your `.bib` file |
| GitHub Action fails | Confirm file paths and that your paper is named `paper.qmd` |

---

## 9. Next Steps

- Customize the YAML header in your `.qmd` file for author info, date, abstract, etc.
- Use Quarto extensions for advanced layouts, code execution, or Jupyter integration.
- Optional: Publish your rendered HTML output using **GitHub Pages**.

---

### Credits

This workflow combines:
- [Mendeley Reference Manager](https://www.mendeley.com)
- [Pandoc](https://pandoc.org)
- [Quarto](https://quarto.org)
- [GitHub Actions](https://docs.github.com/actions)
