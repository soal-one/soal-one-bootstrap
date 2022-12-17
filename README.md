# Bootstrappable Cloud Computing Laboratory

First take a look at the k0s.yaml configuration and change it to your liking.
Then:
```bash

```


## Quick Start

```
make bootstrap
make argo-password # Returns the admin argo password
# Port forward argocd here
argocd login localhost:8080
# Add your repository to argocd via Make target
make argo-add-config-repo


```

## Project Anatomy

```
├── bootstrap.sh -> Install argocd, create projects and self-manage argocd
├── meta-apps -> App of apps, one per environment
├── production
├── README.md
├── script -> Scripts, duh
├── staging
├── test -> Local test environment
└── workloads
    └── argocd
        └── install.yaml
```


## TODO

- Script to add do-token (or whatever) to cluster to enable external-dns
- Make bootstrap idempotent
- Add workload: cert-manager
- Add workload: osiris
- Add workload: tekton
- Add workload: grafana/prometheus
- Add workload: sloth
- Add workload: loki
- Add workload: jaeger
- Add workload: hubble
- Add workload: golang org static site, org-roam server
## DONE but needs tested


## DONE
- Improve argocd install - use install.yaml as base
- add .gitignore
- add bootstrap folder to install gitops operator (argocd) incl. projects
- Add meta-apps folder to hold apps of apps - .e.g. production, etc
- Add terraform folder & scripts for terraform (for building cluster)
depending on use case
