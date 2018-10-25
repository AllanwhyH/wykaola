SET NAMES UTF8;

DROP DATABASE IF EXISTS kl;

CREATE DATABASE kl CHARSET=UTF8;

USE kl;


/*#1.用户信息表kl_user*/
CREATE TABLE kl_user(
	uid INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	uname VARCHAR(32),
	upwd VARCHAR(32),
	email VARCHAR(64),
	phone VARCHAR(16) NOT NULL UNIQUE,
	avatar VARCHAR(128),
	user_name VARCHAR(32),
	gender INT
);
INSERT INTO kl_user VALUES
(NULL, 'dingding', '123456', 'ding@qq.com', '13501234567', 'img/avatar/default.png', '丁伟', '1'),
(NULL, 'dangdang', '123456', 'dang@qq.com', '13501234568', 'img/avatar/default.png', '林当', '1'),
(NULL, 'doudou', '123456', 'dou@qq.com', '13501234569', 'img/avatar/default.png', '窦志强', '1'),
(NULL, 'yaya', '123456', 'ya@qq.com', '13501234560', 'img/avatar/default.png', '秦小雅', '0');

/**购物车条目**/
CREATE TABLE kl_shoppingcart_item(
  iid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,      /*#用户编号*/
  product_id INT,   /*#商品编号*/
  count INT,        /*#购买数量*/
  is_checked BOOLEAN /*#是否已勾选，确定购买*/
);
INSERT INTO kl_shoppingcart_item VALUES
(NULL,1,1,4,0),
(NULL,1,1,4,1);

/*1.首页轮播图表xz_index_carousel*/
CREATE TABLE kl_index_carousel(
	id INT PRIMARY KEY AUTO_INCREMENT,
	img VARCHAR(128),
	title VARCHAR(64)
);
INSERT INTO kl_index_carousel VALUES
(NULL, 'img/lb-1.jpg','轮播广告商品1'),
(NULL, 'img/lb-2.jpg','轮播广告商品2'),
(NULL, 'img/lb-3.jpg','轮播广告商品3'),
(NULL, 'img/lb-4.jpg','轮播广告商品4');

