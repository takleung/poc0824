oc login -u admin -p nopass https://api.poc1.rhocp.hkjc:6443

oc get clusterrolebinding -o wide \
    | grep -E 'NAME|self-provisioner'

oc describe clusterrolebindings self-provisioners

oc adm policy remove-cluster-role-from-group  \
    self-provisioner system:authenticated:oauth

oc describe clusterrolebindings self-provisioners

oc get clusterrolebinding -o wide \
    | grep -E 'NAME|self-provisioner'

oc login -u leader -p nopass

oc new-project test

oc login -u admin -p nopass

oc new-project authorization-rbac

oc policy add-role-to-user admin leader

oc adm groups new dev-group

oc adm groups add-users dev-group developer
de
oc adm groups new qa-group

oc adm groups add-users qa-group qa-engineer

oc get groups

oc login -u leader -p nopass

oc policy add-role-to-group edit dev-group

oc policy add-role-to-group view qa-group

oc get rolebindings -o wide

oc login -u developer -p developer

oc new-app --name httpd httpd:2.4

oc policy add-role-to-user edit qa-engineer

oc login -u qa-engineer -p nopass

oc scale deployment httpd --replicas 3

oc login -u admin -p nopass

oc adm policy add-cluster-role-to-group \
  --rolebinding-name self-provisioners \
  self-provisioner system:authenticated:oauth