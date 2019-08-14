aws configure set default.region eu-west-2


APP_Username=$(aws ssm get-parameter ... )
APP_Password=$(aws ssm get-parameter ... )
APP_Schema=$(aws ssm get-parameter ... )
API_Database=$(aws ssm get-parameter ... )
ADMIN_Username=$(aws ssm get-parameter ... )
ADMIN_Password=$(aws ssm get-parameter ... )
Host=$(aws ssm get-parameter ... )

echo "
parameter.super_user=${ADMIN_Username}
parameter.app_user=${APP_Username}
parameter.app_password=${APP_Password}
parameter.app_schema=${APP_Schema}
changeLogFile=${changelogFile}
username=${ADMIN_Username}
password=${ADMIN_Password}
url=jdbc:postgresql://${Host}:5432/${API_Database}
classpath=/opt/jdbc/postgres-jdbc.jar
driver=org.postgresql.Driver
databaseChangeLogTableName=${changelogTable}
databaseChangeLogLockTableName=${changelogTable}lock
"