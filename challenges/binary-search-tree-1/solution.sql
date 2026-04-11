SET NOCOUNT ON;

SELECT DISTINCT
    A.N,
    CASE
        WHEN A.P IS NULL THEN 'Root'
        WHEN B.N IS NULL AND B.P IS NULL THEN 'Leaf'
        ELSE 'Inner'
        END AS ND
FROM
    BST A
    LEFT JOIN BST B ON B.P = A.N;
    
go