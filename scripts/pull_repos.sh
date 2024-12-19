#!/bin/bash

# Setup project directory and load bitbucket secrets
PROJECT_DIR=`pwd`


function pull_common_dags {
    # Change directory to the `dags` location.
    cd $PROJECT_DIR/dags

    # Change this branch to your working branch for testing your DAGs locally.
    # Default branch is set to a `develop`.
    DAG_BRANCH='develop'

    # Cleanup existing dataflow dag repository.
    rm -rf $PROJECT_DIR/dags/dataflow_dag

    # Clone to the repository and checkout to your working branch.
    git clone -b $DAG_BRANCH git@github.com:panjiyudasetya/common_dags.git

    # Change directory back to the working directory,
    cd $PROJECT_DIR
}


function pull_customer_dags {
    # Change directory to the `dags` location.
    cd $PROJECT_DIR/dags

    # Change this branch to your working branch for testing your DAGs locally.
    # Default branch is set to a `develop`.
    DAG_BRANCH='develop'

    # Cleanup existing dataflow dag repository.
    rm -rf $PROJECT_DIR/dags/dataflow_dag

    # Clone to the repository and checkout to your working branch.
    git clone -b $DAG_BRANCH git@github.com:panjiyudasetya/customer_dags.git

    # Change directory back to the working directory,
    cd $PROJECT_DIR
}


function main {
    echo "Pulls common dags from Github repository..."
    pull_common_dags

    echo ""

    echo "Pulls customer dags from Github repository..."
    pull_customer_dags
}


main