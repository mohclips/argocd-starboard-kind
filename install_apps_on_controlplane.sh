source kind_cluster.env

docker exec -t $KIND_CLUSTER-control-plane bash -c "apt update && apt install -y strace jq binutils"


