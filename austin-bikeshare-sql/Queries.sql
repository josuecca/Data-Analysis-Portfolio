WITH bike_usage AS (
  SELECT
    bike_id,
    SUM(duration_minutes) AS total_duration,
    COUNT(*) AS total_trips
  FROM
    bigquery-public-data.austin_bikeshare.bikeshare_trips
  WHERE
    start_time BETWEEN '2019-01-01' AND '2019-12-31'
  GROUP BY
    bike_id
),

longest_used_bike AS (
  SELECT *
  FROM bike_usage
  ORDER BY total_duration DESC
  LIMIT 1
),

station_frequency AS (
  SELECT
    trips.start_station_id,
    COUNT(*) AS trip_ct
  FROM
    longest_used_bike AS longest
  JOIN
    bigquery-public-data.austin_bikeshare.bikeshare_trips AS trips
  ON
    longest.bike_id = trips.bike_id
  WHERE
    trips.start_time BETWEEN '2019-01-01' AND '2019-12-31'
  GROUP BY
    trips.start_station_id
  ORDER BY
    trip_ct DESC
  LIMIT 1
)

SELECT
  sf.start_station_id,
  stations.name AS station_name,
  sf.trip_ct
FROM
  station_frequency sf
JOIN
  bigquery-public-data.austin_bikeshare.bikeshare_stations stations
ON
  sf.start_station_id = stations.station_id;
