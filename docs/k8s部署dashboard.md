# k8s部署dashboard
> 当前版本：
> - k8s版本：v1.25.4
> - dashboard版本：v2.7.0

## 1、下载yml配置文件
```js
$ kubectl version
```
根据K8s版本查询对应的dashboard版本  
https://github.com/kubernetes/dashboard/releases

```js
# v2.0.3就是版本
wget https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.3/aio/deploy/recommended.yaml
```

## 2、修改配置文件
```js
$ vi recommended.yaml
```
![](/pics/1.png)
将type改为NodePort，这样可以对外访问，修改完成进行保存。
```js
# 启动dashboard
$ kubectl apply -f recommended.yaml
# 查看dashboard的pod
$ kubectl get pods -n kubernetes-dashboard
# 查看dashboard的对外端口
$ kubectl get services -n kubernetes-dashboard
```

## 3、访问dashboard

## 4、获取token
创建一个叫dashboard-admin的账号，并指定命名空间为kube-system  

dashboard-admin.yaml 

```js
apiVersion: v1
kind: ServiceAccount
metadata:
  name: dashboard-admin
  namespace: kube-system
```

创建一个关系，关系名为dashboard-admin，角色为cluster-admin，账户为kube-system命名空间下的dashboard-admin账号  

dashboard-admin-bind-cluster-role.yaml

```js
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: dashboard-admin
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: dashboard-admin
  namespace: kube-system
```

## 5、创建一个token
```js
$ kubectl -n kube-system create token dashboard-admin
```