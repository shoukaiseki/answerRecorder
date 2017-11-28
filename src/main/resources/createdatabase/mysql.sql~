--设置外部ip可以访问本机数据库
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'asus' WITH GRANT OPTION;


--创建数据库
 CREATE DATABASE answer;
--切换用户
 USE answer; 

--新建表
--表中所有 VARCHAR 长度加起来不能超过 21844
--
/**
--最大长度 18793
CREATE TABLE issue(
	`ID` varchar(36) CHARACTER SET utf8mb4 NOT NULL DEFAULT '0' COMMENT '主键', 
      	question VARCHAR(1000)  COMMENT '问题',
       	Options  VARCHAR(18793) COMMENT '问题选项',
       	answer  VARCHAR(2000) COMMENT '问题答案',
	createdate DATE COMMENT '创建时间'
); 


--最大长度 18794
CREATE TABLE issue(
	`ID` varchar(36) CHARACTER SET utf8mb4 NOT NULL DEFAULT '0' COMMENT '主键', 
      	question VARCHAR(1000)  COMMENT '问题',
       	`OPTIONS`   varchar(18794) COMMENT '问题选项',
       	answer  VARCHAR(2000) COMMENT '问题答案'
)charset=utf8;


--最大长度 18794 为最大值的 21844 减去3000长度再减2字段占位符(如为null字符占用1字符)
CREATE TABLE issue(
  	question VARCHAR(1000)  COMMENT '问题',
       	`OPTIONS`   varchar(18842) COMMENT '问题选项',
       	answer  VARCHAR(2000) COMMENT '问题答案'
)charset=utf8;
**/
CREATE TABLE chapter(
	`chapterid` varchar(36) CHARACTER SET utf8mb4 NOT NULL DEFAULT '0' COMMENT '主键', 
      	trainingname VARCHAR(1000)  COMMENT '培训名称',
      	coursetitle VARCHAR(1000)  COMMENT '课程名称',
      	chaptername VARCHAR(1000)  COMMENT '章节名称',
	createdate DATE COMMENT '创建时间',
	createby VARCHAR(30)  COMMENT '创建用户'
); 
CREATE TABLE issue(
	`issueid` varchar(36) CHARACTER SET utf8mb4 NOT NULL DEFAULT '0' COMMENT '主键', 
	`chapterid` varchar(36) NOT NULL  COMMENT '主键',
      	question VARCHAR(1000)  COMMENT '问题',
       	answer  VARCHAR(30) COMMENT '问题答案',
       	answerdescription  VARCHAR(2000) COMMENT '问题答案描述',
	createdate DATE COMMENT '创建时间',
	createby VARCHAR(30)  COMMENT '创建用户'
); 

CREATE TABLE issueoption(
	`issueoptionid` varchar(36) CHARACTER SET utf8mb4 NOT NULL DEFAULT '0' COMMENT '主键', 
	`issueid` varchar(36) NOT NULL  COMMENT '主键',
       	`OPTION`  VARCHAR(30) COMMENT '问题选项',
       	Optiondescription  VARCHAR(2000) COMMENT '问题选项描述',
	createdate DATE COMMENT '创建时间',
	createby VARCHAR(30)  COMMENT '创建用户'
); 

