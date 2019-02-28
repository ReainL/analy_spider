-- 数据库创建完毕，加入初始化数据
-- 网站地址表加入初始化数据
INSERT INTO infos.url_link (url, url_nm, bj_num, crt_user) VALUES
    ('http://finance.ifeng.com', '凤凰财经', '凤凰网财经', 'admin'),
    ('http://tech.ifeng.com', '凤凰科技', '', 'admin'),
    ('https://36kr.com', '36氪', '36氪', 'admin'),
    ('http://money.163.com/', '网易财经', '', 'admin'),
    ('http://www.cs.com.cn', '中证网', '', 'admin'),
    ('http://www.sohu.com', '搜狐网', '搜狐网', 'admin'),
    ('http://stock.10jqka.com.cn/', '同花顺财经', '同花顺财经', 'admin'),
    ('http://news.sina.com.cn', '新浪新闻', '', 'admin'),
    ('http://sc.stock.cnfol.com', '中金在线', '', 'admin'),
    ('http://finance.sina.com.cn', '新浪财经', '', 'admin'),
    ('https://finance.china.com', '中华网财经', '', 'admin'),
    ('https://ent.china.com', '中华网娱乐', '中华网娱乐', 'admin'),
    ('http://www.wabei.cn', '挖贝网', '', 'admin');


-- 关键字表加入初始化数据
INSERT INTO infos.hot_keyword (word,crt_user) VALUES
    ('新特汽车','admin'),
    ('澜起科技', 'admin'),
    ('36氪', 'admin'),
    ('36Kr', 'admin'),
    ('36氪媒体', 'admin'),
    ('鲸准', 'admin'),
    ('氪空间', 'admin'),
    ('沃得农机', 'admin'),
    ('小鹏汽车', 'admin'),
    ('京东金融', 'admin');


INSERT INTO infos.hot_keyword (word, crt_user) VALUES
    ('唯品金额', 'admin'),
    ('比克动力', 'admin'),
    ('桑尼能源', 'admin'),
    ('叮咚买菜', 'admin'),
    ('英雄互娱', 'admin'),
    ('优必选', 'admin'),
    ('灿星', 'admin'),
    ('原醉', 'admin'),
    ('蜻蜓FM', 'admin'),
    ('Nonolive', 'admin');


INSERT INTO infos.hot_keyword (word, crt_user) VALUES
    ('极战（上海）机器人', 'admin'),
    ('天津灏峰文化传播', 'admin'),
    ('地球娱乐', 'admin'),
    ('北京君舍文化', 'admin'),
    ('坏男孩学院', 'admin'),
    ('小鹿乱撞', 'admin'),
    ('海豚会员店', 'admin'),
    ('北京蹦酷文化', 'admin'),
    ('凯叔', 'admin'),
    ('程一电台', 'admin');


INSERT INTO infos.hot_keyword (word, crt_user) VALUES
    ('爱尚游', 'admin'),
    ('乌鸦电影', 'admin'),
    ('时间知道', 'admin'),
    ('彩虹堂英语', 'admin'),
    ('神棍局', 'admin'),
    ('云知声', 'admin'),
    ('居然之家', 'admin'),
    ('米未传媒', 'admin'),
    ('哇唧唧哇', 'admin'),
    ('巴图鲁', 'admin');


INSERT INTO infos.hot_keyword (word, crt_user) VALUES
    ('幸福西饼', 'admin'),
    ('苏州速显微电子科技', 'admin'),
    ('北京小京鱼科技', 'admin'),
    ('天津扬天科技', 'admin'),
    ('常州市德速机械', 'admin'),
    ('上海坤锐电子科技', 'admin'),
    ('杭州一知智能科技', 'admin'),
    ('北京中交兴路信源', 'admin'),
    ('深圳市鲸仓科技', 'admin'),
    ('泛测（北京）环境科技', 'admin');


INSERT INTO infos.hot_keyword (word, crt_user) VALUES
    ('上海仁勤信息科技', 'admin'),
    ('北京恩萨工程技术', 'admin'),
    ('南京辉锐光电科技', 'admin'),
    ('知豆电动汽车', 'admin'),
    ('西安飞芯电子科技', 'admin'),
    ('浙江多普勒环保', 'admin'),
    ('杨凌美畅新材料', 'admin'),
    ('杭州思惟音符', 'admin'),
    ('杭州中研三迪机器人', 'admin'),
    ('杭州赛连叁期投资', 'admin');