/*2.专区商品kl_index_product*/
CREATE TABLE kl_index_product(
	cid INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(64), 
	details VARCHAR(128),
	img VARCHAR(128),
	img2 VARCHAR(128),
	price DECIMAL(10,2),
	price_del DECIMAL(10,2),
	xcount VARCHAR(64)
);
INSERT INTO kl_index_product VALUES	
	#会场图片
	(NULL,'会场1',NULL,'img/middle-1.jpg',NULL,NULL,NULL,NULL),
	(NULL,'会场2',NULL,'img/middle-2.jpg',NULL,NULL,NULL,NULL),
	(NULL,'会场3',NULL,'img/middle-3.jpg',NULL,NULL,NULL,NULL),
	(NULL,'会场4',NULL,'img/middle-4.jpg',NULL,NULL,NULL,NULL),

	#今日限时购
	(NULL,'不打针也能拥有水光肌','JAYJUN 水光再生洗面奶 150毫升', 'img/jrxsg-1.jpg',NULL,2889,3889,'限购500件'),
	(NULL,'添加维生素 高钙高蛋白','【新西兰本土版】Anchor 安佳 多维营养脱脂成人奶粉 900克/罐', 'img/jrxsg-2.jpg',NULL,199,399,'剩余50件'),
	(NULL,'水光透亮肌肤秘诀','EAORON耀妆 玻尿酸高效保湿护肤套装', 'img/jrxsg-3.jpg',NULL,216,598,'限量100件'),
	(NULL,'Pampers 帮宝适','【官方直采】Pampers 帮宝适一级帮 L36片/包 2包装 拉拉裤箱装', 'img/jrxsg-4.jpg',NULL,219,299,'限购100件'),
	(NULL,NULL,NULL, 'img/jrxsg-5.png',NULL,NULL,NULL,NULL),

	#今日上新
	(NULL,'元朗荣华',NULL, 'img/jrsx-1.jpg','img/jrsx-1-1.jpg',NULL,NULL,NULL),
	(NULL,'5分钟商学院·商业篇(市场版)',NULL, 'img/jrsx-2.jpg',null,35.86,49.8,NULL),
	(NULL,'SunnyHills微热山丘 蜜丰糖脆蛋糕 7.5g*12片 进口蛋糕营养早餐网红零食小吃',NULL, 'img/jrsx-6.jpg',null,80,100,NULL),
	(NULL,'【 脂肪糖分代谢 肝胆肾健康】life Extension活性复合维生素B族60粒 美国直邮',NULL, 'img/jrsx-4.jpg',null,214,500,NULL),
	(NULL,'【颜值爆表不怕岁月】BONBACK乌鸡牌 冰糖燕窝45毫升*6瓶',NULL, 'img/jrsx-5.png',null,169,499,NULL),
	(NULL,'盛香珍  香辣味青豆 休闲旅游零食 240g/袋',NULL, 'img/jrsx-3.jpg',null,17.9,30,NULL),
	(NULL,'加油卡',NULL, 'img/jrsx-7.jpg',NULL,150,300,NULL),
	(NULL,'09.15&nbsp;|&nbsp;每日上新新品',NULL, 'img/jrsx-8.jpg',NULL,NULL,NULL,NULL),

	#热门品牌
	(NULL,'SHISEIDO 资生堂','创造美丽生活的文化','img/rmpp-1-1.jpg',NULL,NULL,NULL,NULL),
	(NULL,'SHISEIDO 资生堂','创造美丽生活的文化','img/rmpp-1-2.jpg',NULL,NULL,NULL,NULL),
	(NULL,'SHISEIDO 资生堂','创造美丽生活的文化','img/rmpp-1-3.jpg',NULL,NULL,NULL,NULL),
	(NULL,'网易原创生活类品牌','429590人关注该品牌', 'img/rmpp-2.jpg',NULL,NULL,NULL,NULL),
	(NULL,'基因级肌密修复','579093人关注该品牌', 'img/rmpp-3.jpg',NULL,NULL,NULL,NULL),
	(NULL,'法兰西的浪漫玫瑰','510519人关注该品牌', 'img/rmpp-4.jpg',NULL,NULL,NULL,NULL),
	(NULL,'科学配方 优质原材料','786336人关注该品牌', 'img/rmpp-5.jpg',NULL,NULL,NULL,NULL),
	(NULL,'全球知名的运动品牌','153068人关注该品牌', 'img/rmpp-6.jpg',NULL,NULL,NULL,NULL),
	(NULL,'打造健康肌肤','436690人关注该品牌', 'img/rmpp-7.jpg',NULL,NULL,NULL,NULL),
	(NULL,'高雅与华丽的代名词','452684人关注该品牌', 'img/rmpp-8.jpg',NULL,NULL,NULL,NULL),
	(NULL,'源自纽约的国际时尚品牌','793162人关注该品牌', 'img/rmpp-9.jpg',NULL,NULL,NULL,NULL),

	#专区首图
	(NULL,NULL,NULL, 'img/my-1.jpg',NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL, 'img/meir-1.jpg',NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL, 'img/shirt-1.jpg',NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL, 'img/homeju-1.jpg',NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL, 'img/yyang-1.jpg',NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL, 'img/sma-1.jpg',NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL, 'img/sport-1.jpg',NULL,NULL,NULL,NULL),

	#母婴专区
	(NULL,'辅食N元任选','最多99选9', 'img/my-2.jpg',NULL,NULL,NULL,NULL),
	(NULL,'用品N元任选','最多99选8', 'img/my-3.jpg',NULL,NULL,NULL,NULL),
	(NULL,'童装童鞋馆','最高188减100', 'img/my-4.jpg',NULL,NULL,NULL,NULL),
	(NULL,'玩具N元任选','最多99选10', 'img/my-5.jpg',NULL,NULL,NULL,NULL),

	#美容彩妆
	(NULL,'美妆热销专场','美妆热点盘点', 'img/meir-4.jpg',NULL,NULL,NULL,NULL),
	(NULL,'美容仪器馆','热门美颜新科技', 'img/meir-5.jpg',NULL,NULL,NULL,NULL),
	(NULL,'美妆面膜馆','人气面膜大搜罗', 'img/meir-2.jpg',NULL,NULL,NULL,NULL),
	(NULL,'美妆新品专场','尝新党剁手必看', 'img/meir-3.jpg',NULL,NULL,NULL,NULL),

	#
	(NULL,'时尚博主教你“型”','亚历山大·王5.0折起', 'img/shirt-2.jpg',NULL,NULL,NULL,NULL),
	(NULL,'潮流服饰鞋靴会场','专柜同款 型格上新', 'img/shirt-3.jpg',NULL,NULL,NULL,NULL),
	(NULL,'美式轻奢品牌专场','新品包袋低至499元起', 'img/shirt-4.jpg',NULL,NULL,NULL,NULL),
	(NULL,'男人也要“千娇百媚”','男士臻品低至3.9折', 'img/shirt-5.jpg',NULL,NULL,NULL,NULL),

	(NULL,'秋季滋养正当时','雅顿身体乳低至75元/瓶', 'img/homeju-2.jpg',NULL,NULL,NULL,NULL),
	(NULL,'个人洗护任选专场','99元任选5件起', 'img/homeju-3.jpg',NULL,NULL,NULL,NULL),
	(NULL,'一屋不扫何以扫天下','满168立减40元起', 'img/homeju-4.jpg',NULL,NULL,NULL,NULL),
	(NULL,'唯有爱与下厨不可辜负','碧然德滤水壶低至119元', 'img/homeju-5.jpg',NULL,NULL,NULL,NULL),

	(NULL,'传统滋补','全场满399减150元', 'img/yyang-2.jpg',NULL,NULL,NULL,NULL),
	(NULL,'职场营养','护眼片低至88元', 'img/yyang-3.jpg',NULL,NULL,NULL,NULL),
	(NULL,'运动营养专场','美瑞克斯赛霸增肌粉低至288元', 'img/yyang-4.jpg',NULL,NULL,NULL,NULL),
	(NULL,'考拉海外分站','参天眼药水香港直邮', 'img/yyang-5.jpg',NULL,NULL,NULL,NULL),

	(NULL,'数码家电热销榜','热门推荐一网打尽', 'img/sma-2.jpg',NULL,NULL,NULL,NULL),
	(NULL,'数码NEW货榜','第一时间用上潮流款', 'img/sma-3.jpg',NULL,NULL,NULL,NULL),
	(NULL,'历届IF奖大赏','用心种草 为你精选', 'img/sma-4.jpg',NULL,NULL,NULL,NULL),
	(NULL,'历届红点奖大赏','以创新 致匠心', 'img/sma-5.jpg',NULL,NULL,NULL,NULL),

	(NULL,'斯凯奇新品上市','热门鞋款低至5.7折', 'img/sport-2.jpg',NULL,NULL,NULL,NULL),
	(NULL,'潮流运动焕新','阿迪耐克新品6折起', 'img/sport-3.jpg',NULL,NULL,NULL,NULL),
	(NULL,'活力出游季','防晒装备低至39元起', 'img/sport-4.jpg',NULL,NULL,NULL,NULL),
	(NULL,'汽车用品养护专场','机油低至49.9元', 'img/sport-5.jpg',NULL,NULL,NULL,NULL),

	#专区轮播的图片
	(NULL,'【宝宝肠道护卫队】Culturelle 康萃乐 儿童益生菌粉 30袋/盒 2盒装',NULL,'img/my-lb-1-1.jpg',NULL,278,398,NULL),
	(NULL,'CALIFORNIA BABY 加州宝宝 桉树精华泡泡浴 384毫升',NULL,'img/my-lb-1-4.jpg',NULL,95,289,NULL),
	(NULL,'【酸奶口感 不上火】CHILDLIFE 童年时光 钙镁锌成长营养液 474毫升（6个月~12岁）',NULL,'img/my-lb-1-3.jpg',NULL,171,228,NULL),
	(NULL,'【经典款】MAXI-COSI 迈可适 Pria 70 汽车儿童安全座椅0-7岁',NULL,'img/my-lb-1-2.jpg',NULL,799,998,NULL),

	(NULL,'BIODERMA 贝德玛 舒妍温和保湿卸妆水 500毫升 粉水 敏感肌用',NULL,'img/meir-lb-1.jpg',NULL,109,225,NULL),
	(NULL,'DoMeCare 欣兰 黑里透白冻膜 225g+城野医生水 100ml 【拍套餐享优惠】',NULL,'img/meir-lb-2.jpg',NULL,175,395,NULL),
	(NULL,'贝德玛 舒妍温和卸妆水 500毫升 蓝水 卸妆保养一瓶搞定',NULL,'img/meir-lb-3.jpg',NULL,105,225,NULL),
	(NULL,'【3件装】MEDIHEAL 美迪恵尔 N.M.F针剂水库保湿面膜 10片/盒【拍套餐享优惠】',NULL,'img/meir-lb-4.jpg',NULL,186,507,NULL),

	(NULL,'【蜜桃粉!】Fjallraven 瑞典北极狐 Kanken Classic 经典款双肩背包 F23510-319',NULL,'img/shirt-lb-1.jpg',NULL,439,699,NULL),
	(NULL,'【领券立减80】Ray·Ban 雷朋 非偏光镜片 派对达人系列太阳眼镜 墨绿色 RB3016 W0365 镜片尺寸49毫米',NULL,'img/shirt-lb-2.jpg',NULL,659,998,NULL),
	(NULL,'【2代短筒靴】UGG  Classic Mini II系列 女士防水防污羊皮短筒雪地靴',NULL,'img/shirt-lb-3.jpg',NULL,699,899,NULL),
	(NULL,'网易严选 雪丝竹节纹男式隐形袜 5双装',NULL,'img/shirt-lb-4.jpg',NULL,39,39,NULL),

	(NULL,'SHISEIDO 资生堂旗下 Fino  高效滋润渗透发膜 230克/罐',NULL,'img/homeju-lb-1.jpg',NULL,58,148,NULL),
	(NULL,'Propolinse 比那氏蜂胶除口臭漱口水600毫升/瓶 2瓶装',NULL,'img/homeju-lb-2.jpg',NULL,79,128,NULL),
	(NULL,'Lauríer 乐而雅 S系列 超薄瞬吸护翼日用卫生巾 20.5厘米 28片/包',NULL,'img/homeju-lb-3.jpg',NULL,29,48,NULL),
	(NULL,'熊野油脂 无硅弱酸性马油洗发水 600毫升/瓶 2瓶装',NULL,'img/homeju-lb-4.jpg',NULL,69,129,NULL),
	
	(NULL,'【祛黄美颜好气色】Salus 莎露斯 Floradix 德国铁元草本营养液补铁养血绿色版500ml 2件',NULL,'img/yyang-lb-1.jpg',NULL,199,598,NULL),
	(NULL,'【钙质易吸收，不腹胀】Swisse 钙&VD片 150片/罐 2罐',NULL,'img/yyang-lb-2.jpg',NULL,162,378,NULL),
	(NULL,'【宋钟基同款】KGC 正官庄 everytime高丽参口服液 10ml*30支',NULL,'img/yyang-lb-3.jpg',NULL,668,888,NULL),
	(NULL,'【吴秀波同款】【日常关节保养】Schiff 维骨力氨糖软骨素片170粒 2瓶',NULL,'img/yyang-lb-4.jpg',NULL,369,369,NULL),

	(NULL,'nathome 北欧欧慕 NSH0603 可折叠双电压电热水壶 旅行便携 0.6L 白色',NULL,'img/sma-lb-1.jpg',NULL,159,199,NULL),
	(NULL,'Apple 苹果 AirPods 蓝牙无线耳机（MMEF2CH/A）',NULL,'img/sma-lb-2.jpg',NULL,699,989,NULL),
	(NULL,'Apple 苹果 iPhone X 64GB 移动联通电信4G手机 国内行货',NULL,'img/sma-lb-3.jpg',NULL,7098,8316,NULL),
	(NULL,'PHILIPS 飞利浦钻石亮白型声波震动电动牙刷HX9362/67 粉钻',NULL,'img/sma-lb-4.jpg',NULL,869,1699,NULL),

	(NULL,'【24/7系列】OSPREY Questa 魁星 城市通勤日用双肩背包 27L',NULL,'img/sport-lb-1.jpg',NULL,769,899,NULL),
	(NULL,'Adidas 三叶草 Superstar 黑白金标贝壳头男女滑板鞋运动板鞋',NULL,'img/sport-lb-2.jpg',NULL,449,799,NULL),
	(NULL,'SUUNTO 颂拓 TRAVERSE ALPHA 户外运动GPS 多功能腕表 远征阿尔法军表',NULL,'img/sport-lb-3.jpg',NULL,329,499,NULL),
	(NULL,'【防晒神器】Let s diet 韩国美肤光疗 防晒帽 防晒指数 UPF50+ 均码',NULL,'img/sport-lb-4.jpg',NULL,99,198,NULL),

	#猜你喜欢
	(NULL,'SHISEIDO 资生堂 安耐晒小金瓶防晒露  60毫升 2018版本 防水防汗',NULL,'img/jrsx-1.jpg',NULL,169,300,NULL),
	(NULL,'unicharm 尤妮佳 Silcot省1/2化妆水化妆棉 40枚 四盒装',NULL,'img/ylike-2.jpg',NULL,62,99,NULL),
	(NULL,'【自营 3瓶装】RE:CIPE 水晶防晒喷雾 150毫升/瓶  2018新版【拍套餐享优惠】',NULL,'img/ylike-3.jpg',NULL,162,395,NULL),
	(NULL,'【10件装】NARIS UP 娜丽丝 UV防晒喷雾 90克',NULL,'img/ylike-4.jpg',NULL,469,999,NULL),

	#专区商品品牌
	(NULL,NULL,NULL,'img/1-rmai-1.jpg',NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/1-rmai-2.jpg',NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/1-rmai-3.jpg',NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/1-rmai-4.jpg',NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/1-rmai-5.jpg',NULL,NULL,NULL,NULL),

	(NULL,NULL,NULL,'img/2-rmai-1.jpg',NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/2-rmai-2.jpg',NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/2-rmai-3.jpg',NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/2-rmai-4.jpg',NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/2-rmai-5.jpg',NULL,NULL,NULL,NULL),

	(NULL,NULL,NULL,'img/3-rmai-1.jpg',NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/3-rmai-2.jpg',NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/3-rmai-3.jpg',NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/3-rmai-4.jpg',NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/3-rmai-5.jpg',NULL,NULL,NULL,NULL),

	(NULL,NULL,NULL,'img/4-rmai-1.jpg',NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/4-rmai-2.jpg',NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/4-rmai-3.jpg',NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/4-rmai-4.jpg',NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/4-rmai-5.jpg',NULL,NULL,NULL,NULL),

	(NULL,NULL,NULL,'img/5-rmai-1.jpg',NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/5-rmai-2.jpg',NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/5-rmai-3.jpg',NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/5-rmai-4.jpg',NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/5-rmai-5.jpg',NULL,NULL,NULL,NULL),

	(NULL,NULL,NULL,'img/6-rmai-1.jpg',NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/6-rmai-2.jpg',NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/6-rmai-3.jpg',NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/6-rmai-4.jpg',NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/6-rmai-5.jpg',NULL,NULL,NULL,NULL),

	(NULL,NULL,NULL,'img/7-rmai-1.jpg',NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/7-rmai-2.jpg',NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/7-rmai-3.jpg',NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/7-rmai-4.jpg',NULL,NULL,NULL,NULL),
	(NULL,NULL,NULL,'img/7-rmai-5.jpg',NULL,NULL,NULL,NULL);


/**/

/*2.会场图片kl_index_huich
CREATE TABLE kl_index_huich(
	cid INT PRIMARY KEY AUTO_INCREMENT,
	img VARCHAR(128),
	title VARCHAR(64)
);
INSERT INTO kl_index_huich VALUES*/


/*3.今日限时购
CREATE TABLE kl_index_jrxsg(
	cid INT PRIMARY KEY AUTO_INCREMENT,
	img VARCHAR(128),
	title VARCHAR(64),
	details VARCHAR(128),
	price DECIMAL(10,2),
	price_del DECIMAL(10,2)
);
INSERT INTO kl_index_jrxsg VALUES*/


/*4.今日上新kl_index_jrsx
CREATE TABLE kl_index_jrsx(
	cid INT PRIMARY KEY AUTO_INCREMENT,
	img1 VARCHAR(128),
	img2 VARCHAR(128),
	title VARCHAR(64),
	price DECIMAL(10,2),
	price_del DECIMAL(10,2)
);
INSERT INTO kl_index_jrsx VALUES*/


/*5.热门品牌kl_index_rmpp
CREATE TABLE kl_index_rmpp(
	cid INT PRIMARY KEY AUTO_INCREMENT,
	img VARCHAR(128),
	title VARCHAR(64),
	details VARCHAR(128)
);
INSERT INTO kl_index_rmpp VALUES*/


/*6.专区首图kl_index_product_first
CREATE TABLE kl_index_product_first(
	cid INT PRIMARY KEY AUTO_INCREMENT,
	img VARCHAR(128)
);
INSERT INTO kl_index_product_first VALUES*/




/*8.专区商品轮播kl_index_product_lb
CREATE TABLE kl_index_product_lb(
	cid INT PRIMARY KEY AUTO_INCREMENT,
	img VARCHAR(128),
	title VARCHAR(128), 
	price DECIMAL(10,2),
	price_del DECIMAL(10,2)
);
INSERT INTO kl_index_product_lb VALUES*/
	
/**/

/*9.专区商品品牌kl_index_product_pp
CREATE TABLE kl_index_product_pp(
	cid INT PRIMARY KEY AUTO_INCREMENT,
	img VARCHAR(128)
);
INSERT INTO kl_index_product_pp VALUES*/
	

/**/




/**商品图片
CREATE TABLE kl_laptop_pic(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  laptop_id INT,              #编号
  lg VARCHAR(128)             #图片路径
);
INSERT INTO kl_laptop_pic VALUES
	(NULL,1,img/1-rmai-1.jpg),
	(NULL,1,img/1-rmai-2.jpg),
	(NULL,1,img/1-rmai-3.jpg),
	(NULL,1,img/1-rmai-4.jpg),
	(NULL,1,img/1-rmai-5.jpg),

	(NULL,2,img/2-rmai-1.jpg),
	(NULL,2,img/2-rmai-2.jpg),
	(NULL,2,img/2-rmai-3.jpg),
	(NULL,2,img/2-rmai-4.jpg),
	(NULL,2,img/2-rmai-5.jpg),

	(NULL,3,img/3-rmai-1.jpg),
	(NULL,3,img/3-rmai-2.jpg),
	(NULL,3,img/3-rmai-3.jpg),
	(NULL,3,img/3-rmai-4.jpg),
	(NULL,3,img/3-rmai-5.jpg),

	(NULL,4,img/4-rmai-1.jpg),
	(NULL,4,img/4-rmai-2.jpg),
	(NULL,4,img/4-rmai-3.jpg),
	(NULL,4,img/4-rmai-4.jpg),
	(NULL,4,img/4-rmai-5.jpg),

	(NULL,5,img/5-rmai-1.jpg),
	(NULL,5,img/5-rmai-2.jpg),
	(NULL,5,img/5-rmai-3.jpg),
	(NULL,5,img/5-rmai-4.jpg),
	(NULL,5,img/5-rmai-5.jpg),

	(NULL,6,img/6-rmai-1.jpg),
	(NULL,6,img/6-rmai-2.jpg),
	(NULL,6,img/6-rmai-3.jpg),
	(NULL,6,img/6-rmai-4.jpg),
	(NULL,6,img/6-rmai-5.jpg),
	(NULL,7,img/7-rmai-1.jpg),
	(NULL,7,img/7-rmai-2.jpg),
	(NULL,7,img/7-rmai-3.jpg),
	(NULL,7,img/7-rmai-4.jpg),
	(NULL,7,img/7-rmai-5.jpg),

	(NULL,8,img/aixin.png),
	(NULL,9,img/all-smlogo.png),
	(NULL,10,img/bottom-1.png),
	(NULL,10,img/bottom-2.png),
	(NULL,10,img/bottom-3.png),
	(NULL,10,img/bottom-4.gif),
	(NULL,10,img/bottom-logo.png),
	(NULL,10,img/bottom-phone-erw.png),
	(NULL,10,img/bottom-wb.png),
	(NULL,10,img/bottom-weibo.png),
	(NULL,10,img/bottom-weix.png),
	(NULL,10,img/bottom-wx.png),
	(NULL,10,img/bottom-yix.png),

	(NULL,11,img/fixed-ewm.jpg),

	(NULL,12,img/homeju-1.jpg),
	(NULL,12,img/homeju-2.jpg),
	(NULL,12,img/homeju-3.jpg),
	(NULL,12,img/homeju-4.jpg),
	(NULL,12,img/homeju-5.jpg),
	(NULL,12,img/homeju-lb-1.jpg),
	(NULL,12,img/homeju-lb-2.jpg),
	(NULL,12,img/homeju-lb-3.jpg),
	(NULL,12,img/homeju-lb-4.jpg),

	(NULL,13,img/jrsx-1-1.jpg),
	(NULL,13,img/jrsx-1.jpg),
	(NULL,13,img/jrsx-2.jpg),
	(NULL,13,img/jrsx-3.jpg),
	(NULL,13,img/jrsx-4.jpg),
	(NULL,13,img/jrsx-5.jpg),
	(NULL,13,img/jrsx-6.jpg),
	(NULL,13,img/jrsx-7.jpg),
	(NULL,13,img/jrsx-8.jpg),

	(NULL,14,img/jrxsg-1.jpg),
	(NULL,14,img/jrxsg-2.jpg),
	(NULL,14,img/jrxsg-3.jpg),
	(NULL,14,img/jrxsg-4.jpg),
	(NULL,14,img/jrxsg-5.jpg),

	(NULL,15,img/List-1.jpg),
	(NULL,15,img/list-1.png),
	(NULL,15,img/list-2.png),
	(NULL,15,img/list-3.png),
	(NULL,15,img/list-4.png),
	(NULL,15,img/list-5.png),
	(NULL,15,img/list-6.png),
	(NULL,15,img/list-7.png),
	(NULL,15,img/list-8.png),
	(NULL,15,img/list-9.png),
	(NULL,15,img/list-10.png),

	(NULL,16,img/logo-sousou.png),
	(NULL,17,img/logo.png),
	(NULL,18,img/manjian.jpg),

	(NULL,19,img/meir-1.jpg),
	(NULL,19,img/meir-2.jpg),
	(NULL,19,img/meir-3.jpg),
	(NULL,19,img/meir-4.jpg),
	(NULL,19,img/meir-5.jpg),
	(NULL,19,img/meir-lb-1.jpg),
	(NULL,19,img/meir-lb-2.jpg),
	(NULL,19,img/meir-lb-3.jpg),
	(NULL,19,img/meir-lb-4.jpg),

	(NULL,20,img/middle-1.jpg),
	(NULL,20,img/middle-2.jpg),
	(NULL,20,img/middle-3.jpg),
	(NULL,20,img/middle-4.jpg),

	(NULL,21,img/my-1.jpg),
	(NULL,21,img/my-2.jpg),
	(NULL,21,img/my-3.jpg),
	(NULL,21,img/my-4.jpg),
	(NULL,21,img/my-5.jpg),
	(NULL,21,img/my-lb-1-1.jpg),
	(NULL,21,img/my-lb-1-2.jpg),
	(NULL,21,img/my-lb-1-3.jpg),
	(NULL,21,img/my-lb-1-4.jpg),

	(NULL,22,img/nav-phone.png),

	(NULL,23,img/rmpp-1-1.jpg),
	(NULL,23,img/rmpp-1-2.jpg),
	(NULL,23,img/rmpp-1-3.jpg),
	(NULL,23,img/rmpp-2.jpg),
	(NULL,23,img/rmpp-3.jpg),
	(NULL,23,img/rmpp-4.jpg),
	(NULL,23,img/rmpp-5.jpg),
	(NULL,23,img/rmpp-6.jpg),
	(NULL,23,img/rmpp-7.jpg),
	(NULL,23,img/rmpp-8.jpg),
	(NULL,23,img/rmpp-9.jpg),

	(NULL,24,img/section-mj.jpg),

	(NULL,25,img/shirt-1.jpg),
	(NULL,25,img/shirt-2.jpg),
	(NULL,25,img/shirt-3.jpg),
	(NULL,25,img/shirt-4.jpg),
	(NULL,25,img/shirt-5.jpg),
	(NULL,25,img/shirt-lb-1.jpg),
	(NULL,25,img/shirt-lb-2.jpg),
	(NULL,25,img/shirt-lb-3.jpg),
	(NULL,25,img/shirt-lb-4.jpg),

	(NULL,26,img/sma-1.jpg),
	(NULL,26,img/sma-2.jpg),
	(NULL,26,img/sma-3.jpg),
	(NULL,26,img/sma-4.jpg),
	(NULL,26,img/sma-5.jpg),
	(NULL,26,img/sma-lb-1.jpg),
	(NULL,26,img/sma-lb-2.jpg),
	(NULL,26,img/sma-lb-3.jpg),
	(NULL,26,img/sma-lb-4.jpg),

	(NULL,27,img/sport-1.jpg),
	(NULL,27,img/sport-2.jpg),
	(NULL,27,img/sport-3.jpg),
	(NULL,27,img/sport-4.jpg),
	(NULL,27,img/sport-5.jpg),
	(NULL,27,img/sport-lb-1.jpg),
	(NULL,27,img/sport-lb-2.jpg),
	(NULL,27,img/sport-lb-3.jpg),
	(NULL,27,img/sport-lb-4.jpg),

	(NULL,28,img/top-shoppcart.png),
	(NULL,28,img/top-soso.png),
	(NULL,28,img/top.jpg),

	(NULL,29,img/ylike-1.jpg),
	(NULL,29,img/ylike-2.jpg),
	(NULL,29,img/ylike-3.jpg),
	(NULL,29,img/ylike-4.jpg),

	(NULL,30,img/yyang-1.jpg),
	(NULL,30,img/yyang-2.jpg),
	(NULL,30,img/yyang-3.jpg),
	(NULL,30,img/yyang-4.jpg),
	(NULL,30,img/yyang-5.jpg),
	(NULL,30,img/yyang-lb-1.jpg),
	(NULL,30,img/yyang-lb-2.jpg),
	(NULL,30,img/yyang-lb-3.jpg),
	(NULL,30,img/yyang-lb-4.jpg),*/

	/*login文件夹中的img
	(NULL,31,img/1.png),
	(NULL,32,img/3.jpg),
	(NULL,33,img/all-smlogo.png),
	(NULL,34,img/all.png),
	(NULL,35,img/bg.jpg),
	
	(NULL,36,img/bottom-1.png),
	(NULL,36,img/bottom-3.png),
	(NULL,36,img/bottom-4.gif),
	
	(NULL,37,img/logo.png),
	(NULL,38,img/phone-suo.png),
	(NULL,39,img/scap.png),
	(NULL,40,img/slider.png),*/
	
	/*购物车中的img
	(NULL,41,img/7toe.png),
	(NULL,42,img/all-smlogo.png),

	(NULL,43,img/bottom-1.png),
	(NULL,43,img/bottom-2.png),
	(NULL,43,img/bottom-3.png),
	(NULL,43,img/bottom-4.gif),
	(NULL,43,img/bottom-phone-erw.png),
	(NULL,43,img/bottom-weibo.png),
	(NULL,43,img/bottom-weix.png),
	(NULL,43,img/bottom-yix.png),

	(NULL,44,img/cart-1.jpg),
	(NULL,44,img/cart-2.jpg),
	(NULL,44,img/cart-3.jpg),
	
	(NULL,45,img/guess-1.jpg),
	(NULL,45,img/guess-2.jpg),
	(NULL,45,img/guess-3.jpg),
	(NULL,45,img/guess-4.jpg),
	(NULL,45,img/guess-5.jpg),
	
	(NULL,46,img/lapa.png),
	
	(NULL,47,img/logo-sousou.png),
	(NULL,47,img/logo.png),
	(NULL,48,img/red-gou.png),
	(NULL,49,img/top-shoppcart.png),
	
	(NULL,50,img/we-3.jpg),
	(NULL,50,img/we-4.jpg),
	(NULL,50,img/we-5.jpg),
	
	(NULL,51,img/zj-1.jpg),
	(NULL,51,img/zj-2.jpg),
	(NULL,51,img/zj-3.jpg),
	(NULL,51,img/zj-4.jpg);*/
	
	
/**/


/*#6.商品类别表kl_laptop_family
CREATE TABLE kl_laptop_family(
	lid INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(32)
);
INSERT INTO kl_laptop_family VALUES
(NULL,'会场商品'),
(NULL,'今日限时购'),
(NULL,'今日上新'),
(NULL,'热门品牌'),
(NULL,'母婴专区'),
(NULL,'美容彩妆'),
(NULL,'服饰鞋包'),
(NULL,'家居个护'),
(NULL,'营养保健'),
(NULL,'数码家电'),
(NULL,'运动户外'),
(NULL,'猜你喜欢');*/




