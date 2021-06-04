SET NAMES UTF8;
DROP DATABASE IF EXISTS ag;
CREATE DATABASE ag CHARSET=UTF8;
USE ag;


/**电器型号家族**/
CREATE TABLE ag_electrical_equipment_family(
  fid INT PRIMARY KEY AUTO_INCREMENT,
  fname VARCHAR(32)
);

/**电器**/
CREATE TABLE ag_electrical_equipment(
  lid INT PRIMARY KEY AUTO_INCREMENT,
  family_id INT,              #所属型号家族编号
  title VARCHAR(128),         #标题
  price DECIMAL(10,2),        #价格
  promise VARCHAR(64),        #服务承诺
  spec VARCHAR(64),           #规格/颜色
  name VARCHAR(32),           #商品名称
  shelf_time BIGINT,          #上架时间
  sold_count INT,             #已售出的数量
  is_onsale BOOLEAN           #是否促销中
);

/**电器图片**/
CREATE TABLE ag_electrical_equipment_pic(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  electrical_equipment_id INT,       #电器编号
  sm VARCHAR(128),               #小图片路径
  md VARCHAR(128),               #中图片路径
  lg VARCHAR(128)                #大图片路径
);

/**用户信息**/
CREATE TABLE ag_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(32),
  upwd VARCHAR(32),
  email VARCHAR(64),
  phone VARCHAR(16),

  avatar VARCHAR(128),        #头像图片路径
  user_name VARCHAR(32),      #用户名，如王小明
  gender INT                  #性别  0-女  1-男
);

/**收货地址信息**/
CREATE TABLE ag_receiver_address(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,                #用户编号
  receiver VARCHAR(16),       #接收人姓名
  province VARCHAR(16),       #省
  city VARCHAR(16),           #市
  county VARCHAR(16),         #县
  address VARCHAR(128),       #详细地址
  cellphone VARCHAR(16),      #手机
  fixedphone VARCHAR(16),     #固定电话
  postcode CHAR(6),           #邮编
  tag VARCHAR(16),            #标签名

  is_default BOOLEAN          #是否为当前用户的默认收货地址
);

/**购物车条目**/
CREATE TABLE ag_shopping_cart(
  iid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,      #用户编号
  product_id INT,   #商品编号
  count INT,        #购买数量
  is_checked BOOLEAN #是否已勾选，确定购买
);

/**商品收藏**/
CREATE TABLE ag_collection(
  iid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,      #用户编号
  product_id INT   #商品编号
);

/**用户订单**/
CREATE TABLE ag_order(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  address_id INT,
  status INT,             #订单状态  1-等待付款  2-等待发货  3-运输中  4-已签收  5-已取消
  order_time BIGINT,      #下单时间
  pay_time BIGINT,        #付款时间
  deliver_time BIGINT,    #发货时间
  received_time BIGINT    #签收时间
)AUTO_INCREMENT=10000000;

/**用户订单**/
CREATE TABLE ag_order_detail(
  did INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT,           #订单编号
  product_id INT,         #产品编号
  count INT               #购买数量
);

/****首页轮播广告商品****/
CREATE TABLE ag_index_carousel(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128),
  title VARCHAR(64),
  href VARCHAR(128)
);

/****首页商品****/
CREATE TABLE ag_index_product(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(64),
  details VARCHAR(128),
  pic VARCHAR(128),
  price DECIMAL(10,2),
  href VARCHAR(128),
  seq_recommended TINYINT,
  seq_new_arrival TINYINT,
  seq_top_sale TINYINT
);

/*******************/
/******数据导入******/
/*******************/
/**家族**/
INSERT INTO ag_electrical_equipment_family VALUES
(NULL,'冰箱'),
(NULL,'电视'),
(NULL,'洗衣机'),
(NULL,'空调');

