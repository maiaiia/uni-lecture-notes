# The Euclidean Space $R^n$
___
Class: [[ MathematicalAnalysis]]
Type: Lecture
Tags: # 
Date: November 22nd 2024
Teacher: [[]]
___
## Definitions
### Scalar Product 
A map $\langle \cdot , \cdot \rangle : \mathbb{R}^n \rightarrow \mathbb{R}$ is called a *scalar product* if 
- $\langle x , y \rangle = \langle y , x \rangle,\forall x,y \in \mathbb{R}^n$
- $\langle \alpha x + \beta y, z \rangle = \alpha \langle x , z \rangle + \beta \langle y , z \rangle$
- $\langle x , x \rangle > 0, \forall x \in \mathbb{R}^n \setminus \{0\}$
#### Example - The Dot Product
$x \cdot y = x^Ty=(x_1,...,x_n)_{1\times n} \begin{pmatrix}y_1\\y_2\\\vdots\\y_n \end{pmatrix} = x_1y_1+...+x_ny_n$
### Norm
A function $\|\cdot\|:\mathbb{R}^n\rightarrow[0,\infty)$ is called a *norm* if 
- $\|x\|=0 \iff x = 0$
- $\|\alpha x\| = |\alpha|\cdot\|x\|, \forall x\in \mathbb{R}^n, x \in \mathbb{R}$
- $\|x+y\| \leq \|x\|+\|y\|, \forall x,y \in \mathbb{R}^n$ (*triangle inequality*)

#### Examples 
 Any scalar product generates a norm on $\mathbb{R}^n$, given by $\|x\|=\sqrt{\langle x, x \rangle}$
  - Euclidean norm: $\sqrt{x_1^2+x_2^2+...+x_n^2}$ ,  represents the *length* of the vector $x$ measured in the *Euclidean norm*
 - Manhattan norm: $\|x\|_1:=|x_1|+...+|x_n|$
 - $\|x\|_\infty := max\{|x_1|,...,|x_n|\}$ 
 - $\|x\|_p:=(|x_1|^p+|x_2|^p+...+|x_n|^p)^{\frac{1}{p}}, p>1$

### Distance
A function $d:\mathbb{R}^n\times\mathbb{R}^n \rightarrow [0,\infty)$ is called a *distance* if 
- $d(x,y) = 0 \iff x=y$
- $d(x,y)=d(y,x),\forall x,y\in \mathbb{R}^n$
- $d(x,z)\leq d(x,y)+d(y,z),\forall x,y,z \in \mathbb{R}^n$(*triangle inequality*)
#### Example - the Euclidean Distance
Any norm generates a distance given by $d(x,y)=||x-y||$
- Euclidean distance: $d(x,y)=\sqrt{(x_1-y_1)^2+(x_2-y_2)^2+...+(x_n-y_n)^2}$
## Theorems
- **Cauchy-Schwarz inequality**: $| \langle x, y \rangle| \leq ||x||\cdot||y||$
	- *Proof*: Let $f : \mathbb{R} \rightarrow \mathbb{R}, f(t) = \langle tx+y,tx+y\rangle=||tx+y||^2\geq0$. Since $f(t)=t^2||x||^2+2t\langle x,y\rangle+||y||^2, \Delta=4\langle x,y\rangle^2-4||x||^2||y||^2 \leq 0$ 

## Applications
### Orthogonal projection
The orthogonal projection of a vector $v \in \mathbb{R}^n$ on a vector $a \in \mathbb{R}^n$ is $$p=\cfrac{a}{\|a\|} \cdot \cfrac{\langle v, a \rangle}{\|a\|}=a\cdot\cfrac{\langle v,a \rangle}{\langle a, a \rangle}$$ where $\cfrac{a}{\|a\|}$ is the unit vector and $\|o\|=\cfrac{\langle v, a \rangle}{\|a\|}$ 
![[The Euclidean Space Rn 2025-01-19 12.13.44.excalidraw]]
### The angle between two vectors 
The angle $\theta$ between the vectors $u$ and $v$ is $\cos \theta = \cfrac{\langle u, v \rangle}{\|u\|\|v\|}$. (this can be derived from the cosine rule)