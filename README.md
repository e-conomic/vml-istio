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

```
bash upgrade-sidecar.sh ssn
```

NOTE: the script need `jq`
