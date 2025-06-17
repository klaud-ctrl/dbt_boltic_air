select
    "ID",
    "Type",
    "Name",
    "Registry number"
from {{ source('ingest_sap','raw_customer_group') }}