# YelpoSphere: An end-to-end data pipeline on GCP



3. Clone the repo
2. terraform apply
3. terraform output -json > ../tf_output.json
4. cd ..
5. python utils/get_variables.py --input tf_output.json --output  airflow_variables.json
6. upload airflow_variables.json to airflow UI
7. add 4 more variables to airflow