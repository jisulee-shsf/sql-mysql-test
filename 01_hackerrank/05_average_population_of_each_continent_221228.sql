-- [05. Average Population of Each Continent]

# submitted code
SELECT C2.CONTINENT
     , FLOOR(AVG(C1.POPULATION))
FROM CITY c1
INNER JOIN COUNTRY c2 ON c1.COUNTRYCODE = c2.CODE
GROUP BY CONTINENT;