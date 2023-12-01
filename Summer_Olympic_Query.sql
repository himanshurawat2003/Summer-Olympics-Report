WITH MyCte As( 
				SELECT Name As Athelete_Name ,
					   CASE WHEN Sex = 'M' THEN 'Male'
							WHEN Sex = 'F' THEN 'Female'
					   ELSE NULL End As Gender ,
					   Age ,
					   CASE WHEN Age < 18 THEN 'Less Than 18'
							WHEN Age Between 18 and 25 then '18-25'
							WHEN Age Between 25 and 35 then '25-35'
							WHEN Age Between 35 and 45 then '35-45'
							WHEN Age Between 45 and 55 then '45-55'
							WHEN Age > 55 THEN 'Over 55'
					   End As Age_Grouping ,
					   Height ,
					   Weight ,
					   NOC As Nation_Code ,
					   Games,
					   LEFT(Games, CHARINDEX(' ',Games) -1 ) As Year ,
					   RIGHT(Games, CHARINDEX(' ',REVERSE(Games)) -1 ) As Season ,
					   Sport ,
					   Event ,
					   CASE WHEN Medal = 'NA' THEN 'Not Registered' ELSE Medal End As Medal 
				FROM athletes_event_results 
				)
SELECT * 
FROM MyCte
WHERE Season = 'Summer' 