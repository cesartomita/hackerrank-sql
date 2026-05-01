SET NOCOUNT ON;

    WITH CTE_PROJECTS AS
    (
        SELECT
            Task_ID,
            [Start_Date],
            End_Date,
            CASE
                WHEN LAG([Start_Date]) OVER(ORDER BY [Start_Date]) IS NULL THEN 1
                WHEN LAG([Start_Date]) OVER(ORDER BY [Start_Date]) <> DATEADD(DAY, -1, [Start_Date]) THEN 1
                ELSE 0
                END AS Projects
        FROM
            Projects
    ),
    CTE_GROUP_PROJECTS AS
    (
        SELECT
            Task_ID,
            [Start_Date],
            End_Date,
            SUM(Projects) OVER(ORDER BY [Start_Date]) AS Rn_Group
        FROM
            CTE_PROJECTS
    )
    SELECT
        MIN([Start_Date]),
        MAX(End_Date)
    FROM
        CTE_GROUP_PROJECTS
    GROUP BY
        Rn_Group
    ORDER BY
        COUNT(*),
        MIN([Start_Date]);
        
go