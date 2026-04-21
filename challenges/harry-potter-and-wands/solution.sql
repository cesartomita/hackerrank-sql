SET NOCOUNT ON;

WITH CTE_RANK_WANDS AS
(
    SELECT
        W.id,
        WP.age,
        W.coins_needed,
        W.[power],
        RANK() OVER(PARTITION BY WP.age, W.[power] ORDER BY W.coins_needed) AS RANK_COIN
    FROM
        Wands W
        INNER JOIN Wands_Property WP ON WP.code = W.code
    WHERE
        WP.is_evil = 0
)
SELECT
    id,
    age,
    coins_needed,
    [power]
FROM
    CTE_RANK_WANDS
WHERE
    RANK_COIN = 1
ORDER BY
    [power] DESC,
    age DESC;
    
go