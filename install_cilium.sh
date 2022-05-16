set -e
source kind_cluster.env

kind load docker-image quay.io/cilium/cilium:v1.11.4 --name $KIND_CLUSTER

echo "############# INSTALL"
cilium install 

echo "############# STATUS CHECK"
cilium status --wait

echo "############# SNOOZE"
sleep 60

echo "############# TEST CONNECTIVITY"
cilium connectivity test
ERR=$?
if [[ $ERR -ne 0 ]] ; then
  echo "*****ERROR: $ERR"

fi

# enable hubble
#

echo "############# INSTALL HUBBLE"
cilium hubble enable --ui


