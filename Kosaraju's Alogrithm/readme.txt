This is an implementation of Kosaraju's Algorithm for finding Strongly Connected Components in a Directed Acyclic Graph.
It finds the number of components in each SCC and prints out the size of the 10 largest SCCs.
You'll notice that this implementation does not work for arbitrarily large datasets, i.e. test-huge.in,
as it is implemented using recursion and this size of a dataset causes Stack Overflow.

NOTE: Do not try to open test-huge.in, it will probably crash.
