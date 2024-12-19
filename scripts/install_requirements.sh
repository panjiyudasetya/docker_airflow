#!/bin/bash

# Extract the version of Python installed within a Docker container.
PYTHON_VERSION="$(python -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')"

CONSTRAINT_URL="https://raw.githubusercontent.com/apache/airflow/constraints-${AIRFLOW_VERSION}/constraints-${PYTHON_VERSION}.txt"

pip3 install "apache-airflow[postgres,slack]==${AIRFLOW_VERSION}" --constraint "${CONSTRAINT_URL}"

#
# Install additional requirements.
#
pip3 install -r requirements.txt
