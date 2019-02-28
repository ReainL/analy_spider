-- postgresql数据库, 创建schema, 创建表
create schema infos;
-- 关键字表
DROP TABLE IF EXISTS infos.hot_keyword;
CREATE TABLE infos.hot_keyword(
    id SERIAL primary key,
    word varchar(20),
    crt_dtm timestamp NULL default current_timestamp,
    crt_user varchar(32)
);
COMMENT ON TABLE infos.hot_keyword IS '关键字表';
COMMENT ON COLUMN infos.hot_keyword.id IS '主键';
COMMENT ON COLUMN infos.hot_keyword.word IS '关键字';
COMMENT ON COLUMN infos.hot_keyword.crt_dtm IS '创建时间';
COMMENT ON COLUMN infos.hot_keyword.crt_user IS '创建人';

-- 网站地址表
DROP TABLE IF EXISTS infos.url_link;
CREATE TABLE infos.url_link(
    id SERIAL primary key,
    url varchar(200),
    url_nm varchar(100),
    bj_num varchar(50),
    crt_dtm timestamp NULL default current_timestamp,
    crt_user varchar(32)
);
COMMENT ON TABLE infos.url_link IS '网址表';
COMMENT ON COLUMN infos.url_link.id IS '主键';
COMMENT ON COLUMN infos.url_link.url IS '链接地址';
COMMENT ON COLUMN infos.url_link.url_nm IS '链接名称';
COMMENT ON COLUMN infos.url_link.bj_num IS '百家号';
COMMENT ON COLUMN infos.url_link.crt_dtm IS '创建时间';
COMMENT ON COLUMN infos.url_link.crt_user IS '创建人';

-- 信息采集结果表
DROP TABLE IF EXISTS infos.rslt_url;
CREATE TABLE infos.rslt_url(
    id SERIAL primary key,
    word varchar(20),
    url varchar(200),
    url_nm varchar(100),
    pub_dtm varchar(20),
    crt_dtm timestamp NULL default current_timestamp
);
COMMENT ON TABLE infos.rslt_url IS '信息采集结果表';
COMMENT ON COLUMN infos.rslt_url.id IS '主键';
COMMENT ON COLUMN infos.rslt_url.word IS '关键字';
COMMENT ON COLUMN infos.rslt_url.url IS '链接地址';
COMMENT ON COLUMN infos.rslt_url.url_nm IS '链接标题';
COMMENT ON COLUMN infos.rslt_url.pub_dtm IS '新闻发布时间';
COMMENT ON COLUMN infos.rslt_url.crt_dtm IS '创建时间';
