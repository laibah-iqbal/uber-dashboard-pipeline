with dim_passengers as (
    select
        id,
        passengers,
        CURRENT_TIMESTAMP as insert_datetime
        
    from {{ ref('staging_data') }}
    --group by 1

)

select * from dim_passengers