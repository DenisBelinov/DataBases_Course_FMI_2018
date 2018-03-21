use ships

/*1. �������� ������, ����� ������� ������ ������� ���������� �� �����
�����, ����������� � ������� �� ������� ����. � ��������� �� ������ ��
�� �������� ���� �������, ����� ����� ������.*/
SELECT *
FROM (SHIPS JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASS)

/*2. ��������� ������� ������, ���� ���� ��� �������� � ��������� �
���������, ����� ����� ������, �� ����������� ������ ��� ������ ���
���� �������.*/
(SELECT *
FROM (SHIPS JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASS))
UNION
(SELECT *
FROM SHIPS RIGHT JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASS
WHERE CLASSES.CLASS IN (SELECT NAME
					    FROM SHIPS))

/*3. �� ����� ������ �������� ������� �� ��������, ����� ������ �� ��
��������� � �����.*/
SELECT COUNTRY, NAME
FROM (SHIPS JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASS) LEFT JOIN OUTCOMES ON NAME = SHIP
WHERE BATTLE IS NULL
ORDER BY COUNTRY

/*4. �������� ������� �� ������ ������ � ���� 7 ������, ������� �� ����
���� 1916, �� �������� ������������ ������ Ship Name.*/
SELECT NAME AS 'Ship Name'
FROM SHIPS JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASS
WHERE NUMGUNS >= 7 AND LAUNCHED = 1916

/*5. �������� ������� �� ������ �������� � ����� ������, ����� � ���� ��
���������� �� �������, � ����� �� �� ��������. ��������� ��������� ��
��� �� �������.*/
SELECT SHIP, NAME, DATE
FROM OUTCOMES JOIN BATTLES ON BATTLE = NAME
WHERE RESULT LIKE 'sunk'
ORDER BY NAME

/*6. �������� �����, ����������������� � �������� �� ������� �� ���� ��
������ ������, ����� ���� ������ ��� ���� ������ ����.*/
SELECT NAME, DISPLACEMENT, LAUNCHED
FROM SHIPS JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASS
WHERE NAME = SHIPS.CLASS

/*7. �������� ������ ������� ������, �� ����� ���� ������ �� ���� ���� ����
�����.*/
SELECT CLASSES.CLASS, TYPE, COUNTRY, NUMGUNS, BORE, DISPLACEMENT
FROM SHIPS RIGHT JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASS
WHERE LAUNCHED IS NULL

/*8. �������� �����, ����������������� � ���� ������ �� ��������,
��������� � ������� �North Atlantic�, � ���� � ��������� �� �������.*/
SELECT NAME, DISPLACEMENT, NUMGUNS
FROM (SHIPS JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASS) JOIN OUTCOMES ON NAME = SHIP
WHERE BATTLE = 'North Atlantic'