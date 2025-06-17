/*  Home Task comment: 
    - enrich data with country & region info for analysis based on those dimensions
    - timezone: make sure timestamps come in as UTC / set up timezone for database at UTC
    - sorting columns
        - IDs first
        - logical order / business user centric
        - timestamps last
*/
select
    trip_id,
    airplane_id,
    origin_city,
    origin_country,
    origin_region,
    destination_city,
    destination_country,
    destination_region,
    start_trip_at,
    end_trip_at
from {{ref('trip')}}