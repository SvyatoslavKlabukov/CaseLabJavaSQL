CREATE TABLE competition (
	competition_id SERIAL PRIMARY KEY,
	competition_name VARCHAR(50),
	world_record TIME,
	set_date DATE
);

CREATE TABLE sportsman (
	sportsman_id SERIAL PRIMARY KEY,
	sportsman_name VARCHAR(50),
	sportsman_rank INTEGER,
	year_of_birth INTEGER,
	personal_record TIME,
	country VARCHAR(50)
);

CREATE TABLE result (
	competition_id INTEGER,
	sportsman_id INTEGER,
	sportsman_result INTEGER,
	city VARCHAR(50),
	hold_date DATE,
	FOREIGN KEY (competition_id) REFERENCES competition (competition_id),
	FOREIGN KEY (sportsman_id) REFERENCES sportsman (sportsman_id)
);

INSERT INTO sportsman  (sportsman_name, sportsman_rank, year_of_birth, personal_record, country)
VALUES
('Ivanov', 1, 1998, '00:00:09.580', 'Russia'),
('Petrov Nikolay', 2, 1997, '00:00:15.789', 'Belarus'),
('John Smith', 2, 2000, '00:00:17.789', 'USA'),
('Peter Jackson', 1, 1995, '00:19:50.789', 'France'),
('Tony Stark', 3, 2005, '00:21:55.789', 'Canada'),
('Jackie Chan', 1, 1980, '00:15:00.983', 'China'),
('Jackie Chan', 1, 1980, '00:33:00.803', 'China'),
('Ivanova Lena', 1, 1992, '00:37:14.509', 'Russia'),
('Ivanova Lena', 1, 1992, '01:58:14.509', 'Russia'),
('Egorova Svetlana', 2, 1994, '02:08:19.611', 'Russia'),
('Egorova Svetlana', 2, 1994, '04:00:14.462', 'Russia'),
('Julia Black', 3, 1975, '04:29:49.462', 'Australia'),
('Arturo Rodrigez', 1, 1989, '00:00:48.080', 'Mexico'),
('Roberto Carlos', 1, 1970, '00:00:42.034', 'Brazil'),
('Roberto Carlos', 1, 1970, '00:00:10.034', 'Brazil'),
('Bashar al Saudi', 2, 1998, '00:00:36.208', 'Saudi Arabia'),
('Bashar al Saudi', 2, 1998, '00:00:11.349', 'Saudi Arabia'),
('Frederico Cellini', 5, 2005, '00:00:24.807', 'Italy'),
('Fernando Torres', 4, 2003, '00:00:49.109', 'Spain'),
('Van Tan', 2, 2000, '00:00:40.589', 'China');


INSERT INTO competition  (competition_name, world_record, set_date)
VALUES
('running 100 meters', '00:00:09.580', '2009-08-16'),
('running 200 meters', '00:00:19.020', '2011-01-09'),
('running 400 meters', '00:00:45.230', '1989-06-29'),
('running 800 meters', '00:02:01.460', '1977-04-15'),
('running 5 km', '00:14:45.230', '2001-02-23'),
('running 10 km', '00:32:21.000', '2012-11-09'),
('running 30 km', '01:45:24.000', '1958-09-14'),
('running 50 km', '03:03:12.000', '1967-12-28'),
('triathlon', '00:54:45.008', '1989-06-29'),
('biathlon 5 km', '00:31:28.000', '2003-02-17'),
('biathlon 10 km', '00:58:00.009', '2002-01-17'),
('biathlon 20 km', '01:23:28.289', '2017-12-17'),
('biathlon 30 km', '01:54:47.899', '2016-03-01'),
('biathlon 40 km', '02:40:34.908', '1990-12-24'),
('speed skating 500 meters', '00:00:24.807', '1999-12-01'),
('speed skating 1000 meters', '00:00:51.589', '2008-04-30'),
('speed skating 3000 meters', '00:01:59.490', '1975-05-09'),
('swimming 500 meters', '00:00:35.080', '1997-06-20'),
('swimming 1000 meters', '00:01:03.385', '1992-03-05'),
('swimming 2000 meters', '00:02:12.780', '2012-01-05');

