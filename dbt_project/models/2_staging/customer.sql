select
    cast("Customer ID" as bigint)                   as customer_id,
    cast("Name" as string)                          as name,
    cast("Customer Group ID" as bigint)             as customer_group_id,
    cast("Email" as string)                         as email,
    cast("Phone Number" as string)                  as phone_number
from {{ source('ingest_sap','raw_customer') }}