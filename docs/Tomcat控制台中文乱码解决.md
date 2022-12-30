# Tomcat控制台中文乱码解决

## 解决

1. Tomcat日志配置文件【安装文件夹/conf/logging.properties】
![](/pics/16.png)

2. IDEA 配置文件idea.exe.vmoptions和idea64.exe.vmoptions最后添加：-DFile.encoding=UTF-8  
位置：IDEA安装目录/bin/  

3. 打开IDEA ，File->Settings 搜索 File Encodings ,编码统一UTF-8

4. Tomcat配置项 VM options 无需配置【-DFile.encoding=UTF-8】
