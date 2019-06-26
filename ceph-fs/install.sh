sh create-secret.sh

kubectl create -f filesystem.yaml
kubectl create -f cephfs-provisioner.yaml
kubectl create -f cephfs-sc.yaml
