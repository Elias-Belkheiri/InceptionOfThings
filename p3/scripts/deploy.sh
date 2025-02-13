#!/bin/bash

kubectl wait --for=condition=available --timeout=9000s deployment/argocd-server -n argocd

ARGOCD_PASS=$(kubectl get secret argocd-initial-admin-secret -n argocd -o yaml | grep pass | awk '{print $2}' | base64 -d)

GREEN='\033[0;32m'
NC='\033[0m' # No Color

log 0 "${GREEN}ArgoCD and application ready to use${NC}"
echo ""
log 0 "  ➜  Local:\t${GREEN}http://localhost:9999/${NC}"
log 0 "  ➜  user:\t${GREEN}admin${NC}"
log 0 "  ➜  password:\t${GREEN}$ARGOCD_PASS${NC}"

kubectl port-forward -n argocd svc/argocd-server 9999:443