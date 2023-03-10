-- [02. 상품을 구매한 회원 비율 구하기]

# submitted code - version 1
WITH users AS (
    SELECT USER_ID
    FROM USER_INFO
    WHERE YEAR(JOINED) = '2021'
)
SELECT YEAR(s.SALES_DATE) AS YEAR
     , MONTH(s.SALES_DATE) AS MONTH
     , COUNT(DISTINCT u.USER_ID) AS PUCHASED_USERS
     , ROUND(COUNT(DISTINCT u.USER_ID) / (SELECT COUNT(DISTINCT USER_ID) FROM users), 1) AS PUCHASED_RATIO
FROM users u
LEFT JOIN ONLINE_SALE s ON u.USER_ID = s.USER_ID
WHERE s.SALES_DATE IS NOT NULL
GROUP BY 1, 2
ORDER BY 1, 2;

# submitted code - version 2
WITH users AS (
    SELECT USER_ID
    FROM USER_INFO
    WHERE YEAR(JOINED) = '2021'
)
SELECT YEAR(s.SALES_DATE) AS YEAR
     , MONTH(s.SALES_DATE) AS MONTH
     , COUNT(DISTINCT u.USER_ID) AS PUCHASED_USERS
     , ROUND(COUNT(DISTINCT u.USER_ID) / (SELECT COUNT(DISTINCT USER_ID) FROM users), 1) AS PUCHASED_RATIO
FROM users u
INNER JOIN ONLINE_SALE s ON u.USER_ID = s.USER_ID
GROUP BY 1, 2
ORDER BY 1, 2;
