/*  Home Task comment: 
    - add business_line for future merge with other business lines and overall business performance
    - sorting columns
        - IDs first
        - logical order / business user centric
        - measure last
*/
select
    order_id,
    trip_id,
    customer_id,
    business_line,
    seat_number,
    status,
    price_eur
from {{ref('order')}}