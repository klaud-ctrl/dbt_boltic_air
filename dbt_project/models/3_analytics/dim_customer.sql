/*  Home Task comment: 
    - add customer_group to type etc for making clear which type we are talking about
*/
with add_groups as (
    select 
        c.customer_id,
        c.name,        
        c.email,
        cg.type                as customer_group_type,
        cg.name                as customer_group_name,
        cg.registry_number     as customer_group_registry_number,
        cg.phone_number
    from {{ref('customer')}} as c
    left join {{ref('customer')}} as cg
        on c.customer_group_id = cg.customer_group_id
)
select
    customer_id,
    name,        
    email,
    type                as customer_group_type,
    name                as customer_group_name,
    registry_number     as customer_group_registry_number,
    phone_number
from add_groups