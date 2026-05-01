SET NOCOUNT ON;

SELECT
    S.[Name]
FROM
    Students S
    INNER JOIN Friends F ON F.ID = S.ID
    INNER JOIN Students SS ON SS.ID = F.Friend_ID
    INNER JOIN Packages P ON P.ID = S.ID
    INNER JOIN Packages PP ON PP.ID = SS.ID
WHERE
    IIF(P.Salary < PP.Salary, 1, 0) = 1
ORDER BY
    PP.Salary;
    
go