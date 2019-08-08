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

