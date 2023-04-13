from diagrams import Diagram, Cluster
from diagrams.gcp.analytics import Dataproc
from diagrams.gcp.storage import GCS
from diagrams.gcp.compute import Run
from diagrams.custom import Custom
from diagrams.gcp.devtools import Build, ContainerRegistry
from diagrams.gcp.analytics import BigQuery, Composer

graph_attr = {
    "fontsize": "20"
}

cluster_attr = {
    "fontsize": "16"
}

with Diagram("Yelposphere Architecture Diagram", graph_attr=graph_attr):
    with Cluster("Cloud Composer Environment", graph_attr=cluster_attr):
        with Cluster(""):
            gcs = GCS("GCS")
            dataproc = Dataproc("Dataproc")
            bigquery = BigQuery("BigQuery")
            run = Run("Cloud Run")

        composer = Composer("Cloud Composer")

    build = Build("Cloud Build")
    registry = ContainerRegistry("Artifact Registry")
    repo = Custom("Github Repo", "repo.png")
    data_studio = Custom("", "datastudio.png")

    gcs >> dataproc >> bigquery << run
    run << registry
    registry << build
    build << repo
    bigquery >> data_studio
