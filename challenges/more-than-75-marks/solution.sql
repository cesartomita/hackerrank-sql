SET NOCOUNT ON;

WITH CTE_OCCUPATIONS AS
(
    SELECT
        Name,
        Occupation,
        ROW_NUMBER() OVER(PARTITION BY Occupation ORDER BY Name) AS RN
    FROM
        OCCUPATIONS    
)
SELECT
    PVT.Doctor,
    PVT.Professor,
    PVT.Singer,
    PVT.Actor
FROM
    CTE_OCCUPATIONS
PIVOT (
    MAX(Name) FOR Occupation IN ([Doctor], [Professor], [Singer], [Actor])
) AS PVT;

go