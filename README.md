# Openshift Nginx Keda Autoscaling With Prometheus

It is a simple guide how to setup a nginx server with prometheus exporter.

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

watch -n 0.2 oc get pods / while true; do clear; oc get pods; sleep 1; done

oc get hpa -w
```#### Nginx Deployment and Configuration
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

watch -n 0.2 oc get pods / while true; do clear; oc get pods; sleep 1; done

oc get hpa -w
```