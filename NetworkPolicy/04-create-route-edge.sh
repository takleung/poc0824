oc delete route web-ui
oc expose svc/web-ui --name web-ui-without-ssl
oc create route edge --service=web-ui