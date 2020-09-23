skopeo copy \
  docker://default-route-openshift-image-registry.apps.poc1.rhocp.hkjc/coolstore/pricing:latest \
  docker://quay.apps.poc1.rhocp.hkjc/quay/pricing:v1 \
  --src-creds admin:Acb3JEWE0eoOs-3poU7pfZLX3joL_LnHsWLhX85noAI \
  --dest-creds quay:password \
  --src-tls-verify=false \
  --dest-tls-verify=false

skopeo copy \
  docker://image-registry-openshift-image-registry.apps.tyip.hklab-redhat.com/coolstore/catalog:green \
  docker://quay.io/tyip/catalog:green \
  --src-creds "ray:zSPHzjF4h5Yy_dOPZsFywwmAHo4ShKh2OmG67QPeErA" \
  --dest-creds "tyip:68rM5YTGyF99" \
  --src-tls-verify=false \
  --dest-tls-verify=false