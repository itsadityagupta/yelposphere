from pyspark.sql import SparkSession
from pyspark.sql.types import StructType, StructField, StringType, TimestampType, IntegerType
from argparse import ArgumentParser

parser = ArgumentParser()

parser.add_argument("--input", required=True, help='GCS file path to the input business JSON file')
parser.add_argument("--dataset", required=True, help='BigQuery dataset name')
parser.add_argument("--table", required=True)
parser.add_argument("--tempGcsBucket", required=True)
parser.add_argument("--dateFormat", default='yyyy-MM-dd HH:mm:ss')

args = parser.parse_args()

spark = SparkSession \
        .builder \
        .appName('ingest_tips_data') \
        .getOrCreate()

tip_schema = StructType([
    StructField("business_id", StringType(), True),
    StructField("user_id", StringType(), True),
    StructField("date", TimestampType(), True),
    StructField("text", StringType(), True),
    StructField("compliment_count", IntegerType(), True)
])

df = spark \
    .read \
    .option('dateFormat', args.dateFormat) \
    .schema(tip_schema) \
    .json(args.input)

df \
    .write \
    .format('bigquery') \
    .option("table", f"{args.dataset}.{args.table}") \
    .option("temporaryGcsBucket", f"{args.tempGcsBucket}") \
    .mode('overwrite') \
    .save()
