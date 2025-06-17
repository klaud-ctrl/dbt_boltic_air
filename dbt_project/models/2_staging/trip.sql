select
    * -- apply cast & snake case names (see ERM file)
from {{ source('ingest_sap','raw_trip') }}