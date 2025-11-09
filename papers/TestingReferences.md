---
title: "Testing Quarto References"
author: "Team Test"
bibliography: bibliography.bib
format: pdf
---

# Abstract

A very short test document to verify Quarto/Pandoc citation processing using a `bibliography.bib` file located in the same folder.

# Introduction

This is a minimal test of citations. An inline citation example: according to recent work [@Zhao2020], the method performs well. Multiple citations can be included together [@Zhao2020; Alqahtani2020].

# Notes

- Ensure `bibliography: bibliography.bib` points to a valid `.bib` file in the same directory as this Markdown file.
- Quarto (or Pandoc with --citeproc) will generate the References list when rendering.

# References

(Quarto will populate this from `bibliography.bib` when rendered.)
