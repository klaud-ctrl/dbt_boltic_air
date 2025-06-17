select
    * -- apply cast & snake case names (see ERM file)
from {{ ref('raw_trip') }}