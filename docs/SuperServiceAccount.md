# 创建超级账户【用来获取token】

## 1、创建ServiceAccount
root-sa.yml
```js
apiVersion: v1
kind: ServiceAccount
metadata:
  name: super-admin
  namespace: default
```

## 2、创建集群角色绑定
root-cluster-role-binding.yml
```js
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: super-admin
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: super-admin
  namespace: default
```

## 3、创建Secret
root-secret.yml
```js
apiVersion: v1
  kind: Secret
  metadata:
    name: super-admin-token
    namespace: default
    annotations:
      kubernetes.io/service-account.name: super-admin
  type: kubernetes.io/service-account-token

# 另一种方式
cat <<EOF | kubectl apply -f -
  apiVersion: v1
  kind: Secret
  metadata:
    name: super-admin-token
    namespace: default
    annotations:
      kubernetes.io/service-account.name: super-admin
  type: kubernetes.io/service-account-token
EOF
```

## 4、获取token
```js
$ kubectl get --namespace default secret super-admin-token -o go-template='{ {.data.token | base64decode} }'
```
