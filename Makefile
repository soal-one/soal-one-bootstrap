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
	k8sec list -n argocd | grep initial | awk '{print $4}' | tr -d '"'

.PHONY: argo-add-config-repo
argo-add-config-repo: ## Add config repo and ssh key
	 argocd repo add git@github.com:soal-one/soal-one-bootstrap --ssh-private-key-path ~/.ssh/id_ed25519_soalone_staging

.PHONY: add-do-token-secret
add-do-token-secret: ## Add the DigitalOcean token used by External dns
	k8sec set do-token token=$$DIGITALOCEAN_ACCESS_TOKEN -n default

.PHONY: add-helm-repos
add-helm-repos:
	argocd repo add https://charts.kubevela.net/core --type helm --name kubevela
	argocd repo add https://openebs.github.io/charts --type helm --name openebs
	argocd repo add https://charts.bitnami.com/bitnami --type helm --name bitnami
	argocd repo add https://releases.rancher.com/server-charts/stable --type helm --name rancher
	argocd repo add https://grafana.github.io/helm-charts --type helm --name grafana
	argocd repo add https://microcks.io/helm --type helm --name microcks
	argocd repo add https://helm.pomerium.io --type helm --name pomerium
	argocd repo add https://k8s.ory.sh/helm/charts --type helm --name ory

.PHONY: make-image-secret
make-image-secret:
	./script/create-image-pull-secret.sh
	# TODO HACK - this is skeezy - we should have this specified on workloads
	kubectl patch sa default -n $NAMESPACE -p '"imagePullSecrets": [{"name": "registry-credentials" }]'

.PHONY: login-argocd
login-argocd: ## Login to argocd via port forward
	./script/login-argocd.sh
