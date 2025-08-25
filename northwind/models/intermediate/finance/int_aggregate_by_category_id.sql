with int_aggregate_by_category_id as (
    select
        id,
        count(*) as total_orders
    from {{ ref('stg_crm__new_table') }}
    group by id
)

select * from int_aggregate_by_category_id