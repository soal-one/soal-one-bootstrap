.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: init-mgmt-cluster-do
init-mgmt-cluster-do:
	clusterctl init --infrastructure digitalocean

.PHONY: bootstrap
bootstrap: ## bootstrap the current cluster with workloads
	script/bootstrap.sh

.PHONY: argo-password
argo-password: ## Get the initial password for argocd
	k8sec list -n argocd | grep initial | awk '{print $4}'

.PHONY: argo-add-config-repo
argo-add-config-repo:
	 argocd repo add git@github.com:soal-one/soal-one-bootstrap --ssh-private-key-path ~/.ssh/id_rsa_argocd_grindset
