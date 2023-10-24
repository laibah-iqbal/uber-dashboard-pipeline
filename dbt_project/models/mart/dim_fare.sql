with dim_fare as (
    
    select
        id, 
        fare_amount,
        CURRENT_TIMESTAMP as insert_datetime

    from {{ ref('staging_data') }}
    --group by 1
)

select * from dim_fare