import os
import subprocess
from flask import Flask

app = Flask(__name__)


@app.route("/")
def run_dbt_commands():
    try:
        subprocess.check_call(["/bin/sh", "script.sh"])
        return "Executed DBT Commands successfully."
    except subprocess.CalledProcessError as e:
        print("Error executing DBT commands.", e)


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=int(os.environ.get("PORT", 8080)))
