 # Deduction Rules 
___
Class: [[ComputationalLogic]]
Type: 
Tags: # 
Date: October 24th 2024
Teacher: [[]]
___

Notes:
## Modus Ponens
$U, U \rightarrow V \vdash V$ 
- example:
H1: If it is rainy, then the pool will be closed 
H2: It is rainy
C: The pool is closed
## Modus Tollens
$\neg V, U\rightarrow V \vdash \neg U$
- example:
H1: If it snows today, the school will close
H2: The school is not closed today
C: It did not snow today
## Resolution 
$C_1 = U \lor Z$
$C_2 = \neg U \lor V$ 
$C_3 = Res_Z(C_1,C_2)=U\lor V$
- example:
H1: Today i will go swimming or eat an ice cream
H2: I do not go swimming today
C: I am eating an ice cream today

## Syllogism 
$U \rightarrow V, V \rightarrow Z \vdash U \rightarrow Z$
- example:
H1: If I go swimming, then I will stay in the sun for too long 
H2: If I stay in the sun for too long, then I will sunburn
C: If I go swimming, then I will sunburn

