#!/usr/bin/env python3.4
# encoding: utf-8
"""
Created on 19-2-25
@title: '主程序'
@author: Xusl
"""
import time
import datetime
import re
import random
import logging.config
import requests
import os

from bs4 import BeautifulSoup
from config import logger_path
from urllib.parse import urlparse
from common.pgutils import get_conn, execute_sql, execute_select
from common.timeutils import get_datetime_str


logging.config.fileConfig(logger_path)
logger = logging.getLogger("root")

now = datetime.datetime.now()

ua_list = [
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36",
    "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36",
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36",
    ]

sql_info = "INSERT INTO infos.rslt_url(word, url, url_nm, pub_dtm) VALUES(%s, %s, %s, %s)"


def del_his_info(conn, his_dtm):
    """
    考虑到数据量及新闻的时效性,这里对与日期在两个月前的新闻进行删除
    :param conn:
    :param his_dtm: 当前日期倒减60天
    :return:
    """
    del_fun_nm = " 删除历史数据 "
    logger.debug('start %s ' % del_fun_nm)
    sql_del_params = (his_dtm, )
    sql_del = " DELETE FROM infos.rslt_url WHERE pub_dtm < %s "
    execute_sql(conn, sql_del, sql_del_params)
    logger.debug('end %s ' % del_fun_nm)


def key_word_srch(conn, last_mon, key_word_li, url_li, bj_num_li):
    """
    关键词搜索
    :param conn:
    :param last_mon: 当前日期倒减20天
    :param key_word_li: 关键词[列表]
    :param url_li: 网址链接
    :param bj_num_li: 百家号
    :return:
    """
    func_name = "百度搜索关键词"
    logger.debug('start %s ' % func_name)

    zx_url = "https://www.baidu.com/s?ie=utf-8"

    pn_list = [0, 10, ]
    # pn_list = [0, 10, 20, 30, 40]
    try:
        for key_word in key_word_li:
            logger.debug(key_word)
            for pn in pn_list:
                tm = random.randint(4, 10)
                time.sleep(tm)
                user_agent = random.choice(ua_list)
                # 伪造请求头 + 参数
                my_headers = {
                    'Host': 'www.baidu.com',
                    'User-Agent': user_agent
                }
                data = {'rtt': 1, 'bsst': 1, 'cl': '2', 'tn': 'news', 'word': key_word, 'pn': pn}
                zx_html = requests.get(url=zx_url, params=data, headers=my_headers, timeout=5)
                soup = BeautifulSoup(zx_html.text, 'html.parser')
                soup_content = soup.find('div', id='content_left')  # 定位主要模块内容
                result_list = soup_content.find_all('div', class_='result')     # 定位每个小模块
                for result in result_list:
                    title = result.find('h3', attrs={'class': 'c-title'}).get_text().strip()  # 去除空格,获取标题
                    href = result.find('a').get("href")     # 获取标题对应的链接
                    re_time = result.find('p', attrs={'class': 'c-author'}).get_text(). \
                        replace('\n', '').replace('\t', '').replace(' ', '').replace('\xa0', '')  # 获取发布时间 \xa0:不间断空白符
                    logger.debug('title: %s; href:%s; re_time:%s;' % (title, href, re_time))
                    match_tm = re.search('\d{4}年\d{2}月\d{2}日', str(re_time))
                    # match_tm = <_sre.SRE_Match object; span=(4, 15), match='2018年07月25日'> or match_tm = None
                    # match_tm.span()[0] = 4
                    if match_tm:
                        # ex:蓝鲸财经2018年07月25日 12:01
                        bj = re_time[:match_tm.span()[0]]  # 蓝鲸财经
                        date_time = datetime.datetime.strptime(re_time[match_tm.span()[0]:], '%Y年%m月%d日%H:%M')
                        d_time = get_datetime_str(date_time, pattern='%Y-%m-%d %H:%M:%S')
                    else:
                        # ex: 36氪15小时前
                        match_tm = re.search('\d{1,2}小时前', str(re_time))
                        if not match_tm:
                            continue
                        bj = re_time[:match_tm.span()[0]]      # 36氪
                        hr_tm_ago = re_time[match_tm.span()[0]:]   # 15小时前
                        hr = re.findall("\d+", hr_tm_ago)[0]    # 15
                        d_time = (now - datetime.timedelta(hours=int(hr))).strftime("%Y-%m-%d %H:%M:%S")

                    if d_time >= last_mon:
                        # ex: res-> http://www.shanghai.gov.cn/nw2/nw2319
                        """
                        ParseResult(scheme='http', netloc='www.shanghai.gov.cn', 
                            path='/nw2/nw2319', params='', query='', fragment='')
                        """
                        res = urlparse(href)
                        http_res = res.scheme + '://' + res.netloc
                        # 判断新闻链接是否是我们需要的链接(目的在于排除一些不需要的网站) 或者 是否是我们需要的百家号的新闻
                        if (http_res in url_li) or (bj in bj_num_li):
                            sql_params = [key_word, href, title, d_time]
                            logger.debug(sql_params)
                            remv_repeat_info(conn, sql_params)
        logger.debug('end %s ' % func_name)
    except Exception as e:
        msg = func_name + ' 处理失败: ' + str(e)
        logger.error(msg)


