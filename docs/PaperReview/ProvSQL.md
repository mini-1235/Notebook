### Features

- Support proper management of provenance attached to SQL queries, in the form of a provenance circuit, suitable both for regular Boolean provenance, arbitary provenance, also supports aggregation and grouping.

The following SQL features are currently supported.

- Regular SELECT-FROM-WHERE queries (aka conjunctive queries with multiset semantics)
- JOIN queries (regular joins only; outer, semijoins, and antijoins are not currently supported)
- SELECT queries with nested SELECT subqueries in the FROM clause
- GROUP BY queries
- SELECT DISTINCT queries (i.e., set semantics)
- UNION's or UNION ALL's of SELECT queries
- EXCEPT of SELECT queries
- aggregation on the final query
