SELECT 
  station_id,
  name,
  number_of_rides AS number_of_starting_at_station

FROM 
  (
    SELECT
      start_station_id,
      COUNT(*) number_of_rides
    FROM
      `bigquery-public-data.new-york.citibike_trips`
      GROUP BY
        start_station_id
  )
  AS station_num_trips
  INNER JOIN

  bigquery-public-data.new_york.citibike_stations ON station_id = start_station_id
  ORDER BY
    number_of_rides DESC