INSERT INTO infos.hot_keyword (word, crt_user) VALUES
    ('中研碧诚（北京),科技', 'admin'),
    ('江西省绿野汽车照明', 'admin'),
    ('联方云天科技（北京）', 'admin'),
    ('北京中诺恒康生物', 'admin'),
    ('深圳市天行云供应链', 'admin'),
    ('湖南机械之家信息科技', 'admin'),
    ('驰展产业控股（深圳）', 'admin'),
    ('山东何仙姑夫文化传媒（何仙姑夫）', 'admin'),
    ('北京品新传媒文化（36氪媒体）', 'admin'),
    ('上海宝云网络科技', 'admin');


INSERT INTO infos.hot_keyword (word, crt_user) VALUES
    ('北京淘梦网络科技', 'admin'),
    ('索尼中国之星计划', 'admin'),
    ('柳叶刀', 'admin'),
    ('火箭拳', 'admin'),
    ('上海零犀', 'admin'),
    ('战旗', 'admin'),
    ('互联星', 'admin'),
    ('梦光合数字', 'admin'),
    ('誉衡药业', 'admin'),
    ('信邦药业', 'admin');


INSERT INTO infos.hot_keyword (word, crt_user) VALUES
    ('誉衡集团', 'admin'),
    ('匹克体育', 'admin'),
    ('喜马拉雅FM', 'admin'),
    ('上海证大喜马拉雅', 'admin'),
    ('航天长城节能环保科技', 'admin'),
    ('长沙金科时代中心', 'admin'),
    ('青岛中集碧桂园湖悦天境', 'admin'),
    ('镇江中南君悦府', 'admin'),
    ('房多多', 'admin'),
    ('光大灵曦', 'admin');


INSERT INTO infos.hot_keyword (word, crt_user) VALUES
    ('爱侣健康', 'admin'),
    ('华燕房盟', 'admin'),
    ('捷尚股份', 'admin'),
    ('长望科技', 'admin'),
    ('地源科技', 'admin'),
    ('中科汇通', 'admin'),
    ('古董局中局', 'admin'),
    ('浪淘沙演唱会', 'admin'),
    ('雪浪湖生态园', 'admin'),
    ('松江雪浪湖', 'admin');


INSERT INTO infos.hot_keyword (word, crt_user) VALUES
    ('童石网络', 'admin'),
    ('南派泛娱', 'admin'),
    ('南派三叔', 'admin'),
    ('南派娱乐', 'admin'),
    ('大角虫', 'admin'),
    ('十星人影视', 'admin'),
    ('易生金服', 'admin'),
    ('海航集团', 'admin'),
    ('海航旅游', 'admin'),
    ('昆山韦德 ', 'admin');


INSERT INTO infos.hot_keyword (word, crt_user) VALUES
    ('上海复振科技', 'admin'),
    ('卡姆医疗', 'admin'),
    ('先路医药', 'admin'),
    ('谦讯网络', 'admin'),
    ('利隆媒体', 'admin'),
    ('康泽药业', 'admin'),
    ('《大浦东》', 'admin'),
    ('阿尔特汽车', 'admin'),
    ('海能仪器', 'admin'),
    ('源和药业', 'admin');


INSERT INTO infos.hot_keyword (word, crt_user) VALUES
    ('蓝德环保', 'admin'),
    ('恒大湖州悦珑湾', 'admin'),
    ('湖州市乌虹湖置业有限公司', 'admin'),
    ('恒大地产', 'admin'),
    ('恒大集团', 'admin'),
    ('天津金地康成投资', 'admin'),
    ('天津玉鼎大厦', 'admin'),
    ('天津玉鼎商业楼', 'admin'),
    ('上海茸翊贸易', 'admin'),
    ('上海翊觅实业', 'admin');


INSERT INTO infos.hot_keyword (word, crt_user) VALUES
    ('江阴鼎盛置业', 'admin'),
    ('上海豫商置业集团', 'admin'),
    ('苏州金沙湾投资有限公司', 'admin'),
    ('上海星葛贸易有限公司', 'admin'),
    ('上海妃浦实业', 'admin'),
    ('北京盈达置业有限公司', 'admin');


INSERT INTO infos.hot_keyword (word, crt_user) VALUES
    ('荣华东道19弄', 'admin'),
    ('北京工体', 'admin'),
    ('上海城投集团', 'admin'),
    ('上海树惠资产管理', 'admin'),
    ('上海项鑫', 'admin'),
    ('华夏幸福', 'admin'),
    ('德清孔雀城1期', 'admin'),
    ('廊坊京御房地产', 'admin'),
    ('德清孔雀海房地产', 'admin'),
    ('宏信置业有限公司', 'admin');


