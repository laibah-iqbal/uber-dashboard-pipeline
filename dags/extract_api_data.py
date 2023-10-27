from airflow import DAG
from airflow.operators.python import PythonOperator
from airflow.providers.postgres.operators.postgres import PostgresOperator
from random import randint
from datetime import datetime
import requests
import json
from ulid import ULID

# This function requests data from the API and sends it to an xcom
# for the postgres task to read from
def _extract(ti):
    url = "http://fastapi:80/synthesize"
    response = requests.get(url)
    data = response.json()
    ti.xcom_push(key="api_data", value=data)

# This function generates a unique primary key for each row
def get_primary_key(ti):
    ulid = str(ULID().to_uuid())
    ti.xcom_push(key="primary_key", value=ulid)

with DAG(
    "extract_api_data", 
    start_date=datetime(2023, 10, 22), 
    schedule_interval="0 * * * *", 
    catchup=False
) as dag:

    extract = PythonOperator(
        task_id="extract_from_api",
        python_callable=_extract
    )

    gen_primary_key = PythonOperator(
        task_id="generate_primary_key",
        python_callable=get_primary_key
    )

    # This task inserts a row into the postgres database
    insert_ride = PostgresOperator(
        task_id="insert_ride",
        postgres_conn_id="pg_conn",
        sql="sql/insert_ride.sql",
        database="postgres",
        autocommit=True
    )

    extract >> gen_primary_key >> insert_ride