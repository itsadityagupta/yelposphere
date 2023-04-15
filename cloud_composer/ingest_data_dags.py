import datetime
from airflow import models
from airflow.operators import bash
from airflow.models import Variable
from airflow.hooks.base import BaseHook
from airflow.utils.dates import days_ago
from airflow.providers.google.cloud.sensors.gcs import GCSObjectExistenceSensor
from airflow.providers.google.cloud.operators.gcs import GCSDeleteObjectsOperator
from airflow.providers.google.cloud.operators.dataproc import DataprocSubmitJobOperator

PROJECT_ID = Variable.get("project_id")
REGION = Variable.get("region")

cloud_run_conn = BaseHook.get_connection("cloud_run")
cloud_run_app_url = cloud_run_conn.host

DATALAKE_URL = Variable.get("datalake_url")
DATALAKE = DATALAKE_URL[5:]

DATAPROC_CLUSTER = Variable.get("dataproc_cluster_name")
DATAPROC_TEMP_BUCKET = Variable.get("dataproc_temp_bucket")

INGEST_BUSINESS_FILE_PATH = Variable.get('ingest_business_data_script_uri')
INGEST_CHECKIN_FILE_PATH = Variable.get('ingest_checkin_data_script_uri')
INGEST_REVIEWS_FILE_PATH = Variable.get('ingest_reviews_data_script_uri')
INGEST_TIPS_FILE_PATH = Variable.get('ingest_tips_data_script_uri')
INGEST_USERS_FILE_PATH = Variable.get('ingest_users_data_uri')

BUSINESS_DATA = Variable.get("business_data")
CHECKIN_DATA = Variable.get("checkin_data")
REVIEWS_DATA = Variable.get("reviews_data")
TIPS_DATA = Variable.get("tips_data")
USERS_DATA = Variable.get("users_data")

BUSINESS_DATA_URI = f"{DATALAKE_URL}/{BUSINESS_DATA}"
CHECKIN_DATA_URI = f"{DATALAKE_URL}/{CHECKIN_DATA}"
REVIEWS_DATA_URI = f"{DATALAKE_URL}/{REVIEWS_DATA}"
TIPS_DATA_URI = f"{DATALAKE_URL}/{TIPS_DATA}"
USERS_DATA_URI = f"{DATALAKE_URL}/{USERS_DATA}"

INGEST_BUSINESS_FILE_URI = f"{DATALAKE_URL}/{INGEST_BUSINESS_FILE_PATH}"
INGEST_CHECKIN_FILE_URI = f"{DATALAKE_URL}/{INGEST_CHECKIN_FILE_PATH}"
INGEST_REVIEWS_FILE_URI = f"{DATALAKE_URL}/{INGEST_REVIEWS_FILE_PATH}"
INGEST_TIPS_FILE_URI = f"{DATALAKE_URL}/{INGEST_TIPS_FILE_PATH}"
INGEST_USERS_FILE_URI = f"{DATALAKE_URL}/{INGEST_USERS_FILE_PATH}"

BIGQUERY_STAGING_DATASET = Variable.get("bigquery_staging_dataset")
BIGQUERY_STAGING_BUSINESS_TABLE = Variable.get("bigquery_staging_business_table")
BIGQUERY_STAGING_CHECKIN_TABLE = Variable.get("bigquery_staging_checkin_table")
BIGQUERY_STAGING_REVIEWS_TABLE = Variable.get("bigquery_staging_reviews_table")
BIGQUERY_STAGING_TIPS_TABLE = Variable.get("bigquery_staging_tips_table")
BIGQUERY_STAGING_USERS_TABLE = Variable.get("bigquery_staging_users_table")

ingest_business_data_job = {
    "reference": {"project_id": PROJECT_ID},
    "placement": {"cluster_name": DATAPROC_CLUSTER},
    "pyspark_job": {
        "main_python_file_uri": INGEST_BUSINESS_FILE_URI,
        "args": [
            "--input", BUSINESS_DATA_URI,
            "--dataset", BIGQUERY_STAGING_DATASET,
            "--table", BIGQUERY_STAGING_BUSINESS_TABLE,
            "--tempGcsBucket", DATAPROC_TEMP_BUCKET
        ]
    }
}

ingest_checkin_data_job = {
    "reference": {"project_id": PROJECT_ID},
    "placement": {"cluster_name": DATAPROC_CLUSTER},
    "pyspark_job": {
        "main_python_file_uri": INGEST_CHECKIN_FILE_URI,
        "args": [
            "--input", CHECKIN_DATA_URI,
            "--dataset", BIGQUERY_STAGING_DATASET,
            "--table", BIGQUERY_STAGING_CHECKIN_TABLE,
            "--tempGcsBucket", DATAPROC_TEMP_BUCKET
        ]
    }
}

ingest_reviews_data_job = {
    "reference": {"project_id": PROJECT_ID},
    "placement": {"cluster_name": DATAPROC_CLUSTER},
    "pyspark_job": {
        "main_python_file_uri": INGEST_REVIEWS_FILE_URI,
        "args": [
            "--input", REVIEWS_DATA_URI,
            "--dataset", BIGQUERY_STAGING_DATASET,
            "--table", BIGQUERY_STAGING_REVIEWS_TABLE,
            "--tempGcsBucket", DATAPROC_TEMP_BUCKET
        ]
    }
}

