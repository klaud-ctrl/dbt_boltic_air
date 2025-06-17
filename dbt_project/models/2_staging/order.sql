select                                      
    cast("Order ID" as bigint)              as order_id,
    cast("Customer ID" as bigint)           as customer_id,
    cast("Trip ID" as bigint)               as trip_id,
    cast("Price (EUR)"as decimal(11,2))     as price_eur,
    cast("Seat No" as string)               as seat_number,
    cast("Status" as string)                as status
from {{ source('ingest_sap','raw_order') }}