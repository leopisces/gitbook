# k8s部署Gitlab

## 1、nfs事先准备好需要挂载的文件夹
- 创建目录 mkdir
- 添加到共享
  ```js
  $ vi /etc/exports
  /home/k8s-nfs/gitlab/config 192.168.17.0/8(rw,no_root_squash)
  ```
- 更新nfs
  ```js
  $ service nfs restart
  # 或者
  $ exportfs -r
  ```

## 2、配置文件
gitlab.yml
```js
apiVersion: v1
kind: Service
metadata:
  name: gitlab
  namespace: publish
spec:
  type: NodePort
  ports:
  # Port上的映射端口
  - port: 443
    targetPort: 443
    name: gitlab443
    nodePort: 31000
  - port: 80
    targetPort: 80
    name: gitlab80
    nodePort: 32000
  - port: 22
    targetPort: 22
    name: gitlab22
    nodePort: 30000
  selector:
    app: gitlab
 
---
 
apiVersion: apps/v1
kind: Deployment
metadata:
  name: gitlab
  namespace: publish
spec:
  selector:
    matchLabels:
      app: gitlab
  revisionHistoryLimit: 2
  template:
    metadata:
      labels:
        app: gitlab
    spec:
      containers:
      # 应用的镜像
      - image: gitlab/gitlab-ce 
        name: gitlab
        imagePullPolicy: IfNotPresent
        # 应用的内部端口
        ports:
        - containerPort: 443
          name: gitlab443
        - containerPort: 80
          name: gitlab80
        - containerPort: 22
          name: gitlab22
        volumeMounts:
        # gitlab持久化
        - name: gitlab-persistent-config
          mountPath: /etc/gitlab
        - name: gitlab-persistent-logs
          mountPath: /var/log/gitlab
        - name: gitlab-persistent-data
          mountPath: /var/opt/gitlab
      imagePullSecrets:
      - name: devops-repo
      volumes:
      # 使用nfs互联网存储
      - name: gitlab-persistent-config
        nfs:
          server: 192.168.253.132
          path: /root/nfs/data/gitlab/config
      - name: gitlab-persistent-logs
        nfs:
          server: 192.168.253.132
          path: /root/nfs/data/gitlab/logs
      - name: gitlab-persistent-data
        nfs:
          server: 192.168.253.132
          path: /root/nfs/data/gitlab/data

```

## 3、默认初始密码
```js
# k8s进入gitlab容器
$ cat /etc/gitlab/initial_root_password
```