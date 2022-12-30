# linux常用命令

```js
# 设置777最高权限
$ chmod 777 file

# 在terminal拷贝粘贴，多了0~与1~字符
$ printf "\e[?2004l"

# 文件转码
$ echo $(cat ~/.kube/config | base64) | tr -d " "
```
