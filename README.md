rook安装参考

执行安装部署脚本，配置文档根据环境修改
```bash
sh install.sh
```

获取admin用户的AK和SK
```bash
kubectl -n rook-ceph get secret rook-ceph-object-user-oss-oss-admin -o yaml | grep AccessKey | awk '{print $2}' | base64 --decode
kubectl -n rook-ceph get secret rook-ceph-object-user-oss-oss-admin -o yaml | grep SecretKey | awk '{print $2}' | base64 --decode
```

安装部署s3客户端
```bash
yum --assumeyes install s3cmd
```

导入环境变量
```bash
export AWS_HOST=<host>
export AWS_ENDPOINT=<endpoint>
export AWS_ACCESS_KEY_ID=<accessKey>
export AWS_SECRET_ACCESS_KEY=<secretKey>
```

查看例子：
```bash
source rook-oss-s3.sh
```

使用对象存储：
```bash
 s3cmd mb --no-ssl --host=${AWS_ENDPOINT} --host-bucket=  s3://rookbucket
 s3cmd ls --no-ssl --host=${AWS_ENDPOINT}
 echo "Hello Rook" > /tmp/rookObj
 s3cmd put /tmp/rookObj --no-ssl --host=${AWS_ENDPOINT} --host-bucket=  s3://rookbucket
 s3cmd get s3://rookbucket/rookObj /tmp/rookObj-download --no-ssl --host=${AWS_ENDPOINT} --host-bucket=
 cat /tmp/rookObj-download
```
