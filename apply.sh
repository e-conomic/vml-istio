
kubectl apply -f ../ssn-annotator/manifests/annotator.yaml
kubectl -n ssn set image deploy/annotator annotator=eu.gcr.io/dev-vml-cm/ssn-annotator:master

kubectl apply -f ../ssn-dataservice/manifests/dataservice.yaml
kubectl -n ssn set image deploy/dataservice dataservice=eu.gcr.io/dev-vml-cm/ssn-dataservice:master

kubectl apply -f ../asgt-cserving/manifests/jester.yaml
kubectl -n ssn set image deploy/jester jester=eu.gcr.io/dev-vml-cm/asgt-cserving:master

kubectl apply -f ../asgt-meta-data/manifests/meta-data.yaml
kubectl -n ssn set image deploy/meta-data meta-data=eu.gcr.io/dev-vml-cm/asgt-meta-data:master