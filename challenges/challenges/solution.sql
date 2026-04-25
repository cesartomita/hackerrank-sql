SET NOCOUNT ON;

WITH CTE_HACKERS_CHALLENGES AS
(
    SELECT
        H.hacker_id,
        H.name,
        COUNT(*) AS challenges_created
    FROM
        Hackers H
        INNER JOIN Challenges C ON C.hacker_id = H.hacker_id
    GROUP BY
        H.hacker_id,
        H.name
),
CTE_MAX_CHALLENGES AS
(
    SELECT
        MAX(challenges_created) AS max_cnt
    FROM
        CTE_HACKERS_CHALLENGES
),
CTE_HACKERS_CHALLENGES_CNT AS
(
    SELECT
        hacker_id,
        name,
        challenges_created,
        COUNT(*) OVER(PARTITION BY challenges_created) AS same_cnt
    FROM
        CTE_HACKERS_CHALLENGES
),
CTE_RESULT AS
(
    SELECT
        hacker_id,
        name,
        challenges_created,
        CASE
            WHEN same_cnt > 1 AND challenges_created < (SELECT max_cnt FROM CTE_MAX_CHALLENGES) THEN 1
            ELSE 0
            END excluded 
    FROM
        CTE_HACKERS_CHALLENGES_CNT
)
SELECT
    hacker_id,
    name,
    challenges_created
FROM
    CTE_RESULT
WHERE
    excluded = 0
ORDER BY
    challenges_created DESC,
    hacker_id;

go