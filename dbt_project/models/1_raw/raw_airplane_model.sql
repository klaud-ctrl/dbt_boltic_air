/*  Home Task comment: 
    Raw data would have been injected and transformed from json (semi structured) 
    by using python pipeline into structured table.
*/
select
    manufacturer,
    airplane_model,
    max_seats,
    max_weight,
    max_distance,
    engine_type
from {{ source('ingest_airplane_api','airplane_model') }}