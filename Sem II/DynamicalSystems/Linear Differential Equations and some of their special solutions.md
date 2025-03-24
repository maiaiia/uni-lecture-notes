# LDEs and some of their special solutions
___
Class: [[DynamicalSystems]]
Type: Lecture
Tags: # 
Date: March 24th, 2025
___

## Examples

| IVP                                                                                                                              | Unique Solution |
| -------------------------------------------------------------------------------------------------------------------------------- | --------------- |
| $x' - x = 0, x(0)=1$                                                                                                             | $e^t$           |
| $x''+x=0,x(0)=1,x'(0)=0$                                                                                                         | $\cos t$        |
| $x''+x=0,x(0)=0,x'(0)=1$                                                                                                         | $\sin t$        |
| $x''-x=0,x(0)=1,x'(0)=0$                                                                                                         | $\cosh t$       |
| $x''-x=0,x(0)=0,x'(0)=1$                                                                                                         | $\sinh t$       |
| $x'=\cfrac{2}{\sqrt{\pi}}e^{-t^2},x(0)=0$                                                                                        | $\text{erf}(t)$ |
| $t^2x''+tx'+(t^2-\alpha^2)x=0$, $a_1(t)=\cfrac{1}{t}, a_2(t)=\cfrac{t^2-\alpha^2}{t^2}$, where $t \neq 0$ and $\alpha > 0$ fixed | Bessel Function |

## Cosh and Sinh 
### Definitions 
- $\cosh t = \cfrac{e^t+e^{-t}}{2}$
- $\sinh t = \cfrac{e^t-e^{-t}}{2}$
### Properties
- $\cosh(0)=1$; $\sinh(0)=0$
- $\cosh'(t) = \sinh(t)$; $\sinh'(t) = \cosh'(t)$
- $\cosh^2(t)-\sinh^2(t)=1$ 
- $\cosh (it) = \cos t$;  $\sin h (it) = i\sin t$ $, \forall t \in \mathbb{R}$
- $\cos (it) = \cosh (t)$; $\sin (it) = i \sinh t$ 
- $\cosh (-t) = \cosh (t)$; $\sinh (-t) = - \sinh (t)$

| t           | $\infty$             | 0   | $\infty$            |
| ----------- | -------------------- | --- | ------------------- |
| $\cosh (t)$ | $\infty$ $\searrow$  | 1   | $\nearrow$ $\infty$ |
| $\sinh(t)$  | $-\infty$ $\nearrow$ | 0   | $\nearrow$$\infty$  |
![[Linear Differential Equations and some of their special solutions 2025-03-24 12.28.59.excalidraw]]
#### Proofs
- $\cosh (it) = \cfrac{e^{it}+e^{-it}}{2}=\cfrac{\cos t + i \sin t + \cos (-t)+ i \sin (-t)}{2} = \cos t$ 

## The Gauss error function
### Definition
 $\text{erf}(t)=\cfrac{2}{\sqrt{\pi}}\int_0^t e^{-r^2}dr, t \in \mathbb{R}$  
### Properties 
- $\text{erf}'(t)=\cfrac{2}{\sqrt{\pi}}e^{-{t^2}}$ 
- $\lim_{t\rightarrow \infty}\text{erf}(t)=1$
- $\int_0^{\infty} e^{-s^2}ds=\cfrac{\sqrt{\pi}}{2}$, $\int_{-\infty}^{\infty}e^{-s^2}ds=\sqrt{\pi}$ 
![[Linear Differential Equations and some of their special solutions 2025-03-24 12.37.55.excalidraw]]

## Bessel functions
Bessel functions are solutions of the bessel DE