select
    "Airplane ID",
    "Airplane Model",
    "Manufacturer"
from {{ source('ingest_sap','airplane') }}