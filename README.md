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
# Add repos for charts
make add-helm-repos
# Add miscellaneous secrets
make add-do-token-secret
./scripts/install-keycloak.password.sh


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
- How can we use cue here...
- Add metrics-server dummy
- Add workload: ory hydra + consent app
- Add workload: microcks
- Add workload: vault
- Add workload: silly microservices
- Add workload: robusta?
- Add workload: hubble
- Add workload: osiris
- Add workload: argo workflows
- Add workload: karpenter?
- Add workload: KEDA
- Add workload: loki
- Add workload: jaeger
- Add workload: hubble?
- Add workload: golang org static site, org-roam server
- Add workload: hello-world fastapi example
- Add workload: dex? hydra? other ory shit?
- Add workload: pomerium
- Add workload: authelia?
- Configure dagger and/or earthly to use tekton
- Progressive delivery options - flagger, argo rollouts, etc
- temporal

## DONE
- Add workload: sloth
- Add workload: grafana/prometheus
- Add workload: tekton
- Add workload: cert-manager
- Script to add do-token (or whatever) to cluster to enable external-dns
- Improve argocd install - use install.yaml as base
- add .gitignore
- add bootstrap folder to install gitops operator (argocd) incl. projects
- Add meta-apps folder to hold apps of apps - .e.g. production, etc
- Add terraform folder & scripts for terraform (for building cluster)
depending on use case
- Add steps to quick start: external dns, adding helm repos
- Add terraform for domain dns setup
