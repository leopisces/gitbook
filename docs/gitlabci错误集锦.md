# GitLab CI/CD错误集锦

## 1. kubernetes：pods is forbidden: User “system:serviceaccount:dev:default” cannot create resource “pods”

**原因：**  
如果在CI里面没有特别指定serviceaccount 那么将使用默认账户 system:serviceaccount:dev:default
最终的原因就是没有创建 对应 namespaces 的 集群角色绑定clusterrolebinding

**解决：**
```js
$ kubectl create clusterrolebinding gitlab-cluster-admin --clusterrole=cluster-admin --group=system:serviceaccounts
```

## 2. ./mvnw: Permission denied
命令增加权限
```js
- chmod 777 ./mvnw
- ./mvnw -U xxxxx
```
增加chmod 777命令来授权，然后提交重跑cicd流水线即可。

**Git增加权限**

使用git命令对项目下的mvnw 文件赋权限，然后提交即可。
```js
$ git update-index --chmod=+x mvnw
```