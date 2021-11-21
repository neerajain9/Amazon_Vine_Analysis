-- -- vine table
CREATE TABLE vine_table (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT
);

-- Upload the table with csv extracted from RDS
-- Manual Process

--STEP -1 ************************************************************ 
-- Where the total_votes count is equal to or greater than 20 
--************************************************************ 
SELECT * 
INTO vine_gt_20
FROM vine_table
WHERE total_votes >= 20

--STEP-2************************************************************ 
-- Where the number of helpful_votes divided by total_votes is equal to or greater than 50%
--************************************************************ 
SELECT * 
INTO vine_gt_50pct
FROM vine_gt_20
WHERE CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT)

--STEP-3************************************************************ 
-- Where the review was not part of the Vine program (paid), vine == 'Y'.
--************************************************************ 
SELECT * 
INTO vine_gt_50pct_paid
FROM vine_gt_50pct
WHERE vine = 'Y'

--STEP-4************************************************************ 
-- Where the review was not part of the Vine program (unpaid), vine == 'N'.
--************************************************************ 
SELECT * 
INTO vine_gt_50pct_unpaid
FROM vine_gt_50pct
WHERE vine = 'N'

--************************************************************ 
--STEP-5
--************************************************************ 
-- Analysis table
CREATE TABLE analysis_table (
	total_reviews INTEGER,
	five_star_reviews INTEGER,
	pct_five_star_reviews_Y DECIMAL(10,9),
	pct_five_star_reviews_N DECIMAL(10,9)
);

--STEP-5************************************************************ 
--(a) Total No. of Reviews
--************************************************************ 
INSERT INTO
analysis_table (total_reviews)
SELECT count(*) FROM vine_table;

--STEP-5************************************************************ 
--(b) No. of 5-star Reviews
--************************************************************ 
UPDATE
analysis_table 
SET five_star_reviews =(SELECT count(*) FROM vine_table WHERE star_rating = 5);

--STEP-5************************************************************ 
--(c) The percentage of 5-star Reviews (for all-Vine reviews)
--************************************************************ 
UPDATE
analysis_table
SET pct_five_star_reviews_Y =((SELECT count(*) FROM vine_table WHERE star_rating = 5 AND vine = 'Y')/CAST(total_reviews AS FLOAT));

--STEP-5************************************************************ 
--(d) The percentage of 5-star Reviews (for non-Vine reviews)
--************************************************************ 
UPDATE
analysis_table
SET pct_five_star_reviews_N =((SELECT count(*) FROM vine_table WHERE star_rating = 5 AND vine = 'N')/CAST(total_reviews AS FLOAT));

SELECT * FROM analysis_table

