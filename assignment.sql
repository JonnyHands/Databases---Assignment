-- Answer to Part 1 of the 2nd Database Assignment 2020/21
--
-- CANDIDATE NUMBER: 198397
-- Please insert your candidate number in the line above.
-- Do NOT remove ANY lines of this template.

-- In each section below put your answer in a new line 
-- BELOW the corresponding comment.
-- Use ONE SQL statement ONLY per question.
-- If you don’t answer a question just leave 
-- the corresponding space blank. 
-- Anything that does not run in SQL you MUST put in comments.

-- DO NOT REMOVE ANY LINE FROM THIS FILE.

-- START OF ASSIGNMENT CODE


-- @@01

CREATE TABLE MoSpo_HallOfFame 
(
    hoFdriverId INT UNSIGNED NOT NULL,
    hoFYear YEAR CHECK ((hoFYear >= 1901 AND hoFYear <= 2155) OR hoFYear = 0000),
    hoFSeries VARCHAR(9) NOT NULL CHECK (hoFSeries = 'BritishGT' OR hoFSeries = 'Formula1' OR hoFSeries = 'FormulaE' OR hoFSeries = 'SuperGT'),
    hoFImage VARCHAR(200),
    hoFWins INT UNSIGNED DEFAULT '0' CHECK (hoFWins <= 99 AND hoFWins >= 0),
    hoFBestRaceName VARCHAR(255),
    hoFBestRaceDate DATE,
    PRIMARY KEY(hoFdriverId, hoFYear),
    CONSTRAINT hoF_driverId_fk FOREIGN KEY (hoFdriverId) REFERENCES MoSpo_Driver(driverId) ON DELETE CASCADE,
    CONSTRAINT hoF_race_name_date_fk FOREIGN KEY (hoFBestRaceName, hoFBestRaceDate) REFERENCES MoSpo_Race(raceName, raceDate) ON DELETE SET NULL
);

-- @@02

ALTER TABLE MoSpo_Driver
	ADD driverWeight DEC(3,1) NULL;


-- @@03

UPDATE MoSpo_RacingTeam
	SET teamPostcode = 'HP135PN'
	WHERE teamName = 'Beechdean Motorsport';
	

-- @@04

DELETE FROM MoSpo_Driver WHERE LOWER(driverFirstname) = 'Ayrton' AND LOWER(driverLastname) = 'Senna';

-- @@05

SELECT COUNT(teamName) AS numberTeams FROM MoSpo_RacingTeam;

-- @@06

SELECT driverId AS driverID, CONCAT (LEFT(driverFirstname, 1) ,  ' ' , driverLastname) AS driverName, driverDOB
FROM MoSpo_Driver WHERE LEFT(driverFirstname,1) = LEFT(driverLastname,1);

-- @@07

SELECT driverTeam AS teamName, COUNT(*) AS numberOfDriver FROM MoSpo_Driver GROUP BY driverTeam HAVING numberOfDriver > 1;

-- @@08

SELECT lapRaceName AS raceName,
		 lapRaceDate AS raceDate,
		 MIN(lapInfoTime) AS lapTime
FROM MoSpo_Lap 
JOIN MoSpo_LapInfo 
ON lapRaceDate = lapInfoRaceDate
GROUP BY lapRaceName,lapRaceDate
HAVING lapTime !='NULL';

-- @@09

SELECT pitstopRaceName AS raceName,
COUNT(*)/COUNT(DISTINCT(pitstopRaceDate)) AS avgStops
FROM MoSpo_PitStop 
GROUP BY raceName;

-- @@10



-- @@11



-- @@12



-- @@13



-- @@14



-- END OF ASSIGNMENT CODE
