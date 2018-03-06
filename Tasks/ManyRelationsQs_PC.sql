use pc

SELECT product.maker, laptop.speed
FROM laptop JOIN product ON laptop.model = product.model
WHERE hd >= 9

(SELECT product.model, pc.price
FROM product JOIN pc on product.model = pc.model
WHERE product.maker = 'B')
UNION
(SELECT product.model, laptop.price
FROM product JOIN laptop on product.model = laptop.model
WHERE product.maker = 'B')
UNION
(SELECT product.model, printer.price
FROM product JOIN printer on product.model = printer.model
WHERE product.maker = 'B')

(SELECT maker
FROM product
WHERE type = 'Laptop')
EXCEPT
(SELECT maker
FROM product
WHERE type = 'pc')

SELECT DISTINCT pc.hd
FROM pc,pc as pc2
WHERE pc.hd = pc2.hd AND pc.code <> pc2.code

SELECT pc.model, pc2.model
FROM pc,pc as pc2
WHERE pc.model < pc2.model AND pc.speed = pc2.speed AND pc.ram = pc2.ram  

SELECT DISTINCT product.maker
FROM (pc JOIN product ON pc.model = product.model),(pc as pc2 JOIN product as product2 ON pc2.model = product2.model)
WHERE pc.speed >= 400 AND pc2.speed >= 400 AND product.maker = product2.maker AND pc.code <> pc2.code;
