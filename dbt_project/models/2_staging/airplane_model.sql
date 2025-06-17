/*  Home Task comment: 
    Raw data would have been injected and transformed from json (semi structured) 
    by using python pipeline into structured table.
*/
select
    -- Home Task comment: apply cast
    cast(manufacturer as bigint)                as manufacturer,
    cast(airplane_model as bigint)              as airplane_model,
    cast(max_seats as bigint)                   as max_seats,
    cast(max_weight as bigint)                  as max_weight_kg,
    cast(max_distance as bigint)                as max_distance_nmi,
    cast(engine_type as bigint)                 as engine_type 
from {{ source('ingest_airplane_api','raw_airplane_model') }}