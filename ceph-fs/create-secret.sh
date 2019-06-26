cephfs_admin_secret=`kubectl get secrets rook-ceph-mon -n rook-ceph -o json | jq '.data' | jq '.[]' | awk 'NR==1{print}' | cut -d '"' -f 2 | sed -e 's/^[ \t]*//g' | awk 'NR==1{print}' | base64 -d -i`

kubectl create secret generic rook-ceph-secret-admin --type="kubernetes.io/rbd" --from-literal=key="${cephfs_admin_secret}" --namespace=rook-ceph
