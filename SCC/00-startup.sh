oc login -u developer -p nopass https://api.poc1.rhocp.hkjc:6443

oc new-project authorization-scc

oc new-app --name gitlab \
  --docker-image gitlab/gitlab-ce:8.4.3-ce.0

oc get pods

oc logs pod/gitlab-xxxxxxxxxxx

oc create sa gitlab-sa

oc login -u admin -p redhat

oc adm policy add-scc-to-user anyuid -z gitlab-sa

oc login -u developer -p developer

oc set serviceaccount deployment gitlab gitlab-sa

oc get pods

oc expose service gitlab --port 80

oc get route gitlab