ingest_tips_data_job = {
    "reference": {"project_id": PROJECT_ID},
    "placement": {"cluster_name": DATAPROC_CLUSTER},
    "pyspark_job": {
        "main_python_file_uri": INGEST_TIPS_FILE_URI,
        "args": [
            "--input", TIPS_DATA_URI,
            "--dataset", BIGQUERY_STAGING_DATASET,
            "--table", BIGQUERY_STAGING_TIPS_TABLE,
            "--tempGcsBucket", DATAPROC_TEMP_BUCKET
        ]
    }
}

ingest_users_data_job = {
    "reference": {"project_id": PROJECT_ID},
    "placement": {"cluster_name": DATAPROC_CLUSTER},
    "pyspark_job": {
        "main_python_file_uri": INGEST_USERS_FILE_URI,
        "args": [
            "--input", USERS_DATA_URI,
            "--dataset", BIGQUERY_STAGING_DATASET,
            "--table", BIGQUERY_STAGING_USERS_TABLE,
            "--tempGcsBucket", DATAPROC_TEMP_BUCKET
        ]
    }
}

default_args = {
    # Tell airflow to start one day ago, so that it runs as soon as you upload it
    "start_date": days_ago(1),
    "project_id": PROJECT_ID,
    "region": REGION,
    "retries": 1
}

with models.DAG(
        "process_yelp_data",  # The id you will see in the DAG airflow page
        default_args=default_args,  # The interval with which to schedule the DAG
        schedule_interval=datetime.timedelta(days=10),  # Override to match your needs
) as dag:
    
    get_data = bash.BashOperator(
        task_id="get_data_to_datalake",
        bash_command=f"gsutil -m cp gs://gcs_capstone_dezoomcamp/* {DATALAKE_URL}/data/raw"
    )

    business_data_exists = GCSObjectExistenceSensor(
        task_id="if_business_data_exists",
        bucket=DATALAKE,
        object=BUSINESS_DATA
    )

    ingest_business_data_job_submit = DataprocSubmitJobOperator(
        task_id="ingest_business_job_submit",
        job=ingest_business_data_job,
        region=REGION,
        project_id=PROJECT_ID
    )

    delete_business_data_file = GCSDeleteObjectsOperator(
        task_id="delete_business_data",
        bucket_name=DATALAKE,
        objects=[
            BUSINESS_DATA
        ]
    )

    checkin_data_exists = GCSObjectExistenceSensor(
        task_id="if_checkin_data_exists",
        bucket=DATALAKE,
        object=CHECKIN_DATA
    )

    ingest_checkin_data_job_submit = DataprocSubmitJobOperator(
        task_id="ingest_checkin_job_submit",
        job=ingest_checkin_data_job,
        region=REGION,
        project_id=PROJECT_ID
    )

    delete_checkin_data_file = GCSDeleteObjectsOperator(
        task_id="delete_checkin_data",
        bucket_name=DATALAKE,
        objects=[
            CHECKIN_DATA
        ]
    )

    reviews_data_exists = GCSObjectExistenceSensor(
        task_id="if_reviews_data_exists",
        bucket=DATALAKE,
        object=REVIEWS_DATA
    )

    ingest_reviews_data_job_submit = DataprocSubmitJobOperator(
        task_id="ingest_reviews_job_submit",
        job=ingest_reviews_data_job,
        region=REGION,
        project_id=PROJECT_ID
    )

    delete_reviews_data_file = GCSDeleteObjectsOperator(
        task_id="delete_reviews_data",
        bucket_name=DATALAKE,
        objects=[
            REVIEWS_DATA
        ]
    )

    tips_data_exists = GCSObjectExistenceSensor(
        task_id="if_tips_data_exists",
        bucket=DATALAKE,
        object=TIPS_DATA
    )

    ingest_tips_data_job_submit = DataprocSubmitJobOperator(
        task_id="ingest_tips_job_submit",
        job=ingest_tips_data_job,
        region=REGION,
        project_id=PROJECT_ID
    )

    delete_tips_data_file = GCSDeleteObjectsOperator(
        task_id="delete_tips_data",
        bucket_name=DATALAKE,
        objects=[
            TIPS_DATA
        ]
    )

    users_data_exists = GCSObjectExistenceSensor(
        task_id="if_users_data_exists",
        bucket=DATALAKE,
        object=USERS_DATA
    )

    ingest_users_data_job_submit = DataprocSubmitJobOperator(
        task_id="ingest_users_job_submit",
        job=ingest_users_data_job,
        region=REGION,
        project_id=PROJECT_ID
    )

    delete_users_data_file = GCSDeleteObjectsOperator(
        task_id="delete_users_data",
        bucket_name=DATALAKE,
        objects=[
            USERS_DATA
        ]
    )

    dbt_job_run = bash.BashOperator(
        task_id='run_dbt_job',
        bash_command=f'curl -H "Authorization: Bearer $(gcloud auth print-identity-token --audiences={cloud_run_app_url})" {cloud_run_app_url}'
        # The end point of the deployed Cloud Run container for DBT job
    )

    get_data >> [
        business_data_exists, 
        checkin_data_exists, 
        reviews_data_exists, 
        tips_data_exists, 
        users_data_exists
        ]

    business_data_exists >> ingest_business_data_job_submit >> delete_business_data_file
    checkin_data_exists >> ingest_checkin_data_job_submit >> delete_checkin_data_file
    reviews_data_exists >> ingest_reviews_data_job_submit >> delete_reviews_data_file
    tips_data_exists >> ingest_tips_data_job_submit >> delete_tips_data_file
    users_data_exists >> ingest_users_data_job_submit >> delete_users_data_file

    [delete_business_data_file,
     delete_checkin_data_file,
     delete_reviews_data_file,
     delete_tips_data_file,
     delete_users_data_file] >> dbt_job_run
