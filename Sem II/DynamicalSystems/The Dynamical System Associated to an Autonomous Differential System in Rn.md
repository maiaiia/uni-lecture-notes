# The Dynamical System Associated to an Autonomous Differential System in Rn
___
Class: [[DynamicalSystems]]
Type: 
Tags: # 
Date: June 7th, 2025
___

General: $x' = f(x)$, where $f : \mathbb{R}^n \rightarrow \mathbb{R}^n$ is a $C^1$ function. 
- $f$ is said to be *autonomous*, because it lacks $f$

In this case, we can change the notation for the derivative with respect to time: $x' \mapsto \dot x$ 

So $(1): \dot x = f(x) \rightarrow$ law of *motion* / *change* of some physical system. This system is described by a function of time that has values in $\mathbb{R}^n$. So a state of the system is also from $\mathbb{R}^n$ (i.e. $\mathbb{R}^n$ is the state space)

The motion is fully determined by the initial state. 
We consider the IVP: $\begin{cases}\dot x = f(x) \\ x(0)=\eta, \eta \in \mathbb{R}^n \end{cases}$

>[!Theorem]