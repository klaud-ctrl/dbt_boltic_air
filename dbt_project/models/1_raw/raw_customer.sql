select
    "Customer ID",
    "Name",
    "Customer Group ID",
    "Email",
    "Phone Number"
from {{ source('ingest_sap','raw_customer') }}