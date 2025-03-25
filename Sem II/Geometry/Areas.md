# Areas
___
Class: [[Geometry]]
Type: Lecture
Tags: # 
Date: March 25th, 2025
___
## Oriented area
Suppose the vertices $A(x_A, y_A), B(x_B, y_B), C(x_C,y_C), D(x_D, y_D)$ are given with respect to an orthonormal frame. Then, $$\text{Area}(ABCD) = |\begin{vmatrix} x_A && y_A && 1 \\ x_B && y_B && 1 \\ x_D && y_D && 1 \end{vmatrix}| = |\begin{vmatrix} v_x && v_y \\ w_x && w_y \end{vmatrix}|$$, where $\overrightarrow{AB}=(v_x,v_y)$ and $\overrightarrow{AD}=(w_x,w_y)$

>[!Proposition]
>Let $v = \overrightarrow{AB}$ and $w = \overrightarrow{AC}$. Then,
>$$\sin \angle_{or}(v,w)=\cfrac{[v,w]}{[v][w]}=\cfrac{\text{Area}_{or}(ABC)}{|AB|\cdot|AC|}$$
>Where $[v,w]$ is the box product $\begin{vmatrix} v_x && v_y \\ w_x && w_y \end{vmatrix} = \det{M_{\mathcal{B}\mathcal{B}'}}$

## Theorems
**Heron's Theorem**: $\text{Area}(ABC)=\sqrt{p(p-a)(p-b)(p-c)}$
**Chord Theorem**: Let $A, B, A', B'$ be points on a circle. Let $P$ be the intersection point of the two chords $[AP]$ and $[A'B']$. Show that $$[AP]\cdot[BP]=[A'P]\cdot[B'P]$$
![[Areas 2025-03-25 14.21.53.excalidraw]]
$\triangle AOB$ isosceles $\Rightarrow \cos \angle PAO = \cfrac{AP^2+r^2-OP^2}{2AP\cdot r}=\cfrac{BP^2+r^2-OP^2}{2BP\cdot r} = cos \angle PBO \Rightarrow$ $(AP \cdot BP - r^2+OP^2)(AP-BP)=0 \Rightarrow$
If $AP \neq BP \Leftrightarrow P$ not a midpoint of $(AB) \Rightarrow AP \cdot BP + OP^2 = r^2$
If $AP = BP \Rightarrow P$ is a midpoint, then $AP \cdot BP = r^2 - OP^2$ (since $\angle APO$ would be a right angle). Since $r^2 - OP^2$ is independent of $A, B$, the initial claim holds


