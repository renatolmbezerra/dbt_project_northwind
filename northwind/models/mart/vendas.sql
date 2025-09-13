{{ config(
  materialized='incremental',
  unique_key='id',
  on_schema_change='fail'
) }}

with vendas as (
    select
        *
    from
        {{ ref('stg_crm__new_table') }}
)

select * from vendas

{% if is_incremental() %}
where updated_at > (select coalesce(max(updated_at), '1970-01-01'::timestamp) from {{ this }})
{% endif %}