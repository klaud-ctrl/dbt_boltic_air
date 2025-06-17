select
    cast("ID" as bigint)                        as customer_group_id,
    cast("Type" as string)                      as type,
    cast("Name" as string)                      as name,
    cast("Registry number" as string)           as registry_number
from {{ ref('raw_customer_group') }}