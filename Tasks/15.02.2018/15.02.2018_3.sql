use ships

/*1. Напишете заявка, която извежда цялата налична информация за всеки
кораб, включително и данните за неговия клас. В резултата не трябва да
се включват тези класове, които нямат кораби.*/
SELECT *
FROM (SHIPS JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASS)

/*2. Повторете горната заявка, като този път включите в резултата и
класовете, които нямат кораби, но съществуват кораби със същото име
като тяхното.*/
(SELECT *
FROM (SHIPS JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASS))
UNION
(SELECT *
FROM SHIPS RIGHT JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASS
WHERE CLASSES.CLASS IN (SELECT NAME
					    FROM SHIPS))

/*3. За всяка страна изведете имената на корабите, които никога не са
участвали в битка.*/
SELECT COUNTRY, NAME
FROM (SHIPS JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASS) LEFT JOIN OUTCOMES ON NAME = SHIP
WHERE BATTLE IS NULL
ORDER BY COUNTRY

/*4. Намерете имената на всички кораби с поне 7 оръдия, пуснати на вода
през 1916, но наречете резултатната колона Ship Name.*/
SELECT NAME AS 'Ship Name'
FROM SHIPS JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASS
WHERE NUMGUNS >= 7 AND LAUNCHED = 1916

/*5. Изведете имената на всички потънали в битка кораби, името и дата на
провеждане на битките, в които те са потънали. Подредете резултата по
име на битката.*/
SELECT SHIP, NAME, DATE
FROM OUTCOMES JOIN BATTLES ON BATTLE = NAME
WHERE RESULT LIKE 'sunk'
ORDER BY NAME

/*6. Намерете името, водоизместимостта и годината на пускане на вода на
всички кораби, които имат същото име като техния клас.*/
SELECT NAME, DISPLACEMENT, LAUNCHED
FROM SHIPS JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASS
WHERE NAME = SHIPS.CLASS

/*7. Намерете всички класове кораби, от които няма пуснат на вода нито един
кораб.*/
SELECT CLASSES.CLASS, TYPE, COUNTRY, NUMGUNS, BORE, DISPLACEMENT
FROM SHIPS RIGHT JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASS
WHERE LAUNCHED IS NULL

/*8. Изведете името, водоизместимостта и броя оръдия на корабите,
участвали в битката ‘North Atlantic’, а също и резултата от битката.*/
SELECT NAME, DISPLACEMENT, NUMGUNS
FROM (SHIPS JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASS) JOIN OUTCOMES ON NAME = SHIP
WHERE BATTLE = 'North Atlantic'