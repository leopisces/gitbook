# K8s 常用命令

```js
# 查询密钥
$ kubectl get -n publish secret mysql-root-password -o go-template='{ {.data.password | base64decode} }'

# 文件转码
$ echo $(cat ~/.kube/config | base64) | tr -d " "

# k8s默认端口 30000-32767

# 查看k8s资源信息
$ kubectl api-resources

# 生成证书Secret
$ kubectl create secret tls nginx-tls --key nginx.key --cert nginx.crt

# 伸缩副本
$ kubectl scale -n publish deployment gitlab-runner-elasticsearch-api --replicas=4

# 删除ingress-nginx
$ helm delete ingress-nginx -n ingress-nginx

# 更新harbor
$ helm upgrade harbor . -f values.yaml -n harbor

# 获取命名空间所有资源
$ kubectl -n web get all

# helm安装ingress-nginx
$ helm install ingress-nginx -f values.yaml -n ingress-nginx .

# 选择节点打label
$ kubectl label node k8s-node01 ingress=true  # k8s-node01是自己自定义的node节点名称
$ kubectl get node --show-labels

# 清理所有未使用的镜像
$ docker image prune -a

# 列出最新版本的包
$ helm search repo harbor -l |  grep harbor/harbor  | head  -4

# 访问容器内部接口【端口转发】
$ kubectl port-forward -n kubeapps svc/kubeapps 8080:80

# 强制删除pod 
$ kubectl delete pod <your-pod-name> -n <name-space> --force --grace-period=0

# 强制删除pv、pvc
$ kubectl patch pv xxx -p '{"metadata":{"finalizers":null}}'
$ kubectl patch pvc xxx -p '{"metadata":{"finalizers":null}}'

# 强制删除ns
$ kubectl delete ns <terminating-namespace> --force --grace-period=0

# 实时观察pod【每秒刷新】
$ watch -n 1 kubectl get pod -ndevops
```