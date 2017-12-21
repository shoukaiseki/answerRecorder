# 答案记录器

## 1.0
单一缓存答案记录,无数据库存储


## 常用sql
### 更新issue.answerdescription为空的行
```Sql
SET SQL_SAFE_UPDATES = 0;
UPDATE answer.issue INNER JOIN answer.issueoption ON (issueoption.issueid=issue.issueid and issueoption.option=issue.answer)
SET issue.answerdescription=issueoption.optiondescription
 where answerdescription is null;
```
