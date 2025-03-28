# Openshift Nginx Keda Autoscaling with Prometheus

This is a simple guide how to setup a nginx server with prometheus exporter (excluding opearator and keda controller deployment).`ghcr.io/ks-no/openshift-nginx/fiks-nginx-openshift:1.9.0` nginx image is used in the setup because it is made with Openshift rootless requirements in mind. The testing includes running 1 or 2 scripts against the server to check it's autoscaling behaivour. Feel free to adjust values in `scaled-object.yaml` to check different autoscaling scenarios as well as `interval` value in `nginx-service-monitor.yaml` to adjust it for your own needs. 

#### Nginx Deployment and Configuration
```shell
oc new-project <namespace>

oc label namespace <namespace> openshift.io/cluster-monitoring=true 

oc apply -f nginx-configmap.yaml

oc apply -f nginx-service.yaml

oc apply -f nginx-deployment.yaml

oc apply -f nginx-service-monitor.yaml

oc expose service nginx

oc get route #use the URL in the load generator scripts
```

#### Autoscaling Configuration
```bash
oc create serviceaccount <serviceaccount>

oc create -f secret.yaml

oc create -f auth.yaml

oc create -f metrics-role.yaml

oc create -f role-binding.yaml

oc apply -f scaled-object.yaml
```

#### Testing the Setup
```shell
chmod +x load-generator1.sh

chmod +x load-generator2.sh

./load-generator1.sh 

./load-generator2.sh #depending on the expected workload

watch -n 0.2 oc get pods OR while true; do clear; oc get pods; sleep 1; done

oc get hpa -w
```
