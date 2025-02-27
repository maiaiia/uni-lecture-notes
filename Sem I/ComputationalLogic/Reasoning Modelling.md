# Reasoning Modeling
___
Class: [[ComputationalLogic]]
Type: 
Tags: # 
Date: October 24th 2024
___

Notes: 
## Example 
Build a deduction of the conclusion (C) from the hypotheses H1, H2, H3, H4 
H1: If it is rainy Kate goes to the library or she goes shopping
H2: Kate goes shopping only with her friend Carla 
H3: John goes to the library daily 
H4: It is rainy today, Carla is sick and she will not go shopping 
C: Kate will meet John at the library today 

R - raining 
Kl - Kate library 
Ks - Kate shopping 
Cs - Carla shopping 
Csick - Carla sick 
Jl - John library 

Translation:
H1: R $\rightarrow$ Kl $\oplus$ Ks 
H2: Ks $\rightarrow$ Cs 
H3: Jl 
H4: R$\land$Csick $\land$$\neg$Cs 

H4 $\vdash_{simp}$ R (f5)
H4 $\vdash_{simp}$ Csick  (f6)
f6, H2 $\vdash_{mt}$ $\neg$ Ks (f7)
H1, f5 $\vdash_{mp}$ Kl $\oplus$ Ks (f8)
f8 $\vdash_{simpl}$ Kl$\lor$ks