/*  Home Task comment: 
    - stating of kg and nautic miles
*/
with add_airplane_models as (    
    select
        a.airplane_id,
        a.airplane_model,
        a.manufacturer,
        am.max_seats,
        am.max_weight_kg,
        am.max_distance_nmi,
        am.engine_type
    from {{ ref('airplane')}} as a
    left join {{ ref('airplane_model')}} as am
        on  a.manufacturer      = am.manufacturer
        and a.airplane_model    = am.airplane_model
)   
select
    airplane_id,
    manufacturer,
    airplane_model,
    max_seats,
    max_weight_kg,
    max_distance_nmi,
    engine_type
from add_airplane_models