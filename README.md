# 此项目已废弃，如果面试官想查看我的新项目
# 请前往 https://github.com/setusb/Blog_plus
# 就想找个实习，为啥这么难！！！

# Blog
个人博客

# 展示
![image](https://github.com/setusb/Blog/blob/master/%E5%9B%BE%E7%89%87%E5%B1%95%E7%A4%BA/%E4%B8%AA%E4%BA%BA%E4%BF%A1%E6%81%AF.png)
![image](https://github.com/setusb/Blog/blob/master/%E5%9B%BE%E7%89%87%E5%B1%95%E7%A4%BA/%E4%BF%AE%E6%94%B9%E5%B8%96%E5%AD%90.png)
![image](https://github.com/setusb/Blog/blob/master/%E5%9B%BE%E7%89%87%E5%B1%95%E7%A4%BA/%E5%8F%91%E5%B8%96.png)
![image](https://github.com/setusb/Blog/blob/master/%E5%9B%BE%E7%89%87%E5%B1%95%E7%A4%BA/%E5%8F%91%E5%B8%96%E7%AE%A1%E7%90%86.png)
![image](https://github.com/setusb/Blog/blob/master/%E5%9B%BE%E7%89%87%E5%B1%95%E7%A4%BA/%E6%B3%A8%E5%86%8C.png)
![image](https://github.com/setusb/Blog/blob/master/%E5%9B%BE%E7%89%87%E5%B1%95%E7%A4%BA/%E6%B5%8F%E8%A7%88%E5%B8%96%E5%AD%90.png)
![image](https://github.com/setusb/Blog/blob/master/%E5%9B%BE%E7%89%87%E5%B1%95%E7%A4%BA/%E7%99%BB%E5%BD%95.png)
![image](https://github.com/setusb/Blog/blob/master/%E5%9B%BE%E7%89%87%E5%B1%95%E7%A4%BA/%E7%99%BB%E5%BD%95%E6%88%90%E5%8A%9F.png)
![image](https://github.com/setusb/Blog/blob/master/%E5%9B%BE%E7%89%87%E5%B1%95%E7%A4%BA/%E9%A6%96%E9%A1%B5.png)

# 使用技术栈：
### 前端：layui、jquery
### 后端：ssm
### 数据库：mysql
### 开发工具：IDEA

# 数据库导入：
create database blog;
use blog;

-- auto-generated definition
create table article
(
    uuid            int          null comment '唯一id',
    article_uuid    int(12) auto_increment comment '文章唯一id',
    article_title   varchar(255) null comment '文章标题',
    article_content text         null comment '文章内容',
    article_target  varchar(255) null comment '文章简介',
    article_points  int(12)      null comment '文章点赞',
    article_ban     int          null comment '文章封禁',
    article_top     int          null comment '文章置顶',
    constraint article_article_uuid_uindex
        unique (article_uuid)
);

create index uuid
    on article (uuid);

alter table article
    add primary key (article_uuid);
    
-- auto-generated definition
create table user
(
    uuid         int(12) auto_increment comment '唯一id',
    username     varchar(255) null comment '用户名',
    nickname     varchar(255) null comment '昵称',
    password     varchar(255) null comment '密码',
    date         date         null comment '注册日期',
    sex          varchar(20)  null comment '性别',
    userinfo     text         null comment '用户信息',
    authority    int          null comment '权限',
    verification int          null comment '验证',
    constraint user_username_uindex
        unique (username),
    constraint user_uuid_uindex
        unique (uuid)
)
    comment '用户表';

alter table user
    add primary key (uuid);

