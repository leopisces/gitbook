# SQL 

```js
#  修改字段id
ALTER TABLE `tbl_employee`
MODIFY COLUMN `id`  int NOT NULL FIRST ;

# 设置id为自增主键
ALTER TABLE `tbl_employee`
MODIFY COLUMN `id`  int NOT NULL AUTO_INCREMENT FIRST ;
```