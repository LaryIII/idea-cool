-- 存储物品信息
create table C_PRODUCT
(
	UID		  INT(20)		   NOT NULL,    	--物品唯一标识符，自增长字段
	NAME      VARCHAR(30) 	   NOT NULL,        --产品名称
	SUMMARY   VARCHAR(200),                     --首页上的物品描述
	DEFAULTPIC    BLOB ,                        --首页上的物品图片
	PV        INT(10)         DEFAULT 0,        --物品浏览量
	COLLECT   INT(10)         DEFAULT 0,        --物品被收藏总数
	DISCRIPTION   BLOB                          --物品描述(实现)
)

-- 存储物品标签映射关系
create table C_TAG_MAPPING
(
	UID		  INT(20)          NOT NULL,       --产品标识符 
	TAGID 	  INT(10)          NOT NULL        --标签标识符
)

-- 存储物品标签
create table C_TAG
(
	TAGID     INT(10)			NOT NULL,      --标签标识符，自增长字段
	TAGNAME   VARCHAR(10)       NOT NULL       --标签名称
)

-- 存储帐号信息
create table C_ACCOUNT
(
	UID        INT(20)         NOT NULL,       --用户唯一标识符，自增长字段
	MAIL       VARCHAR(30)     NOT NULL,       --登录帐号，邮箱格式
	PASSWORD   VARCHAR(32)     NOT NULL,       --登录密码
	DATE       DATE            NOT NULL,       --注册日期 yyyy-MM-dd
	LASTIP     VARCHAR(20),                    --上一次登录的IP
	TOKEN      VARCHAR(30)                     --验证邮箱的标识字段，值为UUID     
);

-- 存储帐号收藏的物品
create table C_COLLECT
(
    AUID       INT(20)         NOT NULL,       --用户标识符   
	PUID       INT(20)         NOT NULL        --物品标识符
)