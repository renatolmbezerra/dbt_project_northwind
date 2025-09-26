
with sources as (

  select * from {{ source('northwinddb', 'customers') }}

)

select 
    id as customers_id,
    name,
    email
from sources