INSERT INTO result (competition_id, sportsman_id, sportsman_result, city, hold_date)
VALUES
(1, 1, 3, 'Moscow', '2020-06-15'),
(1, 2, 5, 'Moscow', '2020-06-15'),
(1, 3, 9, 'Moscow', '2020-06-15'),
(1, 4, 15, 'Samara', '2014-06-15'),
(5, 5, 2, 'Beijing', '2022-07-29'),
(5, 6, 1, 'Beijing', '1998-05-09'),
(6, 7, 1, 'Beijing', '1998-05-14'),
(6, 8, 9, 'London', '2010-07-19'),
(7, 9, 19, 'London', '2010-07-22'),
(7, 10, 19, 'London', '2014-05-12'),
(8, 11, 4, 'London', '2014-05-17'),
(8, 12, 17, 'Rome', '1993-07-27'),
(18, 13, 7, 'Paris', '2004-03-05'),
(18, 14, 2, 'Gavana', '1985-06-20'),
(1, 15, 1, 'Moscow', '1986-08-18'),
(18, 16, 1, 'Madrid', '2015-11-23'),
(1, 17, 1, 'Monaco', '2016-09-05'),
(15, 18, 10, 'Vena', '2021-04-08'),
(15, 19, 5, 'Vena', '2020-09-18'),
(15, 20, 1, 'Vena', '2019-07-27');

SELECT * FROM competition;
SELECT * FROM sportsman;
SELECT * FROM result;

-- 1. Выдайте всю информацию о спортсменах из таблицы sportsman.
SELECT * FROM sportsman;

-- 2. Выдайте наименование и мировые результаты по всем соревнованиям.
SELECT competition_name, world_record FROM competition;

-- 3. Выберите имена всех спортсменов, которые родились в 1992 году.
SELECT DISTINCT sportsman_name FROM sportsman WHERE year_of_birth = 1992;

-- 4. Выберите наименование и мировые результаты по всем соревнованиям, 
-- установленные 12-05-2010 или 15-05-2010.
SELECT competition_name, world_record FROM competition
WHERE set_date = '2010-05-12' OR set_date = '2010-05-12';

-- 5. Выберите дату проведения всех соревнований, которые проводились в Москве
-- и полученные на них результаты равны 10.034 секунд.
SELECT hold_date 
FROM result LEFT JOIN sportsman
ON result.sportsman_id = sportsman.sportsman_id
WHERE city = 'Moscow' AND personal_record = '00:00:10.034';

-- 6. Выберите имена всех спортсменов, у которых персональный рекорд не равен 14.203 с.
SELECT sportsman_name FROM sportsman
WHERE personal_record <> '00:00:14.203';

-- 7. Выберите названия всех соревнований, у которых мировой рекорд равен 15 с
-- и дата установки рекорда не равна 12-02-2015.
SELECT competition_name FROM competition
WHERE world_record = '00:31:28' AND set_date <> '2015-02-12';

-- 8. Выберите города проведения соревнований, 
-- где результаты принадлежат множеству {13, 25, 17, 9}.
SELECT city FROM result
WHERE sportsman_result IN (13, 25, 17, 9);

-- 9. Выберите имена всех спортсменов, у которых год рождения 2000
-- и разряд не принадлежит множеству {3, 7, 9}.
SELECT sportsman_name FROM sportsman
WHERE year_of_birth = 2000 AND sportsman_rank NOT IN (3, 7, 9);

-- 10. Выберите дату проведения всех соревнований, у которых город 
-- проведения начинается с буквы "М".
SELECT set_date
FROM competition INNER JOIN result
ON competition.competition_id = result.competition_id
WHERE city LIKE 'M%';

-- 11. Выберите имена всех спортсменов, у которых имена начинаются с буквы "J"
-- и год рождения не заканчивается на "6".
SELECT sportsman_name FROM sportsman
WHERE sportsman_name LIKE 'J%' 
AND CAST(year_of_birth AS TEXT) NOT LIKE '%6';

-- 12. Выберите наименования всех соревнований, у которых в названии есть слово "biathlon".
SELECT competition_name FROM competition
WHERE competition_name LIKE '%biathlon%';

-- 13. Выберите годы рождения всех спортсменов без повторений.
SELECT DISTINCT year_of_birth FROM sportsman;

