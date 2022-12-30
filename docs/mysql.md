# MySQL

## 1. mysql8以上版本配置驱动
```js
1.引用外部库  mysql-connector-java-8.0.版本的jar
2.jdbc驱动类：com.mysql.jdbc.Driver  改成 com.mysql.cj.jdbc.Driver
3.jdbcUrl：jdbc:mysql://{ip}:{port}/{db}?characterEncoding=utf8&useSSL=false&serverTimezone=UTC&rewriteBatchedStatements=true
```