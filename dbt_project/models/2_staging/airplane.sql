select
    cast("Airplane ID" as string)           as airplane_id ,
    cast("Airplane Model" as string)        as airplane_model ,
    cast("Manufacturer"  as string)         as manufacturer
from {{ source('ingest_sap','raw_airplane') }}