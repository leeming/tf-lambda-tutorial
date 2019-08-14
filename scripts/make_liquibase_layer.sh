#!/bin/bash

ROOT_DIR=$1"liquibase-layer"
LIB_DIR=${ROOT_DIR}/lib
LIQUIBASE_HOME=${ROOT_DIR}/liquibase
JDBC_DRIVER=${LIB_DIR}/postgres.jar

if [ ! -f "${LIQUIBASE_HOME}/liquibase" ]; then
    mkdir -p ${LIQUIBASE_HOME}
    curl -s -L -o ${ROOT_DIR}/liquibase.zip https://github.com/liquibase/liquibase/releases/download/liquibase-parent-3.5.5/liquibase-3.5.5-bin.zip
    unzip -q ${ROOT_DIR}/liquibase.zip -d ${LIQUIBASE_HOME}
    rm ${ROOT_DIR}/liquibase.zip
fi

if [ ! -f "${JDBC_DRIVER}" ]; then
    mkdir -p ${LIB_DIR}
    curl -s -o ${JDBC_DRIVER} https://jdbc.postgresql.org/download/postgresql-42.2.5.jar
fi

echo $ROOT_DIR