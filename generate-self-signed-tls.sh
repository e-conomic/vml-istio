#!/bin/bash

CURRENT_PROJECT=$(gcloud config get-value project)

echo "setting project to ops"
gcloud config set project dev-vml-cm

gcloud secrets versions access latest --secret=istio-self-signed-tls-crt > tls.crt
gcloud secrets versions access latest --secret=istio-self-signed-tls-key > tls.key

gcloud container clusters get-credentials vml --zone europe-west1 --project snbx-vml-vcdm
CERT=$(cat tls.crt)$'\n'$USER_TRUST_CA_BUNDLE
cat > self-signed-tls.yaml <<EOF
apiVersion: v1
kind: Secret
metadata:
  name: self-signed-tls
  namespace: istio-system
type: Opaque
data:
  tls.key: $(base64 tls.key)
  tls.crt: $(echo "$CERT" | base64)
EOF
cat self-signed-tls.yaml | kubeseal --format yaml > manifests/snbx-self-signed-tls-sealed.yaml
echo manifests/snbx-self-signed-tls.yaml

gcloud container clusters get-credentials vml --zone europe-west1 --project stage-vml-vcdm
CERT=$(cat tls.crt)$'\n'$USER_TRUST_CA_BUNDLE
cat > self-signed-tls.yaml <<EOF
apiVersion: v1
kind: Secret
metadata:
  name: self-signed-tls
  namespace: istio-system
type: Opaque
data:
  tls.key: $(base64 tls.key)
  tls.crt: $(echo "$CERT" | base64)
EOF
cat self-signed-tls.yaml | kubeseal --format yaml > manifests/stag-self-signed-tls-sealed.yaml
echo manifests/stag-self-signed-tls.yaml


gcloud container clusters get-credentials vml --zone europe-west1 --project prod-vml-vcdm
CERT=$(cat tls.crt)$'\n'$USER_TRUST_CA_BUNDLE
cat > self-signed-tls.yaml <<EOF
apiVersion: v1
kind: Secret
metadata:
  name: self-signed-tls
  namespace: istio-system
type: Opaque
data:
  tls.key: $(base64 tls.key)
  tls.crt: $(echo "$CERT" | base64)
EOF
cat self-signed-tls.yaml | kubeseal --format yaml > manifests/prod-self-signed-tls-sealed.yaml
echo manifests/prod-self-signed-tls.yaml

rm tls.crt
rm tls.key
rm self-signed-tls.yaml
gcloud container clusters get-credentials vml --zone europe-west1 --project snbx-vml-vcdm
