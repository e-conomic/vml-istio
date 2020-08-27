# VML Istio
Istio config for Visma Machine Learning

At the moment updating and rolling out istio updates is a manual process.

*Requires istioctl, kustomize and kubectl*

To generate the istio config

cd istio-install
Make sure you're on the right cluster before doing this.

```bash
istioctl manifest generate -f istio-operator.yaml > istio-generated.yaml
kustomize build > istio-generated-kustomized.yaml
kubectl apply -f istio-generated-kustomized.yaml
```

watch -n istio-system pods while doing this, if they are rolling wait for them to completely roll and give them some time to do dns

When istio is done rolling restart the pods of our services

```
kubectl rollout restart deployment --namespace ssn
```

```
kubectl rollout restart deployment --namespace ssn
```

practice well on snbx and stage before doing this on production.
