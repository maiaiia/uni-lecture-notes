# The Complex Exponential
___
Class: [[DynamicalSystems]]
Type: Lecture
Tags: # 
Date: March 10th, 2025
___

Let $z \in \mathbb{C}$. Then, $e^z = 1+z+\cfrac{1}{2!}z^2+...+\cfrac{1}{k!}z^k+...=\sum _{k=0}^{\infty}\cfrac{1}{k!}z^k$
We know this is true $\forall z \in \mathbb{R}$
It is known that this series is convergent $\forall z \in \mathbb{C}$
It is also known that $e^{z_1+z_2}=e^{z_1}\cdot e^{z_2}$.
Let $y \in \mathbb{R} \Rightarrow e^{iy} = ?$
>[!Recall]
>$\cos y = 1 - \cfrac{y^2}{2!}+\cfrac{y^4}{4!}-\cfrac{y^6}{6!}+...$
>$\sin y = y - \cfrac{y^3}{3!}+\cfrac{y^5}{5!}-\cfrac{y^7}{7!}+...$

$\Rightarrow e^{iy}=1+iy+\cfrac{1}{2!}(iy)^2+\cfrac{1}{3!}(iy)^3+\cfrac{1}{4!}(iy)^4+\cfrac{1}{5!}(iy)^5+...=$
$=1+iy-\cfrac{1}{2!}y^2-i\cfrac{1}{3!}y^3+\cfrac{1}{4!}y^4+i\cfrac{1}{5!}y^5+...$ =$= (1 - \cfrac{y^2}{2!}+\cfrac{y^4}{4!}-\cfrac{y^6}{6!}+...)+i(y - \cfrac{y^3}{3!}+\cfrac{y^5}{5!}-\cfrac{y^7}{7!}+...)\Rightarrow$ 

>[!definition]
$$e^{x+iy}=e^x\cos y+ie^x\sin y$$ $$ e^{x+iy} = e^x (\cos y + i \sin y)$$

for $y = \pi \Rightarrow$ $$e^{i\pi}+1=0$$
For $z = x+iy \in \mathbb{C}$ we define $e^z=\sum_{k=0}^\infty \cfrac{1}{k!}$.
We know: $z = x \in \mathbb{R}, \sum_{k=0}^\infty \cfrac{1}{k!}x^k=e^x$ is absolutely convergent 
$z=x+iy\in\mathbb{C}\mapsto (x,y)\in \mathbb{R}^2$
$|z|=\sqrt{x^2+y^2} \rightarrow$ the euclidian norm of $(x,y)\in\mathbb{R}^2$.
The series $\sum_{k=0}^\infty \cfrac{1}{k!}z^k$ is convergent $\iff$ $\sum_{k=0}^\infty \Big{|}\cfrac{1}{k!}z^k\Big{|}$ is convergent
$\Big{|}\cfrac{1}{k!}z^k\Big{|}=\cfrac{1}{k!}\Big{|}z^k\Big{|}=\cfrac{1}{k!}|z|^k, \sum_{k=0}^\infty \cfrac{1}{k!}|z|^k=e^{|z|}$. 
Conclusion: $\sum_{k=0}^\infty \cfrac{1}{k!}z^k$ is absolutely convergent.

Recall in Lecture3 we justified Euler's formula $$e^{x+iy}=e^x\cos y+ie^x \sin y; x,y \in \mathbb{R}$$
Let $f:\mathbb{R}\rightarrow \mathbb{C}$ and $r=\alpha + ibeta \in \mathbb{C}$ with $\alpha, \beta \in \mathbb{R}, \beta > 0, f(t)=e^{rt}, \forall t \in \mathbb{R}$.
>[!proposition]
>Let $f:\mathbb{R}\rightarrow \mathbb{C}$ and $r=\alpha + i\beta \in \mathbb{C}$ with $\alpha, \beta \in \mathbb{R}, \beta > 0, f(t)=e^{rt}, \forall t \in \mathbb{R}$.
>Then $f'(t)=re^{rt}, \forall t \in \mathbb{R}$

We first prove that $f'(0)=r$.
$f'(0)=\lim_{h\rightarrow 0} \cfrac{f(h)-f(0)}{h-0}=\lim_{h\rightarrow 0} \cfrac{e^{rh}-1}{h}=r$
Let $t \in \mathbb{R}$
$f'(t)=\lim_{h\rightarrow 0}\cfrac{f(t+h)-f(t)}{h}=\lim_{h\rightarrow 0}\cfrac{e^{r(t+h)}-e^{rt}}{h}=\lim_{h\rightarrow 0}\cfrac{e^rh-1}{h}=re^rt$