-- 14. Найдите количество результатов, полученных 12-05-2014.
SELECT COUNT(*) FROM result
WHERE hold_date = '2014-05-12';

-- 15. Вычислите максимальный результат, полученный в Москве.
SELECT MIN(sportsman_result) FROM result
WHERE city = 'Moscow';

-- 16. Вычислите минимальный год рождения спортсменов, которые имеют 1 разряд.
SELECT MAX(year_of_birth) FROM sportsman
WHERE sportsman_rank = 1;

-- 17. Определите имена спортсменов, у которых личные рекорды совпадают с результатами,
-- установленными 12-04-2014.
--не совпадают типы: личные рекорды(Type Time), результаты (Type Integer)(понял так, что
--результаты это занятое место) 
SELECT sportsman_name
FROM sportsman RIGHT JOIN result
ON sportsman.sportsman_id = result.sportsman_id 
WHERE personal_record = result  AND hold_date='2014-04-12';

-- 18. Выведите наименования соревнований, у которых дата установления мирового рекорда 
-- совпадает с датой проведения соревнований в - Москве 20-04-2015.
SELECT competition_name FROM competition
WHERE set_date = (SELECT hold_date 
				  FROM result 
				  WHERE city = 'MOSCOW' AND hold_date = '2015-04-20');
				  
-- 19. Вычислите средний результат каждого из спортсменов
SELECT sportsman_name, AVG(sportsman_result)::numeric(10,2) 
FROM sportsman RIGHT JOIN result
ON sportsman.sportsman_id = result.sportsman_id
GROUP BY sportsman_name;

-- 20. Выведите годы рождения спортсменов, у которых результат, показанный 
-- в Москве выше среднего по всем спортсменам.
SELECT year_of_birth
FROM sportsman RIGHT JOIN result
ON sportsman.sportsman_id = result.sportsman_id
WHERE city = 'Moscow' AND sportsman_result > (SELECT AVG(sportsman_result) FROM result); 

-- 21. Выведите имена всех спортсменов, у которых год рождения больше, чем год 
-- установления мирового рекорда, равного 24.807 с.
SELECT sportsman_name FROM sportsman
WHERE year_of_birth > (SELECT date_part('year', set_date::DATE) FROM competition
					  WHERE world_record = '00:00:24.807');
					  
-- 22. Выведите список спортсменов в виде 'Спортсмен ' ['имя спортсмена'] 
--'показал результат' ['результат'] 'в городе' ['город']
SELECT 'Спортсмен ' ||  sportsman_name || ' показал результат ' ||  sportsman_result ||
' в городе ' || city
FROM result
JOIN sportsman
ON result.sportsman_id = sportsman.sportsman_id;

-- 23. Выведите имена всех спортсменов, у которых разряд ниже среднего разряда всех 
-- спортсменов, родившихся в 2000 году.
SELECT DISTINCT sportsman_name, sportsman_rank FROM sportsman
WHERE sportsman_rank < (SELECT AVG(sportsman_rank) FROM 
					   (SELECT DISTINCT sportsman_name, sportsman_rank FROM sportsman
					   WHERE year_of_birth=2000) AS derivedTable);
					   
-- 24. Выведите данные о спортсменах, у которых персональный рекорд совпадает с мировым.
SELECT * FROM sportsman
WHERE personal_record IN (SELECT world_record FROM competition);

-- 25. Определите количество участников с фамилией Иванов, которые участвовали в 
-- соревнованиях с названием, содержащим слово 'Региональные'.
SELECT COUNT(*)
FROM sportsman  
RIGHT JOIN result ON sportsman.sportsman_id = result.sportsman_id
LEFT JOIN competition ON result.competition_id = competition.competition_id
WHERE sportsman_name = 'Ivanov' AND competition_name LIKE '%run%';

-- 26. Выведите города, в которых были установлены мировые рекорды.
SELECT city 
FROM result
JOIN competition ON result.competition_id = competition.competition_id
JOIN sportsman ON result.sportsman_id = sportsman.sportsman_id
WHERE competition.world_record = sportsman.personal_record;

-- 27. Найдите минимальный разряд спортсменов, которые установили мировой рекорд.
SELECT MIN(sportsman_rank)
FROM sportsman
JOIN result ON sportsman.sportsman_id = result.sportsman_id
JOIN competition ON result.competition_id = competition.competition_id 
WHERE competition.world_record = sportsman.personal_record;

