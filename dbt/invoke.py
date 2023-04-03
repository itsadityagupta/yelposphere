import subprocess
import logging
import os

from flask import Flask

app = Flask(__name__)


@app.route("/")
def run_dbt():
    logging.info("Received a request. Running DBT commands...")
    result_code = subprocess.call(["script.sh"], timeout=300)
    return result_code


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=int(os.environ.get("PORT", 8080)))
