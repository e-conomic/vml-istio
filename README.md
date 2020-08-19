# VML Istio
Istio config for Visma Machine Learning

To generate the istio config

cd istio-install

```bash
istioctl manifest generate -f istio-operator.yaml > istio-generated.yaml
kustomize build > ~/code/vml/ssn-terraform/manifests/istio/istio-generated-kustomized.yaml
```
When files have been moved to terraform repo let *Atlantis* plan and apply to environments.

watch -n istio-system pods while doing this, if they are rolling wait for them to completely roll and give them some time to do dns

When istio is done rolling restart the pods of our services

```
kubectl rollout restart deployment --namespace ssn
```

```
kubectl rollout restart deployment --namespace ssn
```

practice well on snbx and stage before doing this on production.
