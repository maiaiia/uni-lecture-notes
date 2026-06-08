---
Class: "[[AI]]"
date: 2026-06-08
type: CheatSheet
---
# Formulas

## [[Convolutional Neural Networks]]
Mathematical convolution: 
- $s(t) = \int_{-\infty}^\infty x(a)w(t-a)da$, where $s(t)=(x\cdot w)(t)$
- if $t$ is *discrete*, the integral becomes a sum: $s(t)=(x*w)(t)=\sum_{a=-\infty}^\infty x(a)w(t-a)$

Cross-correlation (input $I$, kernel $K$): $S(i,j)=\sum_m\sum_n I(i+m, j+n)K(m,n)$
