Austin Bikeshare Usage Analysis
Business Question

Which station was most frequently used by the most utilized bike in the Austin Bikeshare system during 2019?

Dataset

Source: bigquery-public-data.austin_bikeshare
Tables used:

  - bikeshare_trips

  - bikeshare_stations

The dataset contains trip-level information including bike ID, trip duration, timestamps, and station metadata.

Objective

  - Identify the bike with the highest total trip duration in 2019.

  - Determine from which station that bike most frequently departed.

  - Translate the results into operational insight.

Methodology

The analysis was performed using BigQuery SQL and included:

  - Aggregating total trip duration and trip count per bike

  - Filtering trips to the 2019 calendar year

  - Identifying the highest-used bike using total duration

  - Joining trip data with station metadata
  
  - Determining the most frequent departure station

  - The full SQL query is available in the queries.sql file.

Key Findings

  - The most utilized bike in 2019 accumulated the highest total trip duration among all bikes in the dataset.

  - This bike most frequently departed from 21st & Speedway @PCL (Station ID: 3798).

  - It departed 23 times from this station during the selected period.

Business Insight

The concentration of departures at 21st & Speedway @PCL suggests:

  - High rider demand in that area

  - Potential increased wear on bikes stationed there

  - Opportunity to optimize bike redistribution and maintenance scheduling

Understanding station-level concentration can support more efficient asset management and operational planning.

Skills Demonstrated

  - SQL (BigQuery)

  - Common Table Expressions (CTEs)

  - Aggregations (SUM, COUNT)

  - Multi-table JOIN operations

  - Time-based filtering

  - Translating analytical results into business insights
