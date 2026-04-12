SET NOCOUNT ON;

WITH CTE_EMPLOYEE AS
(
    SELECT
        employee_id,
        salary * months AS earnings
    FROM
        Employee
)
SELECT
    earnings,
    COUNT(*) AS cnt
FROM
    CTE_EMPLOYEE
WHERE
    earnings = (SELECT MAX(earnings) FROM CTE_EMPLOYEE)
GROUP BY
    earnings;

go