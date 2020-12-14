# VML Istio

### Installing new istioctl
To download new versions of istioctl the following command can be used.
 ```bash
 curl -L https://istio.io/downloadIstio | ISTIO_VERSION=x.x.x sh -
 sudo cp istio-x.x.x/bin/istioctl /usr/local/bin
 rm -rf istio-x.x.x
 ```

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


# Self signed certificate
Can be sealed to a sealed secret using `generate-self-signed-tls.sh` if clusters are completely wiped(Eg. business continuity plan testing new secrets will need to be generated.)



