#!/usr/bin/env bash

# TODO  port-forward argocd
ARGO_ADMIN_PW=`k8sec list -n argocd | grep initial | awk '{print $4}' | tr -d '"'`

yes | argocd login localhost:8080 --username admin --password $ARGO_ADMIN_PW
