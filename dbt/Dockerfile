FROM ghcr.io/dbt-labs/dbt-bigquery:1.4.1
WORKDIR /dbt
COPY . ./

ENV GCP_PROJECT=dtc-de-zoomcamp-2023
ENV DBT_DATASET=yelp_dbt
ENV PORT=8080

EXPOSE $PORT

RUN pip install --no-cache-dir -r requirements.txt

CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 invoke:app