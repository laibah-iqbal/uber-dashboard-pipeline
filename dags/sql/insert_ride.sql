{% set data = ti.xcom_pull(key="api_data", task_ids="extract_from_api") %}
{% set pid = ti.xcom_pull(key="primary_key", task_ids="generate_primary_key") %}

INSERT INTO uber.rides
VALUES
('{{pid}}', 
{{data["fare_amount"]}},
'{{data["pickup_datetime"]}}',
{{data["passenger_count"]}},
'{{data["pickup lat long"]}}',
'{{data["dropoff lat long"]}}',
'{{data["created_at"]}}'
);