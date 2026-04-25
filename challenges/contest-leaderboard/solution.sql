SET NOCOUNT ON;

WITH CTE_HACKER_SUBMISSIONS_MAX_SCORE AS
(
    SELECT
        H.hacker_id,
        H.name,
        MAX(S.score) AS max_score
    FROM
        Hackers H
        INNER JOIN Submissions S ON S.hacker_id = H.hacker_id
    GROUP BY
        H.hacker_id,
        H.name,
        S.challenge_id
)
SELECT
    hacker_id,
    name,
    SUM(max_score) AS total_score
FROM
    CTE_HACKER_SUBMISSIONS_MAX_SCORE
GROUP BY
    hacker_id,
    name
HAVING
    SUM(max_score) > 0
ORDER BY
    total_score DESC,
    hacker_id;
    
go