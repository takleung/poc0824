oc new-project poc-network-policy
oc new-app \
    -e MYSQL_USER=admin \
    -e MYSQL_PASSWORD=redhat \
    -e MYSQL_DATABASE=mysqldb \
    registry.redhat.io/rhscl/mysql-80-rhel7
mysql -u admin -predhat -h 172.30.18.21 mysqldb
mysql -u admin -predhat -h 10.129.2.25 mysqldb


oc new-app httpd
172.30.46.103:8080
10.131.1.104:8080

