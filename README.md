# analy_crawler
[![](https://img.shields.io/badge/python-3-brightgreen.svg)](https://www.python.org/downloads/)

# 微舆情分析安装部署文档
## 一.技术选型
1.requests作为爬虫程序处理网络请求的框架

2.Beautiful作为解析网页的dom解析器

3.数据库用postgresql

## 二.开发环境
1.下载安装python3,debian9最新发行版自带python3.5版本，可通过在终端输入python3测试；若系统没有python3，使用以下命令安装:
```
# apt-get install python3
```
2.安装python包管理工具pip
```
# apt-get install python3-pip
```
3.下载安装psycopg2、psycopg2-binary、、python-dateutil、requests、bs4、selenium、lxml包
```
# apt-get install python3-pandas
# pip3 install python-dateutil
# pip3 install requests
# pip3 install bs4
# pip3 install psycopg2
# pip3 install psycopg2-binary
# pip3 install lxml
```

## 三.前期准备
1.创建数据库表：在pgadmin III使用analy_creat.sql中建表语句创建[table](https://github.com/ReainL/analy_spider/blob/master/analy_spider/db_init/analy_creat.sql) 

2.数据库初始化操作：同样的方法执行[analy_init.sql](https://github.com/ReainL/analy_spider/blob/master/analy_spider/db_init/analy_init.sql)中初始化语句

## 四、项目工程目录
系统各个模块之间的联系如下：

- common/pgutils.py:主要连接postgresql数据库
- db_init/analy_creat.sql: 数据库建表语句
- db_init/analy_init.sql: 数据库初始化语句
- config.py:调用配置文件
- [baidu_crawler.py](https://github.com/ReainL/analy_spider/blob/master/analy_spider/baidu_crawler.py): 主要的采集数据文件
- settings.conf.template:主要是项目的一些配置文件模板,需拷贝至当前目录配置环境
- logging.conf.template:主要是项目的日志文件模板
- task_baidu_craw.sh: shell脚本执行程序也可以直接运行python3 baidu_crawler.py脚本
