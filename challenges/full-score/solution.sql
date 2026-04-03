SET NOCOUNT ON;

SELECT
    H.hacker_id,
    H.name
FROM
    Submissions S
    INNER JOIN Hackers H ON H.hacker_id = S.hacker_id
    INNER JOIN Challenges C ON C.challenge_id = S.challenge_id
    INNER JOIN Difficulty D ON D.difficulty_level = C.difficulty_level
WHERE
    S.score = D.score
GROUP BY
    H.hacker_id,
    H.name
HAVING
    COUNT(DISTINCT S.challenge_id) > 1
ORDER BY
    COUNT(DISTINCT S.challenge_id) DESC,
    H.hacker_id ASC;
    
go