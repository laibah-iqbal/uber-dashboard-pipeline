with dim_pickuptime as (
    select
        id,
        date_part('day',pickup_datetime) as day,
        date_part('month',pickup_datetime) as month,
        date_part('year',pickup_datetime) as year,
        date_part('hour',pickup_datetime) as hour,
        date_part('minute', pickup_datetime) as minute,
        date_part('second', pickup_datetime) as second,
        date_part('dow', pickup_datetime) as dow    
    from {{ ref('staging_data') }}
    --group by 1

)

select *,
cast(concat(month,'-',day,'-',year) as date) as date_,
cast(concat(hour,':',minute,':',second) as time) as time_

from dim_pickuptime