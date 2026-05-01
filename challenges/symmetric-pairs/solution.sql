SET NOCOUNT ON;

SELECT DISTINCT
    F1.X,
    F1.Y
FROM
    Functions F1
    INNER JOIN Functions F2 ON F1.X = F2.Y AND F1.Y = F2.X
WHERE
    F1.X < F1.Y
UNION ALL
SELECT
    F1.X,
    F1.Y
FROM
    Functions F1
    INNER JOIN Functions F2 ON F1.X = F2.Y AND F1.Y = F2.X
WHERE
    F1.X = F1.Y
GROUP BY
    F1.X,
    F1.Y
HAVING
    COUNT(*) > 1
ORDER BY
    F1.X;
    
go