-- [28. 자동차들의 월별 대여 횟수 구하기]

# submitted code
SELECT MONTH
     , CAR_ID
     , RECORDS
FROM (SELECT MONTH(START_DATE) AS MONTH
     , CAR_ID
     , COUNT(CAR_ID) OVER (PARTITION BY CAR_ID) AS TOTAL_CNT
     , COUNT(CAR_ID) OVER (PARTITION BY MONTH(START_DATE), CAR_ID) AS RECORDS
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
WHERE START_DATE >= '2022-08-01' 
  AND START_DATE < '2022-11-01') t
WHERE TOTAL_CNT >= 5
GROUP BY 1, 2
ORDER BY 1, 2 DESC;
