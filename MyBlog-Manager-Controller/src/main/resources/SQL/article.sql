create TABLE article(
id int PRIMARY key auto_increment,
title VARCHAR(100) COMMENT "标题",
keyword VARCHAR(100) COMMENT "关键字",
article_describe VARCHAR(500) COMMENT "描述",
article_column VARCHAR(100) COMMENT "栏目",
label VARCHAR(100) COMMENT "标签",
title_images VARCHAR(500) COMMENT "标题图片",
userName VARCHAR(50) COMMENT "发布用户",
is_del int DEFAULT '0' COMMENT "是否删除",
is_release int DEFAULT '0' COMMENT "发布状态",
is_open int DEFAULT '0' COMMENT "是否公开",
release_Date TIME COMMENT "发布时间"
)COMMENT "文章表";

alter table article add content VARCHAR(500) not null COMMENT "内容";


