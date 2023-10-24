with dim_locations as (
    select
        id,
        cast(split_part(pickup_latlong,' , ',1) as float) as pickup_latitude,
        cast(split_part(pickup_latlong,' , ',2) as float) as pickup_longitude,
        cast(split_part(dropoff_latlong,' , ',1) as float) as dropoff_latitude,
        cast(split_part(dropoff_latlong,' , ',2) as float) as dropoff_longitude,
        CURRENT_TIMESTAMP as insert_datetime
        
    from {{ ref('staging_data') }}
    --group by 1

)

select * from dim_locations