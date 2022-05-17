# setup



argocd app create out-of-date-nginx \
  --repo https://github.com/mohclips/argocd-starboard-kind.git \
  --path test-apps/out-of-date-nginx \
  --dest-server https://kubernetes.default.svc \
  --dest-namespace default
  
argocd app sync out-of-date-nginx


# scan


