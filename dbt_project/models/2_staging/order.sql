select
    * -- apply cast & snake case names
from {{ ref('raw_order') }}