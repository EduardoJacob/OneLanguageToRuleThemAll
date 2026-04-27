![](Thumbnail3.png)

# R Programming Data Drills: Solutions Library

This repository contains R-based solutions for a variety of data engineering and analytics challenges. The projects cover a range of technical skills, from recursive logic and data modeling to time-series analysis and JSON parsing.

----

These problems were copied from the excellent Playlist [Data Drill Showdowns by Maven Analytics](https://www.youtube.com/playlist?list=PLGAnLqlBhx1EptV8UtVLM0fRA7UDsnd59) on Youtube. 
I have implemented my own solutions to these problems in R, and I am sharing them here for anyone who wants to learn from them or compare their own solutions. 

![Maven Analytics](MavenAnalytics.png)

----

You can watch a video walkthrough of the solutions in my Youtube R Programming Tutorials Playlist:

[my Youtube R Programming Tutorials Playlist](https://www.youtube.com/playlist?list=PLRbCt61PaxX2d0_QXh6Qi6_jAQd66fmcI)

----


## Project Descriptions

### 1. Org Chart Overhaul
Build reporting hierarchies and count both direct and total reports. This solution maps employee-manager relationships using recursive logic and complex data modeling skills.

### 2. Flatten the Stack
Flatten a nested JSON column into individual rows. This data drill transforms order records with embedded line items into a flat table format, perfect for total online sales calculations and aggregation.

### 3. Rolling Up, Looking Back
Analyze monthly sales and track performance trends. The script groups transactions by store and month, then calculates month-over-month changes to uncover key business insights.

### 4. Spot the Sale
Match orders in a table with active promotions based on the transaction date. This project implements non-traditional joins based on date ranges and overlapping intervals.

### 5. Movie Metrics
Summarize viewing activity for Netflix users. This solution involves logic-based feature engineering and data aggregation to create user-specific metrics from raw activity logs.

### 6. Streak Leaderboard
Identify users with the longest daily active streaks based on completed lessons. The logic utilizes date comparisons, lag functions, and streak tracking algorithms.

### 7. Turning Bullish
Identify "Golden Cross" moments in the S&P 500 by comparing short-term and long-term moving averages. This project practices rolling calculations and conditional flagging to signal the start of a bull market.

### 8. Splitting the Field
Count the number of players who suited up at each position during the 2025 MLB season. This solution demonstrates how to perform aggregation based on multi-value fields.

### 9. The Price is Right
Look up the price for each product based on transaction dates and historical price changes. This involves implementing **Slowly Changing Dimension (SCD)** techniques to ensure accurate historical pricing.

---

## Technical Skills Covered
* **Data Cleaning:** Imputation and handling missing values.
* **Data Modeling:** Recursive hierarchies and SCD Type 2 techniques.
* **Time Series:** Moving averages and date interval joins.
* **Format Transformation:** JSON parsing and flattening.
* **Visualization:** Plotting trends and organizational structures.