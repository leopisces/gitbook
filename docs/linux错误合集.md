# Linux 问题合集

## 1. shell脚本执行时报"bad interpreter: Text file busy"的解决方法
```js
# 查看是否有其它进程正在访问该文件
$ lsof | grep xxx.sh
# 杀掉进程
$ kill -9 <进程号> 
```
