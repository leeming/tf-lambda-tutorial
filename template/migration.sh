function debugcmd {
    1>&2 echo -e "[debugcmd] $1\n$($1)\n-"
}

function debug {
    1>&2 echo -e "[debug] $1\n-"
}

function handler () {
    set -e
    EVENT_DATA=$1


    ROOT_DIR=/opt
    LIB_DIR=${ROOT_DIR}/lib
    LIQUIBASE_HOME=${ROOT_DIR}/liquibase
    JDBC_DRIVER=${LIB_DIR}/postgres.jar
    LIQUIBASE_CMD=${LIQUIBASE_HOME}/liquibase
    LIQUIBASE_PROP=/tmp/liquibase.properties

    export PATH="$PATH:/opt"
    export AWS_CONFIG_FILE="/tmp/.aws/config"
    mkdir -p /tmp/.aws/

    debug "Creating properties file"
    ./create_liquibase_properties.sh > $LIQUIBASE_PROP

    debug "Running Liquibase"
    cd changelog
    ${LIQUIBASE_CMD} --classpath=${JDBC_DRIVER} --defaultsFile=${LIQUIBASE_PROP} validate
    $LIQUIBASE_CMD --classpath=${JDBC_DRIVER} --defaultsFile=${LIQUIBASE_PROP} update

    RESPONSE="{\"statusCode\": 200, \"body\": \"Success\"}"
    echo $RESPONSE
}