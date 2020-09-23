oc new-project poc-create-https
oc delete route httpd-example
oc expose svc/httpd-example --name httpd-example-without-https -n poc-create-https
oc create route edge --service=httpd-example -n poc-create-https