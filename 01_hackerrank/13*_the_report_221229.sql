-- [13. The Report]

# submitted code
SELECT CASE WHEN g.Grade < 8 THEN NULL ELSE s.Name END
     , g.Grade
     , s.Marks
FROM Students s
INNER JOIN Grades g on s.Marks BETWEEN g.Min_Mark AND g.Max_Mark
ORDER BY g.Grade DESC, s.Name, s.Marks;