#!/bin/bash

#查看镜像是否存在
appname=$1
name=registry.cn-hangzhou.aliyuncs.com/lp-web/${appname}*:*
echo $name

#查询得到指定名称的容器ID
#容器ID
ARG1=$(docker ps -aqf "name=${appname}")

#查询得到指定名称的镜像ID
#镜像ID
ARG2=$(docker images -q --filter reference=${name})
echo $ARG2

#查询空镜像ID
ARG3=$(docker images | grep "none" | awk '{print $3}')

#如果查询结果不为空，先停容器在删除
#容器
if [  -n "$ARG1" ]; then
 docker rm -f $(docker stop $ARG1)
 echo "$name容器停止删除成功.....！！！"
fi

#如果查询结果不为空，先删除镜像
#删除镜像
if [  -n "$ARG2" -o  ${#ARG2[*]} -gt 0 ]; then
 docker rmi -f $ARG2
 echo "$name镜像删除成功.....！！！"
fi

# 删除空闲镜像
if [  -n "$ARG3" -o  ${#ARG3[*]} -gt 0 ]; then
 docker rmi -f $ARG3
 echo "$空镜像删除成功.....！！！"
fi