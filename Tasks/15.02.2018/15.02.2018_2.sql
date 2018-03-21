use pc

(SELECT product.maker, product.model, product.type
FROM product LEFT JOIN pc ON product.model = pc.model
WHERE type = 'PC' AND code IS NULL)
UNION ALL
(SELECT product.maker, product.model, product.type
FROM product LEFT JOIN printer ON product.model = printer.model
WHERE product.type = 'Printer' AND code IS NULL)
UNION ALL
(SELECT product.maker, product.model, product.type
FROM product LEFT JOIN laptop ON product.model = laptop.model
WHERE type = 'Laptop' AND code IS NULL)

(SELECT maker
FROM product
WHERE type = 'Laptop')
INTERSECT
(SELECT maker
FROM product
WHERE type = 'Printer')

SELECT DISTINCT l1.hd
FROM laptop l1 JOIN laptop l2 ON l1.hd = l2.hd
WHERE l1.code <> l2.code

SELECT pc.model
FROM pc LEFT JOIN product ON pc.model = product.model
WHERE maker IS NULL