INSERT INTO infos.hot_keyword (word, crt_user) VALUES
    ('上海雪浪湖企业发展有限公司', 'admin'),
    ('歌德盈香', 'admin'),
    ('茅台酒', 'admin'),
    ('上海睿银盛嘉资产管理', 'admin'),
    ('全寅实业', 'admin'),
    ('中国正信集团', 'admin'),
    ('浙江华越置业有限公司', 'admin'),
    ('隆泰商务印刷（上海）有限公司', 'admin'),
    ('上海云古酒店管理有限公司', 'admin'),
    ('汇丰房地产开发有限公司', 'admin');


INSERT INTO infos.hot_keyword (word, crt_user) VALUES
    ('上海晋歌实业有限公司', 'admin'),
    ('上海忝广置业', 'admin'),
    ('上海装瑾实业', 'admin'),
    ('上海茸享实业', 'admin'),
    ('上海滨河华城项目', 'admin'),
    ('上海蔚珞实业', 'admin'),
    ('青岛宝龙城市广场', 'admin'),
    ('华沪实业', 'admin'),
    ('金汇镇城市更新项目', 'admin');


INSERT INTO infos.hot_keyword (word, crt_user) VALUES
    ('高特佳睿智', 'admin'),
    ('和合诊断', 'admin'),
    ('康爱瑞浩', 'admin'),
    ('天广实生物', 'admin'),
    ('善康科技', 'admin'),
    ('康诺药业', 'admin'),
    ('美华医疗', 'admin'),
    ('美贝尔医疗美容', 'admin'),
    ('仁鹏科技', 'admin'),
    ('丹霞生物', 'admin');


INSERT INTO infos.hot_keyword (word, crt_user) VALUES
    ('康方生物', 'admin'),
    ('安诺优达', 'admin'),
    ('恩迪生物 ', 'admin'),
    ('北京汉新成长', 'admin'),
    ('优脉财富', 'admin'),
    ('博创联动', 'admin'),
    ('未动科技', 'admin'),
    ('友宝在线', 'admin'),
    ('基调网络', 'admin'),
    ('悦美好医', 'admin');


INSERT INTO infos.hot_keyword (word, crt_user) VALUES
    ('熊孩子', 'admin'),    ('职问教育', 'admin'),
    ('荷马项目', 'admin'),
    ('什马金融', 'admin'),
    ('网思科平', 'admin'),
    ('慧联无限', 'admin'),
    ('掌上快销', 'admin'),
    ('友咖啡', 'admin'),
    ('Chic原醉', 'admin'),
    ('迈瑞医疗', 'admin');


INSERT INTO infos.hot_keyword (word, crt_user) VALUES
    ('深圳前海鼎嘉', 'admin'),
    ('上象星作', 'admin'),
    ('乐漾传媒', 'admin'),
    ('微语言', 'admin'),
    ('工夫真言', 'admin'),
    ('功守道 ', 'admin'),
    ('斯维登集团', 'admin'),
    ('指点控股', 'admin'),
    ('Odalys', 'admin');


INSERT INTO infos.hot_keyword (word, crt_user) VALUES
    ('博纳影院', 'admin'),
    ('Hycor Holdings,Inc.', 'admin'),
    ('诺康达', 'admin'),
    ('碧莲盛', 'admin'),
    ('湖南珂信健康', 'admin'),
    ('辰海秒基金', 'admin'),
    ('熊猫TV', 'admin'),
    ('麦锐娱乐', 'admin'),
    ('创客星球', 'admin'),
    ('微念科技', 'admin');


INSERT INTO infos.hot_keyword (word, crt_user) VALUES
    ('亭东影业', 'admin'),
    ('柠萌影业', 'admin'),
    ('货车帮', 'admin'),
    ('运满满', 'admin'),
    ('盛大游戏', 'admin'),
    ('世纪华通', 'admin'),
    ('宿迁幸福学府', 'admin'),
    ('连云港融侨', 'admin'),
    ('安吉度假城', 'admin'),
    ('固安幸福基金仓储服务有限公司', 'admin');


INSERT INTO infos.hot_keyword (word, crt_user) VALUES
    ('荆棘谷智慧物联网', 'admin'),
    ('滴滴', 'admin');