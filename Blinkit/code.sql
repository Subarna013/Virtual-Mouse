CREATE TABLE blinkit_data
(
 "Item Fat Content"           VARCHAR,  
 "Item Identifier"            VARCHAR,  
 "Item Type"                  VARCHAR,
 "Outlet Establishment Year"  INT,
 "Outlet Identifier"          VARCHAR,
 "Outlet Location Type"       VARCHAR,     
 "Outlet Size"                VARCHAR,
 "Outlet Type"                VARCHAR,
 "Item Visibility"            FLOAT,
 "Item Weight"                FLOAT, 
 "Sales"                      FLOAT,
 "Rating"                     INT 
);

ALTER TABLE blinkit_data
ALTER COLUMN "Rating" TYPE FLOAT

SELECT * FROM blinkit_data

--Number of Rows
SELECT COUNT(*) FROM blinkit_data

--Data Cleaning
SELECT DISTINCT("Item Fat Content") FROM blinkit_data

UPDATE blinkit_data
SET "Item Fat Content"= CASE
WHEN "Item Fat Content" IN ('reg', 'regular') THEN 'Regular'
WHEN "Item Fat Content" IN ('low fat', 'lf') THEN 'Low Fat'
ELSE "Item Fat Content"
END

--Total Sales: The overall revenue generated from all items sold.
SELECT SUM("Sales") as "Total Sales" FROM blinkit_data 

--Average Sales: The average revenue per sales.
SELECT CAST(AVG("Sales") AS DECIMAL (10, 3)) AS "Average Sales" FROM blinkit_data

--Number of Items: The total count of different items sold.
SELECT "Item Type",COUNT(DISTINCT "Item Identifier") AS "Number of Items Sold"
FROM blinkit_data
GROUP BY "Item Type"

--Average Rating: The average customer rating for items sold.
SELECT CAST(AVG("Rating")AS DECIMAL(10, 3)) AS "Average Customer Rating"
FROM blinkit_data

--Total Sales by Fat Content
SELECT 
  "Item Fat Content", 
   COUNT(*) AS "Items Sold",
   CAST(SUM("Sales") AS DECIMAL(10,3)) AS "Total Sales", 
   CAST(AVG("Sales") AS DECIMAL(10,3)) AS "Average Sales",
   CAST(AVG("Rating") AS DECIMAL(10,3)) AS "Average Rating"
FROM blinkit_data
GROUP BY "Item Fat Content"

--Total Sales by Item Type
SELECT  
   "Item Type",
   COUNT(*) AS "Items Sold",
   CAST(SUM("Sales") AS DECIMAL(10,3)) AS "Total Sales", 
   CAST(AVG("Sales") AS DECIMAL(10,3)) AS "Average Sales",
   CAST(AVG("Rating") AS DECIMAL(10,3)) AS "Average Rating"
FROM blinkit_data
GROUP BY "Item Type"

--Fat Content by Outlet for Total Sales
SELECT  
   "Item Fat Content",
   "Outlet Location Type",
   COUNT(*) AS "Items Sold",
   CAST(SUM("Sales") AS DECIMAL(10,3)) AS "Total Sales", 
   CAST(AVG("Sales") AS DECIMAL(10,3)) AS "Average Sales",
   CAST(AVG("Rating") AS DECIMAL(10,3)) AS "Average Rating"
FROM blinkit_data
GROUP BY "Outlet Location Type","Item Fat Content"

--Total Sales by Outlet Establishment
SELECT  
   "Outlet Location Type",
   EXTRACT(YEAR FROM CURRENT_DATE) - "Outlet Establishment Year" AS "Outlet Age",
   COUNT(*) AS "Items Sold",
   CAST(SUM("Sales") AS DECIMAL(10,3)) AS "Total Sales", 
   CAST(AVG("Sales") AS DECIMAL(10,3)) AS "Average Sales",
   CAST(AVG("Rating") AS DECIMAL(10,3)) AS "Average Rating"
FROM blinkit_data
GROUP BY "Outlet Location Type", EXTRACT(YEAR FROM CURRENT_DATE) - "Outlet Establishment Year"
ORDER BY "Outlet Age" ASC;

--Percentage of Sales by Outlet Size
SELECT 
"Outlet Size",    
CAST(SUM("Sales") * 100.0 / SUM(SUM("Sales")) OVER () AS DECIMAL(10,3)) AS "Percentage of Sales",
CAST(SUM("Sales") AS DECIMAL(10,3)) AS "Total Sales",
CAST(AVG("Sales") AS DECIMAL(10,3)) AS "Average Sales",
CAST(AVG("Rating") AS DECIMAL(10,3)) AS "Average Rating"
FROM blinkit_data
GROUP BY "Outlet Size"

--Sales by Outlet Location
SELECT 
"Outlet Location Type",    
CAST(SUM("Sales") AS DECIMAL(10,3)) AS "Total Sales",
CAST(AVG("Sales") AS DECIMAL(10,3)) AS "Average Sales",
COUNT(*) AS "Items Sold",
CAST(AVG("Rating") AS DECIMAL(10,3)) AS "Average Rating"
FROM blinkit_data
GROUP BY "Outlet Location Type"

--All Metrics by Outlet Type
SELECT 
"Outlet Type",    
CAST(SUM("Sales") AS DECIMAL(10,3)) AS "Total Sales",
CAST(AVG("Sales") AS DECIMAL(10,3)) AS "Average Sales",
COUNT(*) AS "Items Sold",
CAST(AVG("Rating") AS DECIMAL(10,3)) AS "Average Rating"
FROM blinkit_data
GROUP BY "Outlet Type"