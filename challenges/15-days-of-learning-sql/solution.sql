SET NOCOUNT ON;

WITH CTE_SUBMISSION AS
(
    SELECT
        submission_date,
        hacker_id,
        COUNT(*) AS cnt_submission_day,
        ROW_NUMBER() OVER(PARTITION BY submission_date ORDER BY hacker_id) rnk_hacker
    FROM
        Submissions S
    GROUP BY
        submission_date,
        hacker_id
),
CTE_ACCUMULATED AS
(
    SELECT
        submission_date,
        hacker_id,
        cnt_submission_day,
        COUNT(*) OVER(PARTITION BY hacker_id ORDER BY submission_date) AS cnt_submission_accumulated
    FROM
        CTE_SUBMISSION
),
CTE_HACKER AS
(
    SELECT
        submission_date,
        COUNT(*) AS total_hackers
    FROM
        CTE_ACCUMULATED
    WHERE
        cnt_submission_accumulated = DATEDIFF(DAY, '2016-03-01', submission_date) + 1
    GROUP BY
        submission_date
),
CTE_FINAL AS
(
    SELECT
        H.submission_date,
        H.total_hackers,
        S.hacker_id,
        ROW_NUMBER() OVER(PARTITION BY H.submission_date ORDER BY S.cnt_submission_day DESC, S.rnk_hacker) AS rn,
        HA.name
    FROM
        CTE_HACKER H
        INNER JOIN CTE_SUBMISSION S ON S.submission_date = H.submission_date
        INNER JOIN Hackers HA ON HA.hacker_id = S.hacker_id
)
SELECT
    submission_date,
    total_hackers,
    hacker_id,
    name
FROM    
    CTE_FINAL
WHERE
    rn = 1;
    
go