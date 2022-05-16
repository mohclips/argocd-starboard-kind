The ArgoCD test guest book

https://github.com/argoproj/argocd-example-apps/tree/master/guestbook

```
k create ns guestbook

argocd app create guestbook \
  --repo https://github.com/mohclips/argocd-starboard-kind.git \
  --path test-apps/guestbook \
  --dest-server https://kubernetes.default.svc \
  --dest-namespace guestbook
  
argocd app sync guestbook

## Testing

you can swap deployment image version between 0.1 and 0.2 to test ArgoCD

```
