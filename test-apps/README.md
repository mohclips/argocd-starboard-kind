The ArgoCD test guest book

https://github.com/argoproj/argocd-example-apps/tree/master/guestbook

```
argocd app create guestbook \
  --repo https://github.com/argoproj/argocd-example-apps.git 
  --path guestbook \
  --dest-server https://kubernetes.default.svc \
  --dest-namespace default

```
