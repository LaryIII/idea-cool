-- 存储物品信息
create table C_PRODUCT
(
	UID		  INT	   primary key auto_increment	NOT NULL,    	--物品唯一标识符，自增长字段
	NAME      VARCHAR(30) 	   NOT NULL,                            --产品名称
	SUMMARY   VARCHAR(200),                     					--首页上的物品描述
	DEFAULTPIC    VARCHAR(30) ,                						--首页上的物品图片路径
	PV        INT         DEFAULT 0,        						--物品浏览量
	COLLECT   INT         DEFAULT 0,       						    --物品被收藏总数
	DESCRIPTION   BLOB                                              --物品描述(实现)
)ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 存储物品标签映射关系
create table C_TAG_MAPPING
(
	UID		  INT          NOT NULL,                                --产品标识符 
	TAGID 	  INT          NOT NULL                                 --标签标识符
)ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 存储物品标签
create table C_TAG
(
	TAGID     INT	    primary key auto_increment		NOT NULL,      --标签标识符，自增长字段
	TAGNAME   VARCHAR(10)       NOT NULL                               --标签名称
)ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 存储帐号信息
create table C_ACCOUNT
(
	UID        INT       primary key auto_increment  NOT NULL,       --用户唯一标识符，自增长字段
	MAIL       VARCHAR(30)     NOT NULL,                             --登录帐号，邮箱格式
	PASSWORD   VARCHAR(32)     NOT NULL,                             --登录密码
	NICKNAME   VARCHAR(30)     NOT NULL,                             --昵称
	DATE       DATE            NOT NULL,                             --注册日期 yyyy-MM-dd
	LASTIP     VARCHAR(30),                                          --上一次登录的IP
	TOKEN      VARCHAR(40)                                           --验证邮箱的标识字段，值为UUID 
        
)ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 存储帐号收藏的物品
create table C_COLLECT
(
    AUID       INT         NOT NULL,                                 --用户标识符   
	PUID       INT         NOT NULL                                  --物品标识符
)ENGINE=MyISAM DEFAULT CHARSET=utf8;