#!/usr/bin/env bash

# TODO  port-forward argocd
yes | argocd login localhost:8080 --username admin --password $ARGO_ADMIN_PW
