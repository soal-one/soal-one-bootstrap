# Bootstrappable Cloud Computing Laboratory

First take a look at the k0s.yaml configuration and change it to your liking.
Then:
```bash

```


## Quick Start

```
k0s apply
make add-cluster-config
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
- Get nginx-ingress working with metallb - nginx daemonset and get it showing default backend
- Argocd has some reference to a traefik crd that doesn't exist...
- Add terraform folder & scripts for terraform (for building cluster)
depending on use case
- Add workload: crossplane
- Add workload: OAM
- Add workload: cert-manager
- Add workload: osiris
- Add workload: argo workflows/events
- Add workload: earthly/drone
- Add workload: grafana/prometheus

## DONE
- add .gitignore
- add bootstrap folder to install gitops operator (argocd) incl. projects
- Add meta-apps folder to hold apps of apps - .e.g. production, etc
