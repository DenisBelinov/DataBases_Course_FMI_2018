use pc

SELECT model as MODEL, speed as MHZ, hd as GB
FROM pc
WHERE price < 1200

SELECT DISTINCT maker
FROM product
WHERE type = 'printer'

SELECT MODEL, RAM, SCREEN
FROM laptop
WHERE price > 1000

SELECT *
from printer
WHERE color = 'y'

SELECT MODEL, SPEED, HD
FROM pc
WHERE (cd = '12x' OR cd = '16x') AND price < 2000