with rides as (

    select
        id,
        pickup_datetime,
        CURRENT_TIMESTAMP as insert_datetime

    from {{ ref('staging_data') }}
    --group by 1,2
)

select * from rides