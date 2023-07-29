An incomplete database is a finite set of database instances, where each $W_i$ is one possible world.

### Compact representation of incomplete databases

- enumerate all possible worlds in one single column

### Block Independent Disjoint (BID) representation

- RID: row ID, a unique identifier for each row
- P: probability
- each tuple is contained in an arbitary world with probability P(t)
  **Dependencies?**
- for example, an SSN should not be assigned more than once
- idea: use random variables, in order to model dependencies between tuples

### Probabilistic Conditional Database (PCD)

- the table contains probabilities of the individual random variables
- each assignment of the variables defines one world, and the probability of the world is the product of the probabilities of the individual variables
- TIs and BCDs are special cases of PCDs

### Possible World Semantics

- Given a database $W_1, \dots, W_n$, the probability of a query $Q$ is the sum of the probabilities of the worlds in which $Q$ is true.
- Given a query q and an incomplete database W:
  - An answer t is called certain if it is contained in all possible worlds in W.
  - An answer t is called possible if it is contained in at least one possible world in W.

### Possible tuple semantics

- A tuple is an possible answer to a query if it is contained in at least one possible world in W.

### Possible answer set semantics

- An answer set is a set of possible answers to a query.
- $q^pwd$ is the set of possible answers to a query q in a possible world d.
- $q^rank$ is the set of possible answers to a query q in a database W.
  **If the tuples contained in a database are independent from other, this is called extensional**

### Intensional Query Evaluation

### Complexity of the query evaluation problem

- for a boolean equation with n variables, there are between 0 and $2^n$ solutions
  - some queries can be computed in PTIME, for others this problem is #P-complete

Class #P: Class of counting problems

- NP = Class of decision problems, for example, considering SAT, "does an assignment exist that fulfills the equation"?
- #P = Class of counting problems, for example, considering #SAT, "how many assignments exist that fulfill the equation"?
- A problem from #P is at least as difficult as the corresponding problem from NP

!!! Theorem #SAT is #P-complete

### Extensional Operators

- There can be plans for which the extensional evaluation provides the correct result probabilities, a plan that is delivering the correct probabilities is called safe, queries that can be evaluated safely are called safe queries

![formula](https://i.imgur.com/nsPPWmm.png)

### Row stored databases
