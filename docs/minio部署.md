# MinIO部署

```js
# 添加 helm 源
$ helm repo add minio https://helm.min.io/

# helm部署
$ helm install minio --namespace minio --create-namespace --set accessKey=minio,secretKey=minio123 --set mode=standalone --set service.type=NodePort --set service.nodePort=32001  --set persistence.enabled=false --set persistence.size=1Gi minio/minio
```