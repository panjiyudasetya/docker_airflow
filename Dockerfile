FROM apache/airflow:2.10.2

# Switch to the `root` user for adding new apt packages
USER root

# Install git is required to sync Airflow dag and plugins
# from external repositories
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git

# Register the symbolic links of the dataflow dag and it's plugins to the Python path
ENV PYTHONPATH "${PYTHONPATH}:/opt/airflow/dags/dataflow_dag:/opt/airflow/plugins/dataflow_plugins"

# Add working directories to the Airflow
WORKDIR /opt/airflow
ADD . /opt/airflow

# Grant access write permission for the `airflow` user
# to the `dag` and `plugins` directories
RUN chown -R airflow /opt/airflow
RUN chown -R airflow /opt/airflow

# Switch back to the `airflow` user for adding new PyPI packages individually
USER airflow

# Install extra dependencies
RUN ./scripts/install_requirements.sh
