安装csi-s3，要求k8s 1.14.1
```bash
sh install.sh
```

创建pvc及pod验证
```bash
kubectl create -f pvc.yaml
kubectl create -f pod.yaml
```

登录进pod中查看挂载情况，创建文件，通过s3cmd访问文件
```bash
s3cmd ls --no-ssl --host=${AWS_ENDPOINT} --host-bucket= s3://pvc-0d857888-965d-11e9-9d87-e4434b32cd54
s3cmd get --no-ssl --host=${AWS_ENDPOINT} --host-bucket= s3://pvc-0d857888-965d-11e9-9d87-e4434b32cd54/.metadata.json
```

```bash
s3cmd signurl --no-ssl --host=${AWS_ENDPOINT} --host-bucket= s3://pvc-0d857888-965d-11e9-9d87-e4434b32cd54/csi-fs/123123 180000
http://pvc-0d857888-965d-11e9-9d87-e4434b32cd54.10.1.0.15:30260/csi-fs/123123?AWSAccessKeyId=UK2CNC5WACG6WIRXXP6M&Expires=180000&Signature=71obAR3gizadCV6OefF5KNZQhLo%3D
```
