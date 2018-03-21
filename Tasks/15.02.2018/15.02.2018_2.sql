use pc
/*1. Напишете заявка, която извежда производител, модел и тип на продукт
за тези производители, за които съответният продукт не се продава
(няма го в таблиците PC, Laptop или Printer).*/
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

/*2. Намерете всички производители, които правят както лаптопи, така и
принтери.*/
(SELECT maker
FROM product
WHERE type = 'Laptop')
INTERSECT
(SELECT maker
FROM product
WHERE type = 'Printer')

/*3. Намерете размерите на тези твърди дискове, които се появяват в два
или повече модела лаптопи.*/
SELECT DISTINCT l1.hd
FROM laptop l1 JOIN laptop l2 ON l1.hd = l2.hd
WHERE l1.code <> l2.code

/*4. Намерете всички модели персонални компютри, които нямат регистриран
производител.*/
SELECT pc.model
FROM pc LEFT JOIN product ON pc.model = product.model
WHERE maker IS NULL
