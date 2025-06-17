select
    "Trip ID",
    "Origin City",
    "Destination City",
    "Airplane ID",
    "Start Timestamp",
    "End Timestamp"    
from {{ source('ingest_sap','raw_trip') }}