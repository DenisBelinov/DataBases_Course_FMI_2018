use movies

SELECT starname AS name
FROM starsin JOIN moviestar ON starname = name
WHERE gender = 'M' AND movietitle = 'The Usual Suspects'

SELECT starname
FROM starsin JOIN movie ON movietitle = title
WHERE movieyear = 1995 AND studioname = 'MGM'

SELECT DISTINCT NAME
FROM MOVIEEXEC JOIN MOVIE ON CERT# = PRODUCERC#
WHERE studioname = 'MGM'

SELECT movie.title
FROM movie, movie AS movie2
WHERE movie2.TITLE = 'Star Wars' AND movie.LENGTH > movie2.LENGTH

SELECT MOVIEEXEC.NAME
FROM MOVIEEXEC, MOVIEEXEC as Stephen
WHERE Stephen.NAME = 'Stephen Spielberg' AND MOVIEEXEC.NETWORTH > Stephen.NETWORTH

SELECT movie.TITLE
FROM movie,MOVIEEXEC, MOVIEEXEC as Stephen
WHERE Stephen.NAME = 'Stephen Spielberg' AND MOVIEEXEC.NETWORTH > Stephen.NETWORTH AND movie.PRODUCERC# = MOVIEEXEC.CERT#