kubectl create -f provisioner.yaml
kubectl create -f attacher.yaml
kubectl create -f csi-s3.yaml
kubectl create -f secret.yaml
kubectl create -f storageclass.yaml

