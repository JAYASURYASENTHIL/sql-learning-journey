CREATE TABLE ufc_fighters (
    fighter_id INT PRIMARY KEY,
    fighter_name VARCHAR(50),
    division VARCHAR(30),
    wins INT,
    losses INT,
    age INT,
    salary INT,
    country VARCHAR(30)
);
INSERT INTO ufc_fighters
(fighter_id, fighter_name, division, wins, losses, age, salary, country)

VALUES
(1, 'Jon Jones', 'Heavyweight', 28, 1, 38, 800000, 'USA'),

(2, 'Islam Makhachev', 'Lightweight', 27, 1, 34, 500000, 'Russia'),

(3, 'Alex Pereira', 'Light Heavyweight', 12, 3, 37, 650000, 'Brazil'),

(4, 'Sean O Malley', 'Bantamweight', 18, 2, 31, 350000, 'USA'),

(5, 'Khamzat Chimaev', 'Middleweight', 14, 0, 31, 400000, 'UAE'),

(6, 'Leon Edwards', 'Welterweight', 22, 4, 33, 450000, 'England'),

(7, 'Charles Oliveira', 'Lightweight', 35, 10, 35, 550000, 'Brazil'),

(8, 'Dricus Du Plessis', 'Middleweight', 23, 2, 31, 300000, 'South Africa'),

(9, 'Max Holloway', 'Featherweight', 26, 8, 34, 600000, 'USA'),

(10, 'Ilia Topuria', 'Featherweight', 16, 0, 28, 420000, 'Spain');

-- 1. Fighter Experience Category
-- Create a column called experience_level
--
-- Rules:
-- wins > 25            -> LEGEND
-- wins BETWEEN 15 AND 25 -> ELITE
-- wins < 15            -> RISING STAR

SELECT * ,
CASE
 WHEN wins>25 THEN 'LEGEND'
 WHEN wins BETWEEN 15 AND 25 THEN 'ELITE'
 WHEN wins<15 THEN 'RISING STAR'
 END AS experience_level
 
FROM ufc_fighters;

-- 2. Undefeated Status
-- Create a column called status
--
-- Rules:
-- losses = 0           -> UNDEFEATED
-- losses BETWEEN 1 AND 3 -> DANGEROUS
-- losses > 3           -> VETERAN


SELECT fighter_id,fighter_name,
CASE 
WHEN losses = 0 THEN 'UNDEFEATED'
WHEN losses BETWEEN 1 AND 3 THEN 'DANGEROUS'
WHEN losses>3 THEN 'VETERAN'
END AS status

FROM ufc_fighters;

-- QUESTION 3
-- Create a fighter_report column using CASE
-- Rules:
-- IF fighter is undefeated AND wins > 20 -> GOAT CONTENDER
-- IF losses > wins                      -> WASHED
-- IF age > 35                           -> VETERAN
-- IF wins BETWEEN 10 AND 20             -> RANKED FIGHTER
-- ELSE                                  -> PROSPECT

SELECT fighter_id,fighter_name,wins,losses,age,
CASE
WHEN wins>20 AND losses=0 THEN 'GOAT CONTENDER'
WHEN losses>wins THEN 'WASHED'
WHEN age>35 THEN 'VETERAN'
WHEN wins BETWEEN 10 AND 20 THEN 'RANKED FIGHTER'
ELSE 'PROSPECT'
END AS 'fighter_report'
FROM ufc_fighters;



-- QUESTION 2
-- Create:
-- new_salary
-- bonus
-- final_ctc
--
-- Salary Rules:
-- undefeated fighters       -> 20% hike
-- wins > 20                 -> 10% hike
-- losses > 5                -> 2% hike
-- everyone else             -> 5% hike
--
-- Bonus Rules:
-- Heavyweight               -> 100000
-- Lightweight               -> 70000
-- USA fighters              -> 50000
-- everyone else             -> 25000
--
-- final_ctc = new_salary + bonus

SELECT fighter_id,fighter_name,new_salary,bonus, new_salary+bonus AS CTC
FROM
(
SELECT fighter_id,fighter_name,salary,
CASE
WHEN losses=0 THEN salary*1.20
WHEN wins>20 THEN salary*1.10
WHEN losses>5 THEN salary*1.02
ELSE salary*1.05
END AS new_salary,

CASE
WHEN division ='Heavyweight' THEN 100000
WHEN division ='Lightweight' THEN 70000
WHEN country ='USA' THEN 50000
ELSE 25000
END AS bonus

FROM ufc_fighters
) AS FINAL_TABLE;



