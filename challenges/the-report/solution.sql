SET NOCOUNT ON;

SELECT
    IIF(G.Grade < 8, NULL, S.Name),
    G.Grade,
    S.Marks
FROM
    Students S
    INNER JOIN Grades G ON S.Marks BETWEEN G.Min_Mark AND G.Max_Mark
ORDER BY   
    G.Grade DESC,
    CASE 
        WHEN G.Grade >= 8 THEN S.Name
    END,
    CASE 
        WHEN G.Grade < 8 THEN S.Marks
    END;
    
go