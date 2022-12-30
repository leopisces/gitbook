# Docker 镜像源

## 镜像源
```js
网易：http://hub-mirror.c.163.com
中科大镜像地址：http://mirrors.ustc.edu.cn/
中科大github地址：https://github.com/ustclug/mirrorrequest
Azure中国镜像地址：http://mirror.azure.cn/
Azure中国github地址：https://github.com/Azure/container-service-for-azure-china
DockerHub镜像仓库: https://hub.docker.com/ 
阿里云镜像仓库： https://cr.console.aliyun.com 
google镜像仓库： https://console.cloud.google.com/gcr/images/google-containers/GLOBAL （如果你本地可以翻墙的话是可以连上去的 ）
coreos镜像仓库： https://quay.io/repository/ 
RedHat镜像仓库： https://access.redhat.com/containers
```

## 私人阿里云镜像加速器

## 国内镜像源

### dockerhub(docker.io)
```js
# dockerhub(docker.io)
# 格式 
dockerhub.azk8s.cn/<repo-name>/<image-name>:<version>
# 原镜像地址示例，我们可能平时拉dockerhub镜像是直接docker pull nginx:1.15.但是docker client会帮你翻译成#docker pull docker.io/library/nginx:1.15
docker.io/library/nginx:1.15
# 国内拉取示例
dockerhub.azk8s.cn/library/nginx:1.15
```

### gcr.io
```js
# gcr.io 
# 格式
gcr.azk8s.cn/<repo-name>/<image-name>:<version> 
# 原镜像地址示例
gcr.io/google-containers/pause:3.1
# 国内拉取示例
gcr.azk8s.cn/google_containers/pause:3.1
```

### quay.io
```js
# quay.io
# 格式
quay.azk8s.cn/<repo-name>/<image-name>:<version>
# 原镜像地址示例
quay.io/coreos/etcd:v3.2.28
# 国内拉取示例
quay.azk8s.cn/coreos/etcd:v3.2.28
```

### k8s.gcr.io
```js
# k8s.gcr.io
# 格式
gcr.azk8s.cn/google_containers/<repo-name>/<image-name>:<version>
# 原镜像地址示例
k8s.gcr.io/pause-amd64:3.1
# 国内拉取示例
gcr.azk8s.cn/google_containers/pause:3.1

# 原镜像格式
k8s.gcr.io/pause:3.1
# 改为以下格式
googlecontainersmirrors/pause:3.1
```

### 阿里云的google 镜像源
```js
# 原镜像格式
k8s.gcr.io/pause:3.1
# 改为以下格式
registry.cn-hangzhou.aliyuncs.com/google_containers/pause:3.1
```

###  定制命令拉取镜像
或使用azk8spull，只有50行命令的小脚本，就可以从dockerhub、gcr.io、quay.io直接拉取镜像：
```js
# download azk8spull
curl -Lo /usr/local/bin/azk8spull https://github.com/xuxinkun/littleTools/releases/download/v1.0.0/azk8spull
chmod +x /usr/local/bin/azk8spull
​
# 直接拉取镜像
azk8spull k8s.gcr.io/pause:3.1
azk8spull quay.io/coreos/etcd:v3.2.28
​
# 查看拉取的镜像
# docker images
REPOSITORY                                                        TAG                 IMAGE ID            CREATED             SIZE
k8s.gcr.io/etcd                                                   v3.2.28             b2756210eeab        3 months ago        247MB
k8s.gcr.io/pause                                                  3.1
```