def remv_repeat_info(conn, sql_params):
    """
    判断是否有重复再进行插入
    :param conn:
    :param sql_params:
    :return:
    """
    sql_rept = " SELECT url_nm FROM infos.rslt_url WHERE url_nm=%s "
    rept_re = execute_select(conn, sql_rept, (sql_params[0], ))
    if len(rept_re) == 0:
        logger.debug('插入sql：%s' % sql_info)
        logger.debug('数据参数：%s' % sql_params)
        execute_sql(conn, sql_info, sql_params)


def remv_his_log():
    """
    清除60天前的日志
    :return:
    """
    func_name = "清除60天前的日志"
    logger.debug('start %s ' % func_name)
    log_path = '/home/xsl/log'  # 需要清空的文件夹
    ds_li = list(os.walk(log_path))
    ceiling = datetime.datetime.now() - datetime.timedelta(days=60)  # 设定60天前的文件为过期

    for wd in ds_li:
        os.chdir(wd[0])  # 进入本级路径，防止找不到文件而报错
        if len(wd[2]) > 0:
            for file_log in wd[2]:
                file_crt_dtm = datetime.datetime.fromtimestamp(os.path.getctime(file_log))  # 获取文件创建时间
                if file_crt_dtm < ceiling:
                    os.remove(file_log)  # 删除文件
    logger.debug('end %s ' % func_name)


def deal():
    remv_his_log()
    last_mon = (now - datetime.timedelta(days=20)).strftime("%Y-%m-%d %H:%M:%S")
    str_his_dtm = (now - datetime.timedelta(days=60)).strftime("%Y-%m-%d %H:%M:%S")
    logger.debug('last_mon:%s, str_his_dtm:%s ' % (last_mon, str_his_dtm))
    conn = None
    try:
        conn = get_conn()
        with conn:
            del_his_info(conn, str_his_dtm)
            # 查找出关键字
            sql_key_word = " SELECT word FROM infos.hot_keyword "
            re_key_word = execute_select(conn, sql_key_word)
            key_word_list = []
            for key_word in re_key_word:
                key_word_list.append(key_word[0])

            # 查找网站地址
            sql_url_link = " SELECT url, url_nm FROM infos.url_link "
            re_url_link = execute_select(conn, sql_url_link)
            url_list = []
            for url in re_url_link:
                url_list.append(url[0])

            # 查找相关百家号
            sql_bj_num = " SELECT bj_num FROM infos.url_link WHERE bj_num>'' "
            re_bj_num = execute_select(conn, sql_bj_num)
            bj_num_list = []
            for bj_num in re_bj_num:
                bj_num_list.append(bj_num)

            key_word_srch(conn, last_mon, key_word_list, url_list, bj_num_list)
    except Exception as e:
        logger.error(str(e))
    finally:
        if conn:
            conn.close()


if __name__ == '__main__':
    deal()

