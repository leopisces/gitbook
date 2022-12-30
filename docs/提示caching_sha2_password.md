# 解决MySql登录 提示caching_sha2_password

```js
# 控制台登录mysql
$ mysql -u root -p

# 查看
$ use mysql;
$ SELECT Host, User, plugin from user;

# 设置登录方式
$ ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'zqz170170';
$ ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'zqz170170';

$ SELECT Host, User, plugin from user;
# 立即生效
$ FLUSH PRIVILEGES;
```