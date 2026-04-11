SET NOCOUNT ON;

SELECT
    C.company_code,
    C.founder,
    COUNT(DISTINCT LM.lead_manager_code) AS CNT_lead_manager_code,
    COUNT(DISTINCT SM.senior_manager_code ) AS CNT_senior_manager_code,
    COUNT(DISTINCT M.manager_code) AS CNT_manager_code,
    COUNT(DISTINCT E.employee_code) AS CNT_employee_code
FROM
    Company C
    INNER JOIN Lead_Manager LM ON LM.company_code = C.company_code
    INNER JOIN Senior_Manager SM ON SM.lead_manager_code = LM.lead_manager_code
    INNER JOIN Manager M ON M.senior_manager_code = SM.senior_manager_code
    INNER JOIN Employee E ON E.manager_code = M.manager_code
GROUP BY
    C.company_code,
    C.founder
ORDER BY
    C.company_code;

go