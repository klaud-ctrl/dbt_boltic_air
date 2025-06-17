select
    "Order ID",
    "Customer ID",
    "Trip ID",
    "Price (EUR)",
    "Seat No",
    "Status"
from {{ source('ingest_sap','raw_order') }}