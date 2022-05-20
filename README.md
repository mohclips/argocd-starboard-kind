# ArgoCD and Starboard on Kind

Test/Demo setup of AquaSec Starboard

Note: Trivy doesn't work on kind.  Due to the CRI

## Networking

- cilium

## CD

- ArgoCD

Follow the install guide https://argo-cd.readthedocs.io/en/stable/getting_started/

install the cli version locally

### Access

Allow remote access
`kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'`

Using `--address` allows us access remotely (if your kind cluster is not on localhost)
`kubectl port-forward svc/argocd-server -n argocd --address 0.0.0.0 8080:443`

`kubectl port-forward service/prometheus-kube-prometheus-prometheus -n monitoring --address 0.0.0.0 9090:9090`

`kubectl port-forward service/prometheus-grafana -n monitoring --address 0.0.0.0 5000:80`

`kubectl port-forward service/starboard-exporter -n starboard-system --address 0.0.0.0 3000:8080`

Get initial password
`kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo`


## SecOps

- Starboard

Install via "GitOps"

## bash completion

`starboard completion bash | sudo tee /etc/bash_completion.d/starboard`

## patch excluded namespaces

`kubectl -n starboard-system patch deployments.apps/starboard-operator -p '{"spec":{"template":{"spec":{"containers":[{"name":"starboard-operator","env":[{"name":"OPERATOR_EXCLUDE_NAMESPACES","value":"kube-system,starboard-system,monitoring,argocd"}]}]}}}}'
`
we do this to stop prometheus and argocd from hogging the CPU.



### Monitoring

You need a lot of CPU and RAM for this...

- Prometheus
- Grafana
- Loki

`helm repo add grafana https://grafana.github.io/helm-charts`
``

`helm repo add prometheus-community https://prometheus-community.github.io/helm-charts`
`helm upgrade --install prom prometheus-community/kube-prometheus-stack -n monitoring --values configs/prom-values.yml`

`helm upgrade --install promtail grafana/promtail -f configs/promtail-values.yml -n monitoring`

`helm upgrade --install loki grafana/loki-distributed -n monitoring`


