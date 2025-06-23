# Unified Modeling Language
___
Class: [[OOP]]
___
## UML Class Members and Methods
| Symbol   | Meaning          |
| -------- | ---------------- |
| -        | private member   |
| +        | public member    |
| \#       | protected member |
| *italic* | virtual method   |

## UML Class Relationships
![[UML_relationships]]
### 1. Association / Directed Association
- "A and B know each other": A $-$ B 
- When instances of one class are connected to instances of another class
- In directed association, the arrow points from the class that *initiates* the association to the class that is being targeted (example: a teacher teaches a specific course: teacher $\rightarrow$ course)
### 2. Aggregation
- "A has B": A $\leftarrow$ B
- A type of association that represents a *whole part* relationship
- The *source class can exist independently* of the target class
- Instances of the source class are attributes of the parent
### 3. Composition
- "B belongs to A": A $\leftarrow$ B
- Similar to aggregation, but now *the source cannot exist independently* of the target class
- The target class controls the entire "lifespan" of the source
### 4. Usage / Dependency
- "A uses B": A $\rightarrow$ B
- when members of a source class are passed as arguments by methods of the target class
### 5. Inheritance
- "A is B": A $\rightarrow$ B 

