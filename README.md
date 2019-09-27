# VML Istio
Istio config for Visma Machine Learning

To generate the istio config

```bash
helm \
  template istio/install/kubernetes/helm/istio \
  --name istio --namespace istio-system \
  -f values.yaml \
  > ~/code/vml/ssn-terraform/manifests/istio/istio-helm-generated.yaml
```

For init file

```
helm template istio/install/kubernetes/helm/istio-init --name istio-init --namespace istio-system > ~/code/vml/ssn-terraform/manifests/istio/init.yaml
```
```bash
cd to terraform and
kubectl apply -f manifests/istio/init.yaml
```
watch -n istio-system pods while doing this, if they are rolling wait for them to completely roll and give them some time to do dns
```bash
kubectl apply -f manifests/istio/istio-helm-generated.yaml
```
watch -n istio-system pods while doing this, if they are rolling wait for them to completely roll and give them some time to do dns

when istio is done rolling do:

```
kubectl rollout restart deployment --namespace ssn
```

practice well on snbx and stage before doing this on production.

NOTE: the script need `jq`
