SET NOCOUNT ON;

WITH CTE_VIEWS AS
(
    SELECT
        CON.contest_id,
        CON.hacker_id,
        CON.[name],
        SUM(VS.total_views) AS sum_total_views,
        SUM(VS.total_unique_views) AS sum_total_unique_views
    FROM
        Contests CON
        INNER JOIN Colleges COL ON COL.contest_id = CON.contest_id
        INNER JOIN Challenges CHA ON CHA.college_id = COL.college_id
        INNER JOIN View_Stats VS ON VS.challenge_id = CHA.challenge_id
    GROUP BY
        CON.contest_id,
        CON.hacker_id,
        CON.[name]
),
CTE_SUBMISSIONS AS
(
    SELECT
        CON.contest_id,
        CON.hacker_id,
        CON.[name],
        SUM(SS.total_submissions) AS sum_total_submissions,
        SUM(SS.total_accepted_submissions) AS sum_total_accepted_submissions
    FROM
        Contests CON
        INNER JOIN Colleges COL ON COL.contest_id = CON.contest_id
        INNER JOIN Challenges CHA ON CHA.college_id = COL.college_id
        INNER JOIN Submission_Stats SS ON SS.challenge_id = CHA.challenge_id
    GROUP BY
        CON.contest_id,
        CON.hacker_id,
        CON.[name]
),
CTE_CONSOLIDATED AS (
    SELECT
        COALESCE(V.contest_id, S.contest_id) AS contest_id,
        COALESCE(V.hacker_id, S.hacker_id) AS hacker_id,
        COALESCE(V.[name], S.[name]) AS [name],
        ISNULL(S.sum_total_submissions, 0) AS sum_total_submissions,
        ISNULL(S.sum_total_accepted_submissions, 0) AS sum_total_accepted_submissions,
        ISNULL(V.sum_total_views, 0) AS sum_total_views,
        ISNULL(V.sum_total_unique_views, 0) AS sum_total_unique_views
    FROM
        CTE_VIEWS V
        FULL JOIN CTE_SUBMISSIONS S ON S.contest_id = V.contest_id AND S.hacker_id = V.hacker_id
)
SELECT
    contest_id,
    hacker_id,
    [name],
    sum_total_submissions,
    sum_total_accepted_submissions,
    sum_total_views,
    sum_total_unique_views
FROM
    CTE_CONSOLIDATED
WHERE
    NOT (
        sum_total_submissions = 0
        AND sum_total_accepted_submissions = 0
        AND sum_total_views = 0
        AND sum_total_unique_views = 0
    )
ORDER BY
    contest_id;
    
go