/**电器**/
INSERT INTO ag_electrical_equipment VALUES
(1,1,'格安(AG)468升电冰箱十字对开门 BCD-468WTPM（E)',3599,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','金色','格安BCD-468WTPM(E)',150123456789,2968,true),
(2,1,'格安(AG)481升变频风冷无霜十字双开门 BCD-481WGHTDD9D9U1',4399,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','黑色','格安BCD-481WGHTDD9D9U1',150123456789,2968,true),
(3,2,'格安(AG)55D8K 55英寸全程8K超高清 5+32GB ADS广角硬屏',4599,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','黑色','格安55D8K',150123456789,2968,true),
(4,2,'格安(AG)电视4A 70英寸 4K超高清 HDR 二级能效 2GB+16GB L70M5-4A 内置小爱',3388,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','黑色','格安L70M5-4A',150123456789,2968,true),
(5,3,'格安(AG)滚筒洗衣机全自动 10公斤变频除螨洗烘一体',3099,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','银色','格安MD100A5',150123456789,2968,true),
(6,3,'格安(AG)滚筒洗衣机全自动 高温除菌除螨',2169,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','金色','格安EG10014B39GU1',150123456789,2968,true),
(7,4,'格安(AG)1.5匹 云佳 新一级能效 变频冷暖 自清洁',3099,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','白色','格安KFR-35GW/NhGc1B',150123456789,2968,true),
(8,4,'格安(AG)新一级 冷静星II 智能家电 变频冷暖1.5匹壁挂式空调挂机',2899,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','白色','格安BCD-468WTPM(E)',150123456789,2968,true);

/**电器图片**/
INSERT INTO ag_electrical_equipment_pic VALUES
(NULL, 1, 'img/product/sm/57b12a31N8f4f75a3.jpg','img/a2.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 2, 'img/product/sm/57b12a31N8f4f75a3.jpg','img/a7.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 3, 'img/product/sm/57ad359dNd4a6f130.jpg','img/a5.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 4, 'img/product/sm/57b12a31N8f4f75a3.jpg','img/a4.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 5, 'img/product/sm/57ad359dNd4a6f130.jpg','img/a9.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 6, 'img/product/sm/57ad359dNd4a6f130.jpg','img/a8.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 7, 'img/product/sm/57ad359dNd4a6f130.jpg','img/a10.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 8, 'img/product/sm/57ad359dNd4a6f130.jpg','img/a1.jpg','img/product/lg/57ad359dNd4a6f130.jpg');

/**用户信息**/
INSERT INTO ag_user VALUES
(NULL, 'dingding', '123456', 'ding@qq.com', '13501234567', 'img/avatar/default.png', '丁伟', '1'),
(NULL, 'dangdang', '123456', 'dang@qq.com', '13501234568', 'img/avatar/default.png', '林当', '1'),
(NULL, 'doudou', '123456', 'dou@qq.com', '13501234569', 'img/avatar/default.png', '窦志强', '1'),
(NULL, 'yaya', '123456', 'ya@qq.com', '13501234560', 'img/avatar/default.png', '秦小雅', '0');

/****首页轮播广告商品****/
INSERT INTO ag_index_carousel VALUES
(NULL, 'img/index/lb1.jpg','轮播广告商品1','product_details.html?lid=28'),
(NULL, 'img/index/lb2.jpg','轮播广告商品2','product_details.html?lid=19'),
(NULL, 'img/index/lb3.png','轮播广告商品3','lookforward.html'),
(NULL, 'img/index/lb4.jpg','轮播广告商品4','lookforward.html');

/****首页商品****/
INSERT INTO ag_index_product VALUES
(NULL, '格安(AG)炒菜机器人全自动投料 ', '纤薄机身 双温区双循环 AAT养鲜 星玄青 BCD-520WPJD', 'img/ccj.jpg', 12034, 'product_details.html?lid=25', 7, 7, 7),
(NULL, '格安(AG)468升电冰箱', '纤薄机身 双温区双循环 AAT养鲜 星玄青 BCD-520WPJD', 'img/bx1.jpg', 6988, 'product_details.html?lid=1', 1, 1, 1),
(NULL, '格安(AG)55英寸8K超高清', '伟达G-SYNC HGIG电竞 120Hz HDMI2.1 ', 'img/ds1.jpg', 3488, 'product_details.html?lid=5', 2, 2, 2),
(NULL, '格安(AG)滚筒洗衣机全自动', '0KG低噪变频  羽绒服洗 MG100A5-Y46B', 'img/xyj1.jpg', 5399, 'product_details.html?lid=9', 3, 3, 3),
(NULL, '格安(AG)1.5匹 云佳空调 ', '纤薄机身 双温区双循环 AAT养鲜 星玄青 BCD-520WPJD', 'img/a3.jpg', 4966, 'product_details.html?lid=13', 4, 4, 4),
(NULL, '格安(AG)305升 商用卧式冰柜', '纤薄机身 双温区双循环 AAT养鲜 星玄青 BCD-520WPJD', 'img/bg1.jpg', 1509, 'product_details.html?lid=17', 5, 5, 5),
(NULL, '格安(AG)171瓶控温保湿红酒柜', '纤薄机身 双温区双循环 AAT养鲜 星玄青 BCD-520WPJD', 'img/jg1.jpg', 5066, 'product_details.html?lid=21', 6, 6, 6);



