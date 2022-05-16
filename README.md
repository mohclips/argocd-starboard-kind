# ArgoCD and Starboard on Kind

Test/Demo setup of AquaSec Starboard

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

Get initial password
`kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo`


## SecOps

- Starboard

Install via "GitOps"



### Monitoring

- Prometheus
- Grafana


