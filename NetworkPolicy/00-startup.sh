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

********* batch script *********
oc expose svc/httpd-example --name httpd-example-without-https -n poc-create-https
oc create route edge --service=httpd-example -n poc-create-https
oc get namespace coolstore -o jsonpath='{.metadata.name}{" "}{.metadata.creationTimestamp}{"\n"}'
oc exec \
    $(oc get pods -n coolstore -l deploymentconfig=catalog -o jsonpath='{range .items[*]}{.metadata.name}{end}') \
    -n coolstore \
    -- curl \
    $(oc get pods -n coolstore -l deploymentconfig=inventory -o jsonpath='{range .items[*]}{.status.podIP}{":8080"}{end}')

oc exec \
    $(oc get pods -n poc-network-policy -l deploymentconfig=httpd-example -o jsonpath='{range .items[*]}{.metadata.name}{end}') \
    -n poc-network-policy \
    -- curl \
    $(oc get pods -n coolstore -l deploymentconfig=catalog -o jsonpath='{range .items[*]}{.status.podIP}{":8080"}{end}') \

cat <<EOF | oc create -f -
kind: NetworkPolicy
apiVersion: networking.k8s.io/v1
metadata:
  name: deny-by-default
  namespace: coolstore
spec:
  podSelector:
  ingress: []
EOF

cat <<EOF | oc create -f -
kind: NetworkPolicy
apiVersion: networking.k8s.io/v1
metadata:
  name: allow-same-namespace
  namespace: coolstore
spec:
  podSelector:
  ingress:
  - from:
    - podSelector: {}
EOF

cat <<EOF | oc create -f -
kind: NetworkPolicy
apiVersion: networking.k8s.io/v1
metadata:
  name: allow-http-8080
  namespace: coolstore
spec:
  podSelector:
    matchLabels:
      role: frontend
  ingress:
  - ports:
    - protocol: TCP
      port: 8080
EOF      

