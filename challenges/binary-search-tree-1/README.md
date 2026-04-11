# Binary Search Tree 1

You are given a table, **BST**, containing two columns: **N** and **P**, where **N** represents the value of a node in Binary Tree, and **P** is the parent of **N**.

![1775926590597](image/README/1775926590597.png)

Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:

`Root`: If node is root node.

`Leaf`: If node is leaf node.

`Inner`: If node is neither root nor leaf node.

Sample Input

![1775926601075](image/README/1775926601075.png)

Sample Output

```text
1 Leaf
2 Inner
3 Leaf
5 Root
6 Leaf
8 Inner
9 Leaf
```

Explanation

The Binary Tree below illustrates the sample:

![1775926619223](image/README/1775926619223.png)