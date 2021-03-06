.PHONY: bootstrap
bootstrap: ## bootstrap the current cluster with workloads
	script/bootstrap.sh

.PHONY: argo-password
argo-password: ## Get the initial password for argocd
	k8sec list -n argocd | grep initial | awk '{print $4}'

.PHONY: update-argocd-password
update-argo-password: ## Update argo admin password
	script/update-argocd-password.sh

.PHONY: argo-add-config-repo
argo-add-config-repo:
	 argocd repo add git@github.com:soal-one/soal-one-bootstrap --ssh-private-key-path ~/.ssh/id_rsa_argocd_grindset

.PHONY: add-cluster-config
add-cluster-config: ## Get the cluster config from CLUSTER_HOST and splice it into our config
	python script/get_kubeconfig.py

.PHONY: reset-nodes
reset-nodes:
	cssh root@{node1,node2,node3} -a "iptables --flush && iptables -tnat --flush && reboot now"

.PHONY: configure-traefik
configure-traefik: ## Copy traefik-config.yaml to CLUSTER_HOST - assumes root user
	scp templates/traefik-config.yaml root@${CLUSTER_HOST}:/var/lib/rancher/k3s/server/manifests/traefik-config.yaml
.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
