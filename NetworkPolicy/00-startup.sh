oc new-project poc-network-policy
oc new-app \
    -e MYSQL_USER=admin \
    -e MYSQL_PASSWORD=redhat \
    -e MYSQL_DATABASE=mysqldb \
    registry.redhat.io/rhscl/mysql-80-rhel7

********* poc-network-policy *********
mysql -u admin -predhat -h 172.30.18.21 mysqldb
mysql -u admin -predhat -h 10.129.2.25 mysqldb

oc new-app httpd
172.30.46.103:8080
10.131.1.104:8080

********* coolstore *********
172.30.120.110:8080
10.128.4.13:8080

mysql -u admin -predhat -h 10.129.2.27 mysqldb
mysql -u admin -predhat -h 172.30.108.31 mysqldb