-- 28. Выведите названия соревнований, на которых было установлено максимальное 
-- количество мировых рекордов.
SELECT competition_name FROM
(
	SELECT competition_name, COUNT(*) AS New_world_record FROM competition
	JOIN result ON competition.competition_id = result.competition_id
	JOIN sportsman ON result.sportsman_id = sportsman.sportsman_id
	WHERE sportsman.personal_record <= competition.world_record
	GROUP BY competition_name
) AS derivedTable
WHERE New_world_record = (SELECT MAX(New_world_record) FROM 
	(
	SELECT competition_name, COUNT(*) AS New_world_record FROM competition
	JOIN result ON competition.competition_id = result.competition_id
	JOIN sportsman ON result.sportsman_id = sportsman.sportsman_id
	WHERE sportsman.personal_record <= competition.world_record
	GROUP BY competition_name
	) AS derivedTable
						 );

-- 29. Определите, спортсмены какой страны участвовали в соревнованиях больше всего.
SELECT country FROM
(
	SELECT country, COUNT(*) AS count_country FROM sportsman
	JOIN result ON sportsman.sportsman_id = result.sportsman_id
	GROUP BY country
) AS derivedTable
WHERE count_country = (SELECT MAX(count_country) FROM 
	(
	SELECT country, COUNT(*) AS count_country FROM sportsman
	JOIN result ON sportsman.sportsman_id = result.sportsman_id
	GROUP BY country
	) AS derivedTable
					  );
					  
-- 30. Измените разряд на 1 тех спортсменов, у которых личный рекорд совпадает с мировым.
Update sportsman 
SET sportsman_rank = (sportsman_rank+1)
WHERE personal_record IN (SELECT world_record FROM competition);

-- 31. Вычислите возраст спортсменов, которые участвовали в соревнованиях в Москве.
SELECT sportsman_name, (date_part - year_of_birth) AS age FROM
(
	SELECT sportsman_name, year_of_birth, city, date_part('year', hold_date::DATE) FROM sportsman
	JOIN result ON sportsman.sportsman_id = result.sportsman_id
	WHERE city = 'Moscow'
) AS derivedTable;

-- 32. Измените дату проведения всех соревнований, проходящих в Москве на 4 дня вперед.
Update result
SET hold_date = hold_date + interval '4 day'
WHERE city = 'Moscow';

-- 33. Измените страну у спортсменов, у которых разряд равен 1 или 2, с Италии на Россию.
Update sportsman
SET country = 'Russia'
WHERE (sportsman_rank = 1 OR sportsman_rank = 2) AND country = 'Italy';

-- 34. Измените название соревнований с 'Бег' на 'Бег с препятствиями'
Update competition
SET competition_name = 'running with barrier'
WHERE competition_name = 'running 200 meters';

-- 35. Увеличьте мировой результат на 2 с для соревнований ранее 20-03-2005.
Update competition
SET world_record = world_record + interval '2 second'
WHERE set_date < '2005-03-20';

-- 36. Уменьшите результаты на 2 с соревнований, которые проводились
-- 19-06-2020 и показанный результат не менее 45 с.
--(Результат в моей БД имеет тип INTEGER(занятое место в соревнованиях), 
--поэтому секунды ( тип TIME) заменяю на Integer)
Update result
SET sportsman_result = (sportsman_result - 2)
WHERE hold_date = '2020-06-19' AND sportsman_result > 2; 

-- 37. Удалите все результаты соревнований в Москве, 
--участники которых родились не позже 1980 г.
DELETE FROM result
WHERE city = 'Moscow' AND sportsman_id IN (
	SELECT sportsman_id FROM sportsman
	WHERE year_of_birth > 1980); 

-- 38. Удалите все соревнования, у которых результат равен 20 с.
DELETE FROM competition CASCADE
WHERE competition_id IN (
	SELECT competition_id FROM result
	WHERE sportsman_result = 2);

-- 39. Удалите все результаты спортсменов, которые родились в 2000 году.
DELETE FROM result
WHERE sportsman_id IN (
	SELECT sportsman_id FROM sportsman
	WHERE year_of_birth = 2000);


