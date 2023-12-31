# ETL pipeline for Uber Dashboard
An ETL pipeline that extracts Uber rides data from an API, stores it, transforms and ultimately makes it available to a Metabase dashboard for visualization.
![image](https://github.com/laibah-iqbal/uber-dashboard-pipeline/assets/67593507/6aaf2f2a-8a7d-4c51-aad9-bb93d217f06c)

[Dashboard Link](http://34.132.138.240:3000/public/dashboard/542592a5-7bf5-4b18-aee9-8f26bdff73f8)

### Motivation: ###
My motivation was to have a more hands-on learning experience with some of the common tools used in modern data stacks. Although the pipeline and data modelling is simple, I learned a lot which will be foundational to any future projects.  

### Architecture: ###
![image](https://github.com/laibah-iqbal/uber-dashboard-pipeline/assets/67593507/dcc17a56-30c2-4d44-ba5b-b58e0a85b769)

- **FastAPI** I used a synthetic data generator model using the python package SDV and created an API using FastAPI. This is because I wanted data that was similar to actual business data and could be used to create a dashboard that could be relevant to business use cases.
- **Airflow** I used Airflow to orchestrate jobs. There were 2 DAGS: one to extract data from the API and load it into postgreSQL database, and the second DAG to trigger dbt so it could run tests on the raw data and build models to transform the data.
- **dbt** I used dbt to run basic tests on the raw data and then transform it into a star schema.
- **PostgreSQL** I used postgreSQL as the data warehouse.
- **Metabase** I chose it as the visualization layer due to how easy it is to connect to the database and create a dashboard for sharing.
- **Docker** All tools were running as services on their own Docker containers. Docker compose makes it very convenient to tear down and restart the pipeline and for services to communicate over the network.
- **Terraform** I used Terraform since it conveniently starts a GCP VM. I chose the type of GCP instance by experimenting with required disk space and RAM.

### Future Work: ###
1. I didn't employ CI/CD practices in this project. If I revisit this project, I'll use Github Actions.
2. Testing was only done at the start of the pipeline. I didn't conduct any data quality checks at the end before visualizing.



