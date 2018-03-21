use PC

SELECT DISTINCT product.maker
FROM product JOIN pc ON product.model = pc.model
WHERE pc.speed > 500

SELECT code, model, price
FROM printer
WHERE price = (SELECT TOP 1 price
			   FROM printer
			   ORDER BY price DESC)

SELECT *
FROM laptop
WHERE speed < (SELECT TOP 1 speed	
			   FROM pc
			   ORDER BY speed ASC);
SELECT table1.model, table1.price
FROM
	((SELECT model, price
	FROM pc)
	UNION
	(SELECT model, price
	FROM printer)
	UNION
	(SELECT model, price
	FROM laptop)) AS table1
WHERE table1.price >=ALL ((SELECT price
							FROM pc)
							UNION
							(SELECT price
							FROM printer)
							UNION
							(SELECT price
							FROM laptop))

SELECT maker
FROM printer JOIN product ON printer.model = product.model
WHERE printer.color = 'y' AND printer.price <=ALL (SELECT price		
												   FROM printer
												   WHERE color = 'y')


SELECT *
FROM pc JOIN product ON pc.model = product.model
WHERE pc.ram  <=ALL (SELECT ram
					 FROM pc) 
					 AND pc.speed >=ALL( SELECT speed
										 FROM pc JOIN product ON pc.model = product.model
										 WHERE pc.ram  <=ALL (SELECT ram
															  FROM pc)) 



