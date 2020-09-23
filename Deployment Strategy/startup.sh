oc new-project coolstore
oc process -f https://raw.githubusercontent.com/takleung/coolstore-microservice/stable-ocp-3.11/openshift/coolstore-template.yaml | oc create -f -
oc tag quay.io/tyip/catalog-green:green catalog-green:green
oc tag quay.io/tyip/catalog-green:green catalog-green:green
oc tag quay.io/tyip/catalog-green:green catalog-blue:blue
oc apply -n coolstore -f catalog-blue-svc.yaml
oc apply -n coolstore -f catalog-green-svc.yaml

oc tag quay.io/tyip/web-ui:latest web-ui:latest
oc tag quay.io/tyip/cart:latest cart:latest
oc tag quay.io/tyip/coolstore-gw:latest coolstore-gw:latest
oc tag quay.io/tyip/rating:latest rating:latest
oc tag quay.io/tyip/cart:latest cart:latest
oc tag quay.io/tyip/pricing:latest pricing:latest
oc tag quay.io/tyip/review:latest review:latest
oc tag quay.io/tyip/inventory:latest inventory:latest
oc tag quay.io/tyip/hystrix-dashboard:latest hystrix-dashboard:latest

oc start-build -n cicd-ray catalog-pipeline

oc new-project poc-rollback
oc rollout latest dc/httpd-example -n poc-rollback
oc rollback httpd-example -n poc-rollback
oc rollback httpd-example --to-version=1 -n poc-rollback