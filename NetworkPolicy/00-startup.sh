oc new-project poc-network-policy
oc new-app \
    -e MYSQL_USER=admin \
    -e MYSQL_PASSWORD=redhat \
    -e MYSQL_DATABASE=mysqldb \
    registry.redhat.io/rhscl/mysql-80-rhel7
mysql -u admin -predhat -h 10.131.2.143 mysqldb
