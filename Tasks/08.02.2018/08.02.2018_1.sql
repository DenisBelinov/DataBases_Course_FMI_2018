use movies

SELECT moviestar.name
FROM MOVIESTAR
WHERE moviestar.GENDER = 'F' AND moviestar.name IN (SELECT name
													FROM MOVIEEXEC
													WHERE NETWORTH > 10000000)


SELECT moviestar.name
FROM MOVIESTAR
WHERE moviestar.name NOT IN (SELECT name
							FROM MOVIEEXEC)

SELECT title
FROM movie
WHERE LENGTH > (SELECT LENGTH 
				FROM movie
				WHERE title = 'Star Wars')

SELECT title, name
FROM MOVIE JOIN MOVIEEXEC ON PRODUCERC# = CERT#
WHERE NETWORTH > (SELECT NETWORTH
				  FROM MOVIEEXEC
				  WHERE name = 'Merv Griffin')
