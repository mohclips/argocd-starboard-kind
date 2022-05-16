
kubectl create namespace argocd
kubectl create namespace starboard-system
kubectl create namespace monitoring
kubectl create namespace app

kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml


