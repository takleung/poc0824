oc exec skopeo-bp3rq -- \
    skopeo copy \
    docker://default-route-openshift-image-registry.apps.poc1.rhocp.hkjc/coolstore/pricing:latest \
    docker://quay.apps.poc1.rhocp.hkjc/quay/pricing:latest \
    --src-creds admin:Rh7LZK3Z-9xGaGtgGDVCgPkyqGOipSdCq8eOB_uJF3A \
    --dest-creds quay:password \
    --src-tls-verify=false \
    --dest-tls-verify=false

