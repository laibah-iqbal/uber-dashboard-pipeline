with stg_data as (
    
    select
        id, 
        pickup_date as pickup_datetime, 
        passengers,
        fare_amount,
        pickup_latlong,
        dropff_latlong as dropoff_latlong,
        CURRENT_TIMESTAMP as insert_datetime

    from {{ source('uber','rides') }}
)

select * from stg_data
where passengers <= 6
and fare_amount is not null and fare_amount > 0
