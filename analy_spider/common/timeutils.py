#!/usr/bin/env python3.4
# encoding: utf-8
"""
Created on 19-2-27
@title: '日期的转换'
@author: Xusl
"""
import datetime


def get_now_datetime():
    """
    获取当前日期
    :return: datetime now
    """
    return datetime.datetime.now()


def parse_str2date(s_date, pattern='%Y-%m-%d'):
    """
    将字符串转换为日期格式
    :param s_date:
    :param pattern:
    :return:
    """
    return datetime.datetime.strptime(s_date, pattern)


def get_datetime_str(d_date=None, pattern='%Y-%m-%d'):
    """
    获取指定日期 字符格式
    :param d_date:
    :param pattern:
    :return:
    """
    if not d_date:
        d_date = get_now_datetime()
    return datetime.datetime.strftime(d_date, pattern)