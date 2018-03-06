use ships

SELECT CLASS, COUNTRY
FROM CLASSES
WHERE NUMGUNS < 10

SELECT NAME as shipName
FROM ships
WHERE launched < 1918

SELECT ship, battle
FROM OUTCOMES
WHERE result = 'sunk'

SELECT name
FROM ships
WHERE name = class

SELECT name
FROM ships
WHERE name like 'R%'

SELECT name
FROM ships
WHERE name like '% %'