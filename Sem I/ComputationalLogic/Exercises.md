[[ComputationalLogic]]
ex. 8 - anti-models with CNF
$$(\neg p \lor q) \land (\neg r \land \neg p) \land (\neg r \land \neg q)$$
- the formula above is in CNF. in order to find an anti-model, all clauses must be false
Clause 1: $(\neg p \lor q)$ : F $\Rightarrow i_{1,2}$: p = T, q = F, r = T/F
Clause 2: $(\neg r \land \neg p)$: F $\Rightarrow$ $i_{3,4}$: p = T, q = T/F, r = T
Clause 3: $(\neg r \land \neg q)$: $\Rightarrow$ $i_{5,6}$: p = T/F, q = T, r = T 
- now, we pick the anti-models, removing any duplicate: $i_1,i_2,i_3,i_6$
ex. 9:
using definition of deduction, prove the following:
$$r \lor (q \rightarrow p), r \land q, \neg r \vdash p$$
$$f_1: r \lor (q \rightarrow p) \equiv \neg r \rightarrow (q \rightarrow p)$$
$$f_2: r \lor q \equiv \neg r \rightarrow q \equiv \neg q \rightarrow r$$
$$f_3: \neg r$$
$$f1, f3 \vdash_{mp} q \rightarrow p$$ $$f_2, f_3 \vdash_{mp} q = f_5$$
ex 12. 
$$H_1 = \neg \text{sunny} \land \text{colder}$$
$$H_2 = \text{swim}\rightarrow \text{canoe}$$
$$H_3 = \neg \text{swim} \rightarrow \text{canoe}$$
$$H_4 = \text{canoe} \rightarrow \text{home}$$
$$\text{C = home}$$
Predicate logic 
2. Transform the following statements from natural language into predicate formulas, choosing the appropriate function symbols and predicate symbols 
Anyone who loves some candy is not a nutrition fanatic 
c:FD $\rightarrow${T,F} c(x) = T if x is candy (FD = food)
nf:P->{T,F}, nf(x) = T if x is a nutrition fanatic (P = people)
l:PxFD->{T,F}, l(x,y) = T if x loves y 
$(\forall x)(\exists y)(c(y)\land l(x,y)\rightarrow \neg nf(x)$

14. Wolves do not like to eat foxes or grains 
w:A --> {T, F}, w(x) = T if x is a wolf  (A = animals)
f:A --> {T, F}, f(x) = T if x is a fox 
g:P --> {T,F}, g(x) = T if x is a grain (P = plants)
l:Ax(A$\cup$P) --> {T,F}, l(x,y) = T if x loves to eat y 
$(\forall x),w(x) \land ((\forall y)(f(y)\lor g(y)) \rightarrow \neg l(x,y)$

3 Check whether the conclusion C is derivable from the set of hypotheses using the definition of deduction and the appropriate inference rules 
![[Screenshot 2024-11-11 at 15.35.53.png]]

definitions:
K(x) = T if x is king 
os(x,y) = T if y is x's oldest son
C(x) = T if x can become king 
D(x, y) = T if x defeats y 

translations: 
H1: $\forall x, \forall y (K(x)\land os(y,x))\rightarrow C(y)$
H2: $\forall x, \forall y, K(x) \land D(x,y) \rightarrow K(y)$
H3: K(R3)
H4: D(R3,H7)
H5: $os(H7,H8)$
C: C(H8)

$H_2 \vdash_{univ. inst, x \leftarrow R3} (\forall y)(K(R3)\land D(y,R3)\rightarrow K(y)) = H6$
$H6 \vdash_{univ. inst, y \leftarrow H7}(K(R3)\land D(H7,R3)\rightarrow K(H7)) = H7$
$H3,H4 \vdash_{conjunction} K(R3) \land D(H7,R3) = H8$
$H7,H8 \vdash_{mp} K(H7) = H10$
$H1 \vdash_{univ.inst,x\leftarrow H7} \forall y (K(H7)\land os(y,H7))\rightarrow C(y) = H9$
$H9 \vdash_{univ.inst, y \leftarrow H8}K(H7)\land os(H8,H7))\rightarrow C(H8) = H11$
$H10,H5 \vdash_{conj} K(H7) \land os(H7,H8) = H12$
$H11,H12 \vdash_{mp} C(H8)$


ex. 4 - using the given interpretation, evaluate the formula
$U = (\exists x)A(x) \land (\exists x)B(x) \rightarrow (\forall x)(A(x) \land B(x))$
$I = <D,m>$
$D =$ the set of all people from Romania 
$m(A):D\rightarrow${T,F}, $m(A)(x) :$ "x has a car"
$m(B):D\rightarrow${T,F}, $m(B)(x):$ "x has a driver license"

$v^I(U)=v^I((\exists x)A(x) \land (\exists x)B(x) \rightarrow (\forall x)(A(x) \land B(x))) =$ 
$= v^I((\exists x)A(x) \land (\exists x)B(x)) \rightarrow v_I((\forall x)(A(x) \land B(x)))$
$= v^I((\exists x)A(x)) \land v^I((\exists x)B(x)) \rightarrow v_I((\forall x)(A(x) \land B(x)))$
$= (\exists x)_{x\in D}$ (x has a car)$\land (\exists x)_{x \in D}$(x has a driver's license) $\rightarrow (\forall x)_{x\in D}$(x both owns a car and has a driver's license) = $T \land T \rightarrow F = T \rightarrow F = F$


ex. 6- find an antimodel 
$U = (\exists x)P(x) \land (\exists x)Q(x) \rightarrow (\forall x)(P(x)\land Q(x))$
$I = <D,m>$, where $D = \{4,6\},m(P)(x)=x \vdots 2, m(Q)(x) - x \vdots 3$,
$v^I(U) = v^I((\exists x)P(x)) \land v^I((\exists x)Q(x)) \rightarrow v^I((\forall x)P(x)\land Q(x))$
$= (4 \vdots 2 \lor 6 \vdots 2) \land (4 \vdots 3 \lor 6 \vdots 3) \rightarrow (4 \vdots 2 \land 4 \vdots 3)\land(6\vdots 2 \land 6 \vdots 3) =$
$= (T \lor T) \land (F \lor T) \rightarrow (T \land F) \land (T \land T) = T \land T \rightarrow F \land T = T \rightarrow F = F$   

Semantic Tableaux 
1. Using the ST method decide what kind of formula U7 is. If U7 is consistent, find all its models 
![[ex1SemanticTable]]
$$DNF(U7) = (\neg p \land q \land r) \lor (q \lor \neg p) \lor (q \lor r) =_{absorbtion} (q \land \neg p) \lor (q \land r)$$
now, we need both parantheses to be true, find all models etc 


ex 2 - from gallery 

ex 3: Decide whether the logical consequence holds 
$$p \land (q \rightarrow r), q \lor r \vDash p \rightarrow (q \rightarrow r)$$
![[ex3]]
all brances of the tableaux are closed => the logical consequence holds


4. find all the antimodels 
![[ex4]]
$$DNF(\neg U7) : (\neg q \land \neg p) \lor (\neg p \land p) \lor (\neg q \land \neg q) \lor (p \land \neg q) \lor (\neg q \land \neg r) \lor (p \land \neg r) = \neg q \lor (p \land \neg r)$$ 
H1: All hummingbirds are richly colored 
H2: No large birds live on honey 
H3: birds that do not live on honey are dull in color
C: All hummingbirds are small 

$B$ - set of all birds 
$hb:B\rightarrow \{T,F\}, hb(x) = T$ if $x$ is a hummingbird, else $F$ 
$sb:B\rightarrow \{T,F\}, sb(x) = T$ if $x$ is a small bird, else $F$ 
$lh:B\rightarrow \{T,F\}, lh(x) = T$ if $x$ lives on honey, else $F$ 
$rc: C \rightarrow \{T,F\}, rc(x) = T$ if $x$ is rich in color, else $F$ 

$H1: (\forall x)hb(x) \rightarrow rc(x)$
$H2: \neg (\exists x)(\neg sb(x)\land (lh(x))) \equiv (\forall x)(\neg sb(x)\rightarrow \neg lh(x))$
$H3:(\forall x)\neg lh(x) \rightarrow \neg rc(x)$
$C: (\forall x)hb(x)\rightarrow sb(x)$
![[Exercises 2024-11-25 14.18.58.excalidraw]]

6. Using the semantic tableaux method, prove the following properties in predicate logic:
 $\forall$ is distributive over $\land$
$\vDash (\forall x)(A(x)\land B(x))\leftrightarrow(\forall x)A(x)\land(\forall x)B(x)$
>[!tip] remember that you have to do both implications, but the table below only treats the left to right implication

![[Exercises 2024-11-25 15.02.54.excalidraw]]

7. Using general resolution prove that $U_7$ is a theorem
$U = (A \rightarrow B) \rightarrow ((\neg A \rightarrow C) \rightarrow (\neg B \rightarrow C))$
$U$ is a theorem $\iff$ $CNF(\neg U) \vdash_{res} \Box$ (empty clause)
$$\neg U = \neg ((A \rightarrow B) \rightarrow ((\neg A \rightarrow C) \rightarrow (\neg B \rightarrow C))) \equiv$$
$$\neg(\neg(A\rightarrow B)\lor((\neg A \rightarrow C) \rightarrow (\neg B \rightarrow C)))$$
$$\equiv \neg(\neg(A\rightarrow B)\lor(\neg(\neg A \rightarrow C) \lor (\neg B \rightarrow C)))$$
$$\equiv \neg(\neg(\neg A\lor B)\lor(\neg(A \lor C) \lor ( B \lor C)))$$
$$\equiv \neg(\neg(\neg A\lor B)\lor(\neg(A \lor C) \lor ( B \lor C)))$$
$$\equiv^{deMorgan} \neg( A\land \neg B)\lor(\neg (A \lor C) \lor ( B \lor C)))$$
$$\equiv^{deMorgan} (\neg A\lor B)\lor(\neg (A \lor C) \lor ( B \lor C)))$$