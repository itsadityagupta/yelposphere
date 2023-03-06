from pyspark.sql import SparkSession
from pyspark.sql.types import StructType, StructField, StringType, FloatType, IntegerType
from argparse import ArgumentParser

parser = ArgumentParser()

parser.add_argument("--input", required=True, help='GCS file path to the input business JSON file')
parser.add_argument("--dataset", required=True, help='BigQuery dataset name')
parser.add_argument("--table", required=True)
parser.add_argument("--tempGcsBucket", required=True)

args = parser.parse_args()

spark = SparkSession \
        .builder \
        .appName('ingest_checkin_data') \
        .getOrCreate()

checkin_schema = StructType([
    StructField("business_id", StringType(), True),
    StructField("date", StringType(), True)
])

df = spark \
    .read \
    .schema(checkin_schema) \
    .json(args.input)

df \
    .write \
    .format('bigquery') \
    .option("table", f"{args.dataset}.{args.table}") \
    .option("temporaryGcsBucket", f"{args.tempGcsBucket}") \
    .mode('overwrite') \
    .save()
