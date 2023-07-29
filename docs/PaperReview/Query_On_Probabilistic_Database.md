### Terms

- **Probabilistic Database**: A database that contains uncertain data. Each tuple in the answer is associated with a probability representing our confidence in that tuple belonging to the answer.
- Keys: every deterministic attribute is part of a key
- Head(q): the set of head variables of a query q
- Freevar(q): the set of free variables of a query q
- R.key: the set of free variables in the key position of the relation R
- R.nonkey: the set of free variables in the non-key position of the relation R
- R.Pred: the predicate on the relation R in the query
- For $x\in$ FreeVar(q)$, denote $q_x$ a new query whose body is identical with q and where $Head(q_x)=Head(q)\cup\{x\}$

### Probabilistic Database

- When the sum of the probability is strictly less than one then that product may not occur in the table at all.

- Probability distribution on possible worlds
- When a probabilistic table has only deterministic attributes, like in $R(A, B)$, this means that each tuple occurs in the database with some probability smaller or equal to one.

![DB](https://i.imgur.com/PrgxL68.png)

### Easy queries

- AKA boolean queries, queries that return a boolean value
- Given a query Q and a tuple t, the probability that t is an answer to Q is the sum of the probabilities of all possible worlds where t is an answer to Q.
- Disjoint Project $\pi^{pD}$ if tuples with probabilities p1,...,pn get projected into the same tuple, the probability of the resulting tuple is $p1 + ... + pn$.
  - $P(t\vee t') = P(t) +P(t')$
- Independent Project $\pi^{pI}$ if tuples with probabilities p1,...,pn get projected into the same tuple, the probability of the resulting tuple is $1-(1-p1) * ... * (1-pn)$.
  - $P(t\vee t') = 1-(1-P(t)) * (1-P(t'))$
- The disjoint project and the independent project compute the same set of tuples, but with different probabilities.
- Join $\bowtie^{pD}$: The probability of a tuple t in the result is the product of the probabilities of the tuples in the input relations that contribute to t.
  - $P(t) = P(t_1) * ... * P(t_n)$
- PTIME

### Hard queries

- #P-complete

### Boundary

!!! Algorithm

![Boundary](https://i.imgur.com/HNBUx0T.png)
**this algorithm is sound and complete**

- every query that has a PTIME data complexity can be evaluated using a relational plan

!!! Example

![Example](https://i.imgur.com/QBWUtbs.png)

!!! Theorem
Let q be any conjunctive query on which none of the three cases applied to the above algorithm. Then q is #P-complete, and one of the following holds:

1. There are three relations R,S,T and two free variables $x,y\in FreeVar(q)$ such that R.key contains x but not y, S.key contains both x,y, and T.key contains y but not x. \
   R(x, . . .), S(x, y, . . .), T(y, . . .)\
2. There are two relations R and S and two free variables $x,y\in FreeVar(q)$ such that x occurs in R.key but not in S.key, and y occurs in S.key but not in R.key but occurs in R. \
   R(x,y . . .), S(y, . . .)\
3. There are two relations R and S and three free variables $x,y,z\in FreeVar(q)$ such that x occurs in R.key but not in S.key, z occurs in S.key but not in R.key, and z occurs in both R and S but neither in R.key nor in S.key. \
    R(x, y, . . .), S(y, z, . . .) \
   Furthermore, if a query is hard, then it must have one of $H_1, H_2, H_3$. as a subpattern.

!!! Example
![Example](https://i.imgur.com/VZbKqeS.png)

- However, these three patterns are only necessary condition for the query to be #P-complete, meaning that there are queries that have one or more of the three patterns, but still in PTIME.
