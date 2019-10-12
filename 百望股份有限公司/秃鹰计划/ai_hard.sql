/*
Navicat MySQL Data Transfer

Source Server         : 192.168.6.141
Source Server Version : 50632
Source Host           : 192.168.6.141:3306
Source Database       : ai_hard

Target Server Type    : MYSQL
Target Server Version : 50632
File Encoding         : 65001

Date: 2019-09-20 15:27:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ai_commodity_code
-- ----------------------------
DROP TABLE IF EXISTS `ai_commodity_code`;
CREATE TABLE `ai_commodity_code` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ART_NO` varchar(32) NOT NULL COMMENT '商品编码',
  `ART_NAME` varchar(200) NOT NULL COMMENT '商品名称',
  `TAX_CODE` varchar(32) NOT NULL COMMENT '税收分类编码',
  `TAX_RATE` decimal(20,6) DEFAULT NULL COMMENT '税率',
  `CREATE_USER_ID` decimal(11,0) DEFAULT NULL COMMENT '创建人ID',
  `UPDATE_USER_ID` decimal(11,0) DEFAULT NULL COMMENT '更新人ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `RESERVED1` varchar(32) DEFAULT NULL COMMENT '预留字段1',
  `RESERVED2` varchar(32) DEFAULT NULL COMMENT '预留字段2',
  `ORG_CODE` varchar(12) DEFAULT '2005' COMMENT '机构id/门店id',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=303966 DEFAULT CHARSET=utf8 COMMENT='商品编码映射表';

-- ----------------------------
-- Records of ai_commodity_code
-- ----------------------------

-- ----------------------------
-- Table structure for ai_device_info
-- ----------------------------
DROP TABLE IF EXISTS `ai_device_info`;
CREATE TABLE `ai_device_info` (
  `ID` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `SELLER_NAME` varchar(200) DEFAULT NULL COMMENT '销售方名称',
  `SELLER_TAX_NO` varchar(30) DEFAULT NULL COMMENT '销售方税号',
  `ADDRESS_PHONE` varchar(200) DEFAULT NULL COMMENT '地址电话',
  `BANK_ACCOUNT` varchar(200) DEFAULT NULL COMMENT '开户行及账号',
  `INVOICE_TERMINAL_CODE` varchar(30) DEFAULT NULL COMMENT '开票点代码',
  `MACHINE_NO` varchar(30) DEFAULT NULL COMMENT '服务器编号',
  `DRAWER` varchar(30) DEFAULT NULL COMMENT '开票人',
  `PAYEE` varchar(30) DEFAULT NULL COMMENT '收款人',
  `CHECKER` varchar(30) DEFAULT NULL COMMENT '复核人',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATE_USER_ID` varchar(20) DEFAULT NULL COMMENT '更新人',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATE_USER_ID` varchar(20) DEFAULT NULL COMMENT '创建人',
  `TELPHONE` varchar(20) DEFAULT NULL COMMENT ' 注册用户手机号',
  `MAC` varchar(100) DEFAULT NULL COMMENT '智能硬件mac地址',
  `EMAIL` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `PASSWORD` varchar(100) DEFAULT NULL COMMENT '密码',
  `IS_BIND` int(2) DEFAULT NULL COMMENT '绑定状态：0未绑定、1已绑定',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='税务配置表';

-- ----------------------------
-- Records of ai_device_info
-- ----------------------------
INSERT INTO `ai_device_info` VALUES ('1', '百望税控5', '91500000747150337A', '肇庆市二塔路东侧3号四季康庭首层08、09商铺及二层202号房屋（0758）2725712', '中国工商银行肇庆市第一支行11111112', '', '499111005230', 'ceshi', 'ceshi', 'ceshi', null, null, null, null, null, null, null, null, null);
INSERT INTO `ai_device_info` VALUES ('2', '质保012', '500102020170810', null, null, null, null, 'd', 'p', 'c', null, null, null, null, null, null, null, null, null);
INSERT INTO `ai_device_info` VALUES ('3', '测试49', '512345678900000049', '肇庆市二塔路东侧3号四季康庭首层08、09商铺及二层202号房屋（0758）2725712', '中国工商银行肇庆市第一支行11111112', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `ai_device_info` VALUES ('4', '中国工商银行北京分行', '110102746140739', '地址123电话456', '银行123', null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for ai_invoice
-- ----------------------------
DROP TABLE IF EXISTS `ai_invoice`;
CREATE TABLE `ai_invoice` (
  `INVOICE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `INVOICE_YM` decimal(6,0) DEFAULT NULL COMMENT '发票年月，YYYYMM',
  `INVOICE_YMD` decimal(8,0) DEFAULT NULL COMMENT '发票日期，YYYYMMDD',
  `SERIAL_NO` varchar(50) NOT NULL COMMENT '开票流水号，唯一标志开票请求。支持数字字母下划线组合',
  `INVOICE_TYPE_CODE` varchar(10) DEFAULT NULL COMMENT '发票类型代码。 004：增值税纸质专用发票，007：增值税纸质普通发票， 026增值税电子普通发票',
  `INVOICE_TERMINAL_CODE` varchar(20) DEFAULT NULL COMMENT '开票点编码',
  `INVOICE_SPECIAL_MARK` varchar(2) DEFAULT NULL COMMENT '特殊票种标记，00：普通发票 02：农业发票 06：抵扣通行费 07：其他通行费 08:成品油 默认：00',
  `SELLER_TAX_NO` varchar(20) DEFAULT NULL COMMENT '销售方纳税人识别号',
  `SELLER_NAME` varchar(200) DEFAULT NULL COMMENT '销售方名称',
  `SELLER_ADDRESS_PHONE` varchar(140) DEFAULT NULL COMMENT '销售方地址电话',
  `SELLER_BANK_ACCOUNT` varchar(160) DEFAULT NULL COMMENT '销售方银行账号',
  `BUYER_TAX_NO` varchar(20) DEFAULT NULL COMMENT '购方纳税人识别',
  `BUYER_NAME` varchar(200) DEFAULT NULL COMMENT '购方名称',
  `BUYER_ADDRESS_PHONE` varchar(140) DEFAULT NULL COMMENT '购买方地址电话',
  `BUYER_BANK_ACCOUNT` varchar(160) DEFAULT NULL COMMENT '购买方银行账号',
  `DRAWER` varchar(40) DEFAULT NULL COMMENT '开票人',
  `PAYEE` varchar(40) DEFAULT NULL COMMENT '收款人',
  `CHECKER` varchar(40) DEFAULT NULL COMMENT '复核人',
  `INVOICE_TYPE` int(1) DEFAULT NULL COMMENT '发票开具类型 0蓝票 ；1红票',
  `INVOICE_LIST_MARK` int(1) DEFAULT NULL COMMENT '清单标志0：无清单1：带清单',
  `ORIGINAL_INVOICE_CODE` varchar(20) DEFAULT NULL COMMENT '原发票代码',
  `ORIGINAL_INVOICE_NO` varchar(10) DEFAULT NULL COMMENT '原发票号码',
  `TAXATION_MODE` varchar(1) DEFAULT NULL COMMENT '征税方式 0：普通征税 2：差额征税',
  `DEDUCTIBLE_AMOUNT` decimal(17,6) DEFAULT NULL COMMENT '扣除额',
  `INVOICE_TOTAL_PRICE_TAX` decimal(17,6) DEFAULT NULL COMMENT '价税合计',
  `INVOICE_TOTAL_PRICE` decimal(17,6) DEFAULT NULL COMMENT '合计金额',
  `INVOICE_TOTAL_TAX` decimal(17,6) DEFAULT NULL COMMENT '合计税额',
  `GOODS_CODE_VERSION` varchar(10) DEFAULT NULL COMMENT '编码表版本号,商品编码版本号',
  `CONSOLIDATED_TAX_RATE` decimal(17,6) DEFAULT NULL COMMENT '综合税率',
  `PRICE_TAX_MARK` int(1) DEFAULT NULL COMMENT '含税标志0：不含税 1：含税',
  `REMARKS` varchar(250) DEFAULT NULL COMMENT '备注',
  `BUYER_EMAIL` varchar(100) DEFAULT NULL COMMENT '客户邮箱',
  `BUYER_PHONE` varchar(30) DEFAULT NULL COMMENT '客户电话',
  `BUYER_TYPE` int(2) DEFAULT '0' COMMENT '购方类型：0[个人]、1[企业]',
  `STATUS` int(2) DEFAULT NULL COMMENT '状态:1已开具、2已红冲、3已开具未生成板式',
  `INVOICE_CODE` varchar(20) DEFAULT NULL COMMENT '发票代码',
  `INVOICE_NO` varchar(10) DEFAULT NULL COMMENT '发票号码',
  `INVOICE_DATE` datetime DEFAULT NULL COMMENT '开票日期',
  `TAX_CONTROL_CODE` varchar(200) DEFAULT NULL COMMENT '税控防伪码',
  `FORMAT_FILE_URL` varchar(200) DEFAULT NULL COMMENT '版式文件地址',
  `MACHINE_NO` varchar(30) DEFAULT NULL COMMENT '机器编号',
  `CHECK_SIGN` int(1) DEFAULT NULL COMMENT '签名状态：0：未验签\n1：验签成功\n 2表示未同步',
  `INVOICE_CHECK_CODE` varchar(30) DEFAULT NULL COMMENT '校验码',
  `CREATE_USER_ID` varchar(20) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `UPDATE_USER_ID` varchar(20) DEFAULT NULL COMMENT '更新人ID',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `RES1` varchar(100) DEFAULT NULL,
  `RES2` varchar(100) DEFAULT NULL,
  `RES3` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`INVOICE_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8 COMMENT='发票表';

-- ----------------------------
-- Records of ai_invoice
-- ----------------------------
INSERT INTO `ai_invoice` VALUES ('198', '201804', '20180415', '52', '026', '10000000000337', '00', '91500000747150337A', '百望税控5', '肇庆市二塔路东侧3号四季康庭首层08、09商铺及二层202号房屋（0758）2725712', '中国工商银行肇庆市第一支行11111112', '', '14', '', '', 'hahha', '', '', '0', '0', '', '', '0', '0.000000', '117.000000', '100.000000', '17.000000', '', '0.000000', '0', '43', 'baiwang@baiwang.com', '13832476198', null, '3', '050003521280', '25380132', '2018-04-15 15:29:11', '03+-2+96//720/69+4&gt;74*84++&lt;&gt;*45+&lt;9906*297&gt;&lt;+-*9--*/31+2&lt;52+-2+96//720/69+446974&gt;3-2//+30303&lt;00011&gt;5*19&gt;810-8&gt;*6-', '', null, null, '09845714885233827640', '0', '2018-04-15 15:29:48', null, null, null, null, null);
INSERT INTO `ai_invoice` VALUES ('199', '201804', '20180417', 'O30c9FXHGVh1kmlx42', '026', '10000000000049', '00', '512345678900000049', '测试49', '肇庆市二塔路东侧3号四季康庭首层08、09商铺及二层202号房屋（0758）2725712', '中国工商银行肇庆市第一支行11111112', '50123456789000102', '测试012', '发士大夫撒旦', '撒范德萨', '天安人寿', '', '', '0', '0', '', '', '2', '100.000000', '8000.000000', '8000.000000', '0.000000', '', '0.000000', '0', '保单号：【220000005800405222】 主险名称：【天安人寿公共交通工具意外伤害保险】', 'baiwang@baiwang.com', '13832476198', null, '3', '050003521271', '41000065', '2018-04-16 16:03:52', '03&lt;-0+11-0488&lt;6&gt;+5-1+8/*+987/*0-*3-6/9775+4+104&lt;&gt;+66++07*-3088&gt;9+3-8202065-+-6+2+1+5&gt;&lt;706+1/&gt;&lt;01293*19-801+4/992', '', null, null, '09274876896536945000', '0', '2018-04-17 00:02:22', null, null, null, null, null);
INSERT INTO `ai_invoice` VALUES ('200', '201804', '20180417', 'NV971pyBCb3jX0zqFr', '026', '10000000000337', '00', '91500000747150337A', '百望税控5', '肇庆市二塔路东侧3号四季康庭首层08、09商铺及二层202号房屋（0758）2725712', '中国工商银行肇庆市第一支行11111112', '50123456789000102', '测试012', '发士大夫撒旦', '撒范德萨', '天安人寿', '', '', '0', '0', '', '', '2', '100.000000', '800.000000', '800.000000', '0.000000', '', '0.000000', '0', '保单号：【220000005800405222】 主险名称：【天安人寿公共交通工具意外伤害保险】', 'baiwang@baiwang.com', '13832476198', null, '3', '050003521280', '25380133', '2018-04-16 16:10:22', '036*7*59-&gt;-9&lt;054/1286/9&gt;+22/763-/18-/&lt;6/976090-42+723-&lt;66+1&lt;8-/1/60858&lt;92966+2250+*4547&lt;&gt;8&gt;/-8012&gt;5*19&gt;40&lt;&lt;5*1/&lt;', '', null, null, '06322336558312230295', '0', '2018-04-17 00:09:04', null, null, null, null, null);
INSERT INTO `ai_invoice` VALUES ('201', '201804', '20180417', 'wu000050', '026', '10000000000049', '00', '512345678900000049', '测试49', '肇庆市二塔路东侧3号四季康庭首层08、09商铺及二层202号房屋（0758）2725712', '中国工商银行肇庆市第一支行11111112', '', '测试012', '', '', '天安人寿', '', '', '0', '0', '', '', '0', '0.000000', '1500.000000', '1500.000000', '0.000000', '', '0.000000', '0', '保单号：【220000005800405222】 主险名称：【天安人寿公共交通工具意外伤害保险】', 'baiwang@baiwang.com', '13832476198', null, '3', '050003521271', '41000066', '2018-04-17 14:42:57', '03*/-783&gt;&gt;&lt;5/&lt;39+80-363&lt;0&lt;87371996628&lt;*/-783&gt;&gt;&lt;5/&lt;39504&gt;+8*/-783&gt;&gt;&lt;5/&lt;39+8202&lt;69-&gt;0/&gt;+51-+&lt;**001393*198659/1&gt;&gt;60', '', null, null, '09425425107770249620', '0', '2018-04-17 14:43:18', null, null, null, null, null);
INSERT INTO `ai_invoice` VALUES ('214', '201804', '20180417', 'wu000072', '026', '10000000000049', '00', '512345678900000049', '测试49', '肇庆市二塔路东侧3号四季康庭首层08、09商铺及二层202号房屋（0758）2725712', '中国工商银行肇庆市第一支行11111112', '', '测试012', '', '', '天安人寿', '', '', '0', '0', '', '', '0', '0.000000', '1500.000000', '1500.000000', '0.000000', '', '0.000000', '0', '保单号：【220000005800405222】 主险名称：【天安人寿公共交通工具意外伤害保险】', 'baiwang@baiwang.com', '13832476198', null, '3', '050003521271', '41000079', '2018-04-17 15:53:56', '034/*&gt;5+03*386+58/060*92-0-9/81/49+75&gt;4/*&gt;5+03*386+51*008/4/*&gt;5+03*386+58/6&gt;63+062&lt;183&lt;6&lt;*/-&lt;601393*19/-97-087-0', '', null, null, '02866393246194859799', '0', '2018-04-17 15:54:31', null, null, null, null, null);
INSERT INTO `ai_invoice` VALUES ('215', '201804', '20180417', 'wu000073', '026', '10000000000049', '00', '512345678900000049', '测试49', '肇庆市二塔路东侧3号四季康庭首层08、09商铺及二层202号房屋（0758）2725712', '中国工商银行肇庆市第一支行11111112', '', '测试012', '', '', '天安人寿', '', '', '0', '0', '', '', '0', '0.000000', '1500.000000', '1500.000000', '0.000000', '', '0.000000', '0', '保单号：【220000005800405222】 主险名称：【天安人寿公共交通工具意外伤害保险】', 'baiwang@baiwang.com', '13832476198', null, '3', '050003521271', '41000080', '2018-04-17 15:54:26', '0357-4-*/6&lt;39&lt;17&gt;*7&gt;2-39*016655&gt;35*58&gt;57-4-*/6&lt;39&lt;17-&gt;07&gt;*57-4-*/6&lt;39&lt;17&gt;*&lt;72&gt;&lt;&gt;64017718/&gt;229701393*192+897&gt;+572', '', null, null, '17210274960532541683', '0', '2018-04-17 15:54:50', null, null, null, null, null);

-- ----------------------------
-- Table structure for ai_job
-- ----------------------------
DROP TABLE IF EXISTS `ai_job`;
CREATE TABLE `ai_job` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `telphone` varchar(50) NOT NULL COMMENT '字典ID',
  `start_date` datetime NOT NULL COMMENT '执行时间',
  `is_enable` int(1) NOT NULL DEFAULT '1' COMMENT '是否有效：0无效，1有效\r是否有效：0无效，1有效\r',
  `UPDATE_TIME` datetime DEFAULT NULL,
  `UPDATE_USER_ID` varchar(20) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATE_USER_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统字典表';

-- ----------------------------
-- Records of ai_job
-- ----------------------------

-- ----------------------------
-- Table structure for ai_stayopen_invoice
-- ----------------------------
DROP TABLE IF EXISTS `ai_stayopen_invoice`;
CREATE TABLE `ai_stayopen_invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `serialNo` varchar(50) NOT NULL COMMENT '开票流水号',
  `sellerTaxNo` varchar(20) NOT NULL COMMENT '销方税号',
  `invoiceTerminalCode` varchar(30) NOT NULL COMMENT '开票点编码',
  `invoiceTypeCode` varchar(3) NOT NULL COMMENT '发票种类编码',
  `deviceType` varchar(1) NOT NULL COMMENT '设备类型',
  `category` varchar(1) NOT NULL COMMENT '0扫码待开1电票直开',
  `addTime` varchar(30) NOT NULL COMMENT '添加时间',
  `invoiceId` varchar(20) DEFAULT '' COMMENT '发票Id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1293 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ai_stayopen_invoice
-- ----------------------------
INSERT INTO `ai_stayopen_invoice` VALUES ('60', 'b40c3240-a69b-11e8-a3a0-b3db5e8a90f8', '512345678900000040', 'dz001', '026', '0', '0', '2018-08-23 14:13:48 684', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('61', 'c2161950-a69b-11e8-a3a0-b3db5e8a90f8', '512345678900000040', 'dz001', '026', '0', '0', '2018-08-23 14:14:12 189', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('62', '2eea5be0-a69c-11e8-b937-bd3fcd708126', '512345678900000040', 'dz001', '026', '0', '0', '2018-08-23 14:17:17 622', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('63', '3191d530-a69c-11e8-a3a0-b3db5e8a90f8', '512345678900000040', 'dz001', '026', '0', '1', '2018-08-23 14:17:19 207', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('64', '8d77d570-a69c-11e8-a3a0-b3db5e8a90f8', '512345678900000040', 'dz001', '026', '0', '0', '2018-08-23 14:19:53 359', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('65', '06bea0c0-a69e-11e8-90c6-c7b0d93dfc4f', '512345678900000040', '40all', '026', '0', '0', '2018-08-23 14:30:28 560', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('66', 'fd995c50-a69e-11e8-bcbc-87775d85226f', '512345678900000040', 'dz001', '026', '0', '0', '2018-08-23 14:37:20 678', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('67', '2384e740-a6a4-11e8-924c-c3f6c8dede6f', '91500000747150541A', '499000151031', '007', '1', '0', '2018-08-23 15:14:14 659', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('68', '483bb500-a6a4-11e8-924c-c3f6c8dede6f', '91500000747150541A', '499000151031', '007', '1', '0', '2018-08-23 15:15:21 068', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('69', '58f9e6a0-a6a4-11e8-924c-c3f6c8dede6f', '91500000747150541A', '499000151031', '007', '1', '0', '2018-08-23 15:15:43 991', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('70', '664fbff0-a6a4-11e8-924c-c3f6c8dede6f', '91500000747150541A', '499000151031', '007', '1', '0', '2018-08-23 15:16:10 550', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('71', '73b3f120-a6a4-11e8-924c-c3f6c8dede6f', '91500000747150541A', '499000151031', '007', '1', '0', '2018-08-23 15:16:28 443', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('72', '8624b4c0-a6a4-11e8-924c-c3f6c8dede6f', '91500000747150541A', '499000151031', '026', '1', '0', '2018-08-23 15:16:59 642', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('73', 'e7d36b80-a6a4-11e8-924c-c3f6c8dede6f', '91500000747150541A', '499000151031', '007', '1', '0', '2018-08-23 15:19:43 169', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('74', '15adb380-a6a5-11e8-924c-c3f6c8dede6f', '91500000747150541A', '499000151031', '007', '1', '0', '2018-08-23 15:21:00 086', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('75', '284cb310-a6a5-11e8-924c-c3f6c8dede6f', '91500000747150541A', '499000151031', '007', '1', '0', '2018-08-23 15:21:31 340', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('76', '7f004960-a6a5-11e8-924c-c3f6c8dede6f', '91500000747150541A', '499000151031', '007', '1', '0', '2018-08-23 15:23:56 803', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('77', '80b074f0-a6a6-11e8-924c-c3f6c8dede6f', '91500000747150541A', '499000151031', '026', '1', '1', '2018-08-23 15:31:09 085', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('78', '82389b90-a6a6-11e8-924c-c3f6c8dede6f', '91500000747150541A', '499000151031', '026', '1', '1', '2018-08-23 15:31:11 622', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('79', 'ad4b3810-a6a6-11e8-bcbc-87775d85226f', '512345678900000040', 'dz001', '026', '0', '0', '2018-08-23 15:32:21 786', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('80', 'cb0bf2e0-a6a6-11e8-bcbc-87775d85226f', '512345678900000040', 'dz001', '026', '0', '0', '2018-08-23 15:33:14 390', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('81', '6ff77e00-a6a7-11e8-924c-c3f6c8dede6f', '91500000747150541A', '499000151031', '026', '1', '0', '2018-08-23 15:37:50 746', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('82', '819c1800-a6a7-11e8-924c-c3f6c8dede6f', '91500000747150541A', '499000151031', '026', '1', '0', '2018-08-23 15:38:22 179', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('83', 'ca33c5e0-a6a7-11e8-924c-c3f6c8dede6f', '91500000747150541A', '499000151031', '026', '1', '1', '2018-08-23 15:40:21 872', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('84', 'a2367850-a6aa-11e8-924c-c3f6c8dede6f', '91500000747150541A', '499000151031', '026', '1', '1', '2018-08-23 16:00:43 454', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('85', 'b24a3920-a6aa-11e8-bcbc-87775d85226f', '512345678900000040', 'dz001', '026', '0', '1', '2018-08-23 16:01:08 064', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('86', 'cb3ace40-a6aa-11e8-924c-c3f6c8dede6f', '91500000747150541A', '499000151031', '026', '1', '1', '2018-08-23 16:01:52 103', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('87', 'd72d6e10-a6aa-11e8-924c-c3f6c8dede6f', '91500000747150541A', '499000151031', '026', '1', '1', '2018-08-23 16:02:12 145', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('88', 'd886bc80-a6aa-11e8-924c-c3f6c8dede6f', '91500000747150541A', '499000151031', '026', '1', '1', '2018-08-23 16:02:14 397', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('89', 'd8fb7750-a6aa-11e8-924c-c3f6c8dede6f', '91500000747150541A', '499000151031', '026', '1', '1', '2018-08-23 16:02:15 152', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('90', 'db841e00-a6aa-11e8-924c-c3f6c8dede6f', '91500000747150541A', '499000151031', '026', '1', '1', '2018-08-23 16:02:19 440', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('91', '012f84f0-a6ab-11e8-bcbc-87775d85226f', '512345678900000040', 'dz001', '026', '0', '0', '2018-08-23 16:03:20 472', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('92', '9d880410-a6ad-11e8-bcbc-87775d85226f', '512345678900000040', 'dz001', '026', '0', '0', '2018-08-23 16:22:01 782', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('93', '00ee78c0-a6b5-11e8-bcbc-87775d85226f', '512345678900000040', 'dz001', '026', '0', '1', '2018-08-23 17:14:54 996', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('94', 'b3935290-a6b8-11e8-924c-c3f6c8dede6f', '91500000747150541A', '499000151031', '026', '1', '1', '2018-08-23 17:41:25 378', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('95', '8c158ab0-a6ba-11e8-bcbc-87775d85226f', '512345678900000040', 'dz001', '026', '0', '1', '2018-08-23 17:54:35 899', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('96', 'fc26ee10-a742-11e8-988c-6f1ed91aba41', '512345678900000040', 'dz001', '026', '0', '0', '2018-08-24 10:11:15 869', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('97', '7e06aa10-a748-11e8-bcbc-87775d85226f', '512345678900000040', 'dz001', '026', '0', '0', '2018-08-24 10:50:40 720', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('98', '89944680-a748-11e8-bcbc-87775d85226f', '512345678900000040', 'dz001', '026', '0', '1', '2018-08-24 10:51:00 051', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('99', '93f17940-a748-11e8-bcbc-87775d85226f', '512345678900000040', 'dz001', '026', '0', '0', '2018-08-24 10:51:17 496', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('100', '0e42b2e0-a74e-11e8-924c-c3f6c8dede6f', '512345678900000040', 'dz001', '026', '0', '0', '2018-08-24 11:30:32 507', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('101', '299ef0d0-a74e-11e8-924c-c3f6c8dede6f', '512345678900000040', 'dz001', '026', '0', '0', '2018-08-24 11:31:18 407', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('102', 'fa865a70-a763-11e8-8776-7d8b137874ea', '512345678900000040', 'dz001', '026', '0', '0', '2018-08-24 14:07:28 369', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('103', 'b88b09f0-a767-11e8-8776-7d8b137874ea', '512345678900000040', 'dz001', '026', '0', '0', '2018-08-24 14:34:15 729', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('104', 'c05f20d0-a767-11e8-8776-7d8b137874ea', '512345678900000040', 'dz001', '026', '0', '0', '2018-08-24 14:34:28 751', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('105', '109b2300-a768-11e8-8776-7d8b137874ea', '512345678900000040', 'dz001', '026', '0', '0', '2018-08-24 14:36:43 372', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('106', '18cff780-a768-11e8-8776-7d8b137874ea', '512345678900000040', 'dz001', '026', '0', '0', '2018-08-24 14:36:57 140', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('107', '28cf1ee0-a768-11e8-8776-7d8b137874ea', '512345678900000040', 'dz001', '026', '0', '0', '2018-08-24 14:37:23 953', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('108', '7bfc89c0-a76a-11e8-bcbc-87775d85226f', '512345678900000040', 'dz001', '026', '0', '1', '2018-08-24 14:54:00 126', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('109', 'd4eadb90-a76f-11e8-8776-7d8b137874ea', '512345678900000040', 'dz001', '026', '0', '0', '2018-08-24 15:32:19 217', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('110', '1217de50-a770-11e8-8776-7d8b137874ea', '512345678900000040', 'dz001', '026', '0', '1', '2018-08-24 15:34:01 819', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('111', '3f7ae560-a9df-11e8-bafb-bd499e4e0a59', '512345678900000040', 'dkpd', '026', '0', '0', '2018-08-27 17:54:54 431', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('112', 'ad5f9110-a9e0-11e8-bafb-bd499e4e0a59', '512345678900000040', 'dkpd', '026', '0', '0', '2018-08-27 18:05:08 313', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('113', 'b9484030-aa6c-11e8-b65e-bfee6320980d', '500102020170810', '810zp', '026', '0', '0', '2018-08-28 10:47:37 872', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('114', 'd148a8f0-aa6c-11e8-b65e-bfee6320980d', '500102020170810', '810zp', '026', '0', '1', '2018-08-28 10:48:18 071', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('115', '8832d4f0-aa6d-11e8-b65e-bfee6320980d', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-28 10:53:24 971', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('116', '583df4e0-aa6e-11e8-b65e-bfee6320980d', '500100201711203', 'dianpiao', '026', '0', '1', '2018-08-28 10:59:13 997', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('117', '017652a0-aa74-11e8-bb22-1d35859d80e2', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-28 11:39:45 399', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('118', '437516d0-aa76-11e8-bb22-1d35859d80e2', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-28 11:55:55 123', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('119', 'ec35c5d0-aa76-11e8-9d00-a7b7e496b4de', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-28 12:00:38 229', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('120', 'ecf30810-aa86-11e8-b35c-55b1b799e80c', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-28 13:54:56 797', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('121', '44431a90-aa89-11e8-b65e-bfee6320980d', '91500000747150541A', '499000151031', '026', '1', '1', '2018-08-28 14:11:56 982', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('122', '9a999cc0-aa89-11e8-b65e-bfee6320980d', '91500000747150541A', '499000151031', '026', '1', '0', '2018-08-28 14:14:21 776', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('123', 'a42cc8c0-aa89-11e8-b65e-bfee6320980d', '91500000747150541A', '499000151031', '007', '1', '0', '2018-08-28 14:14:37 846', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('124', 'a9c7b880-aa89-11e8-b65e-bfee6320980d', '91500000747150541A', '499000151031', '026', '1', '0', '2018-08-28 14:14:47 368', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('125', 'af4423c0-aa89-11e8-b65e-bfee6320980d', '91500000747150541A', '499000151031', '007', '1', '0', '2018-08-28 14:14:56 508', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('126', 'ba3dbd90-aa89-11e8-b65e-bfee6320980d', '91500000747150541A', '499000151031', '007', '1', '0', '2018-08-28 14:15:14 862', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('127', 'c94abcc0-aa89-11e8-b65e-bfee6320980d', '91500000747150541A', '499000151031', '026', '1', '0', '2018-08-28 14:15:40 148', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('128', '2c9178a0-aa8a-11e8-b65e-bfee6320980d', '91500000747150541A', '499000151031', '026', '1', '1', '2018-08-28 14:18:26 658', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('129', '55f0bfd0-aa8a-11e8-b65e-bfee6320980d', '91500000747150541A', '499000151031', '026', '1', '0', '2018-08-28 14:19:36 086', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('130', '58139fd0-aa8a-11e8-b65e-bfee6320980d', '91500000747150541A', '499000151031', '007', '1', '0', '2018-08-28 14:19:39 650', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('131', '61d15e40-aa8a-11e8-b65e-bfee6320980d', '91500000747150541A', '499000151031', '026', '1', '1', '2018-08-28 14:19:55 999', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('132', '8080ace0-aa8c-11e8-b65e-bfee6320980d', '91500000747150541A', '499000151031', '026', '1', '0', '2018-08-28 14:35:07 053', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('133', '477deb80-aa8f-11e8-b35c-55b1b799e80c', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-28 14:54:44 679', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('134', '54f52f80-aa8f-11e8-b35c-55b1b799e80c', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-28 14:55:07 273', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('135', '68db5510-aa8f-11e8-b35c-55b1b799e80c', '500100201711203', 'dianpiao', '026', '0', '1', '2018-08-28 14:55:40 607', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('136', 'f24152e0-aa90-11e8-b65e-bfee6320980d', '91500000747150541A', '499000151031', '026', '1', '1', '2018-08-28 15:06:55 292', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('137', '091f34a0-aa91-11e8-b35c-55b1b799e80c', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-28 15:07:19 030', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('138', 'c6ddda70-aa94-11e8-b994-d1dd0d5d8286', '91500000747150541A', '499000151031', '026', '1', '0', '2018-08-28 15:34:20 507', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('139', 'cb764e50-aa94-11e8-b994-d1dd0d5d8286', '91500000747150541A', '499000151031', '026', '1', '0', '2018-08-28 15:34:28 198', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('140', 'cf96d310-aa94-11e8-b994-d1dd0d5d8286', '91500000747150541A', '499000151031', '007', '1', '0', '2018-08-28 15:34:35 136', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('141', 'e60c07f0-aa94-11e8-848c-9d5c05241926', '91500000747150541A', '499000151031', '026', '1', '1', '2018-08-28 15:35:12 809', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('142', '502e5470-aa96-11e8-b434-f7c0882789cd', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-28 15:45:20 361', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('143', '538b6cb0-aa97-11e8-b35c-55b1b799e80c', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-28 15:52:20 904', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('144', '5efdb8f0-aa97-11e8-b35c-55b1b799e80c', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-28 15:52:40 108', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('145', '4e1e6690-aa9e-11e8-b35c-55b1b799e80c', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-28 16:42:18 287', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('146', 'd8cc4db0-aa9f-11e8-99e7-4fdb6e4c76ec', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-28 16:53:20 405', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('147', 'efcda080-aaa0-11e8-99e7-4fdb6e4c76ec', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-28 17:01:08 509', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('148', '11fb0ed0-aaa2-11e8-b65e-bfee6320980d', '91500000747150541A', '499000151031', '026', '1', '0', '2018-08-28 17:09:30 021', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('149', '196c4530-aaa2-11e8-b65e-bfee6320980d', '91500000747150541A', '499000151031', '007', '1', '0', '2018-08-28 17:09:42 453', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('150', '22c3a0b0-aaa2-11e8-b65e-bfee6320980d', '91500000747150541A', '499000151031', '026', '1', '0', '2018-08-28 17:09:58 156', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('151', '2fe4ae60-aaa2-11e8-b65e-bfee6320980d', '91500000747150541A', '499000151031', '026', '1', '1', '2018-08-28 17:10:20 187', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('152', 'ce204ff0-aaa5-11e8-99e7-4fdb6e4c76ec', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-28 17:35:59 517', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('153', '0bb6bb80-aaa9-11e8-b65e-bfee6320980d', '91500000747150541A', '499000151031', '007', '1', '0', '2018-08-28 17:59:25 977', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('154', '54f0bc80-aaac-11e8-b380-71ef48b40c50', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-28 18:22:57 344', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('155', '7ff36e80-ab30-11e8-aab9-7f85b51d7fba', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-29 10:09:03 556', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('156', '897f95a0-ab30-11e8-aab9-7f85b51d7fba', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-29 10:09:19 458', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('157', 'eceee820-ab30-11e8-aab9-7f85b51d7fba', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-29 10:12:06 302', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('158', '77f60840-ab31-11e8-a2e7-e5c025fd25eb', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-29 10:15:56 171', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('159', '848424c0-ab31-11e8-a2e7-e5c025fd25eb', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-29 10:16:17 207', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('160', '87467910-ab31-11e8-a2e7-e5c025fd25eb', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-29 10:16:21 862', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('161', 'd841b720-ab32-11e8-a2e7-e5c025fd25eb', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-29 10:25:47 231', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('162', '4b015360-ab33-11e8-a2e7-e5c025fd25eb', '91500000747150541A', '499000151031', '007', '1', '0', '2018-08-29 10:28:59 767', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('163', '9aab75d0-ab33-11e8-a2e7-e5c025fd25eb', '91500000747150541A', '499000151031', '026', '1', '1', '2018-08-29 10:31:13 353', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('164', 'a1634740-ab33-11e8-a2e7-e5c025fd25eb', '91500000747150541A', '499000151031', '026', '1', '0', '2018-08-29 10:31:24 646', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('165', '3d56d820-ab38-11e8-a2e7-e5c025fd25eb', '91500000747150541A', '499000151031', '026', '1', '0', '2018-08-29 11:04:24 322', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('166', '402b89b0-ab3d-11e8-a965-23cf2ca429cb', '500100201711203', 'dianpiao', '026', '0', '1', '2018-08-29 11:40:19 272', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('167', '82bf4cd0-ab3d-11e8-a42a-37ffd6248516', '91500000747150541A', '499000151031', '026', '1', '1', '2018-08-29 11:42:11 151', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('168', 'bb90bda0-ab3d-11e8-a965-23cf2ca429cb', '500100201711203', 'dianpiao', '026', '0', '1', '2018-08-29 11:43:46 293', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('169', 'd999fdb0-ab3e-11e8-a965-23cf2ca429cb', '500100201711203', 'dianpiao', '026', '0', '1', '2018-08-29 11:51:46 188', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('170', '73059840-ab50-11e8-a965-23cf2ca429cb', '500100201711203', 'dianpiao', '026', '0', '1', '2018-08-29 13:57:45 767', '1800017157651');
INSERT INTO `ai_stayopen_invoice` VALUES ('171', 'b0992500-ab50-11e8-a965-23cf2ca429cb', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-29 13:59:28 528', '1800017157672');
INSERT INTO `ai_stayopen_invoice` VALUES ('172', 'eeee2d00-ab50-11e8-a965-23cf2ca429cb', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-29 14:01:12 999', '1800017157691');
INSERT INTO `ai_stayopen_invoice` VALUES ('173', '26ea1370-ab53-11e8-b65e-bfee6320980d', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-29 14:17:06 081', '1800017158519');
INSERT INTO `ai_stayopen_invoice` VALUES ('174', '3deba9d0-ab53-11e8-b65e-bfee6320980d', '500100201711203', 'dianpiao', '026', '0', '1', '2018-08-29 14:17:44 633', '1800017158521');
INSERT INTO `ai_stayopen_invoice` VALUES ('175', '034973d0-ab57-11e8-a965-23cf2ca429cb', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-29 14:44:44 080', '1800017157989');
INSERT INTO `ai_stayopen_invoice` VALUES ('176', '56ea24d0-ab57-11e8-a965-23cf2ca429cb', '500100201711203', 'dianpiao', '026', '0', '1', '2018-08-29 14:47:04 333', '1800017158718');
INSERT INTO `ai_stayopen_invoice` VALUES ('177', '6661a5a0-ab57-11e8-a965-23cf2ca429cb', '500100201711203', 'dianpiao', '026', '0', '1', '2018-08-29 14:47:30 294', '1800017158007');
INSERT INTO `ai_stayopen_invoice` VALUES ('178', '7c027e10-ab58-11e8-b951-29eedd0a9490', '500100201711203', 'dianpiao', '026', '0', '1', '2018-08-29 14:55:16 295', '1800017158071');
INSERT INTO `ai_stayopen_invoice` VALUES ('179', '617d0630-ab5a-11e8-a965-23cf2ca429cb', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-29 15:08:50 635', '1800017158913');
INSERT INTO `ai_stayopen_invoice` VALUES ('180', 'd0e64b80-ab5a-11e8-b65e-bfee6320980d', '91500000747150541A', '499000151031', '007', '1', '0', '2018-08-29 15:11:57 755', '1800017158285');
INSERT INTO `ai_stayopen_invoice` VALUES ('181', '34033840-ab5b-11e8-b65e-bfee6320980d', '91500000747150541A', '499000151031', '026', '1', '0', '2018-08-29 15:14:43 944', '1800017158973');
INSERT INTO `ai_stayopen_invoice` VALUES ('182', 'd8c54260-ab5b-11e8-a965-23cf2ca429cb', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-29 15:19:20 233', '1800017159011');
INSERT INTO `ai_stayopen_invoice` VALUES ('183', 'd12405e0-ab5c-11e8-a965-23cf2ca429cb', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-29 15:26:16 960', '1800017159413');
INSERT INTO `ai_stayopen_invoice` VALUES ('184', '98bdbd80-ab5d-11e8-a622-cd2df15ec825', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-29 15:31:51 830', '1800017159113');
INSERT INTO `ai_stayopen_invoice` VALUES ('185', 'b0816b60-ab5d-11e8-a622-cd2df15ec825', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-29 15:32:31 678', '1800017159470');
INSERT INTO `ai_stayopen_invoice` VALUES ('186', 'c50c8380-ab5d-11e8-a635-af53238eae95', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-29 15:33:06 162', '1800017159472');
INSERT INTO `ai_stayopen_invoice` VALUES ('187', '408e6730-ab5e-11e8-a635-af53238eae95', '91500000747150541A', '499000151031', '007', '1', '0', '2018-08-29 15:36:33 387', '1800017159505');
INSERT INTO `ai_stayopen_invoice` VALUES ('188', '5394b410-ab5e-11e8-a635-af53238eae95', '91500000747150541A', '499000151031', '026', '1', '0', '2018-08-29 15:37:05 274', '1800017159169');
INSERT INTO `ai_stayopen_invoice` VALUES ('189', '1e5b9a50-ab60-11e8-a635-af53238eae95', '91500000747150541A', '499000151031', '026', '1', '0', '2018-08-29 15:49:55 002', '1800017159268');
INSERT INTO `ai_stayopen_invoice` VALUES ('190', '4f5d12f0-ab60-11e8-a635-af53238eae95', '512345678900000040', 'esccs', '026', '0', '0', '2018-08-29 15:51:17 188', '1800017159289');
INSERT INTO `ai_stayopen_invoice` VALUES ('191', '737bbf60-ab60-11e8-a807-0f8205588ce7', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-29 15:52:14 064', '1800017159300');
INSERT INTO `ai_stayopen_invoice` VALUES ('192', '7c7b36e0-ab60-11e8-a635-af53238eae95', '512345678900000040', 'esccs', '026', '0', '0', '2018-08-29 15:52:32 873', '1800017159643');
INSERT INTO `ai_stayopen_invoice` VALUES ('193', 'a7a63d60-ab60-11e8-a807-0f8205588ce7', '91500000747150541A', '499000151031', '007', '1', '0', '2018-08-29 15:53:41 538', '1800017159644');
INSERT INTO `ai_stayopen_invoice` VALUES ('194', 'b161b1e0-ab60-11e8-a807-0f8205588ce7', '91500000747150541A', '499000151031', '026', '1', '0', '2018-08-29 15:53:57 870', '1800017159645');
INSERT INTO `ai_stayopen_invoice` VALUES ('195', 'c576afa0-ab60-11e8-a807-0f8205588ce7', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-29 15:54:31 551', '1800017160328');
INSERT INTO `ai_stayopen_invoice` VALUES ('196', 'fa4fbd20-ab60-11e8-a1f5-99179e5827b2', '512345678900000040', 'dkpd', '026', '0', '0', '2018-08-29 15:56:04 143', '1800017159662');
INSERT INTO `ai_stayopen_invoice` VALUES ('197', '2ff59080-ab61-11e8-a1f5-99179e5827b2', '91500000747150541A', '499000151031', '026', '1', '0', '2018-08-29 15:57:34 142', '1800017160348');
INSERT INTO `ai_stayopen_invoice` VALUES ('198', '454afd80-ab61-11e8-99d8-57d1d8b65234', '91500000747150541A', '499000151031', '026', '1', '0', '2018-08-29 15:58:09 915', '1800017159683');
INSERT INTO `ai_stayopen_invoice` VALUES ('199', 'd6849270-ab61-11e8-99d8-57d1d8b65234', '512345678900000040', 'dkpd', '026', '0', '0', '2018-08-29 16:02:13 541', '1800017159723');
INSERT INTO `ai_stayopen_invoice` VALUES ('200', '4e05ae60-ab62-11e8-a635-af53238eae95', '90000000041BWGF', '499000151971', '026', '1', '1', '2018-08-29 16:05:33 861', '1800017160419');
INSERT INTO `ai_stayopen_invoice` VALUES ('201', '8515e730-ab62-11e8-a635-af53238eae95', '90000000041BWGF', '499000151971', '026', '1', '1', '2018-08-29 16:07:06 257', '1800017160433');
INSERT INTO `ai_stayopen_invoice` VALUES ('202', '8ebf0c30-ab62-11e8-a635-af53238eae95', '90000000041BWGF', '499000151971', '026', '1', '1', '2018-08-29 16:07:22 439', '1800017160435');
INSERT INTO `ai_stayopen_invoice` VALUES ('203', 'f42c78a0-ab62-11e8-a635-af53238eae95', '90000000041BWGF', '499000151971', '026', '1', '1', '2018-08-29 16:10:12 607', '1800017159793');
INSERT INTO `ai_stayopen_invoice` VALUES ('204', 'f87df870-ab62-11e8-a635-af53238eae95', '90000000041BWGF', '499000151971', '026', '1', '0', '2018-08-29 16:10:19 889', '1800017160470');
INSERT INTO `ai_stayopen_invoice` VALUES ('205', '4769f3a0-ab66-11e8-a807-0f8205588ce7', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-29 16:33:57 068', '1800017160671');
INSERT INTO `ai_stayopen_invoice` VALUES ('206', '794acfc0-ab66-11e8-a807-0f8205588ce7', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-29 16:35:20 747', '1800017160682');
INSERT INTO `ai_stayopen_invoice` VALUES ('207', 'a81914b0-ab66-11e8-a635-af53238eae95', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-29 16:36:43 044', '1800017160044');
INSERT INTO `ai_stayopen_invoice` VALUES ('208', 'f1390560-ab66-11e8-a635-af53238eae95', '500100201711203', 'dianpiao', '026', '0', '1', '2018-08-29 16:38:45 659', '1800017160717');
INSERT INTO `ai_stayopen_invoice` VALUES ('209', 'f7f088b0-ab66-11e8-99d8-57d1d8b65234', '512345678900000040', 'dkpd', '026', '0', '0', '2018-08-29 16:38:57 122', '1800017160065');
INSERT INTO `ai_stayopen_invoice` VALUES ('210', '194825e0-ab67-11e8-a635-af53238eae95', '500100201711203', 'dianpiao', '026', '0', '1', '2018-08-29 16:39:52 864', '1800017160070');
INSERT INTO `ai_stayopen_invoice` VALUES ('211', 'e5ea5140-ab67-11e8-9a29-970b6a462723', '90000000041BWGF', '499000151971', '026', '1', '0', '2018-08-29 16:45:36 279', '1800017160143');
INSERT INTO `ai_stayopen_invoice` VALUES ('212', '2829d9e0-ab68-11e8-9a29-970b6a462723', '90000000041BWGF', '499000151971', '026', '1', '0', '2018-08-29 16:47:27 361', '1800017160155');
INSERT INTO `ai_stayopen_invoice` VALUES ('213', '2af5f230-ab68-11e8-9a29-970b6a462723', '90000000041BWGF', '499000151971', '026', '1', '0', '2018-08-29 16:47:32 083', '1800017160786');
INSERT INTO `ai_stayopen_invoice` VALUES ('214', '752c5d20-ab82-11e8-9a29-970b6a462723', '90000000041BWGF', '499000151971', '026', '1', '0', '2018-08-29 19:55:43 514', '1800017163760');
INSERT INTO `ai_stayopen_invoice` VALUES ('215', '55827a10-abfd-11e8-8536-d396e2a31fc1', '501234567890000120', '499000150469', '026', '1', '0', '2018-08-30 10:35:18 292', '1800017178521');
INSERT INTO `ai_stayopen_invoice` VALUES ('216', '31720900-abfe-11e8-8536-d396e2a31fc1', '501234567890000120', '499000150469', '026', '1', '0', '2018-08-30 10:41:27 300', '1800017178568');
INSERT INTO `ai_stayopen_invoice` VALUES ('217', '646b5a00-abfe-11e8-8536-d396e2a31fc1', '501234567890000120', '499000150469', '026', '1', '1', '2018-08-30 10:42:52 821', '1800017178581');
INSERT INTO `ai_stayopen_invoice` VALUES ('218', '757f25b0-abfe-11e8-8536-d396e2a31fc1', '501234567890000120', '499000150469', '007', '1', '0', '2018-08-30 10:43:21 495', '1800017178583');
INSERT INTO `ai_stayopen_invoice` VALUES ('219', '8f1b6420-abfe-11e8-8536-d396e2a31fc1', '501234567890000120', '499000150469', '026', '1', '0', '2018-08-30 10:44:04 434', '1800017178590');
INSERT INTO `ai_stayopen_invoice` VALUES ('220', '97c25b60-abfe-11e8-8536-d396e2a31fc1', '501234567890000120', '499000150469', '026', '1', '0', '2018-08-30 10:44:19 000', '1800017177907');
INSERT INTO `ai_stayopen_invoice` VALUES ('221', 'd803ca10-abfe-11e8-8536-d396e2a31fc1', '501234567890000120', '499000150469', '026', '1', '0', '2018-08-30 10:46:06 769', '1800017178609');
INSERT INTO `ai_stayopen_invoice` VALUES ('222', '517eba30-abff-11e8-8536-d396e2a31fc1', '501234567890000120', '499000150469', '007', '1', '0', '2018-08-30 10:49:30 581', '1800017178641');
INSERT INTO `ai_stayopen_invoice` VALUES ('223', '63a07370-abff-11e8-8536-d396e2a31fc1', '501234567890000120', '499000150469', '026', '1', '0', '2018-08-30 10:50:00 981', '1800017178643');
INSERT INTO `ai_stayopen_invoice` VALUES ('224', '7515c010-abff-11e8-8536-d396e2a31fc1', '501234567890000120', '499000150469', '026', '1', '0', '2018-08-30 10:50:30 294', '1800017177966');
INSERT INTO `ai_stayopen_invoice` VALUES ('225', '93c13390-ac00-11e8-8536-d396e2a31fc1', '501234567890000120', '499000150469', '026', '1', '0', '2018-08-30 10:58:31 207', '1800017178717');
INSERT INTO `ai_stayopen_invoice` VALUES ('226', 'a7023f80-ac00-11e8-8536-d396e2a31fc1', '501234567890000120', '499000150469', '026', '1', '0', '2018-08-30 10:59:03 522', '1800017178046');
INSERT INTO `ai_stayopen_invoice` VALUES ('227', 'b45f92e0-ac00-11e8-8536-d396e2a31fc1', '501234567890000120', '499000150469', '007', '1', '0', '2018-08-30 10:59:25 914', '1800017178723');
INSERT INTO `ai_stayopen_invoice` VALUES ('228', '6bc69000-ac01-11e8-8536-d396e2a31fc1', '501234567890000120', '499000150469', '026', '1', '0', '2018-08-30 11:04:33 643', '1800017178096');
INSERT INTO `ai_stayopen_invoice` VALUES ('229', 'd17ff990-ac01-11e8-8536-d396e2a31fc1', '501234567890000120', '499000150469', '007', '1', '0', '2018-08-30 11:07:24 310', '1800017178787');
INSERT INTO `ai_stayopen_invoice` VALUES ('230', 'de43cc10-ac01-11e8-8536-d396e2a31fc1', '501234567890000120', '499000150469', '026', '1', '0', '2018-08-30 11:07:46 904', '1800017178119');
INSERT INTO `ai_stayopen_invoice` VALUES ('231', '0a19b890-ac02-11e8-8536-d396e2a31fc1', '501234567890000120', '499000150469', '026', '1', '0', '2018-08-30 11:08:59 293', '1800017178134');
INSERT INTO `ai_stayopen_invoice` VALUES ('232', '2c8dc240-ac02-11e8-8536-d396e2a31fc1', '501234567890000120', '499000150469', '026', '1', '0', '2018-08-30 11:10:00 011', '1800017178136');
INSERT INTO `ai_stayopen_invoice` VALUES ('233', '4b1e0210-ac02-11e8-8536-d396e2a31fc1', '501234567890000120', '499000150469', '007', '1', '0', '2018-08-30 11:10:48 399', '1800017178829');
INSERT INTO `ai_stayopen_invoice` VALUES ('234', '283b3b90-ac03-11e8-8536-d396e2a31fc1', '501234567890000120', '499000150469', '026', '1', '0', '2018-08-30 11:16:59 335', '1800017178211');
INSERT INTO `ai_stayopen_invoice` VALUES ('235', 'd1d6e140-ac03-11e8-aeca-17fb92fbb02c', '512345678900000040', 'dkpd', '026', '0', '0', '2018-08-30 11:21:44 181', '1800017178257');
INSERT INTO `ai_stayopen_invoice` VALUES ('236', '48a35330-ac04-11e8-8536-d396e2a31fc1', '501234567890000120', '499000150469', '026', '1', '0', '2018-08-30 11:25:03 222', '1800017178961');
INSERT INTO `ai_stayopen_invoice` VALUES ('237', '71b6eb60-ac04-11e8-8536-d396e2a31fc1', '501234567890000120', '499000150469', '026', '1', '0', '2018-08-30 11:26:12 094', '1800017178303');
INSERT INTO `ai_stayopen_invoice` VALUES ('238', '906f9ac0-ac04-11e8-8536-d396e2a31fc1', '501234567890000120', '499000150469', '026', '1', '0', '2018-08-30 11:27:03 660', '1800017178974');
INSERT INTO `ai_stayopen_invoice` VALUES ('239', 'cd14cfe0-ac04-11e8-8536-d396e2a31fc1', '501234567890000120', '499000150469', '007', '1', '0', '2018-08-30 11:28:45 423', '1800017178990');
INSERT INTO `ai_stayopen_invoice` VALUES ('240', '600340c0-ac05-11e8-8536-d396e2a31fc1', '501234567890000120', '499000150469', '026', '1', '0', '2018-08-30 11:32:51 931', '1800017179028');
INSERT INTO `ai_stayopen_invoice` VALUES ('241', '7cdf9990-ac06-11e8-87f2-9dd501ab4a49', '91500000747150541A', '499000151031', '026', '1', '0', '2018-08-30 11:40:50 229', '1800017179089');
INSERT INTO `ai_stayopen_invoice` VALUES ('242', '1e321f70-ac07-11e8-8536-d396e2a31fc1', '501234567890000120', '499000150469', '007', '1', '0', '2018-08-30 11:45:20 521', '1800017179471');
INSERT INTO `ai_stayopen_invoice` VALUES ('243', '0b51fb60-ac0b-11e8-aeca-17fb92fbb02c', '512345678900000040', 'dkpd', '026', '0', '0', '2018-08-30 12:13:27 097', '1800017180366');
INSERT INTO `ai_stayopen_invoice` VALUES ('244', 'd931fdf0-ac0b-11e8-aeca-17fb92fbb02c', '512345678900000040', 'dkpd', '026', '0', '0', '2018-08-30 12:19:12 482', '1800017179727');
INSERT INTO `ai_stayopen_invoice` VALUES ('245', '4b6b2c20-ac0c-11e8-aeca-17fb92fbb02c', '512345678900000040', 'dkpd', '026', '0', '0', '2018-08-30 12:22:24 127', '1800017179758');
INSERT INTO `ai_stayopen_invoice` VALUES ('246', '6b8df2d0-ac0c-11e8-aeca-17fb92fbb02c', '512345678900000040', 'dkpd', '026', '0', '0', '2018-08-30 12:23:18 045', '1800017180444');
INSERT INTO `ai_stayopen_invoice` VALUES ('247', '8368f940-ac0c-11e8-aeca-17fb92fbb02c', '512345678900000040', 'dkpd', '026', '0', '0', '2018-08-30 12:23:58 076', '1800017180445');
INSERT INTO `ai_stayopen_invoice` VALUES ('248', 'a4a12790-ac0c-11e8-aeca-17fb92fbb02c', '512345678900000040', 'dkpd', '026', '0', '0', '2018-08-30 12:24:53 792', '1800017179776');
INSERT INTO `ai_stayopen_invoice` VALUES ('249', 'b9e75250-ac0c-11e8-aeca-17fb92fbb02c', '512345678900000040', 'dkpd', '026', '0', '0', '2018-08-30 12:25:29 484', '1800017179777');
INSERT INTO `ai_stayopen_invoice` VALUES ('250', 'df4f6eb0-ac0c-11e8-85ce-1fa5c96c2b50', '512345678900000040', 'dkpd', '026', '0', '0', '2018-08-30 12:27:20 792', '1800017179793');
INSERT INTO `ai_stayopen_invoice` VALUES ('251', '011ab540-ac0d-11e8-85ce-1fa5c96c2b50', '512345678900000040', 'dkpd', '026', '0', '0', '2018-08-30 12:27:28 944', '1800017179794');
INSERT INTO `ai_stayopen_invoice` VALUES ('252', '944a4dd0-ac0d-11e8-85ce-1fa5c96c2b50', '91500000747150541A', '499000151031', '007', '1', '0', '2018-08-30 12:31:35 915', '1800017179835');
INSERT INTO `ai_stayopen_invoice` VALUES ('253', '45007e60-ac0e-11e8-b7b6-913064fa910a', '91500000747150541A', '499000151031', '007', '1', '0', '2018-08-30 12:36:32 349', '1800017180545');
INSERT INTO `ai_stayopen_invoice` VALUES ('254', '4a8e9ce0-ac0e-11e8-b7b6-913064fa910a', '91500000747150541A', '499000151031', '026', '1', '0', '2018-08-30 12:36:41 684', '1800017180546');
INSERT INTO `ai_stayopen_invoice` VALUES ('255', 'fa1e11a0-ac17-11e8-8536-d396e2a31fc1', '501234567890000120', '499000150469', '007', '1', '0', '2018-08-30 13:46:01 458', '1800017181053');
INSERT INTO `ai_stayopen_invoice` VALUES ('256', '122eb190-ac19-11e8-8536-d396e2a31fc1', '501234567890000120', '499000150469', '026', '1', '0', '2018-08-30 13:53:51 268', '1800017181485');
INSERT INTO `ai_stayopen_invoice` VALUES ('257', 'cf04ebd0-ac1f-11e8-954e-b1e725f7e311', '91500000747150541A', '499000151031', '026', '1', '0', '2018-08-30 14:42:05 364', '1800017182524');
INSERT INTO `ai_stayopen_invoice` VALUES ('258', 'cdc94210-ac20-11e8-954e-b1e725f7e311', '91500000747150541A', '499000151031', '007', '1', '0', '2018-08-30 14:49:12 828', '1800017182611');
INSERT INTO `ai_stayopen_invoice` VALUES ('259', '4147c180-ac21-11e8-954e-b1e725f7e311', '501234567890000120', '499000150469', '007', '1', '0', '2018-08-30 14:52:26 563', '1800017182643');
INSERT INTO `ai_stayopen_invoice` VALUES ('260', '56bd60b0-ac21-11e8-954e-b1e725f7e311', '501234567890000120', '499000150469', '004', '1', '0', '2018-08-30 14:53:02 585', '1800017181986');
INSERT INTO `ai_stayopen_invoice` VALUES ('261', '899c72f0-ac21-11e8-954e-b1e725f7e311', '501234567890000120', '499000150469', '004', '1', '0', '2018-08-30 14:54:27 915', '1800017182660');
INSERT INTO `ai_stayopen_invoice` VALUES ('262', 'e09d4ca0-ac26-11e8-9de5-cf02fd597538', '501234567890000120', '499000150469', '026', '1', '0', '2018-08-30 15:32:41 379', '1800017183025');
INSERT INTO `ai_stayopen_invoice` VALUES ('263', '36795230-ac28-11e8-8536-d396e2a31fc1', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-30 15:42:14 687', '1800017183098');
INSERT INTO `ai_stayopen_invoice` VALUES ('264', '65c77580-ac28-11e8-8536-d396e2a31fc1', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-30 15:43:33 947', '1800017183429');
INSERT INTO `ai_stayopen_invoice` VALUES ('265', '5a17b5a0-ac29-11e8-8659-15c20b89c19c', '501234567890000120', '499000150469', '004', '1', '0', '2018-08-30 15:50:24 164', '1800017183159');
INSERT INTO `ai_stayopen_invoice` VALUES ('266', '929bd450-ac2a-11e8-8536-d396e2a31fc1', '500100201711203', 'dianpiao', '026', '0', '1', '2018-08-30 15:59:11 701', '1800017183251');
INSERT INTO `ai_stayopen_invoice` VALUES ('267', '951dc440-ac2a-11e8-8536-d396e2a31fc1', '500100201711203', 'dianpiao', '026', '0', '1', '2018-08-30 15:59:12 281', '1800017183252');
INSERT INTO `ai_stayopen_invoice` VALUES ('268', '7c71c750-ac2c-11e8-8536-d396e2a31fc1', '501234567890000120', '499000150469', '026', '1', '0', '2018-08-30 16:12:49 960', '1800017183694');
INSERT INTO `ai_stayopen_invoice` VALUES ('269', 'be635700-ac2c-11e8-8536-d396e2a31fc1', '501234567890000120', '499000150469', '026', '1', '0', '2018-08-30 16:14:40 577', '1800017184377');
INSERT INTO `ai_stayopen_invoice` VALUES ('270', '3834f2a0-ac2d-11e8-9d39-3b66d867b0d3', '512345678900000040', 'dkpd', '026', '0', '0', '2018-08-30 16:18:05 390', '1800017184397');
INSERT INTO `ai_stayopen_invoice` VALUES ('271', '9dea3d80-ac2d-11e8-93ba-8fe177d32cab', '501234567890000120', '499000150469', '026', '1', '0', '2018-08-30 16:20:44 273', '1800017184430');
INSERT INTO `ai_stayopen_invoice` VALUES ('272', 'ce4cde10-ac2d-11e8-93ba-8fe177d32cab', '501234567890000120', '499000150469', '007', '1', '0', '2018-08-30 16:22:05 444', '1800017183770');
INSERT INTO `ai_stayopen_invoice` VALUES ('273', 'e3963d20-ac2d-11e8-93ba-8fe177d32cab', '501234567890000120', '499000150469', '004', '1', '0', '2018-08-30 16:22:44 079', '1800017183784');
INSERT INTO `ai_stayopen_invoice` VALUES ('274', '11719690-ac2e-11e8-93ba-8fe177d32cab', '501234567890000120', '499000150469', '026', '1', '1', '2018-08-30 16:23:58 069', '1800017184448');
INSERT INTO `ai_stayopen_invoice` VALUES ('275', '13f8ddb0-ac2e-11e8-93ba-8fe177d32cab', '501234567890000120', '499000150469', '026', '1', '1', '2018-08-30 16:24:02 299', '1800017184452');
INSERT INTO `ai_stayopen_invoice` VALUES ('276', '2e1f81d0-ac2e-11e8-93ba-8fe177d32cab', '501234567890000120', '499000150469', '026', '1', '1', '2018-08-30 16:24:46 173', '1800017183799');
INSERT INTO `ai_stayopen_invoice` VALUES ('277', '31178c20-ac2e-11e8-93ba-8fe177d32cab', '501234567890000120', '499000150469', '026', '1', '1', '2018-08-30 16:24:51 167', '1800017184468');
INSERT INTO `ai_stayopen_invoice` VALUES ('278', 'a97b2360-ac2f-11e8-be1e-23c0b152560e', '501234567890000120', '499000150469', '007', '1', '0', '2018-08-30 16:35:34 498', '1800017183903');
INSERT INTO `ai_stayopen_invoice` VALUES ('279', 'cc00b940-ac2f-11e8-be1e-23c0b152560e', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-30 16:36:32 307', '1800017183915');
INSERT INTO `ai_stayopen_invoice` VALUES ('280', '6080d130-ac31-11e8-93ba-8fe177d32cab', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-30 16:47:38 784', '1800017184041');
INSERT INTO `ai_stayopen_invoice` VALUES ('281', '69e15470-ac31-11e8-93ba-8fe177d32cab', '500100201711203', 'dianpiao', '026', '0', '1', '2018-08-30 16:47:54 497', '1800017184686');
INSERT INTO `ai_stayopen_invoice` VALUES ('282', 'd65a57a0-ac31-11e8-be1e-23c0b152560e', '501234567890000120', '499000150469', '026', '1', '0', '2018-08-30 16:51:08 662', '1800017184724');
INSERT INTO `ai_stayopen_invoice` VALUES ('283', 'ee099320-ac31-11e8-be1e-23c0b152560e', '501234567890000120', '499000150469', '004', '1', '0', '2018-08-30 16:51:48 421', '1800017184076');
INSERT INTO `ai_stayopen_invoice` VALUES ('284', '1b7d5120-ac32-11e8-be1e-23c0b152560e', '501234567890000120', '499000150469', '007', '1', '0', '2018-08-30 16:53:04 640', '1800017184095');
INSERT INTO `ai_stayopen_invoice` VALUES ('285', '42ba0670-ac32-11e8-93ba-8fe177d32cab', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-30 16:53:59 253', '1800017184098');
INSERT INTO `ai_stayopen_invoice` VALUES ('286', '66e64770-ac32-11e8-93ba-8fe177d32cab', '500100201711203', 'dianpiao', '026', '0', '1', '2018-08-30 16:54:59 911', '1800017184111');
INSERT INTO `ai_stayopen_invoice` VALUES ('287', '67f609c0-ac32-11e8-93ba-8fe177d32cab', '500100201711203', 'dianpiao', '026', '0', '1', '2018-08-30 16:55:01 676', '1800017184755');
INSERT INTO `ai_stayopen_invoice` VALUES ('288', 'b1e2a3d0-ac33-11e8-be1e-23c0b152560e', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-30 17:04:26 611', '1800017184187');
INSERT INTO `ai_stayopen_invoice` VALUES ('289', '955a3000-ac35-11e8-91d3-471827c519d3', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-30 17:17:57 799', '1800017184968');
INSERT INTO `ai_stayopen_invoice` VALUES ('290', 'b3773ba0-ac35-11e8-91d3-471827c519d3', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-30 17:18:48 324', '1800017185341');
INSERT INTO `ai_stayopen_invoice` VALUES ('291', 'b891fee0-ac35-11e8-91d3-471827c519d3', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-30 17:19:02 018', '1800017185343');
INSERT INTO `ai_stayopen_invoice` VALUES ('292', '7c291a00-ac36-11e8-91d3-471827c519d3', '500100201711203', 'dianpiao', '026', '0', '1', '2018-08-30 17:24:25 022', '1800017185089');
INSERT INTO `ai_stayopen_invoice` VALUES ('293', 'decae350-ac36-11e8-91d3-471827c519d3', '500100201711203', 'dianpiao', '026', '0', '1', '2018-08-30 17:27:11 313', '1800017185447');
INSERT INTO `ai_stayopen_invoice` VALUES ('294', '427fca50-ac37-11e8-91d3-471827c519d3', '500100201711203', 'dianpiao', '026', '0', '1', '2018-08-30 17:29:58 629', '1800017185165');
INSERT INTO `ai_stayopen_invoice` VALUES ('295', '438db7e0-ac37-11e8-91d3-471827c519d3', '500100201711203', 'dianpiao', '026', '0', '1', '2018-08-30 17:30:00 361', '1800017185507');
INSERT INTO `ai_stayopen_invoice` VALUES ('296', '6f77c8a0-ac37-11e8-be1e-23c0b152560e', '501234567890000120', '499000150469', '007', '1', '0', '2018-08-30 17:31:13 144', '1800017185562');
INSERT INTO `ai_stayopen_invoice` VALUES ('297', '7ec74f10-ac37-11e8-be1e-23c0b152560e', '501234567890000120', '499000150469', '007', '1', '0', '2018-08-30 17:31:38 721', '1800017185576');
INSERT INTO `ai_stayopen_invoice` VALUES ('298', '9d7c7c00-ac37-11e8-be1e-23c0b152560e', '501234567890000120', '499000150469', '004', '1', '0', '2018-08-30 17:32:30 199', '1800017185270');
INSERT INTO `ai_stayopen_invoice` VALUES ('299', 'c72b1bb0-ac37-11e8-be1e-23c0b152560e', '501234567890000120', '499000150469', '026', '1', '1', '2018-08-30 17:33:43 615', '1800017185285');
INSERT INTO `ai_stayopen_invoice` VALUES ('300', 'cab553e0-ac37-11e8-be1e-23c0b152560e', '501234567890000120', '499000150469', '026', '1', '1', '2018-08-30 17:33:46 035', '1800017185288');
INSERT INTO `ai_stayopen_invoice` VALUES ('301', 'e2bcc180-ac37-11e8-be1e-23c0b152560e', '501234567890000120', '499000150469', '026', '1', '0', '2018-08-30 17:34:26 396', '1800017186316');
INSERT INTO `ai_stayopen_invoice` VALUES ('302', '23e6e280-ac38-11e8-be1e-23c0b152560e', '501234567890000120', '499000150469', '026', '1', '0', '2018-08-30 17:36:15 742', '1800017186376');
INSERT INTO `ai_stayopen_invoice` VALUES ('303', '35869a80-ac38-11e8-be1e-23c0b152560e', '501234567890000120', '499000150469', '007', '1', '0', '2018-08-30 17:36:45 305', '1800017185711');
INSERT INTO `ai_stayopen_invoice` VALUES ('304', '40ee3860-ac38-11e8-be1e-23c0b152560e', '501234567890000120', '499000150469', '007', '1', '0', '2018-08-30 17:37:04 408', '1800017185723');
INSERT INTO `ai_stayopen_invoice` VALUES ('305', '480d0900-ac38-11e8-be1e-23c0b152560e', '501234567890000120', '499000150469', '004', '1', '0', '2018-08-30 17:37:16 362', '1800017186405');
INSERT INTO `ai_stayopen_invoice` VALUES ('306', 'c6051cd0-ac38-11e8-b030-098923e24aa4', '501234567890000120', '499000150469', '004', '1', '0', '2018-08-30 17:40:47 345', '1800017186489');
INSERT INTO `ai_stayopen_invoice` VALUES ('307', 'fd1c5a80-ac38-11e8-b030-098923e24aa4', '501234567890000120', '499000150469', '026', '1', '1', '2018-08-30 17:42:19 730', '1800017186499');
INSERT INTO `ai_stayopen_invoice` VALUES ('308', '357c44d0-ac39-11e8-b030-098923e24aa4', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-30 17:43:54 347', '1800017186511');
INSERT INTO `ai_stayopen_invoice` VALUES ('309', '3ef61c70-ac39-11e8-b030-098923e24aa4', '500100201711203', 'dianpiao', '026', '0', '1', '2018-08-30 17:44:10 209', '1800017186521');
INSERT INTO `ai_stayopen_invoice` VALUES ('310', '5d6df240-ac39-11e8-b030-098923e24aa4', '500100201711203', 'dianpiao', '026', '0', '1', '2018-08-30 17:45:01 296', '1800017185818');
INSERT INTO `ai_stayopen_invoice` VALUES ('311', '5bfb7680-ac39-11e8-b030-098923e24aa4', '500100201711203', 'dianpiao', '026', '0', '1', '2018-08-30 17:45:01 502', '1800017185819');
INSERT INTO `ai_stayopen_invoice` VALUES ('312', '8afe38f0-ac39-11e8-b030-098923e24aa4', '500100201711203', 'dianpiao', '026', '0', '1', '2018-08-30 17:46:17 774', '1800017186546');
INSERT INTO `ai_stayopen_invoice` VALUES ('313', 'be229190-ac39-11e8-b030-098923e24aa4', '500100201711203', 'dianpiao', '026', '0', '1', '2018-08-30 17:47:43 535', '1800017186554');
INSERT INTO `ai_stayopen_invoice` VALUES ('314', 'f3fc1f20-ac39-11e8-b030-098923e24aa4', '500100201711203', 'dianpiao', '026', '0', '1', '2018-08-30 17:49:14 395', '1800017185858');
INSERT INTO `ai_stayopen_invoice` VALUES ('315', '5b36aca0-ac49-11e8-be1e-23c0b152560e', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-30 19:39:30 032', '1800017189917');
INSERT INTO `ai_stayopen_invoice` VALUES ('316', '6417edc0-ac49-11e8-be1e-23c0b152560e', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-30 19:39:44 836', '1800017190712');
INSERT INTO `ai_stayopen_invoice` VALUES ('317', 'a4abe940-ac49-11e8-be1e-23c0b152560e', '500100201711203', 'dianpiao', '026', '0', '1', '2018-08-30 19:41:33 258', '1800017189953');
INSERT INTO `ai_stayopen_invoice` VALUES ('318', 'f36913a0-ac49-11e8-b030-098923e24aa4', '500100201711203', 'dianpiao', '026', '0', '1', '2018-08-30 19:43:44 876', '1800017189991');
INSERT INTO `ai_stayopen_invoice` VALUES ('319', 'f500f1b0-ac49-11e8-b030-098923e24aa4', '500100201711203', 'dianpiao', '026', '0', '1', '2018-08-30 19:43:47 528', '1800017190786');
INSERT INTO `ai_stayopen_invoice` VALUES ('320', '18cf8250-ac4a-11e8-9fed-adbe1c06ec8f', '500100201711203', 'dianpiao', '026', '0', '1', '2018-08-30 19:44:47 601', '1800017190019');
INSERT INTO `ai_stayopen_invoice` VALUES ('321', '5257ca90-ac4b-11e8-9fed-adbe1c06ec8f', '500100201711203', 'dianpiao', '026', '0', '1', '2018-08-30 19:53:33 632', '1800017190961');
INSERT INTO `ai_stayopen_invoice` VALUES ('322', 'f5f41960-ac4b-11e8-9b1c-53dbdb1a8122', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-30 19:58:08 538', '1800017191038');
INSERT INTO `ai_stayopen_invoice` VALUES ('323', 'fcd14d20-ac4b-11e8-9b1c-53dbdb1a8122', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-30 19:58:20 057', '1800017191048');
INSERT INTO `ai_stayopen_invoice` VALUES ('324', 'af47aed0-ac4d-11e8-9b1c-53dbdb1a8122', '512345678900000040', 'esc001', '026', '0', '0', '2018-08-30 20:10:29 023', '1800017191258');
INSERT INTO `ai_stayopen_invoice` VALUES ('325', 'cea2dfc0-ac4d-11e8-9b1c-53dbdb1a8122', '512345678900000040', 'esc001', '026', '0', '0', '2018-08-30 20:11:21 577', '1800017191486');
INSERT INTO `ai_stayopen_invoice` VALUES ('326', '5a0808f0-ac4f-11e8-9fed-adbe1c06ec8f', '500100201711203', 'dianpiao', '026', '0', '1', '2018-08-30 20:22:24 522', '1800017191683');
INSERT INTO `ai_stayopen_invoice` VALUES ('327', 'c9fc2920-ac4f-11e8-9fed-adbe1c06ec8f', '500100201711203', 'dianpiao', '026', '0', '1', '2018-08-30 20:25:32 343', '1800017192509');
INSERT INTO `ai_stayopen_invoice` VALUES ('328', 'e8642070-ac4f-11e8-9fed-adbe1c06ec8f', '500100201711203', 'dianpiao', '026', '0', '1', '2018-08-30 20:26:23 367', '1800017191756');
INSERT INTO `ai_stayopen_invoice` VALUES ('329', '286503b0-ac50-11e8-9fed-adbe1c06ec8f', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-30 20:28:10 803', '1800017191779');
INSERT INTO `ai_stayopen_invoice` VALUES ('330', '5a5dfbb0-ac50-11e8-9fed-adbe1c06ec8f', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-30 20:29:34 642', '1800017192589');
INSERT INTO `ai_stayopen_invoice` VALUES ('331', '8a3cc640-ac50-11e8-9697-6f7acba63f1b', '512345678900000040', 'esc001', '026', '0', '1', '2018-08-30 20:30:55 290', '1800017192611');
INSERT INTO `ai_stayopen_invoice` VALUES ('332', 'a2380970-ac51-11e8-9697-6f7acba63f1b', '512345678900000040', 'esc001', '026', '0', '0', '2018-08-30 20:38:45 042', '1800017192745');
INSERT INTO `ai_stayopen_invoice` VALUES ('333', 'bed9bfb0-ac51-11e8-9697-6f7acba63f1b', '512345678900000040', 'esc001', '026', '0', '1', '2018-08-30 20:39:33 038', '1800017192754');
INSERT INTO `ai_stayopen_invoice` VALUES ('334', '7242b430-ac52-11e8-8f71-7995706e5058', '512345678900000040', '40all', '026', '0', '0', '2018-08-30 20:44:34 889', '1800017192068');
INSERT INTO `ai_stayopen_invoice` VALUES ('335', '172bb1d0-ac54-11e8-871c-bdc3ec93a3c4', '512345678900000040', 'esc001', '026', '0', '0', '2018-08-30 20:56:21 048', '1800017193003');
INSERT INTO `ai_stayopen_invoice` VALUES ('336', '234cb4a0-ac54-11e8-871c-bdc3ec93a3c4', '512345678900000040', 'esc001', '026', '0', '0', '2018-08-30 20:56:41 447', '1800017192209');
INSERT INTO `ai_stayopen_invoice` VALUES ('337', '3d907db0-ac54-11e8-a695-636266f81a2f', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-30 20:57:12 730', '1800017193004');
INSERT INTO `ai_stayopen_invoice` VALUES ('338', '7e781770-ac54-11e8-a695-636266f81a2f', '501234567890000120', '499000150469', '026', '1', '0', '2018-08-30 20:59:01 605', '1800017192224');
INSERT INTO `ai_stayopen_invoice` VALUES ('339', '946b9930-ac54-11e8-a695-636266f81a2f', '501234567890000120', '499000150469', '026', '1', '0', '2018-08-30 20:59:38 469', '1800017192225');
INSERT INTO `ai_stayopen_invoice` VALUES ('340', 'cd1054b0-ac54-11e8-a59b-d5ed236fa4f3', '512345678900000040', 'esc001', '026', '0', '0', '2018-08-30 21:01:26 236', '1800017193027');
INSERT INTO `ai_stayopen_invoice` VALUES ('341', 'deb0a8f0-ac54-11e8-a59b-d5ed236fa4f3', '512345678900000040', 'esc001', '026', '0', '1', '2018-08-30 21:01:55 745', '1800017193028');
INSERT INTO `ai_stayopen_invoice` VALUES ('342', '16aa5760-ac55-11e8-97f7-93c10636fd9a', '512345678900000040', 'esc001', '026', '0', '0', '2018-08-30 21:03:28 975', '1800017192251');
INSERT INTO `ai_stayopen_invoice` VALUES ('343', '1f068a00-ac55-11e8-97f7-93c10636fd9a', '512345678900000040', 'esc001', '026', '0', '1', '2018-08-30 21:03:42 898', '1800017192252');
INSERT INTO `ai_stayopen_invoice` VALUES ('344', '6dc6a520-ac56-11e8-a4eb-3128ac8d7a24', '512345678900000040', 'esc001', '026', '0', '0', '2018-08-30 21:13:05 419', '1800017193101');
INSERT INTO `ai_stayopen_invoice` VALUES ('345', '7d9a9dd0-ac56-11e8-a4eb-3128ac8d7a24', '512345678900000040', 'esc001', '026', '0', '1', '2018-08-30 21:13:31 883', '1800017193102');
INSERT INTO `ai_stayopen_invoice` VALUES ('346', '987034b0-ac58-11e8-a695-636266f81a2f', '501234567890000120', '499000150469', '026', '1', '1', '2018-08-30 21:28:22 863', '1800017193216');
INSERT INTO `ai_stayopen_invoice` VALUES ('347', '06fb9d20-ac59-11e8-a695-636266f81a2f', '501234567890000120', '499000150469', '007', '1', '0', '2018-08-30 21:31:28 823', '1800017193230');
INSERT INTO `ai_stayopen_invoice` VALUES ('348', '247eb2b0-ac59-11e8-a695-636266f81a2f', '501234567890000120', '499000150469', '004', '1', '0', '2018-08-30 21:32:18 227', '1800017193447');
INSERT INTO `ai_stayopen_invoice` VALUES ('349', 'f31681a0-ac5b-11e8-a695-636266f81a2f', '501234567890000120', '499000150469', '004', '1', '0', '2018-08-30 21:52:24 047', '1800017193576');
INSERT INTO `ai_stayopen_invoice` VALUES ('350', 'fdb24400-ac5b-11e8-a695-636266f81a2f', '501234567890000120', '499000150469', '007', '1', '0', '2018-08-30 21:52:41 924', '1800017193577');
INSERT INTO `ai_stayopen_invoice` VALUES ('351', '0c054200-ac5c-11e8-a695-636266f81a2f', '501234567890000120', '499000150469', '007', '1', '0', '2018-08-30 21:53:05 859', '1800017194380');
INSERT INTO `ai_stayopen_invoice` VALUES ('352', 'ab3f2110-ac5c-11e8-8761-fdf6aced76f4', '501234567890000120', '499000150469', '004', '1', '0', '2018-08-30 21:57:32 699', '1800017193597');
INSERT INTO `ai_stayopen_invoice` VALUES ('353', 'e49121a0-ac5e-11e8-b83d-7f2ed279a01f', '501234567890000120', '499000150469', '026', '1', '0', '2018-08-30 22:13:39 457', '1800017194514');
INSERT INTO `ai_stayopen_invoice` VALUES ('354', 'fb8152e0-ac5e-11e8-b83d-7f2ed279a01f', '501234567890000120', '499000150469', '026', '1', '1', '2018-08-30 22:14:17 865', '1800017193719');
INSERT INTO `ai_stayopen_invoice` VALUES ('355', '292e2240-ac5f-11e8-b83d-7f2ed279a01f', '501234567890000120', '499000150469', '026', '1', '1', '2018-08-30 22:15:34 509', '1800017193720');
INSERT INTO `ai_stayopen_invoice` VALUES ('356', '3a8fbfd0-ac5f-11e8-b83d-7f2ed279a01f', '501234567890000120', '499000150469', '026', '1', '1', '2018-08-30 22:16:03 658', '1800017193722');
INSERT INTO `ai_stayopen_invoice` VALUES ('357', '3efa9400-ac5f-11e8-b83d-7f2ed279a01f', '501234567890000120', '499000150469', '026', '1', '1', '2018-08-30 22:16:11 064', '1800017194539');
INSERT INTO `ai_stayopen_invoice` VALUES ('358', '4c43c320-ac5f-11e8-b83d-7f2ed279a01f', '501234567890000120', '499000150469', '026', '1', '1', '2018-08-30 22:16:33 372', '1800017193734');
INSERT INTO `ai_stayopen_invoice` VALUES ('359', '680dde10-ac5f-11e8-b83d-7f2ed279a01f', '501234567890000120', '499000150469', '026', '1', '1', '2018-08-30 22:17:20 021', '1800017194543');
INSERT INTO `ai_stayopen_invoice` VALUES ('360', '725da350-ac5f-11e8-b83d-7f2ed279a01f', '501234567890000120', '499000150469', '007', '1', '0', '2018-08-30 22:17:37 306', '1800017194544');
INSERT INTO `ai_stayopen_invoice` VALUES ('361', '76efd5a0-ac5f-11e8-b83d-7f2ed279a01f', '501234567890000120', '499000150469', '004', '1', '0', '2018-08-30 22:17:44 983', '1800017194545');
INSERT INTO `ai_stayopen_invoice` VALUES ('362', '686c8360-ac60-11e8-b83d-7f2ed279a01f', '501234567890000120', '499000150469', '026', '1', '1', '2018-08-30 22:24:30 135', '1800017193790');
INSERT INTO `ai_stayopen_invoice` VALUES ('363', 'e14455b0-ac60-11e8-bcc4-1ba20a70cb13', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-30 22:27:53 282', '1800017193806');
INSERT INTO `ai_stayopen_invoice` VALUES ('364', '050a5ad0-ac61-11e8-bcc4-1ba20a70cb13', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-30 22:28:53 288', '1800017193816');
INSERT INTO `ai_stayopen_invoice` VALUES ('365', '13155350-ac61-11e8-bcc4-1ba20a70cb13', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-30 22:29:16 850', '1800017193817');
INSERT INTO `ai_stayopen_invoice` VALUES ('366', '333310f0-ac61-11e8-bcc4-1ba20a70cb13', '500100201711203', 'dianpiao', '026', '0', '1', '2018-08-30 22:30:10 802', '1800017194632');
INSERT INTO `ai_stayopen_invoice` VALUES ('367', '4aef6bd0-ac61-11e8-bcc4-1ba20a70cb13', '500100201711203', 'dianpiao', '026', '0', '1', '2018-08-30 22:30:50 531', '1800017193829');
INSERT INTO `ai_stayopen_invoice` VALUES ('368', '6043c760-ac61-11e8-bcc4-1ba20a70cb13', '500100201711203', 'dianpiao', '026', '0', '1', '2018-08-30 22:31:26 341', '1800017193830');
INSERT INTO `ai_stayopen_invoice` VALUES ('369', '757e8070-ac61-11e8-b83d-7f2ed279a01f', '501234567890000120', '499000150469', '007', '1', '0', '2018-08-30 22:32:01 586', '1800017193832');
INSERT INTO `ai_stayopen_invoice` VALUES ('370', '94f77290-ac61-11e8-b83d-7f2ed279a01f', '501234567890000120', '499000150469', '004', '1', '0', '2018-08-30 22:32:54 370', '1800017194654');
INSERT INTO `ai_stayopen_invoice` VALUES ('371', '94fa0340-ac64-11e8-9cc7-1badf8a9c6d2', '512345678900000040', 'esc001', '026', '0', '0', '2018-08-30 22:54:23 849', '1800017194794');
INSERT INTO `ai_stayopen_invoice` VALUES ('372', 'f47426c0-ac64-11e8-9655-f51cf3103039', '512345678900000040', 'esc001', '026', '0', '0', '2018-08-30 22:57:03 457', '1800017194004');
INSERT INTO `ai_stayopen_invoice` VALUES ('373', '4c302c60-ac65-11e8-887b-3105e15a3fa6', '512345678900000040', 'esc001', '026', '0', '0', '2018-08-30 22:59:31 294', '1800017194821');
INSERT INTO `ai_stayopen_invoice` VALUES ('374', 'f47426c0-ac64-11e8-9655-f51cf3103039', '110101499200460752', 'jkglxx', '026', '2', '0', '2018-08-30 23:13:04 095', '1800017194915');
INSERT INTO `ai_stayopen_invoice` VALUES ('375', 'c5d8d150-ac67-11e8-887b-3105e15a3fa6', '512345678900000040', 'esc001', '026', '0', '1', '2018-08-30 23:17:13 786', '1800017194946');
INSERT INTO `ai_stayopen_invoice` VALUES ('376', '42596050-ac68-11e8-aba4-f3f4c64fd8a0', '500100201711203', 'dianpiao', '026', '0', '0', '2018-08-30 23:20:42 973', '1800017194154');
INSERT INTO `ai_stayopen_invoice` VALUES ('377', '5af37100-ac68-11e8-9219-21d044337c8c', '501234567890000120', '499000150469', '007', '1', '0', '2018-08-30 23:21:19 756', '1800017194155');
INSERT INTO `ai_stayopen_invoice` VALUES ('378', '61ed7b90-ac68-11e8-9219-21d044337c8c', '501234567890000120', '499000150469', '004', '1', '0', '2018-08-30 23:21:31 462', '1800017194156');
INSERT INTO `ai_stayopen_invoice` VALUES ('379', '9887f2b0-ac69-11e8-9219-21d044337c8c', '501234567890000120', '499000150469', '026', '1', '0', '2018-08-30 23:30:12 599', '1800017195029');
INSERT INTO `ai_stayopen_invoice` VALUES ('380', '01dc0f30-ac6a-11e8-9219-21d044337c8c', '501234567890000120', '499000150469', '026', '1', '1', '2018-08-30 23:33:09 297', '1800017195047');
INSERT INTO `ai_stayopen_invoice` VALUES ('381', '2d1aebd0-ac6a-11e8-9219-21d044337c8c', '501234567890000120', '499000150469', '004', '1', '0', '2018-08-30 23:34:21 849', '1800017195059');
INSERT INTO `ai_stayopen_invoice` VALUES ('382', '358c0600-ac6a-11e8-9219-21d044337c8c', '501234567890000120', '499000150469', '004', '1', '0', '2018-08-30 23:34:35 989', '1800017195060');
INSERT INTO `ai_stayopen_invoice` VALUES ('383', 'c950c7c0-ac6c-11e8-941d-49d8f5fd3001', '512345678900000040', 'esc001', '026', '0', '1', '2018-08-30 23:53:07 039', '1800017195355');
INSERT INTO `ai_stayopen_invoice` VALUES ('384', '16e0f520-acc0-11e8-9f62-83339917e2f1', '512345678900000040', 'esc001', '026', '0', '1', '2018-08-31 09:49:25 375', '1800017203032');
INSERT INTO `ai_stayopen_invoice` VALUES ('385', 'f1e128c0-acc5-11e8-9821-5ff4997f1045', '512345678900000040', 'esc001', '026', '0', '1', '2018-08-31 10:31:20 284', '1800017203481');
INSERT INTO `ai_stayopen_invoice` VALUES ('386', 'a988ddc0-acd9-11e8-b6e3-1db04c94023f', '501234567890000120', '499000150469', '026', '1', '0', '2018-08-31 12:52:28 317', '1800017205501');
INSERT INTO `ai_stayopen_invoice` VALUES ('387', 'ba693d60-acd9-11e8-b6e3-1db04c94023f', '501234567890000120', '499000150469', '007', '1', '0', '2018-08-31 12:52:56 660', '1800017205502');
INSERT INTO `ai_stayopen_invoice` VALUES ('388', 'c42d8b80-acd9-11e8-b6e3-1db04c94023f', '501234567890000120', '499000150469', '004', '1', '0', '2018-08-31 12:53:13 074', '1800017206354');
INSERT INTO `ai_stayopen_invoice` VALUES ('389', '5d52c180-acdb-11e8-b219-5f35b9536973', '512345678900000040', 'ds', '026', '0', '1', '2018-08-31 13:04:40 293', '1800017205596');
INSERT INTO `ai_stayopen_invoice` VALUES ('390', '74783390-acdb-11e8-b219-5f35b9536973', '512345678900000040', 'ds', '026', '0', '1', '2018-08-31 13:05:19 093', '1800017206423');
INSERT INTO `ai_stayopen_invoice` VALUES ('391', '964c05a0-acdb-11e8-b219-5f35b9536973', '512345678900000040', 'ds', '026', '0', '0', '2018-08-31 13:06:15 873', '1800017205609');
INSERT INTO `ai_stayopen_invoice` VALUES ('392', '4f5d5760-acdc-11e8-b219-5f35b9536973', '512345678900000040', 'ds', '026', '0', '0', '2018-08-31 13:11:26 386', '1800017206467');
INSERT INTO `ai_stayopen_invoice` VALUES ('393', '4ee7b8c0-af7a-11e8-8b92-a3673a82302b', '91500000747150541A', '499000151031', '004', '1', '0', '2018-09-03 21:07:28 136', '1800017282469');
INSERT INTO `ai_stayopen_invoice` VALUES ('394', '8f9f9a80-af7b-11e8-8b92-a3673a82302b', '91500000747150541A', '499000151031', '026', '1', '0', '2018-09-03 21:16:26 188', '1800017283462');
INSERT INTO `ai_stayopen_invoice` VALUES ('395', '93d8b050-af7b-11e8-8b92-a3673a82302b', '91500000747150541A', '499000151031', '004', '1', '0', '2018-09-03 21:16:33 278', '1800017283463');
INSERT INTO `ai_stayopen_invoice` VALUES ('396', 'a35945e0-b04c-11e8-86bd-0d201577ff02', '51234567890029BWGF', '499000153045', '004', '1', '0', '2018-09-04 22:13:04 888', '1800017306666');
INSERT INTO `ai_stayopen_invoice` VALUES ('397', 'aa2cb5a0-b04c-11e8-86bd-0d201577ff02', '51234567890029BWGF', '499000153045', '004', '1', '0', '2018-09-04 22:13:16 331', '1800017305762');
INSERT INTO `ai_stayopen_invoice` VALUES ('398', 'afe93720-b04c-11e8-86bd-0d201577ff02', '51234567890029BWGF', '499000153045', '026', '1', '0', '2018-09-04 22:13:25 926', '1800017306667');
INSERT INTO `ai_stayopen_invoice` VALUES ('399', 'f90f4250-b04c-11e8-86bd-0d201577ff02', '51234567890029BWGF', '499000153045', '026', '1', '1', '2018-09-04 22:15:28 635', '1800017306677');
INSERT INTO `ai_stayopen_invoice` VALUES ('400', '311e9ba0-b04d-11e8-86bd-0d201577ff02', '512345678900000040', 'ds', '026', '0', '0', '2018-09-04 22:17:04 460', '1800017305777');
INSERT INTO `ai_stayopen_invoice` VALUES ('401', '370a4370-b04d-11e8-86bd-0d201577ff02', '512345678900000040', 'ds', '026', '0', '0', '2018-09-04 22:17:16 287', '1800017305787');
INSERT INTO `ai_stayopen_invoice` VALUES ('402', '3d32a620-b04d-11e8-86bd-0d201577ff02', '512345678900000040', 'ds', '026', '0', '0', '2018-09-04 22:17:23 018', '1800017305796');
INSERT INTO `ai_stayopen_invoice` VALUES ('403', 'f47426c0-ac64-11e8-9655-f51cf3103039', '110101499200460752', 'jkglxx', '026', '2', '0', '2018-09-06 10:28:01 390', '1800017336824');
INSERT INTO `ai_stayopen_invoice` VALUES ('404', '708a9ac0-d12f-11e8-a6fb-0ba272785827', '512345678900000040', '40all', '026', '0', '0', '2018-10-16 18:37:11 847', '1800018688607');
INSERT INTO `ai_stayopen_invoice` VALUES ('405', '34ce4ff0-d138-11e8-a6fb-0ba272785827', '512345678900000040', '40all', '026', '0', '0', '2018-10-16 19:39:57 103', '1800018699164');
INSERT INTO `ai_stayopen_invoice` VALUES ('406', '12c8ca10-d139-11e8-acfa-11907147e9bc', '512345678900000040', '40all', '026', '0', '0', '2018-10-16 19:46:09 509', '1800018700662');
INSERT INTO `ai_stayopen_invoice` VALUES ('407', '1b1d82a0-d139-11e8-acfa-11907147e9bc', '512345678900000040', '40all', '026', '0', '0', '2018-10-16 19:46:23 470', '1800018700679');
INSERT INTO `ai_stayopen_invoice` VALUES ('408', '1ec2a060-d13a-11e8-a81f-b95a99213826', '512345678900000040', '40all', '026', '0', '1', '2018-10-16 19:53:39 053', '1800018701537');
INSERT INTO `ai_stayopen_invoice` VALUES ('409', 'feba8110-d14e-11e8-a1ff-a1ab9381614f', '512345678900000040', 'cpy001', '026', '0', '0', '2018-10-16 22:23:05 659', '1800018728426');
INSERT INTO `ai_stayopen_invoice` VALUES ('410', '3331e690-d14f-11e8-a1ff-a1ab9381614f', '512345678900000040', 'cpy001', '026', '0', '0', '2018-10-16 22:24:33 688', '1800018728554');
INSERT INTO `ai_stayopen_invoice` VALUES ('411', '6280cd30-d14f-11e8-a1ff-a1ab9381614f', '512345678900000040', 'cpy001', '026', '0', '1', '2018-10-16 22:25:52 989', '1800018728672');
INSERT INTO `ai_stayopen_invoice` VALUES ('412', '6ee3b960-d1af-11e8-87a1-63e3d35acaa1', '512345678900000040', 'ds', '026', '0', '1', '2018-10-17 09:53:20 890', '1800018750640');
INSERT INTO `ai_stayopen_invoice` VALUES ('413', '9bc17c20-d1b3-11e8-b9fe-7d3dd69d2c9a', '512345678900000040', 'ds', '026', '0', '1', '2018-10-17 10:23:18 856', '1800018752960');
INSERT INTO `ai_stayopen_invoice` VALUES ('414', 'c9465120-d1b3-11e8-b9fe-7d3dd69d2c9a', '512345678900000040', 'ds', '026', '0', '1', '2018-10-17 10:24:35 187', '1800018753458');
INSERT INTO `ai_stayopen_invoice` VALUES ('415', 'e776e4c0-d1b3-11e8-b9fe-7d3dd69d2c9a', '512345678900000040', 'ds', '026', '0', '0', '2018-10-17 10:25:25 901', '1800018753459');
INSERT INTO `ai_stayopen_invoice` VALUES ('416', 'fb65e3f0-d1b3-11e8-b9fe-7d3dd69d2c9a', '512345678900000040', 'ds', '026', '0', '0', '2018-10-17 10:25:59 309', '1800018753460');
INSERT INTO `ai_stayopen_invoice` VALUES ('417', '0bb5c360-d1b4-11e8-b9fe-7d3dd69d2c9a', '512345678900000040', 'ds', '026', '0', '0', '2018-10-17 10:26:26 678', '1800018753461');
INSERT INTO `ai_stayopen_invoice` VALUES ('418', '14b513d0-d1b4-11e8-b9fe-7d3dd69d2c9a', '512345678900000040', 'ds', '026', '0', '0', '2018-10-17 10:26:41 781', '1800018752967');
INSERT INTO `ai_stayopen_invoice` VALUES ('419', '354876a0-d1b4-11e8-b9fe-7d3dd69d2c9a', '512345678900000040', 'ds', '026', '0', '0', '2018-10-17 10:27:36 449', '1800018752972');
INSERT INTO `ai_stayopen_invoice` VALUES ('420', '43a160b0-d1b7-11e8-87a1-63e3d35acaa1', '512345678900000040', 'ds', '026', '0', '0', '2018-10-17 10:49:21 314', '1800018753503');
INSERT INTO `ai_stayopen_invoice` VALUES ('421', 'e0751860-d1bb-11e8-9bc8-b93458c9a7cd', '512345678900000040', 'ds', '026', '0', '0', '2018-10-17 11:22:22 468', '1800018753070');
INSERT INTO `ai_stayopen_invoice` VALUES ('422', 'ef839e30-d1bb-11e8-9bc8-b93458c9a7cd', '512345678900000040', 'ds', '026', '0', '1', '2018-10-17 11:22:47 691', '1800018753555');
INSERT INTO `ai_stayopen_invoice` VALUES ('423', '4a3d9a30-d1bf-11e8-b8f6-db31b0f285d3', '512345678900000040', 'ds', '026', '0', '0', '2018-10-17 11:46:48 190', '1800018753115');
INSERT INTO `ai_stayopen_invoice` VALUES ('424', 'e16dd370-d1bf-11e8-b8f6-db31b0f285d3', '512345678900000040', 'ds', '026', '0', '1', '2018-10-17 11:51:01 804', '1800018753613');
INSERT INTO `ai_stayopen_invoice` VALUES ('425', '6db08960-d1d7-11e8-b8f6-db31b0f285d3', '512345678900000040', 'ds', '026', '0', '1', '2018-10-17 14:39:43 830', '1800018754365');
INSERT INTO `ai_stayopen_invoice` VALUES ('426', '00470ee0-d1db-11e8-b8f6-db31b0f285d3', '512345678900000040', 'ds', '026', '0', '1', '2018-10-17 15:05:22 051', '1800018757151');
INSERT INTO `ai_stayopen_invoice` VALUES ('427', '07645180-d1de-11e8-b4fe-959d4c7b5b1b', '512345678900000040', 'ds', '026', '0', '1', '2018-10-17 15:26:58 008', '1800018761045');
INSERT INTO `ai_stayopen_invoice` VALUES ('428', '54c0ee90-d1eb-11e8-b8f6-db31b0f285d3', '512345678900000040', 'ds', '026', '0', '0', '2018-10-17 17:02:11 497', '1800018777118');
INSERT INTO `ai_stayopen_invoice` VALUES ('429', 'a9af5fd0-d1ec-11e8-a037-735b29158bf5', '512345678900000040', 'esc001', '026', '0', '0', '2018-10-17 17:11:42 597', '1800018779374');
INSERT INTO `ai_stayopen_invoice` VALUES ('430', '02869970-d1ed-11e8-a037-735b29158bf5', '512345678900000040', 'esc001', '026', '0', '0', '2018-10-17 17:14:11 630', '1800018779552');
INSERT INTO `ai_stayopen_invoice` VALUES ('431', 'd7c61f20-d1ed-11e8-a037-735b29158bf5', '512345678900000040', 'esc001', '026', '0', '0', '2018-10-17 17:20:09 405', '1800018780110');
INSERT INTO `ai_stayopen_invoice` VALUES ('432', '018b5410-d1ee-11e8-a037-735b29158bf5', '512345678900000040', 'esc001', '026', '0', '0', '2018-10-17 17:21:19 501', '1800018780225');
INSERT INTO `ai_stayopen_invoice` VALUES ('433', '3808d7e0-d1f0-11e8-8831-615d48c8fd44', '512345678900000040', 'esc001', '026', '0', '0', '2018-10-17 17:37:09 917', '1800018783614');
INSERT INTO `ai_stayopen_invoice` VALUES ('434', '94dcc520-d1f1-11e8-9be2-191b2223e698', '512345678900000040', 'esc001', '026', '0', '0', '2018-10-17 17:46:55 149', '1800018785487');
INSERT INTO `ai_stayopen_invoice` VALUES ('435', 'e6aa3cc0-d1f1-11e8-a575-858664fcd918', '512345678900000040', 'esc001', '026', '0', '0', '2018-10-17 17:49:12 418', '1800018785055');
INSERT INTO `ai_stayopen_invoice` VALUES ('436', '026abac0-d1f2-11e8-a575-858664fcd918', '512345678900000040', 'esc001', '026', '0', '0', '2018-10-17 17:49:58 955', '1800018785753');
INSERT INTO `ai_stayopen_invoice` VALUES ('437', 'f8559810-d1f2-11e8-a575-858664fcd918', '512345678900000040', 'esc001', '026', '0', '0', '2018-10-17 17:56:51 578', '1800018787329');
INSERT INTO `ai_stayopen_invoice` VALUES ('438', '29163720-d1f3-11e8-a575-858664fcd918', '512345678900000040', 'esc001', '026', '0', '0', '2018-10-17 17:58:13 325', '1800018786769');
INSERT INTO `ai_stayopen_invoice` VALUES ('439', '44670360-d1f3-11e8-a575-858664fcd918', '512345678900000040', 'esc001', '026', '0', '0', '2018-10-17 17:58:59 138', '1800018787521');
INSERT INTO `ai_stayopen_invoice` VALUES ('440', '3a019dd0-d1f4-11e8-8ed4-57849540aab4', '512345678900000040', 'esc001', '026', '0', '0', '2018-10-17 18:05:51 200', '1800018788147');
INSERT INTO `ai_stayopen_invoice` VALUES ('441', '4c9d4200-d1f4-11e8-8ed4-57849540aab4', '512345678900000040', 'esc001', '026', '0', '0', '2018-10-17 18:06:22 415', '1800018788197');
INSERT INTO `ai_stayopen_invoice` VALUES ('442', 'e2e76100-d1f4-11e8-8ed4-57849540aab4', '512345678900000040', 'esc001', '026', '0', '0', '2018-10-17 18:10:34 558', '1800018789536');
INSERT INTO `ai_stayopen_invoice` VALUES ('443', '2a35ed10-d1f5-11e8-8ed4-57849540aab4', '512345678900000040', 'esc001', '026', '0', '0', '2018-10-17 18:12:34 190', '1800018789698');
INSERT INTO `ai_stayopen_invoice` VALUES ('444', '6a85b3a0-d1f5-11e8-8ed4-57849540aab4', '512345678900000040', 'esc001', '026', '0', '0', '2018-10-17 18:14:22 089', '1800018789234');
INSERT INTO `ai_stayopen_invoice` VALUES ('445', '6655a910-d1f6-11e8-8ed4-57849540aab4', '512345678900000040', 'esc001', '026', '0', '1', '2018-10-17 18:21:24 550', '1800018790866');
INSERT INTO `ai_stayopen_invoice` VALUES ('446', 'f91c6220-d200-11e8-8c5a-55b779541f77', '512345678900000040', 'cpy001', '026', '0', '0', '2018-10-17 19:37:05 767', '1800018792534');
INSERT INTO `ai_stayopen_invoice` VALUES ('447', 'a4862fc0-d20f-11e8-94ad-df250c4f0835', '512345678900000040', 'ds', '026', '0', '0', '2018-10-17 21:22:07 435', '1800018793323');
INSERT INTO `ai_stayopen_invoice` VALUES ('448', 'd7e2c480-d211-11e8-989d-21e0ab386964', '512345678900000040', 'ds', '026', '0', '0', '2018-10-17 21:37:51 917', '1800018793339');
INSERT INTO `ai_stayopen_invoice` VALUES ('449', '692418a0-d275-11e8-9d71-3751b1ce26cb', '512345678900000040', 'ds', '026', '0', '1', '2018-10-18 09:30:36 048', '1800018794445');
INSERT INTO `ai_stayopen_invoice` VALUES ('450', '0f347f40-d277-11e8-9d71-3751b1ce26cb', '512345678900000040', 'ds', '026', '0', '1', '2018-10-18 09:42:24 163', '1800018794119');
INSERT INTO `ai_stayopen_invoice` VALUES ('451', '9fa82c20-d277-11e8-9fb6-3dff232958be', '512345678900000040', 'ds', '026', '0', '1', '2018-10-18 09:46:26 641', '1800018794471');
INSERT INTO `ai_stayopen_invoice` VALUES ('452', '67657f10-d27d-11e8-8bcc-bbea5ae35717', '512345678900000040', 'ds', '026', '0', '0', '2018-10-18 10:27:49 245', '1800018794206');
INSERT INTO `ai_stayopen_invoice` VALUES ('453', '0a33f690-d27e-11e8-8bcc-bbea5ae35717', '512345678900000040', 'ds', '026', '0', '0', '2018-10-18 10:32:22 132', '1800018794561');
INSERT INTO `ai_stayopen_invoice` VALUES ('454', '2768ec20-d27e-11e8-8bcc-bbea5ae35717', '512345678900000040', 'ds', '026', '0', '1', '2018-10-18 10:33:11 129', '1800018794213');
INSERT INTO `ai_stayopen_invoice` VALUES ('455', '9ee01d00-d27e-11e8-8bcc-bbea5ae35717', '512345678900000040', 'ds', '026', '0', '1', '2018-10-18 10:36:31 581', '1800018794218');
INSERT INTO `ai_stayopen_invoice` VALUES ('456', 'c2199990-d27e-11e8-8bcc-bbea5ae35717', '512345678900000040', 'ds', '026', '0', '1', '2018-10-18 10:37:30 652', '1800018794219');
INSERT INTO `ai_stayopen_invoice` VALUES ('457', '2cc76390-d288-11e8-8bcc-bbea5ae35717', '512345678900000040', 'ds', '026', '0', '0', '2018-10-18 11:44:55 308', '1800018795369');
INSERT INTO `ai_stayopen_invoice` VALUES ('458', '5cd04400-d28b-11e8-8f17-d350da2a2dd0', '512345678900000040', 'esc001', '026', '0', '0', '2018-10-18 12:07:43 852', '1800018794761');
INSERT INTO `ai_stayopen_invoice` VALUES ('459', '252ace30-d38a-11e8-85fa-676adfbcb7ae', '512345678900000040', '40all', '026', '0', '0', '2018-10-19 18:31:32 297', '1800018806899');
INSERT INTO `ai_stayopen_invoice` VALUES ('460', 'be277690-d599-11e8-a446-c726de462fda', '512345678900000040', 'ds', '026', '0', '0', '2018-10-22 09:28:14 364', '1800018814944');
INSERT INTO `ai_stayopen_invoice` VALUES ('461', 'cb7f24a0-d599-11e8-a446-c726de462fda', '512345678900000040', 'ds', '026', '0', '1', '2018-10-22 09:28:36 643', '1800018815373');
INSERT INTO `ai_stayopen_invoice` VALUES ('462', 'd36b5760-d599-11e8-a446-c726de462fda', '512345678900000040', 'ds', '026', '0', '1', '2018-10-22 09:28:49 942', '1800018814946');
INSERT INTO `ai_stayopen_invoice` VALUES ('463', 'd7a5a5b0-d599-11e8-a446-c726de462fda', '512345678900000040', 'ds', '026', '0', '1', '2018-10-22 09:28:57 039', '1800018814947');
INSERT INTO `ai_stayopen_invoice` VALUES ('464', 'f5297e90-d599-11e8-a446-c726de462fda', '512345678900000040', 'ds', '026', '0', '0', '2018-10-22 09:29:46 610', '1800018815374');
INSERT INTO `ai_stayopen_invoice` VALUES ('465', '71570b90-d59a-11e8-9b46-65a77abb4ba9', '512345678900000040', 'ds', '026', '0', '0', '2018-10-22 09:33:14 012', '1800018814955');
INSERT INTO `ai_stayopen_invoice` VALUES ('466', 'd2cadc30-d59a-11e8-a446-c726de462fda', '512345678900000040', 'ds', '026', '0', '0', '2018-10-22 09:35:58 446', '1800018815384');
INSERT INTO `ai_stayopen_invoice` VALUES ('467', '0a5267e0-d59b-11e8-9b46-65a77abb4ba9', '512345678900000040', 'ds', '026', '0', '0', '2018-10-22 09:37:30 656', '1800018815389');
INSERT INTO `ai_stayopen_invoice` VALUES ('468', '5c3451e0-d59b-11e8-9b46-65a77abb4ba9', '512345678900000040', 'ds', '026', '0', '1', '2018-10-22 09:39:48 007', '1800018814962');
INSERT INTO `ai_stayopen_invoice` VALUES ('469', 'aedc23f0-d59b-11e8-9b46-65a77abb4ba9', '512345678900000040', 'ds', '026', '0', '1', '2018-10-22 09:42:06 677', '1800018814964');
INSERT INTO `ai_stayopen_invoice` VALUES ('470', '4d0161e0-d5a0-11e8-b3db-157b98574f05', '91500000747150541A', '499000151040', '026', '1', '0', '2018-10-22 10:15:10 017', '1800018815005');
INSERT INTO `ai_stayopen_invoice` VALUES ('471', '0013f900-d5a1-11e8-b3db-157b98574f05', '91500000747150541A', '499000151040', '026', '1', '1', '2018-10-22 10:20:10 435', '1800018815013');
INSERT INTO `ai_stayopen_invoice` VALUES ('472', '0b90a580-d5a1-11e8-b3db-157b98574f05', '91500000747150541A', '499000151040', '007', '1', '0', '2018-10-22 10:20:29 746', '1800018815451');
INSERT INTO `ai_stayopen_invoice` VALUES ('473', '170318d0-d5a1-11e8-b3db-157b98574f05', '91500000747150541A', '499000151040', '004', '1', '0', '2018-10-22 10:20:48 952', '1800018815014');
INSERT INTO `ai_stayopen_invoice` VALUES ('474', 'd4e8eb20-d5a3-11e8-b3db-157b98574f05', '91500000747150541A', '499000151040', '026', '1', '0', '2018-10-22 10:40:26 558', '1800018815049');
INSERT INTO `ai_stayopen_invoice` VALUES ('475', 'f8118ce0-d5a5-11e8-b3db-157b98574f05', '91500000747150541A', '499000151040', '026', '1', '1', '2018-10-22 10:55:44 459', '1800018815078');
INSERT INTO `ai_stayopen_invoice` VALUES ('476', 'f696afe0-d5a9-11e8-b3db-157b98574f05', '91500000747150541A', '499000151031', '004', '1', '0', '2018-10-22 11:24:20 047', '1800018815546');
INSERT INTO `ai_stayopen_invoice` VALUES ('477', '9e1ad550-d5ac-11e8-b091-0d1023f8a171', '91500000747150541A', '499000151031', '026', '1', '0', '2018-10-22 11:43:20 056', '1800018815580');
INSERT INTO `ai_stayopen_invoice` VALUES ('478', 'ab71c010-d5ac-11e8-b091-0d1023f8a171', '91500000747150541A', '499000151031', '026', '1', '1', '2018-10-22 11:43:42 555', '1800018815153');
INSERT INTO `ai_stayopen_invoice` VALUES ('479', 'bd296ce0-d5ac-11e8-b091-0d1023f8a171', '91500000747150541A', '499000151031', '026', '1', '1', '2018-10-22 11:44:12 112', '1800018815154');
INSERT INTO `ai_stayopen_invoice` VALUES ('480', 'd473f320-d5ac-11e8-b091-0d1023f8a171', '91500000747150541A', '499000151031', '026', '1', '1', '2018-10-22 11:44:51 197', '1800018815155');
INSERT INTO `ai_stayopen_invoice` VALUES ('481', '44df0950-d5b3-11e8-a651-69d8faa246a4', '512345678900000040', '40all', '026', '0', '0', '2018-10-22 12:30:56 811', '1800018815203');
INSERT INTO `ai_stayopen_invoice` VALUES ('482', '4409f320-d5c0-11e8-90dc-914751eff059', '512345678900000040', '40all', '026', '0', '0', '2018-10-22 14:03:58 876', '1800018815307');
INSERT INTO `ai_stayopen_invoice` VALUES ('483', '73a91ca0-d5c0-11e8-90dc-914751eff059', '512345678900000040', '40all', '026', '0', '1', '2018-10-22 14:05:18 737', '1800018815760');
INSERT INTO `ai_stayopen_invoice` VALUES ('484', '6bf35bd0-d5c3-11e8-b091-0d1023f8a171', '512345678900000040', 'ds', '026', '0', '1', '2018-10-22 14:26:34 278', '1800018816343');
INSERT INTO `ai_stayopen_invoice` VALUES ('485', '9db1bbd0-d5c3-11e8-b091-0d1023f8a171', '512345678900000040', 'ds', '026', '0', '1', '2018-10-22 14:27:57 707', '1800018816348');
INSERT INTO `ai_stayopen_invoice` VALUES ('486', 'b3c03fa0-d5c3-11e8-b091-0d1023f8a171', '512345678900000040', 'ds', '026', '0', '1', '2018-10-22 14:28:34 705', '1800018816350');
INSERT INTO `ai_stayopen_invoice` VALUES ('487', 'bb9bd090-d5c3-11e8-b091-0d1023f8a171', '512345678900000040', 'ds', '026', '0', '0', '2018-10-22 14:28:47 949', '1800018816351');
INSERT INTO `ai_stayopen_invoice` VALUES ('488', '049eea70-d5c4-11e8-9738-29831e9c4f5f', '51234567890004BWGF', '499000151200', '007', '1', '0', '2018-10-22 14:30:50 454', '1800018815796');
INSERT INTO `ai_stayopen_invoice` VALUES ('489', '7fdbd5e0-d5c4-11e8-9738-29831e9c4f5f', '51234567890004BWGF', '499000151200', '026', '1', '0', '2018-10-22 14:34:17 220', '1800018816359');
INSERT INTO `ai_stayopen_invoice` VALUES ('490', '8a0af3c0-d5c4-11e8-9738-29831e9c4f5f', '51234567890004BWGF', '499000151200', '007', '1', '0', '2018-10-22 14:34:34 383', '1800018815807');
INSERT INTO `ai_stayopen_invoice` VALUES ('491', '77f15b60-d5c5-11e8-9738-29831e9c4f5f', '512345678900000040', '40all', '026', '0', '0', '2018-10-22 14:41:13 413', '1800018815823');
INSERT INTO `ai_stayopen_invoice` VALUES ('492', 'f7494d50-d5c5-11e8-9738-29831e9c4f5f', '51234567890004BWGF', '499000151200', '007', '1', '0', '2018-10-22 14:44:47 145', '1800018816382');
INSERT INTO `ai_stayopen_invoice` VALUES ('493', '67e67ec0-d5c6-11e8-9738-29831e9c4f5f', '51234567890004BWGF', '499000151200', '026', '1', '1', '2018-10-22 14:47:55 973', '1800018816389');
INSERT INTO `ai_stayopen_invoice` VALUES ('494', '39cacb80-d5c7-11e8-9738-29831e9c4f5f', '51234567890004BWGF', '499000151200', '026', '1', '1', '2018-10-22 14:53:48 117', '1800018816397');
INSERT INTO `ai_stayopen_invoice` VALUES ('495', '79519cc0-d5c7-11e8-9738-29831e9c4f5f', '51234567890004BWGF', '499000151200', '026', '1', '1', '2018-10-22 14:55:34 764', '1800018815856');
INSERT INTO `ai_stayopen_invoice` VALUES ('496', 'b8ee6700-d5c7-11e8-b091-0d1023f8a171', '51234567890004BWGF', '499000151200', '004', '1', '0', '2018-10-22 14:57:21 473', '1800018815861');
INSERT INTO `ai_stayopen_invoice` VALUES ('497', '17e5ed00-d5c8-11e8-b091-0d1023f8a171', '51234567890004BWGF', '499000151200', '004', '1', '0', '2018-10-22 15:00:00 775', '1800018816405');
INSERT INTO `ai_stayopen_invoice` VALUES ('498', '2369ec80-d5c8-11e8-aaf2-2fcc4a257ddb', '51234567890004BWGF', '499000151200', '026', '1', '1', '2018-10-22 15:00:20 053', '1800018815868');
INSERT INTO `ai_stayopen_invoice` VALUES ('499', '8e7f8f20-d5c8-11e8-aaf2-2fcc4a257ddb', '512345678900000040', '40all', '026', '0', '1', '2018-10-22 15:03:19 737', '1800018815876');
INSERT INTO `ai_stayopen_invoice` VALUES ('500', 'a244a2b0-d5c9-11e8-aaf2-2fcc4a257ddb', '512345678900000040', '40all', '026', '0', '0', '2018-10-22 15:11:02 442', '1800018816426');
INSERT INTO `ai_stayopen_invoice` VALUES ('501', '81521e00-d5cb-11e8-aaf2-2fcc4a257ddb', '512345678900000040', '40all', '026', '0', '1', '2018-10-22 15:24:26 144', '1800018815925');
INSERT INTO `ai_stayopen_invoice` VALUES ('502', 'c70bccb0-d5e0-11e8-aebe-efaf86d84b76', '90000000034BWGF', '499000151621', '026', '1', '1', '2018-10-22 17:56:43 301', '1800018816188');
INSERT INTO `ai_stayopen_invoice` VALUES ('503', '7d371580-d5e1-11e8-aebe-efaf86d84b76', '90000000034BWGF', '499000151621', '026', '1', '1', '2018-10-22 18:01:48 146', '1800018816196');
INSERT INTO `ai_stayopen_invoice` VALUES ('504', '5cd99a50-d5e2-11e8-aebe-efaf86d84b76', '90000000034BWGF', '499000151621', '026', '1', '1', '2018-10-22 18:08:03 477', '1800018816207');
INSERT INTO `ai_stayopen_invoice` VALUES ('505', '46f98410-d5e3-11e8-aebe-efaf86d84b76', '90000000034BWGF', '499000151621', '026', '1', '1', '2018-10-22 18:14:36 240', '1800018816223');
INSERT INTO `ai_stayopen_invoice` VALUES ('506', '738c9420-d5e5-11e8-b2bb-9195e787fa89', '90000000034BWGF', '499000151621', '026', '1', '1', '2018-10-22 18:30:09 969', '1800018816788');
INSERT INTO `ai_stayopen_invoice` VALUES ('507', '8c7eda20-d5e9-11e8-ac97-e32652e31bf2', '512345678900000040', '40all', '026', '0', '1', '2018-10-22 18:59:30 384', '1800018816299');
INSERT INTO `ai_stayopen_invoice` VALUES ('508', 'e29741e0-d5e9-11e8-baf8-a3b9e33fe2a2', '512345678900000040', 'ds', '026', '0', '0', '2018-10-22 19:01:54 583', '1800018816830');
INSERT INTO `ai_stayopen_invoice` VALUES ('509', '42463100-d5ea-11e8-baf8-a3b9e33fe2a2', '51234567890004BWGF', '499000151200', '026', '1', '1', '2018-10-22 19:04:34 672', '1800018816836');
INSERT INTO `ai_stayopen_invoice` VALUES ('510', '4b82ffa0-d5ea-11e8-baf8-a3b9e33fe2a2', '51234567890004BWGF', '499000151200', '026', '1', '1', '2018-10-22 19:04:50 165', '1800018816837');
INSERT INTO `ai_stayopen_invoice` VALUES ('511', '30745000-d5eb-11e8-baf8-a3b9e33fe2a2', '512345678900000040', 'ds', '026', '0', '1', '2018-10-22 19:11:14 276', '1800018816849');
INSERT INTO `ai_stayopen_invoice` VALUES ('512', '2643dd20-d5ec-11e8-baf8-a3b9e33fe2a2', '90000000004BWGF', '499000151752', '026', '1', '0', '2018-10-22 19:18:06 730', '1800018817325');
INSERT INTO `ai_stayopen_invoice` VALUES ('513', '38b11e50-d5ec-11e8-baf8-a3b9e33fe2a2', '90000000004BWGF', '499000151752', '007', '1', '0', '2018-10-22 19:18:37 640', '1800018816864');
INSERT INTO `ai_stayopen_invoice` VALUES ('514', '2f660260-d5ed-11e8-baf8-a3b9e33fe2a2', '90000000004BWGF', '499000151752', '026', '1', '1', '2018-10-22 19:25:31 480', '1800018816878');
INSERT INTO `ai_stayopen_invoice` VALUES ('515', '3d48d970-d5ed-11e8-baf8-a3b9e33fe2a2', '90000000004BWGF', '499000151752', '026', '1', '1', '2018-10-22 19:25:54 779', '1800018817336');
INSERT INTO `ai_stayopen_invoice` VALUES ('516', 'b7664b20-d5ed-11e8-baf8-a3b9e33fe2a2', '90000000004BWGF', '499000151752', '026', '1', '1', '2018-10-22 19:29:19 653', '1800018817343');
INSERT INTO `ai_stayopen_invoice` VALUES ('517', 'c71b4a20-d5ed-11e8-baf8-a3b9e33fe2a2', '90000000004BWGF', '499000151752', '026', '1', '1', '2018-10-22 19:29:46 004', '1800018817344');
INSERT INTO `ai_stayopen_invoice` VALUES ('518', 'd51049a0-d5ed-11e8-baf8-a3b9e33fe2a2', '90000000004BWGF', '499000151752', '004', '1', '0', '2018-10-22 19:30:09 500', '1800018816885');
INSERT INTO `ai_stayopen_invoice` VALUES ('519', '08fe5ae0-d5ee-11e8-baf8-a3b9e33fe2a2', '90000000004BWGF', '499000151752', '007', '1', '0', '2018-10-22 19:31:36 588', '1800018817350');
INSERT INTO `ai_stayopen_invoice` VALUES ('520', '32295630-d5ef-11e8-baf8-a3b9e33fe2a2', '512345678900000040', 'ds', '026', '0', '0', '2018-10-22 19:39:55 147', '1800018817365');
INSERT INTO `ai_stayopen_invoice` VALUES ('521', '5e430270-d5ef-11e8-baf8-a3b9e33fe2a2', '512345678900000040', 'ds', '026', '0', '1', '2018-10-22 19:41:09 115', '1800018816905');
INSERT INTO `ai_stayopen_invoice` VALUES ('522', '8258ae30-d5ef-11e8-baf8-a3b9e33fe2a2', '512345678900000040', 'ds', '026', '0', '1', '2018-10-22 19:42:09 633', '1800018816909');
INSERT INTO `ai_stayopen_invoice` VALUES ('523', '95d6ea30-d5ef-11e8-baf8-a3b9e33fe2a2', '512345678900000040', 'ds', '026', '0', '1', '2018-10-22 19:42:42 352', '1800018817373');
INSERT INTO `ai_stayopen_invoice` VALUES ('524', 'c56f35e0-d5ef-11e8-baf8-a3b9e33fe2a2', '512345678900000040', 'ds', '026', '0', '0', '2018-10-22 19:44:02 228', '1800018817378');
INSERT INTO `ai_stayopen_invoice` VALUES ('525', 'd1563cf0-d5ef-11e8-baf8-a3b9e33fe2a2', '512345678900000040', 'ds', '026', '0', '0', '2018-10-22 19:44:22 208', '1800018817380');
INSERT INTO `ai_stayopen_invoice` VALUES ('526', '7bdd5410-d5f0-11e8-baf8-a3b9e33fe2a2', '90000000004BWGF', '499000151752', '007', '1', '0', '2018-10-22 19:49:08 329', '1800018816922');
INSERT INTO `ai_stayopen_invoice` VALUES ('527', 'f20b94c0-d5f1-11e8-baf8-a3b9e33fe2a2', '90000000004BWGF', '499000151752', '004', '1', '0', '2018-10-22 19:59:36 085', '1800018816933');
INSERT INTO `ai_stayopen_invoice` VALUES ('528', 'f58bbad0-d5f1-11e8-baf8-a3b9e33fe2a2', '90000000004BWGF', '499000151752', '004', '1', '0', '2018-10-22 19:59:41 964', '1800018817410');
INSERT INTO `ai_stayopen_invoice` VALUES ('529', '9334e7c0-d5f2-11e8-baf8-a3b9e33fe2a2', '90000000004BWGF', '499000151752', '026', '1', '1', '2018-10-22 20:04:06 417', '1800018816941');
INSERT INTO `ai_stayopen_invoice` VALUES ('530', 'c7044d70-d5f2-11e8-baf8-a3b9e33fe2a2', '90000000004BWGF', '499000151752', '007', '1', '0', '2018-10-22 20:05:33 376', '1800018817422');
INSERT INTO `ai_stayopen_invoice` VALUES ('531', '7e5ccba0-d5f3-11e8-a3e3-efe43c98d054', '512345678900000040', 'ds', '026', '0', '0', '2018-10-22 20:10:41 129', '1800018816953');
INSERT INTO `ai_stayopen_invoice` VALUES ('532', 'f99411c0-d5f3-11e8-a2b4-8980940977f8', '90000000004BWGF', '499000151752', '026', '1', '1', '2018-10-22 20:14:07 663', '1800018816969');
INSERT INTO `ai_stayopen_invoice` VALUES ('533', '1cdf68a0-d5f4-11e8-a3e3-efe43c98d054', '512345678900000040', 'ds', '026', '0', '1', '2018-10-22 20:15:07 001', '1800018816972');
INSERT INTO `ai_stayopen_invoice` VALUES ('534', '528fea60-d5f4-11e8-a2b4-8980940977f8', '90000000004BWGF', '499000151752', '007', '1', '0', '2018-10-22 20:16:37 018', '1800018816974');
INSERT INTO `ai_stayopen_invoice` VALUES ('535', '778b3b30-d5f4-11e8-a2b4-8980940977f8', '90000000004BWGF', '499000151752', '004', '1', '0', '2018-10-22 20:17:39 044', '1800018817443');
INSERT INTO `ai_stayopen_invoice` VALUES ('536', 'c52a9980-d5f4-11e8-a2b4-8980940977f8', '90000000004BWGF', '499000151752', '026', '1', '1', '2018-10-22 20:19:49 248', '1800018817449');
INSERT INTO `ai_stayopen_invoice` VALUES ('537', 'ea759b80-d5f5-11e8-b6f1-f7340e6b84dd', '512345678900000040', '40all', '026', '0', '1', '2018-10-22 20:28:01 604', '1800018817463');
INSERT INTO `ai_stayopen_invoice` VALUES ('538', '9c372cb0-d666-11e8-b9f4-6f4c8a7fd1a8', '512345678900000040', '40all', '026', '0', '1', '2018-10-23 09:54:43 256', '1800018818892');
INSERT INTO `ai_stayopen_invoice` VALUES ('539', '073823f0-d669-11e8-9dc5-e37554b41f46', '512345678900000040', 'ds', '026', '0', '0', '2018-10-23 10:12:01 916', '1800018818928');
INSERT INTO `ai_stayopen_invoice` VALUES ('540', '2451a240-d669-11e8-9dc5-e37554b41f46', '512345678900000040', 'ds', '026', '0', '1', '2018-10-23 10:12:50 608', '1800018819374');
INSERT INTO `ai_stayopen_invoice` VALUES ('541', '1a97e600-d66a-11e8-b99a-3b82fc6856c4', '512345678900000040', 'ds', '026', '0', '0', '2018-10-23 10:19:43 534', '1800018819392');
INSERT INTO `ai_stayopen_invoice` VALUES ('542', '5fdf0950-d66a-11e8-9dc5-e37554b41f46', '512345678900000040', 'ds', '026', '0', '0', '2018-10-23 10:21:40 002', '1800018818946');
INSERT INTO `ai_stayopen_invoice` VALUES ('543', 'ed4d8c80-d66a-11e8-88fa-25a712149eca', '90000000034BWGF', '499000151621', '026', '1', '1', '2018-10-23 10:25:37 276', '1800018818952');
INSERT INTO `ai_stayopen_invoice` VALUES ('544', '0f316420-d66b-11e8-9dc5-e37554b41f46', '512345678900000040', 'ds', '026', '0', '1', '2018-10-23 10:26:34 163', '1800018818955');
INSERT INTO `ai_stayopen_invoice` VALUES ('545', '63d1aad0-d66b-11e8-9dc5-e37554b41f46', '512345678900000040', 'ds', '026', '0', '1', '2018-10-23 10:28:56 133', '1800018818960');
INSERT INTO `ai_stayopen_invoice` VALUES ('546', '7e787b70-d66b-11e8-b99a-3b82fc6856c4', '512345678900000040', 'ds', '026', '0', '0', '2018-10-23 10:29:40 600', '1800018819416');
INSERT INTO `ai_stayopen_invoice` VALUES ('547', '21236560-d66c-11e8-aa18-e744555e5e21', '512345678900000040', '40all', '026', '0', '1', '2018-10-23 10:34:13 803', '1800018818967');
INSERT INTO `ai_stayopen_invoice` VALUES ('548', '2d17d9f0-d66c-11e8-b99a-3b82fc6856c4', '512345678900000040', 'ds', '026', '0', '0', '2018-10-23 10:34:33 569', '1800018819426');
INSERT INTO `ai_stayopen_invoice` VALUES ('549', 'eee18810-d66c-11e8-b99a-3b82fc6856c4', '512345678900000040', 'ds', '026', '0', '1', '2018-10-23 10:39:58 637', '1800018818980');
INSERT INTO `ai_stayopen_invoice` VALUES ('550', '41779f80-d670-11e8-81a8-2f355e15d5a8', '90000000004BWGF', '499000151752', '026', '1', '1', '2018-10-23 11:03:46 022', '1800018819020');
INSERT INTO `ai_stayopen_invoice` VALUES ('551', 'a12e2560-d694-11e8-a42b-691e08ece6df', '512345678900000040', 'ds', '026', '0', '0', '2018-10-23 15:24:08 845', '1800018820003');
INSERT INTO `ai_stayopen_invoice` VALUES ('552', 'ee63c560-d694-11e8-a42b-691e08ece6df', '512345678900000040', 'ds', '026', '0', '1', '2018-10-23 15:26:18 333', '1800018820568');
INSERT INTO `ai_stayopen_invoice` VALUES ('553', '3cc191b0-d695-11e8-a42b-691e08ece6df', '512345678900000040', 'ds', '026', '0', '0', '2018-10-23 15:28:29 844', '1800018820573');
INSERT INTO `ai_stayopen_invoice` VALUES ('554', '5581a0f0-d695-11e8-a42b-691e08ece6df', '512345678900000040', 'ds', '026', '0', '1', '2018-10-23 15:29:13 182', '1800018820581');
INSERT INTO `ai_stayopen_invoice` VALUES ('555', '95b18370-d695-11e8-a42b-691e08ece6df', '512345678900000040', 'ds', '026', '0', '0', '2018-10-23 15:30:59 024', '1800018820047');
INSERT INTO `ai_stayopen_invoice` VALUES ('556', 'a1567870-d695-11e8-a42b-691e08ece6df', '512345678900000040', 'ds', '026', '0', '0', '2018-10-23 15:31:18 557', '1800018820603');
INSERT INTO `ai_stayopen_invoice` VALUES ('557', '14760f00-d696-11e8-a42b-691e08ece6df', '512345678900000040', 'ds', '026', '0', '0', '2018-10-23 15:34:31 695', '1800018820121');
INSERT INTO `ai_stayopen_invoice` VALUES ('558', '532719b0-d696-11e8-8adc-fde6fe02a5d9', '512345678900000040', 'ds', '026', '0', '1', '2018-10-23 15:36:16 867', '1800018820690');
INSERT INTO `ai_stayopen_invoice` VALUES ('559', '8f04e020-d696-11e8-8adc-fde6fe02a5d9', '512345678900000040', 'ds', '026', '0', '1', '2018-10-23 15:38:17 950', '1800018820181');
INSERT INTO `ai_stayopen_invoice` VALUES ('560', '50e39ce0-d697-11e8-bc6b-71884da37276', '512345678900000040', 'ds', '026', '0', '1', '2018-10-23 15:43:22 584', '1800018820779');
INSERT INTO `ai_stayopen_invoice` VALUES ('561', '6e10f150-d697-11e8-bc6b-71884da37276', '512345678900000040', 'ds', '026', '0', '1', '2018-10-23 15:44:11 527', '1800018820784');
INSERT INTO `ai_stayopen_invoice` VALUES ('562', 'b102e490-d698-11e8-b73b-518449d99d33', '512345678900000040', 'ds', '026', '0', '1', '2018-10-23 15:53:13 784', '1800018820252');
INSERT INTO `ai_stayopen_invoice` VALUES ('563', '10e22e50-d6a0-11e8-a53d-afc67f8321d2', '512345678900000040', 'ds', '026', '0', '1', '2018-10-23 16:45:59 936', '1800018821213');
INSERT INTO `ai_stayopen_invoice` VALUES ('564', 'b784b840-d6a0-11e8-9158-1f9f8ef7ed57', '512345678900000040', 'ds', '026', '0', '1', '2018-10-23 16:50:39 511', '1800018821218');
INSERT INTO `ai_stayopen_invoice` VALUES ('565', 'c921d830-d6a0-11e8-9158-1f9f8ef7ed57', '512345678900000040', 'ds', '026', '0', '1', '2018-10-23 16:51:09 050', '1800018821220');
INSERT INTO `ai_stayopen_invoice` VALUES ('566', 'ee9e3fe0-d6a0-11e8-9158-1f9f8ef7ed57', '512345678900000040', 'ds', '026', '0', '0', '2018-10-23 16:52:11 987', '1800018821659');
INSERT INTO `ai_stayopen_invoice` VALUES ('567', '77bf8900-d6a1-11e8-9d04-8f619b101821', '512345678900000040', 'ds', '026', '0', '1', '2018-10-23 16:56:02 530', '1800018821232');
INSERT INTO `ai_stayopen_invoice` VALUES ('568', '8eba8fb0-d6a1-11e8-9d04-8f619b101821', '512345678900000040', 'ds', '026', '0', '1', '2018-10-23 16:56:41 077', '1800018821674');
INSERT INTO `ai_stayopen_invoice` VALUES ('569', 'f333ff30-d6a1-11e8-9158-1f9f8ef7ed57', '512345678900000040', 'ds', '026', '0', '0', '2018-10-23 16:59:29 174', '1800018821244');
INSERT INTO `ai_stayopen_invoice` VALUES ('570', '2717b030-d6a2-11e8-9158-1f9f8ef7ed57', '512345678900000040', 'ds', '026', '0', '0', '2018-10-23 17:00:56 245', '1800018821247');
INSERT INTO `ai_stayopen_invoice` VALUES ('571', '4a0556b0-d6a2-11e8-9158-1f9f8ef7ed57', '512345678900000040', 'ds', '026', '0', '0', '2018-10-23 17:01:54 816', '1800018821251');
INSERT INTO `ai_stayopen_invoice` VALUES ('572', '589cd7c0-d6a2-11e8-9158-1f9f8ef7ed57', '512345678900000040', 'ds', '026', '0', '0', '2018-10-23 17:02:19 332', '1800018821253');
INSERT INTO `ai_stayopen_invoice` VALUES ('573', 'ea639180-d6a2-11e8-bc3e-4db5da0c6c53', '512345678900000040', '40all', '026', '0', '0', '2018-10-23 17:06:24 205', '1800018821703');
INSERT INTO `ai_stayopen_invoice` VALUES ('574', '5e333e30-d6a3-11e8-bc3e-4db5da0c6c53', '512345678900000040', '40all', '026', '0', '0', '2018-10-23 17:09:38 503', '1800018821718');
INSERT INTO `ai_stayopen_invoice` VALUES ('575', '6cd98c50-d6a3-11e8-9158-1f9f8ef7ed57', '512345678900000040', 'ds', '026', '0', '0', '2018-10-23 17:10:02 774', '1800018821280');
INSERT INTO `ai_stayopen_invoice` VALUES ('576', 'a1a3a5b0-d6a3-11e8-9158-1f9f8ef7ed57', '512345678900000040', 'ds', '026', '0', '0', '2018-10-23 17:11:31 336', '1800018821286');
INSERT INTO `ai_stayopen_invoice` VALUES ('577', 'd4b057a0-d6a3-11e8-9158-1f9f8ef7ed57', '512345678900000040', 'ds', '026', '0', '0', '2018-10-23 17:12:56 964', '1800018821727');
INSERT INTO `ai_stayopen_invoice` VALUES ('578', 'fb1cebb0-d6a3-11e8-9158-1f9f8ef7ed57', '512345678900000040', 'ds', '026', '0', '0', '2018-10-23 17:14:01 438', '1800018821735');
INSERT INTO `ai_stayopen_invoice` VALUES ('579', 'd177d700-d6a5-11e8-b2ee-a5dcb947a80e', '90000000004BWGF', '499000151752', '026', '1', '1', '2018-10-23 17:27:10 529', '1800018821783');
INSERT INTO `ai_stayopen_invoice` VALUES ('580', '9d7fbe30-d6a6-11e8-b2ee-a5dcb947a80e', '90000000004BWGF', '499000151752', '007', '1', '0', '2018-10-23 17:32:52 876', '1800018822372');
INSERT INTO `ai_stayopen_invoice` VALUES ('581', '1918fa70-d6a7-11e8-b2ee-a5dcb947a80e', '90000000004BWGF', '499000151752', '004', '1', '0', '2018-10-23 17:36:20 218', '1800018821816');
INSERT INTO `ai_stayopen_invoice` VALUES ('582', 'fac99ec0-d6a7-11e8-b2ee-a5dcb947a80e', '90000000004BWGF', '499000151752', '026', '1', '0', '2018-10-23 17:42:38 876', '1800018822407');
INSERT INTO `ai_stayopen_invoice` VALUES ('583', '24d5c060-d6ab-11e8-b9e9-4d31ed7aed44', '512345678900000040', '40all', '026', '0', '0', '2018-10-23 18:05:18 269', '1800018822467');
INSERT INTO `ai_stayopen_invoice` VALUES ('584', '1af2e660-d6ae-11e8-b7f8-c3298eba52aa', '512345678900000040', '40all', '026', '0', '0', '2018-10-23 18:26:30 132', '1800018822541');
INSERT INTO `ai_stayopen_invoice` VALUES ('585', 'da202bd0-d6bb-11e8-9b1c-abf7b638abd8', '512345678900000040', '40all', '026', '0', '0', '2018-10-23 20:04:54 334', '1800018823319');
INSERT INTO `ai_stayopen_invoice` VALUES ('586', '0c31f110-d6be-11e8-aeee-8366a34e45e6', '512345678900000040', 'dkpd', '026', '0', '0', '2018-10-23 20:20:37 031', '1800018823401');
INSERT INTO `ai_stayopen_invoice` VALUES ('587', '2df19ee0-d6be-11e8-a96e-432e7d1dfa66', '512345678900000040', 'ds', '026', '0', '0', '2018-10-23 20:21:34 051', '1800018823415');
INSERT INTO `ai_stayopen_invoice` VALUES ('588', '4dca1620-d6be-11e8-a96e-432e7d1dfa66', '512345678900000040', 'ds', '026', '0', '0', '2018-10-23 20:22:30 489', '1800018823058');
INSERT INTO `ai_stayopen_invoice` VALUES ('589', '675bcd40-d6be-11e8-a96e-432e7d1dfa66', '512345678900000040', 'ds', '026', '0', '0', '2018-10-23 20:23:10 371', '1800018823427');
INSERT INTO `ai_stayopen_invoice` VALUES ('590', '19092f10-d6bf-11e8-beb9-1928f540ffe1', '512345678900000040', 'esc001', '026', '0', '0', '2018-10-23 20:28:10 316', '1800018823460');
INSERT INTO `ai_stayopen_invoice` VALUES ('591', '7a308d60-d6bf-11e8-beb9-1928f540ffe1', '512345678900000040', 'esc001', '026', '0', '0', '2018-10-23 20:30:51 364', '1800018823486');
INSERT INTO `ai_stayopen_invoice` VALUES ('592', '85d2c340-d6bf-11e8-beb9-1928f540ffe1', '512345678900000040', 'esc001', '026', '0', '0', '2018-10-23 20:31:10 886', '1800018823126');
INSERT INTO `ai_stayopen_invoice` VALUES ('593', '08032990-d6c0-11e8-9ac7-19bd4be067e5', '512345678900000040', 'ds', '026', '0', '0', '2018-10-23 20:34:49 475', '1800018823153');
INSERT INTO `ai_stayopen_invoice` VALUES ('594', '34922ce0-d6c0-11e8-9ac7-19bd4be067e5', '512345678900000040', 'ds', '026', '0', '0', '2018-10-23 20:36:04 175', '1800018823523');
INSERT INTO `ai_stayopen_invoice` VALUES ('595', '53252bd0-d6c0-11e8-9ac7-19bd4be067e5', '512345678900000040', 'ds', '026', '0', '1', '2018-10-23 20:36:55 413', '1800018823536');
INSERT INTO `ai_stayopen_invoice` VALUES ('596', '7a3b6d60-d6c0-11e8-a625-95602b8442a4', '512345678900000040', 'dkpd', '026', '0', '0', '2018-10-23 20:38:02 038', '1800018823185');
INSERT INTO `ai_stayopen_invoice` VALUES ('597', 'd2d0bc00-d6c0-11e8-9ac7-19bd4be067e5', '512345678900000040', 'ds', '026', '0', '1', '2018-10-23 20:40:29 626', '1800018823199');
INSERT INTO `ai_stayopen_invoice` VALUES ('598', '62401840-d6c1-11e8-9ac7-19bd4be067e5', '512345678900000040', 'ds', '026', '0', '1', '2018-10-23 20:44:32 633', '1800018823224');
INSERT INTO `ai_stayopen_invoice` VALUES ('599', '95a94210-d6c1-11e8-9ac7-19bd4be067e5', '512345678900000040', 'ds', '026', '0', '1', '2018-10-23 20:45:56 548', '1800018823589');
INSERT INTO `ai_stayopen_invoice` VALUES ('600', 'c3746ee0-d6c1-11e8-9ac7-19bd4be067e5', '512345678900000040', 'ds', '026', '0', '0', '2018-10-23 20:47:13 407', '1800018823605');
INSERT INTO `ai_stayopen_invoice` VALUES ('601', '65273d30-d6c2-11e8-9ac7-19bd4be067e5', '512345678900000040', 'ds', '026', '0', '1', '2018-10-23 20:51:44 709', '1800018823631');
INSERT INTO `ai_stayopen_invoice` VALUES ('602', 'b46cd4a0-d6c6-11e8-b4c7-8fe7144e2d36', '512345678900000040', 'dkpd', '026', '0', '0', '2018-10-23 21:22:38 761', '1800018823742');
INSERT INTO `ai_stayopen_invoice` VALUES ('603', 'ae815e70-d6c7-11e8-b42b-cb4a2ad28bff', '512345678900000040', 'ds', '026', '0', '1', '2018-10-23 21:29:34 941', '1800018824404');
INSERT INTO `ai_stayopen_invoice` VALUES ('604', '4529f120-d6c8-11e8-bad5-2ba1756052ea', '90000000004BWGF', '499000151752', '026', '1', '0', '2018-10-23 21:33:47 708', '1800018824429');
INSERT INTO `ai_stayopen_invoice` VALUES ('605', 'c83e00b0-d6c8-11e8-bad5-2ba1756052ea', '90000000004BWGF', '499000151752', '026', '1', '1', '2018-10-23 21:37:27 621', '1800018824459');
INSERT INTO `ai_stayopen_invoice` VALUES ('606', '09b8d9c0-d6c9-11e8-bad5-2ba1756052ea', '90000000004BWGF', '499000151752', '007', '1', '0', '2018-10-23 21:39:19 524', '1800018823837');
INSERT INTO `ai_stayopen_invoice` VALUES ('607', '688d4760-d6c9-11e8-bad5-2ba1756052ea', '90000000004BWGF', '499000151752', '026', '1', '1', '2018-10-23 21:41:56 540', '1800018824483');
INSERT INTO `ai_stayopen_invoice` VALUES ('608', '89b8f290-d6c9-11e8-bad5-2ba1756052ea', '90000000004BWGF', '499000151752', '026', '1', '1', '2018-10-23 21:42:52 250', '1800018823860');
INSERT INTO `ai_stayopen_invoice` VALUES ('609', 'dffab440-d6c9-11e8-9762-671b3daabbf4', '512345678900000040', 'ds', '026', '0', '0', '2018-10-23 21:45:16 827', '1800018823871');
INSERT INTO `ai_stayopen_invoice` VALUES ('610', 'e9d82fb0-d6c9-11e8-9762-671b3daabbf4', '512345678900000040', 'ds', '026', '0', '1', '2018-10-23 21:45:33 281', '1800018824507');
INSERT INTO `ai_stayopen_invoice` VALUES ('611', '0b35e760-d6ca-11e8-9762-671b3daabbf4', '512345678900000040', 'ds', '026', '0', '0', '2018-10-23 21:46:29 286', '1800018824518');
INSERT INTO `ai_stayopen_invoice` VALUES ('612', '57481600-d6ca-11e8-bad5-2ba1756052ea', '512345678900000040', 'ds', '026', '0', '0', '2018-10-23 21:48:38 448', '1800018823889');
INSERT INTO `ai_stayopen_invoice` VALUES ('613', 'cec07f60-d6ca-11e8-9762-671b3daabbf4', '512345678900000040', 'ds', '026', '0', '0', '2018-10-23 21:51:57 353', '1800018824540');
INSERT INTO `ai_stayopen_invoice` VALUES ('614', 'dc3922f0-d6ca-11e8-9762-671b3daabbf4', '512345678900000040', 'ds', '026', '0', '1', '2018-10-23 21:52:19 917', '1800018824543');
INSERT INTO `ai_stayopen_invoice` VALUES ('615', '2fa8b1d0-d6cb-11e8-bad5-2ba1756052ea', '512345678900000040', 'ds', '026', '0', '1', '2018-10-23 21:54:40 079', '1800018824554');
INSERT INTO `ai_stayopen_invoice` VALUES ('616', '90bcfd50-d6cb-11e8-9762-671b3daabbf4', '90000000004BWGF', '499000151752', '026', '1', '0', '2018-10-23 21:57:22 823', '1800018823917');
INSERT INTO `ai_stayopen_invoice` VALUES ('617', 'a72cdb00-d6cb-11e8-9762-671b3daabbf4', '90000000004BWGF', '499000151752', '026', '1', '1', '2018-10-23 21:58:04 204', '1800018824562');
INSERT INTO `ai_stayopen_invoice` VALUES ('618', 'd8faf270-d6cb-11e8-9762-671b3daabbf4', '90000000004BWGF', '499000151752', '026', '1', '1', '2018-10-23 21:59:23 965', '1800018824566');
INSERT INTO `ai_stayopen_invoice` VALUES ('619', '120cc7a0-d6cc-11e8-9762-671b3daabbf4', '90000000004BWGF', '499000151752', '026', '1', '0', '2018-10-23 22:01:03 308', '1800018823928');
INSERT INTO `ai_stayopen_invoice` VALUES ('620', '34d3d350-d6cc-11e8-bad5-2ba1756052ea', '512345678900000040', 'ds', '026', '0', '1', '2018-10-23 22:01:58 316', '1800018823932');
INSERT INTO `ai_stayopen_invoice` VALUES ('621', '6fbe1200-d6cc-11e8-9aad-8b62c6b83ecc', '512345678900000040', 'ds', '026', '0', '1', '2018-10-23 22:03:37 102', '1800018824579');
INSERT INTO `ai_stayopen_invoice` VALUES ('622', 'b36ba990-d6cc-11e8-9762-671b3daabbf4', '90000000004BWGF', '499000151752', '004', '1', '0', '2018-10-23 22:05:30 500', '1800018824584');
INSERT INTO `ai_stayopen_invoice` VALUES ('623', 'f8b67660-d6cc-11e8-a311-3df1e7b97cc5', '512345678900000040', 'ds', '026', '0', '1', '2018-10-23 22:07:26 704', '1800018824591');
INSERT INTO `ai_stayopen_invoice` VALUES ('624', 'a7bc5ee0-d6cd-11e8-a311-3df1e7b97cc5', '512345678900000040', 'ds', '026', '0', '1', '2018-10-23 22:12:20 379', '1800018823967');
INSERT INTO `ai_stayopen_invoice` VALUES ('625', 'de64d530-d6cd-11e8-a311-3df1e7b97cc5', '512345678900000040', 'ds', '026', '0', '1', '2018-10-23 22:13:52 044', '1800018824620');
INSERT INTO `ai_stayopen_invoice` VALUES ('626', '5ceb6600-d6d1-11e8-9aad-8b62c6b83ecc', '512345678900000040', 'ds', '026', '0', '1', '2018-10-23 22:38:53 059', '1800018824741');
INSERT INTO `ai_stayopen_invoice` VALUES ('627', '91871c60-d6d1-11e8-8f5f-3b156f1388da', '512345678900000040', 'ds', '026', '0', '1', '2018-10-23 22:40:21 324', '1800018824751');
INSERT INTO `ai_stayopen_invoice` VALUES ('628', 'f5af3790-d6d1-11e8-848d-955652038a3c', '512345678900000040', 'ds', '026', '0', '1', '2018-10-23 22:43:09 417', '1800018824780');
INSERT INTO `ai_stayopen_invoice` VALUES ('629', '14155a20-d6d2-11e8-848d-955652038a3c', '512345678900000040', 'ds', '026', '0', '1', '2018-10-23 22:44:00 347', '1800018824170');
INSERT INTO `ai_stayopen_invoice` VALUES ('630', '215c3f50-d6d2-11e8-848d-955652038a3c', '512345678900000040', 'ds', '026', '0', '1', '2018-10-23 22:44:22 672', '1800018824790');
INSERT INTO `ai_stayopen_invoice` VALUES ('631', '7ee0fb70-d6d2-11e8-b627-f7ffbab8a3d2', '512345678900000040', 'ds', '026', '0', '1', '2018-10-23 22:46:59 679', '1800018824810');
INSERT INTO `ai_stayopen_invoice` VALUES ('632', '0ca12110-d6d3-11e8-a6c9-3be21f9ed869', '512345678900000040', 'ds', '026', '0', '1', '2018-10-23 22:50:57 506', '1800018824193');
INSERT INTO `ai_stayopen_invoice` VALUES ('633', '262da810-d6d3-11e8-848d-955652038a3c', '512345678900000040', 'ds', '026', '0', '1', '2018-10-23 22:51:40 202', '1800018824824');
INSERT INTO `ai_stayopen_invoice` VALUES ('634', '4a32d910-d6d3-11e8-9caf-ebc58c33d8f5', '512345678900000040', 'esc001', '026', '0', '1', '2018-10-23 22:52:40 991', '1800018824828');
INSERT INTO `ai_stayopen_invoice` VALUES ('635', 'ee84e350-d6d3-11e8-b500-8701b3453246', '512345678900000040', 'ds', '026', '0', '1', '2018-10-23 22:57:16 463', '1800018824213');
INSERT INTO `ai_stayopen_invoice` VALUES ('636', '1002e250-d6d6-11e8-848d-955652038a3c', '512345678900000040', 'ds', '026', '0', '1', '2018-10-23 23:12:31 796', '1800018824244');
INSERT INTO `ai_stayopen_invoice` VALUES ('637', '3e8243f0-d6d6-11e8-b500-8701b3453246', '512345678900000040', 'ds', '026', '0', '1', '2018-10-23 23:13:49 646', '1800018824246');
INSERT INTO `ai_stayopen_invoice` VALUES ('638', '0db55360-d6d7-11e8-b017-43f31610e73f', '512345678900000040', 'ds', '026', '0', '1', '2018-10-23 23:19:37 962', '1800018824259');
INSERT INTO `ai_stayopen_invoice` VALUES ('639', '104f8640-d6d7-11e8-b017-43f31610e73f', '512345678900000040', 'ds', '026', '0', '1', '2018-10-23 23:19:42 230', '1800018824260');
INSERT INTO `ai_stayopen_invoice` VALUES ('640', '12dff520-d6d7-11e8-b017-43f31610e73f', '512345678900000040', 'ds', '026', '0', '1', '2018-10-23 23:19:46 584', '1800018824901');
INSERT INTO `ai_stayopen_invoice` VALUES ('641', '15be0ed0-d6d7-11e8-b017-43f31610e73f', '512345678900000040', 'ds', '026', '0', '1', '2018-10-23 23:19:51 418', '1800018824261');
INSERT INTO `ai_stayopen_invoice` VALUES ('642', '18ac5520-d6d7-11e8-b017-43f31610e73f', '512345678900000040', 'ds', '026', '0', '1', '2018-10-23 23:19:56 301', '1800018824262');
INSERT INTO `ai_stayopen_invoice` VALUES ('643', '1c078e10-d6d7-11e8-b017-43f31610e73f', '512345678900000040', 'ds', '026', '0', '1', '2018-10-23 23:20:01 877', '1800018824903');
INSERT INTO `ai_stayopen_invoice` VALUES ('644', '1ead59b0-d6d7-11e8-b017-43f31610e73f', '512345678900000040', 'ds', '026', '0', '1', '2018-10-23 23:20:06 339', '1800018824904');
INSERT INTO `ai_stayopen_invoice` VALUES ('645', '223520e0-d6d7-11e8-b017-43f31610e73f', '512345678900000040', 'ds', '026', '0', '1', '2018-10-23 23:20:12 240', '1800018824264');
INSERT INTO `ai_stayopen_invoice` VALUES ('646', '2910a6f0-d6d7-11e8-baea-c1bba42b4833', '512345678900000040', 'wn001', '026', '0', '1', '2018-10-23 23:20:23 156', '1800018824265');
INSERT INTO `ai_stayopen_invoice` VALUES ('647', '5fbc5190-d6d7-11e8-b017-43f31610e73f', '512345678900000040', 'ds', '026', '0', '1', '2018-10-23 23:21:55 500', '1800018824909');
INSERT INTO `ai_stayopen_invoice` VALUES ('648', '70f7c980-d6d7-11e8-baea-c1bba42b4833', '512345678900000040', 'wn001', '026', '0', '1', '2018-10-23 23:22:23 764', '1800018824911');
INSERT INTO `ai_stayopen_invoice` VALUES ('649', 'd0f54b30-d742-11e8-b685-357102801346', '512345678900000040', 'esc001', '026', '0', '1', '2018-10-24 12:11:00 988', '1800018828262');
INSERT INTO `ai_stayopen_invoice` VALUES ('650', 'aed77e30-d74a-11e8-90f7-639658cc79bc', '512345678900000040', 'ds', '026', '0', '0', '2018-10-24 13:07:20 343', '1800018829100');
INSERT INTO `ai_stayopen_invoice` VALUES ('651', '3b148970-d74f-11e8-90f7-639658cc79bc', '512345678900000040', 'ds', '026', '0', '0', '2018-10-24 13:39:55 485', '1800018829763');
INSERT INTO `ai_stayopen_invoice` VALUES ('652', '20180240-d750-11e8-90f7-639658cc79bc', '512345678900000040', 'ds', '026', '0', '0', '2018-10-24 13:46:17 420', '1800018829916');
INSERT INTO `ai_stayopen_invoice` VALUES ('653', '3861d010-d750-11e8-90f7-639658cc79bc', '512345678900000040', 'ds', '026', '0', '0', '2018-10-24 13:46:58 179', '1800018830668');
INSERT INTO `ai_stayopen_invoice` VALUES ('654', '861b6d20-d750-11e8-90f7-639658cc79bc', '512345678900000040', 'ds', '026', '0', '0', '2018-10-24 13:49:10 012', '1800018829973');
INSERT INTO `ai_stayopen_invoice` VALUES ('655', 'c9505240-d750-11e8-90f7-639658cc79bc', '512345678900000040', 'ds', '026', '0', '0', '2018-10-24 13:51:01 316', '1800018830014');
INSERT INTO `ai_stayopen_invoice` VALUES ('656', 'cb9a7e70-d752-11e8-90f7-639658cc79bc', '90000000004BWGF', '499000151752', '026', '1', '0', '2018-10-24 14:05:24 165', '1800018831020');
INSERT INTO `ai_stayopen_invoice` VALUES ('657', 'cf5a4590-d752-11e8-90f7-639658cc79bc', '90000000004BWGF', '499000151752', '026', '1', '0', '2018-10-24 14:05:30 454', '1800018830275');
INSERT INTO `ai_stayopen_invoice` VALUES ('658', 'f14b6e30-d753-11e8-afcb-5b27421e4348', '512345678900000040', 'esc001', '026', '0', '0', '2018-10-24 14:13:36 731', '1800018833280');
INSERT INTO `ai_stayopen_invoice` VALUES ('659', 'f2290780-d754-11e8-8f5e-5167f4d33666', '512345678900000040', 'ds', '026', '0', '1', '2018-10-24 14:20:48 107', '1800018835704');
INSERT INTO `ai_stayopen_invoice` VALUES ('660', '12fca7a0-d755-11e8-8f5e-5167f4d33666', '512345678900000040', 'ds', '026', '0', '0', '2018-10-24 14:21:43 060', '1800018835708');
INSERT INTO `ai_stayopen_invoice` VALUES ('661', '2c1b9fc0-d755-11e8-8f5e-5167f4d33666', '512345678900000040', 'ds', '026', '0', '1', '2018-10-24 14:22:25 021', '1800018836644');
INSERT INTO `ai_stayopen_invoice` VALUES ('662', '42b74860-d755-11e8-8f5e-5167f4d33666', '512345678900000040', 'ds', '026', '0', '1', '2018-10-24 14:23:02 936', '1800018835713');
INSERT INTO `ai_stayopen_invoice` VALUES ('663', '62873420-d755-11e8-8f5e-5167f4d33666', '512345678900000040', 'ds', '026', '0', '0', '2018-10-24 14:23:56 351', '1800018836649');
INSERT INTO `ai_stayopen_invoice` VALUES ('664', '909f6f80-d755-11e8-8f5e-5167f4d33666', '90000000004BWGF', '499000151752', '026', '1', '0', '2018-10-24 14:25:13 695', '1800018836655');
INSERT INTO `ai_stayopen_invoice` VALUES ('665', '9fb03f40-d755-11e8-8f5e-5167f4d33666', '90000000004BWGF', '499000151752', '026', '1', '1', '2018-10-24 14:25:38 925', '1800018835722');
INSERT INTO `ai_stayopen_invoice` VALUES ('666', 'ca735c30-d755-11e8-8f5e-5167f4d33666', '90000000004BWGF', '499000151752', '026', '1', '1', '2018-10-24 14:26:51 767', '1800018836662');
INSERT INTO `ai_stayopen_invoice` VALUES ('667', 'e01848c0-d755-11e8-8f5e-5167f4d33666', '90000000004BWGF', '499000151752', '026', '1', '0', '2018-10-24 14:27:27 021', '1800018835730');
INSERT INTO `ai_stayopen_invoice` VALUES ('668', 'ea83fa70-d755-11e8-8f5e-5167f4d33666', '90000000004BWGF', '499000151752', '026', '1', '0', '2018-10-24 14:27:44 505', '1800018836665');
INSERT INTO `ai_stayopen_invoice` VALUES ('669', 'f820c7d0-d755-11e8-8f5e-5167f4d33666', '90000000004BWGF', '499000151752', '007', '1', '0', '2018-10-24 14:28:07 348', '1800018836668');
INSERT INTO `ai_stayopen_invoice` VALUES ('670', '027aed50-d756-11e8-8f5e-5167f4d33666', '90000000004BWGF', '499000151752', '004', '1', '0', '2018-10-24 14:28:24 718', '1800018836669');
INSERT INTO `ai_stayopen_invoice` VALUES ('671', '319e7e30-d756-11e8-8f5e-5167f4d33666', '512345678900000040', 'ds', '026', '0', '0', '2018-10-24 14:29:43 832', '1800018836678');
INSERT INTO `ai_stayopen_invoice` VALUES ('672', 'e76056d0-d756-11e8-8f5e-5167f4d33666', '90000000004BWGF', '499000151752', '004', '1', '0', '2018-10-24 14:34:48 777', '1800018835784');
INSERT INTO `ai_stayopen_invoice` VALUES ('673', '3c7c8440-d757-11e8-8f5e-5167f4d33666', '90000000004BWGF', '499000151752', '004', '1', '0', '2018-10-24 14:37:11 547', '1800018835790');
INSERT INTO `ai_stayopen_invoice` VALUES ('674', '46955b00-d757-11e8-8f5e-5167f4d33666', '90000000004BWGF', '499000151752', '004', '1', '0', '2018-10-24 14:37:28 486', '1800018836736');
INSERT INTO `ai_stayopen_invoice` VALUES ('675', '7764c720-d757-11e8-8f5e-5167f4d33666', '90000000004BWGF', '499000151752', '007', '1', '0', '2018-10-24 14:38:50 380', '1800018835796');
INSERT INTO `ai_stayopen_invoice` VALUES ('676', '94c5fcd0-d757-11e8-8f5e-5167f4d33666', '90000000004BWGF', '499000151752', '004', '1', '0', '2018-10-24 14:39:39 656', '1800018836751');
INSERT INTO `ai_stayopen_invoice` VALUES ('677', 'abe26e30-d757-11e8-8f5e-5167f4d33666', '90000000004BWGF', '499000151752', '007', '1', '0', '2018-10-24 14:40:18 460', '1800018836758');
INSERT INTO `ai_stayopen_invoice` VALUES ('678', '86360060-d758-11e8-8f5e-5167f4d33666', '512345678900000040', 'ds', '026', '0', '1', '2018-10-24 14:46:24 670', '1800018835824');
INSERT INTO `ai_stayopen_invoice` VALUES ('679', '8a051450-d759-11e8-9595-1d93a230a54e', '512345678900000040', 'ds', '026', '0', '0', '2018-10-24 14:53:40 419', '1800018835852');
INSERT INTO `ai_stayopen_invoice` VALUES ('680', 'c4edf370-d759-11e8-9595-1d93a230a54e', '512345678900000040', 'ds', '026', '0', '1', '2018-10-24 14:55:19 218', '1800018835858');
INSERT INTO `ai_stayopen_invoice` VALUES ('681', 'a75a6db0-d75a-11e8-9595-1d93a230a54e', '90000000004BWGF', '499000151752', '004', '1', '0', '2018-10-24 15:01:42 121', '1800018836834');
INSERT INTO `ai_stayopen_invoice` VALUES ('682', 'cda2b0e0-d75a-11e8-8f5e-5167f4d33666', '512345678900000040', 'ds', '026', '0', '0', '2018-10-24 15:02:45 724', '1800018836839');
INSERT INTO `ai_stayopen_invoice` VALUES ('683', 'dea0aaa0-d75a-11e8-8f5e-5167f4d33666', '90000000004BWGF', '499000151752', '004', '1', '0', '2018-10-24 15:03:11 944', '1800018836843');
INSERT INTO `ai_stayopen_invoice` VALUES ('684', 'e99c8e60-d75a-11e8-9595-1d93a230a54e', '90000000004BWGF', '499000151752', '026', '1', '0', '2018-10-24 15:03:30 349', '1800018836845');
INSERT INTO `ai_stayopen_invoice` VALUES ('685', 'fb3800a0-d75a-11e8-9595-1d93a230a54e', '90000000004BWGF', '499000151752', '026', '1', '1', '2018-10-24 15:03:59 813', '1800018835893');
INSERT INTO `ai_stayopen_invoice` VALUES ('686', '4811ec10-d75b-11e8-9595-1d93a230a54e', '90000000004BWGF', '499000151752', '026', '1', '0', '2018-10-24 15:06:08 822', '1800018835896');
INSERT INTO `ai_stayopen_invoice` VALUES ('687', '8cadc1f0-d760-11e8-9973-7b15f396075f', '512345678900000040', 'ds', '026', '0', '0', '2018-10-24 15:43:51 409', '1800018836995');
INSERT INTO `ai_stayopen_invoice` VALUES ('688', 'e887b440-d760-11e8-9973-7b15f396075f', '512345678900000040', 'ds', '026', '0', '0', '2018-10-24 15:46:25 546', '1800018837004');
INSERT INTO `ai_stayopen_invoice` VALUES ('689', '5f5f97e0-d761-11e8-9973-7b15f396075f', '90000000004BWGF', '499000151752', '026', '1', '0', '2018-10-24 15:49:44 846', '1800018836032');
INSERT INTO `ai_stayopen_invoice` VALUES ('690', '4f1c50b0-d763-11e8-8135-df22c34d30ec', '512345678900000040', 'ds', '026', '0', '0', '2018-10-24 16:03:36 837', '1800018836085');
INSERT INTO `ai_stayopen_invoice` VALUES ('691', '397d0fd0-d76b-11e8-8135-df22c34d30ec', '512345678900000040', 'ds', '026', '0', '0', '2018-10-24 17:00:16 741', '1800018836262');
INSERT INTO `ai_stayopen_invoice` VALUES ('692', '99270e30-d771-11e8-960c-fd3def7f8c3a', '512345678900000040', 'ds', '026', '0', '0', '2018-10-24 17:45:53 655', '1800018838375');
INSERT INTO `ai_stayopen_invoice` VALUES ('693', '4b4cd450-d772-11e8-960c-fd3def7f8c3a', '512345678900000040', 'ds', '026', '0', '0', '2018-10-24 17:50:52 549', '1800018837392');
INSERT INTO `ai_stayopen_invoice` VALUES ('694', '63b95a70-d774-11e8-960c-fd3def7f8c3a', '512345678900000040', 'ds', '026', '0', '0', '2018-10-24 18:05:56 930', '1800018838430');
INSERT INTO `ai_stayopen_invoice` VALUES ('695', '0098a7b0-d775-11e8-960c-fd3def7f8c3a', '512345678900000040', 'ds', '026', '0', '0', '2018-10-24 18:10:15 996', '1800018837441');
INSERT INTO `ai_stayopen_invoice` VALUES ('696', '2323f030-d7f4-11e8-9b1d-63780780ddfa', '512345678900000040', 'ds', '026', '0', '0', '2018-10-25 09:20:19 948', '1800018841678');
INSERT INTO `ai_stayopen_invoice` VALUES ('697', '10d87260-d7f5-11e8-9b1d-63780780ddfa', '90000000004BWGF', '499000151752', '026', '1', '0', '2018-10-25 09:26:58 763', '1800018841714');
INSERT INTO `ai_stayopen_invoice` VALUES ('698', '49b38020-d7f5-11e8-9b1d-63780780ddfa', '90000000004BWGF', '499000151752', '026', '1', '0', '2018-10-25 09:28:34 127', '1800018842633');
INSERT INTO `ai_stayopen_invoice` VALUES ('699', 'c32150e0-d7f5-11e8-9b1d-63780780ddfa', '512345678900000040', 'ds', '026', '0', '0', '2018-10-25 09:31:57 937', '1800018841731');
INSERT INTO `ai_stayopen_invoice` VALUES ('700', '982ff0a0-d7f8-11e8-9b1d-63780780ddfa', '90000000004BWGF', '499000151752', '026', '1', '0', '2018-10-25 09:52:14 403', '1800018842720');
INSERT INTO `ai_stayopen_invoice` VALUES ('701', 'dc0ab2b0-d7f8-11e8-9b1d-63780780ddfa', '90000000004BWGF', '499000151752', '026', '1', '0', '2018-10-25 09:54:08 175', '1800018841815');
INSERT INTO `ai_stayopen_invoice` VALUES ('702', '148c2ec0-d7f9-11e8-9b1d-63780780ddfa', '90000000004BWGF', '499000151752', '026', '1', '0', '2018-10-25 09:55:42 953', '1800018842731');
INSERT INTO `ai_stayopen_invoice` VALUES ('703', '6e848fd0-d7f9-11e8-9b1d-63780780ddfa', '512345678900000040', 'ds', '026', '0', '0', '2018-10-25 09:58:13 915', '1800018842742');
INSERT INTO `ai_stayopen_invoice` VALUES ('704', 'ca06ec40-d7f9-11e8-9b1d-63780780ddfa', '90000000004BWGF', '499000151752', '026', '1', '0', '2018-10-25 10:00:47 447', '1800018842752');
INSERT INTO `ai_stayopen_invoice` VALUES ('705', 'f3c98920-d7f9-11e8-9b1d-63780780ddfa', '90000000004BWGF', '499000151752', '026', '1', '0', '2018-10-25 10:01:57 482', '1800018841841');
INSERT INTO `ai_stayopen_invoice` VALUES ('706', '445c5de0-d7fa-11e8-9b1d-63780780ddfa', '90000000004BWGF', '499000151752', '026', '1', '0', '2018-10-25 10:04:12 685', '1800018842767');
INSERT INTO `ai_stayopen_invoice` VALUES ('707', '83fa4420-d7fb-11e8-9b1d-63780780ddfa', '90000000004BWGF', '499000151752', '026', '1', '0', '2018-10-25 10:13:08 917', '1800018841879');
INSERT INTO `ai_stayopen_invoice` VALUES ('708', '89e6efd0-d81b-11e8-9b1d-63780780ddfa', '90000000004BWGF', '499000151752', '026', '1', '0', '2018-10-25 14:02:22 337', '1800018843770');
INSERT INTO `ai_stayopen_invoice` VALUES ('709', 'c1e5a750-d81b-11e8-9b1d-63780780ddfa', '90000000004BWGF', '499000151752', '026', '1', '0', '2018-10-25 14:03:56 268', '1800018843782');
INSERT INTO `ai_stayopen_invoice` VALUES ('710', '0d21c140-d81c-11e8-9b1d-63780780ddfa', '512345678900000040', 'ds', '026', '0', '0', '2018-10-25 14:06:02 500', '1800018843794');
INSERT INTO `ai_stayopen_invoice` VALUES ('711', 'e6132b60-d81c-11e8-9b1d-63780780ddfa', '512345678900000040', 'ds', '026', '0', '0', '2018-10-25 14:12:06 462', '1800018844776');
INSERT INTO `ai_stayopen_invoice` VALUES ('712', '186a0bc0-d826-11e8-9b1d-63780780ddfa', '90000000004BWGF', '499000151752', '026', '1', '1', '2018-10-25 15:17:56 271', '1800018844086');
INSERT INTO `ai_stayopen_invoice` VALUES ('713', '44f390d0-d826-11e8-9b1d-63780780ddfa', '512345678900000040', 'ds', '026', '0', '1', '2018-10-25 15:19:10 996', '1800018845034');
INSERT INTO `ai_stayopen_invoice` VALUES ('714', '8cf1e4e0-d826-11e8-af64-657791de52da', '90000000004BWGF', '499000151752', '026', '1', '1', '2018-10-25 15:21:11 767', '1800018845042');
INSERT INTO `ai_stayopen_invoice` VALUES ('715', 'a19d2f30-d826-11e8-af64-657791de52da', '90000000004BWGF', '499000151752', '026', '1', '0', '2018-10-25 15:21:46 510', '1800018844097');
INSERT INTO `ai_stayopen_invoice` VALUES ('716', 'e7803270-d828-11e8-b07e-0b902ac69e49', '90000000004BWGF', '499000151752', '007', '1', '0', '2018-10-25 15:38:03 077', '1800018844138');
INSERT INTO `ai_stayopen_invoice` VALUES ('717', 'bb68be30-d82a-11e8-b07e-0b902ac69e49', '90000000004BWGF', '499000151752', '026', '1', '1', '2018-10-25 15:51:08 112', '1800018845181');
INSERT INTO `ai_stayopen_invoice` VALUES ('718', '555255a0-d82c-11e8-af64-657791de52da', '512345678900000040', 'ds', '026', '0', '1', '2018-10-25 16:02:35 165', '1800018844257');
INSERT INTO `ai_stayopen_invoice` VALUES ('719', 'a18b9440-d82c-11e8-af64-657791de52da', '512345678900000040', 'ds', '026', '0', '1', '2018-10-25 16:04:43 055', '1800018844263');
INSERT INTO `ai_stayopen_invoice` VALUES ('720', '8c463760-d82d-11e8-af64-657791de52da', '512345678900000040', 'ds', '026', '0', '0', '2018-10-25 16:11:16 909', '1800018844277');
INSERT INTO `ai_stayopen_invoice` VALUES ('721', 'aa26fd50-d82d-11e8-af64-657791de52da', '512345678900000040', 'ds', '026', '0', '0', '2018-10-25 16:12:07 055', '1800018844280');
INSERT INTO `ai_stayopen_invoice` VALUES ('722', 'd75d3d20-d82d-11e8-af64-657791de52da', '512345678900000040', 'ds', '026', '0', '0', '2018-10-25 16:13:22 902', '1800018844284');
INSERT INTO `ai_stayopen_invoice` VALUES ('723', '0059a3d0-d82e-11e8-af64-657791de52da', '512345678900000040', 'ds', '026', '0', '0', '2018-10-25 16:14:31 677', '1800018844288');
INSERT INTO `ai_stayopen_invoice` VALUES ('724', '24c88460-d834-11e8-b82c-ef167db1c775', '90000000004BWGF', '499000151752', '007', '1', '0', '2018-10-25 16:58:29 744', '1800018846352');
INSERT INTO `ai_stayopen_invoice` VALUES ('725', '7dc52050-d834-11e8-b82c-ef167db1c775', '90000000004BWGF', '499000151752', '007', '1', '0', '2018-10-25 17:00:59 071', '1800018846360');
INSERT INTO `ai_stayopen_invoice` VALUES ('726', '829cf1b0-d835-11e8-b82c-ef167db1c775', '90000000004BWGF', '499000151752', '026', '1', '1', '2018-10-25 17:08:16 618', '1800018846385');
INSERT INTO `ai_stayopen_invoice` VALUES ('727', 'c4707210-d835-11e8-8011-db1c419acbb0', '90000000004BWGF', '499000151752', '026', '1', '0', '2018-10-25 17:10:07 092', '1800018846391');
INSERT INTO `ai_stayopen_invoice` VALUES ('728', 'e65449b0-d835-11e8-8011-db1c419acbb0', '90000000004BWGF', '499000151752', '026', '1', '0', '2018-10-25 17:11:03 947', '1800018845444');
INSERT INTO `ai_stayopen_invoice` VALUES ('729', '0554fe90-d836-11e8-8011-db1c419acbb0', '90000000004BWGF', '499000151752', '026', '1', '1', '2018-10-25 17:11:55 927', '1800018845446');
INSERT INTO `ai_stayopen_invoice` VALUES ('730', '8069a180-d836-11e8-8011-db1c419acbb0', '90000000004BWGF', '499000151752', '026', '1', '1', '2018-10-25 17:15:22 410', '1800018846404');
INSERT INTO `ai_stayopen_invoice` VALUES ('731', 'aa90da50-d83b-11e8-8011-db1c419acbb0', '90000000004BWGF', '499000151752', '026', '1', '1', '2018-10-25 17:52:21 018', '1800018846499');
INSERT INTO `ai_stayopen_invoice` VALUES ('732', 'd3a8b840-d83b-11e8-8011-db1c419acbb0', '90000000004BWGF', '499000151752', '026', '1', '1', '2018-10-25 17:53:29 936', '1800018846503');
INSERT INTO `ai_stayopen_invoice` VALUES ('733', '3265cd50-d83c-11e8-8011-db1c419acbb0', '90000000004BWGF', '499000151752', '026', '1', '1', '2018-10-25 17:56:08 883', '1800018846508');
INSERT INTO `ai_stayopen_invoice` VALUES ('734', '06b115b0-d842-11e8-8011-db1c419acbb0', '90000000004BWGF', '499000151752', '026', '1', '1', '2018-10-25 18:37:53 013', '1800018846606');
INSERT INTO `ai_stayopen_invoice` VALUES ('735', '1cb909d0-d842-11e8-8011-db1c419acbb0', '90000000004BWGF', '499000151752', '026', '1', '0', '2018-10-25 18:38:30 006', '1800018845672');
INSERT INTO `ai_stayopen_invoice` VALUES ('736', '305a44e0-d847-11e8-8011-db1c419acbb0', '90000000004BWGF', '499000151752', '007', '1', '0', '2018-10-25 19:14:49 751', '1800018846689');
INSERT INTO `ai_stayopen_invoice` VALUES ('737', '87777270-d847-11e8-8011-db1c419acbb0', '90000000004BWGF', '499000151752', '004', '1', '0', '2018-10-25 19:17:16 087', '1800018846693');
INSERT INTO `ai_stayopen_invoice` VALUES ('738', 'b8cb50d0-d847-11e8-8011-db1c419acbb0', '90000000004BWGF', '499000151752', '026', '1', '0', '2018-10-25 19:18:38 652', '1800018846700');
INSERT INTO `ai_stayopen_invoice` VALUES ('739', 'e19cfe00-d847-11e8-8011-db1c419acbb0', '90000000004BWGF', '499000151752', '026', '1', '0', '2018-10-25 19:19:47 157', '1800018845762');
INSERT INTO `ai_stayopen_invoice` VALUES ('740', '287bd850-d848-11e8-8011-db1c419acbb0', '90000000004BWGF', '499000151752', '026', '1', '1', '2018-10-25 19:21:45 996', '1800018845765');
INSERT INTO `ai_stayopen_invoice` VALUES ('741', 'a812cf10-d848-11e8-8011-db1c419acbb0', '90000000004BWGF', '499000151752', '026', '1', '1', '2018-10-25 19:25:20 072', '1800018845777');
INSERT INTO `ai_stayopen_invoice` VALUES ('742', 'f2f6f310-d84a-11e8-8011-db1c419acbb0', '90000000004BWGF', '499000151752', '026', '1', '0', '2018-10-25 19:41:45 057', '1800018846755');
INSERT INTO `ai_stayopen_invoice` VALUES ('743', '3f6d61c0-d84b-11e8-8011-db1c419acbb0', '90000000004BWGF', '499000151752', '026', '1', '1', '2018-10-25 19:43:53 282', '1800018845819');
INSERT INTO `ai_stayopen_invoice` VALUES ('744', '50f265d0-d84b-11e8-8011-db1c419acbb0', '90000000004BWGF', '499000151752', '026', '1', '1', '2018-10-25 19:44:22 692', '1800018845822');
INSERT INTO `ai_stayopen_invoice` VALUES ('745', '9fe1c3c0-d84b-11e8-8011-db1c419acbb0', '90000000004BWGF', '499000151752', '007', '1', '0', '2018-10-25 19:46:35 209', '1800018845832');
INSERT INTO `ai_stayopen_invoice` VALUES ('746', 'e6135c30-d84d-11e8-8011-db1c419acbb0', '90000000004BWGF', '499000151752', '004', '1', '0', '2018-10-25 20:02:52 294', '1800018845876');
INSERT INTO `ai_stayopen_invoice` VALUES ('747', '336277a0-d84e-11e8-8011-db1c419acbb0', '512345678900000040', 'ds', '026', '0', '0', '2018-10-25 20:05:02 033', '1800018845883');
INSERT INTO `ai_stayopen_invoice` VALUES ('748', '6da1f760-d84e-11e8-8011-db1c419acbb0', '512345678900000040', 'ds', '026', '0', '0', '2018-10-25 20:06:39 702', '1800018846817');
INSERT INTO `ai_stayopen_invoice` VALUES ('749', '11aa2760-d84f-11e8-8011-db1c419acbb0', '512345678900000040', 'ds', '026', '0', '1', '2018-10-25 20:11:14 851', '1800018846828');
INSERT INTO `ai_stayopen_invoice` VALUES ('750', '60323800-d84f-11e8-8011-db1c419acbb0', '512345678900000040', 'ds', '026', '0', '1', '2018-10-25 20:13:26 599', '1800018845908');
INSERT INTO `ai_stayopen_invoice` VALUES ('751', 'ba7de930-d84f-11e8-8011-db1c419acbb0', '512345678900000040', 'ds', '026', '0', '0', '2018-10-25 20:15:58 166', '1800018845914');
INSERT INTO `ai_stayopen_invoice` VALUES ('752', '4a6ae470-d851-11e8-8011-db1c419acbb0', '512345678900000040', 'ds', '026', '0', '0', '2018-10-25 20:27:08 822', '1800018846873');
INSERT INTO `ai_stayopen_invoice` VALUES ('753', '70edca30-d852-11e8-8011-db1c419acbb0', '512345678900000040', 'ds', '026', '0', '1', '2018-10-25 20:35:22 869', '1800018845958');
INSERT INTO `ai_stayopen_invoice` VALUES ('754', 'a1a71fd0-ff6e-11e8-85e3-8f41b793370e', '512345678900000040', 'tu-23', '026', '0', '0', '2018-12-14 15:05:26 093', '1800019249237');
INSERT INTO `ai_stayopen_invoice` VALUES ('755', '1abcf880-0380-11e9-85f2-63fb3afd9bf4', '110101201809212568', '499000161096', '026', '1', '1', '2018-12-19 19:20:35 744', '1800019276498');
INSERT INTO `ai_stayopen_invoice` VALUES ('756', '4dc64f10-0380-11e9-85f2-63fb3afd9bf4', '110101201809212568', '499000161096', '026', '1', '0', '2018-12-19 19:22:00 910', '1800019277496');
INSERT INTO `ai_stayopen_invoice` VALUES ('757', '466cf100-0381-11e9-9d12-e1221b8fda29', '110101201809212568', '499000161096', '026', '1', '1', '2018-12-19 19:28:58 088', '1800019277505');
INSERT INTO `ai_stayopen_invoice` VALUES ('758', '6722cff0-0381-11e9-9d12-e1221b8fda29', '110101201809212568', '499000161096', '026', '1', '0', '2018-12-19 19:29:52 857', '1800019276508');
INSERT INTO `ai_stayopen_invoice` VALUES ('759', 'fcf38c40-045d-11e9-a0f5-d75d4329855f', '110101201809212568', '499000161096', '026', '1', '0', '2018-12-20 21:48:53 367', '1800019281686');
INSERT INTO `ai_stayopen_invoice` VALUES ('760', '3f6dd3a0-05c1-11e9-855b-551313605f4b', '110101201809212568', '499000161096', '026', '1', '1', '2018-12-22 16:11:55 781', '1800019288324');
INSERT INTO `ai_stayopen_invoice` VALUES ('761', '75ebc210-05c2-11e9-92b3-bfe9b554d1e1', '110101201809212568', '499000161096', '026', '1', '1', '2018-12-22 16:20:37 952', '1800019288238');
INSERT INTO `ai_stayopen_invoice` VALUES ('762', 'c1095d60-0e5b-11e9-8240-6387c1b8edf2', '90000000009BWGF', '499000151832', '026', '1', '1', '2019-01-02 14:58:05 669', '1800019339766');
INSERT INTO `ai_stayopen_invoice` VALUES ('763', 'c30c15c0-0e5c-11e9-8240-6387c1b8edf2', '150000000020012', '499000150557', '026', '1', '1', '2019-01-02 15:05:18 805', '1800019338788');
INSERT INTO `ai_stayopen_invoice` VALUES ('764', '5b1c5950-0e5e-11e9-8240-6387c1b8edf2', '150000000020012', '499000150557', '026', '1', '1', '2019-01-02 15:16:43 157', '1800019338795');
INSERT INTO `ai_stayopen_invoice` VALUES ('765', '60ee1080-0e5e-11e9-8240-6387c1b8edf2', '150000000020012', '499000150557', '026', '1', '0', '2019-01-02 15:16:53 015', '1800019338796');
INSERT INTO `ai_stayopen_invoice` VALUES ('766', '1fc580b0-0e5f-11e9-bcb9-8d67bf33de29', '90000000009BWGF', '499000151832', '026', '1', '1', '2019-01-02 15:22:13 163', '1800019338799');
INSERT INTO `ai_stayopen_invoice` VALUES ('767', 'd4f65ed0-399f-11e9-8ae5-012ad8c48278', '90000000009BWGF', '499000151832', '026', '1', '1', '2019-02-26 16:23:44 375', '1800019419332');
INSERT INTO `ai_stayopen_invoice` VALUES ('768', 'da145660-399f-11e9-8ae5-012ad8c48278', '90000000009BWGF', '499000151832', '026', '1', '1', '2019-02-26 16:23:53 575', '1800019419333');
INSERT INTO `ai_stayopen_invoice` VALUES ('769', 'efb7f880-39a1-11e9-a0c7-b514a97c9505', '90000000013BWGF', '499000151584', '026', '1', '0', '2019-02-26 16:38:51 253', '2446641410942698474');
INSERT INTO `ai_stayopen_invoice` VALUES ('770', '125b3310-39a3-11e9-a0c7-b514a97c9505', '90000000013BWGF', '499000151584', '026', '1', '1', '2019-02-26 16:46:57 805', '2446641933854966762');
INSERT INTO `ai_stayopen_invoice` VALUES ('771', '88e5f630-39a5-11e9-a0c7-b514a97c9505', '90000000013BWGF', '499000151584', '026', '1', '1', '2019-02-26 17:04:34 713', '2446643068800074729');
INSERT INTO `ai_stayopen_invoice` VALUES ('772', 'c8be1bc0-39a5-11e9-a0c7-b514a97c9505', '90000000013BWGF', '499000151584', '026', '1', '1', '2019-02-26 17:06:21 914', '2446643183690449897');
INSERT INTO `ai_stayopen_invoice` VALUES ('773', '6ff592b0-39a6-11e9-a0c7-b514a97c9505', '90000000013BWGF', '499000151584', '026', '1', '1', '2019-02-26 17:11:02 688', '2446643485411902442');
INSERT INTO `ai_stayopen_invoice` VALUES ('774', 'a9266c20-39a7-11e9-a0c7-b514a97c9505', '90000000013BWGF', '499000151584', '026', '1', '1', '2019-02-26 17:19:48 589', '2446644050200101865');
INSERT INTO `ai_stayopen_invoice` VALUES ('775', '06449e40-39a8-11e9-a0c7-b514a97c9505', '90000000013BWGF', '499000151584', '026', '1', '1', '2019-02-26 17:22:24 252', '2446644217703826409');
INSERT INTO `ai_stayopen_invoice` VALUES ('776', '73d35730-39a8-11e9-a0c7-b514a97c9505', '90000000013BWGF', '499000151584', '026', '1', '1', '2019-02-26 17:25:27 757', '2446644414198580202');
INSERT INTO `ai_stayopen_invoice` VALUES ('777', '20d55960-39a9-11e9-a0c7-b514a97c9505', '90000000013BWGF', '499000151584', '026', '1', '0', '2019-02-26 17:30:18 305', '2446644726657450986');
INSERT INTO `ai_stayopen_invoice` VALUES ('778', '0483a270-39aa-11e9-a0c7-b514a97c9505', '90000000013BWGF', '499000151584', '026', '1', '1', '2019-02-26 17:36:40 063', '2446645135753085929');
INSERT INTO `ai_stayopen_invoice` VALUES ('779', '6e2298b0-39ac-11e9-88bd-957fe4496be4', '90000000013BWGF', '499000151584', '026', '1', '1', '2019-02-26 17:53:56 725', '2446646249223357417');
INSERT INTO `ai_stayopen_invoice` VALUES ('780', 'b74b6300-39ac-11e9-88bd-957fe4496be4', '90000000013BWGF', '499000151584', '026', '1', '1', '2019-02-26 17:56:01 364', '2446646383441085418');
INSERT INTO `ai_stayopen_invoice` VALUES ('781', '5daf6080-39b1-11e9-88bd-957fe4496be4', '90000000013BWGF', '499000151584', '026', '1', '1', '2019-02-26 18:29:17 352', '2446648526629766122');
INSERT INTO `ai_stayopen_invoice` VALUES ('782', 'c1247f60-39b1-11e9-88bd-957fe4496be4', '90000000013BWGF', '499000151584', '026', '1', '1', '2019-02-26 18:32:03 058', '2446648703797167082');
INSERT INTO `ai_stayopen_invoice` VALUES ('783', '43e93670-39b2-11e9-88bd-957fe4496be4', '90000000013BWGF', '499000151584', '026', '1', '1', '2019-02-26 18:35:45 335', '2446648943241593834');
INSERT INTO `ai_stayopen_invoice` VALUES ('784', 'd98f0fa0-3a35-11e9-af6a-a5856a63c559', '90000000013BWGF', '499000151584', '026', '1', '1', '2019-02-27 10:17:38 763', '2446709623613293546');
INSERT INTO `ai_stayopen_invoice` VALUES ('785', '2d1a24b0-3a55-11e9-a7b0-2f9e0972a92f', '90000000013BWGF', '499000151584', '026', '1', '1', '2019-02-27 14:01:51 698', '1800019422301');
INSERT INTO `ai_stayopen_invoice` VALUES ('786', 'b09e99c0-3a8b-11e9-9425-39f339bc8548', '90000000013BWGF', '499000151584', '026', '1', '1', '2019-02-27 20:32:05 149', '1800019422456');
INSERT INTO `ai_stayopen_invoice` VALUES ('787', '6296c030-3a8c-11e9-9425-39f339bc8548', '90000000013BWGF', '499000151584', '026', '1', '1', '2019-02-27 20:37:03 700', '1800019423486');
INSERT INTO `ai_stayopen_invoice` VALUES ('788', '9f5ac120-3afe-11e9-aef9-75f535abd306', '90000000013BWGF', '499000151584', '026', '1', '1', '2019-02-28 10:14:48 331', '1800019423603');
INSERT INTO `ai_stayopen_invoice` VALUES ('789', '33e40a90-3b31-11e9-8771-99550c031a4c', '90000000013BWGF', '499000151584', '026', '1', '1', '2019-02-28 16:16:53 934', '1800019422711');
INSERT INTO `ai_stayopen_invoice` VALUES ('790', 'b95a0980-3b32-11e9-8771-99550c031a4c', '90000000013BWGF', '499000151584', '026', '1', '1', '2019-02-28 16:27:45 746', '1800019422720');
INSERT INTO `ai_stayopen_invoice` VALUES ('791', '37052710-3b39-11e9-a909-5ba107c770dc', '90000000013BWGF', '499000151584', '004', '1', '1', '2019-02-28 17:14:13 670', '1800019422738');
INSERT INTO `ai_stayopen_invoice` VALUES ('792', '3f1caf90-3b39-11e9-a909-5ba107c770dc', '90000000013BWGF', '499000151584', '004', '1', '1', '2019-02-28 17:14:27 173', '1800019423805');
INSERT INTO `ai_stayopen_invoice` VALUES ('793', 'f8b98300-3b3a-11e9-a909-5ba107c770dc', '90000000013BWGF', '499000151584', '004', '1', '1', '2019-02-28 17:26:48 111', '1800019423812');
INSERT INTO `ai_stayopen_invoice` VALUES ('794', '0dbc6330-3b3b-11e9-a909-5ba107c770dc', '90000000013BWGF', '499000151584', '004', '1', '1', '2019-02-28 17:27:23 310', '1800019423813');
INSERT INTO `ai_stayopen_invoice` VALUES ('795', '197443f0-3b3b-11e9-a909-5ba107c770dc', '90000000013BWGF', '499000151584', '004', '1', '1', '2019-02-28 17:27:42 968', '1800019422748');
INSERT INTO `ai_stayopen_invoice` VALUES ('796', 'b79929f0-3bd2-11e9-a22e-b1b06b7710fa', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-01 11:33:02 536', '1800019423961');
INSERT INTO `ai_stayopen_invoice` VALUES ('797', 'b03cc730-3bea-11e9-a226-cfad7db386c1', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-01 14:24:37 836', '1800019423978');
INSERT INTO `ai_stayopen_invoice` VALUES ('798', 'd90a2fa0-3e50-11e9-9d17-7f86c0a702d5', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-04 15:42:17 437', '1800019425036');
INSERT INTO `ai_stayopen_invoice` VALUES ('799', 'ff4839a0-3e50-11e9-9d17-7f86c0a702d5', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-04 15:43:21 568', '1800019425903');
INSERT INTO `ai_stayopen_invoice` VALUES ('800', '04bc8e90-3e51-11e9-9d17-7f86c0a702d5', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-04 15:43:30 706', '1800019425038');
INSERT INTO `ai_stayopen_invoice` VALUES ('801', '2ded24a0-3e51-11e9-9d17-7f86c0a702d5', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-04 15:44:39 896', '1800019425040');
INSERT INTO `ai_stayopen_invoice` VALUES ('802', '76a5ab80-3e52-11e9-848f-d1cb23f27610', '11010120181019078', '499000153512', '026', '1', '0', '2019-03-04 15:53:51 533', '1800019425915');
INSERT INTO `ai_stayopen_invoice` VALUES ('803', '4347aba0-3e5a-11e9-be2a-b54a67d80ffc', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-04 16:49:41 216', '1800019425993');
INSERT INTO `ai_stayopen_invoice` VALUES ('804', '60930590-3eed-11e9-9855-bbdd395c5be4', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-05 10:22:47 521', '1800019427483');
INSERT INTO `ai_stayopen_invoice` VALUES ('805', 'c46e6080-3f12-11e9-8c86-07c4bfe158ea', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-05 14:49:03 845', '1800019426899');
INSERT INTO `ai_stayopen_invoice` VALUES ('806', '186ce090-3f21-11e9-864f-8118be5e192b', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-05 16:31:37 700', '1800019426970');
INSERT INTO `ai_stayopen_invoice` VALUES ('807', '3374ff80-3f2b-11e9-a426-bf087c5c15f7', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-05 17:43:58 098', '1800019427031');
INSERT INTO `ai_stayopen_invoice` VALUES ('808', '6ede5940-3f2b-11e9-a426-bf087c5c15f7', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-05 17:45:37 636', '1800019427033');
INSERT INTO `ai_stayopen_invoice` VALUES ('809', '6ede5940-3f2b-11e9-a426-bf087c5c15f7', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-05 21:29:08 958', '1800019427033');
INSERT INTO `ai_stayopen_invoice` VALUES ('810', '6ede5940-3f2b-11e9-a426-bf087c5c15f7', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-06 09:06:52 769', '1800019427033');
INSERT INTO `ai_stayopen_invoice` VALUES ('811', '65716cf0-3fba-11e9-b15f-ef98d26eaa37', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-06 10:50:23 348', '1800019429329');
INSERT INTO `ai_stayopen_invoice` VALUES ('812', '886ca800-3fba-11e9-b15f-ef98d26eaa37', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-06 10:51:22 006', '1800019429330');
INSERT INTO `ai_stayopen_invoice` VALUES ('813', 'b8f6a6b0-3fba-11e9-b15f-ef98d26eaa37', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-06 10:52:43 439', '1800019428576');
INSERT INTO `ai_stayopen_invoice` VALUES ('814', 'd91ec490-3fba-11e9-b15f-ef98d26eaa37', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-06 10:53:37 386', '1800019428577');
INSERT INTO `ai_stayopen_invoice` VALUES ('815', 'd91ec490-3fba-11e9-b15f-ef98d26eaa37', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-06 11:10:24 042', '1800019428577');
INSERT INTO `ai_stayopen_invoice` VALUES ('816', 'd91ec490-3fba-11e9-b15f-ef98d26eaa37', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-06 11:10:32 669', '1800019428577');
INSERT INTO `ai_stayopen_invoice` VALUES ('817', 'd91ec490-3fba-11e9-b15f-ef98d26eaa37', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-06 11:10:46 088', '1800019428577');
INSERT INTO `ai_stayopen_invoice` VALUES ('818', 'e8511eb0-3fbd-11e9-b15f-ef98d26eaa37', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-06 11:15:31 372', '1800019428600');
INSERT INTO `ai_stayopen_invoice` VALUES ('819', 'e8511eb0-3fbd-11e9-b15f-ef98d26eaa37', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-06 11:17:30 927', '1800019428600');
INSERT INTO `ai_stayopen_invoice` VALUES ('820', 'e8511eb0-3fbd-11e9-b15f-ef98d26eaa37', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-06 11:17:44 466', '1800019428600');
INSERT INTO `ai_stayopen_invoice` VALUES ('821', 'e469bfa0-3fef-11e9-b429-6f32512034cb', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-06 17:12:00 178', '1800019429565');
INSERT INTO `ai_stayopen_invoice` VALUES ('822', 'ea14b4f0-3fef-11e9-b429-6f32512034cb', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-06 17:12:07 301', '1800019428817');
INSERT INTO `ai_stayopen_invoice` VALUES ('823', 'fee49e40-3fef-11e9-b429-6f32512034cb', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-06 17:12:41 954', '1800019428818');
INSERT INTO `ai_stayopen_invoice` VALUES ('824', 'b5e78260-3ff0-11e9-b429-6f32512034cb', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-06 17:17:50 331', '1800019429574');
INSERT INTO `ai_stayopen_invoice` VALUES ('825', 'b964c240-3ff0-11e9-b429-6f32512034cb', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-06 17:17:54 886', '1800019429575');
INSERT INTO `ai_stayopen_invoice` VALUES ('826', '17b3ac30-3ff1-11e9-b429-6f32512034cb', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-06 17:20:33 029', '1800019429576');
INSERT INTO `ai_stayopen_invoice` VALUES ('827', '2a875050-3ff1-11e9-b429-6f32512034cb', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-06 17:21:04 603', '1800019428824');
INSERT INTO `ai_stayopen_invoice` VALUES ('828', '4344c780-3ff1-11e9-b429-6f32512034cb', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-06 17:21:46 119', '1800019428825');
INSERT INTO `ai_stayopen_invoice` VALUES ('829', 'bbc15a70-3ff1-11e9-b429-6f32512034cb', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-06 17:25:08 647', '1800019429584');
INSERT INTO `ai_stayopen_invoice` VALUES ('830', '437000c0-3ff2-11e9-b2fb-6d89acba7891', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-06 17:28:56 138', '1800019429586');
INSERT INTO `ai_stayopen_invoice` VALUES ('831', '9f6ee1f0-407b-11e9-81a2-c7cf76b90513', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-07 09:52:11 704', '1800019430104');
INSERT INTO `ai_stayopen_invoice` VALUES ('832', '3d138bf0-4085-11e9-b8db-9b01f44ad813', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-07 11:01:01 972', '1800019430149');
INSERT INTO `ai_stayopen_invoice` VALUES ('833', '5a72ece0-4085-11e9-9be0-0b4167c8071c', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-07 11:01:52 396', '1800019430150');
INSERT INTO `ai_stayopen_invoice` VALUES ('834', 'cdac4d00-4085-11e9-9be0-0b4167c8071c', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-07 11:05:05 741', '1800019430154');
INSERT INTO `ai_stayopen_invoice` VALUES ('835', '59016610-4086-11e9-9be0-0b4167c8071c', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-07 11:08:59 484', '1800019430159');
INSERT INTO `ai_stayopen_invoice` VALUES ('836', '216faef0-408b-11e9-9be0-0b4167c8071c', '11010120181019078', '499000153512', '026', '1', '0', '2019-03-07 11:43:13 612', '1800019430186');
INSERT INTO `ai_stayopen_invoice` VALUES ('837', 'd33a81d0-40a1-11e9-b26d-29cdbbbc119e', '11010120181019078', '499000153512', '026', '1', '0', '2019-03-07 14:25:39 948', '1800019430475');
INSERT INTO `ai_stayopen_invoice` VALUES ('838', 'e2dd7810-40a4-11e9-b26d-29cdbbbc119e', '11010120181019078', '499000153512', '026', '1', '0', '2019-03-07 14:47:34 700', '1800019430496');
INSERT INTO `ai_stayopen_invoice` VALUES ('839', 'bda5f6b0-40a6-11e9-b26d-29cdbbbc119e', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-07 15:00:52 192', '1800019430301');
INSERT INTO `ai_stayopen_invoice` VALUES ('840', 'ef6c0bb0-4152-11e9-ab0d-c99ac6df1d3a', '11010120181019078', '499000153512', '026', '1', '0', '2019-03-08 11:33:27 646', '1800019432036');
INSERT INTO `ai_stayopen_invoice` VALUES ('841', '048d2240-4153-11e9-ab0d-c99ac6df1d3a', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-08 11:34:02 882', '1800019431246');
INSERT INTO `ai_stayopen_invoice` VALUES ('842', '64d36310-433a-11e9-adba-87244f633bba', '11010120181019078', '499000153512', '026', '1', '0', '2019-03-10 21:42:49 372', '1800019435983');
INSERT INTO `ai_stayopen_invoice` VALUES ('843', '98c85220-433a-11e9-adba-87244f633bba', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-10 21:44:16 392', '1800019435984');
INSERT INTO `ai_stayopen_invoice` VALUES ('844', '9afa4d50-433a-11e9-adba-87244f633bba', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-10 21:44:20 069', '1800019435205');
INSERT INTO `ai_stayopen_invoice` VALUES ('845', 'cfa1ea90-433a-11e9-adba-87244f633bba', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-10 21:45:48 402', '1800019435990');
INSERT INTO `ai_stayopen_invoice` VALUES ('846', 'f5eba730-43a4-11e9-82ab-ed1ad0eb6ff7', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-11 10:25:39 041', '1800019437439');
INSERT INTO `ai_stayopen_invoice` VALUES ('847', 'a7570910-43c8-11e9-9b0f-a90e01bd5fb4', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-11 14:41:09 502', '1800019437709');
INSERT INTO `ai_stayopen_invoice` VALUES ('848', '63ae3500-43df-11e9-b3bb-adc3708a6a13', '512345678900000040', 'ds', '026', '0', '1', '2019-03-11 17:23:55 817', '2447850342231049194');
INSERT INTO `ai_stayopen_invoice` VALUES ('849', '7c5ae350-43df-11e9-b3bb-adc3708a6a13', '512345678900000040', 'ds', '026', '0', '1', '2019-03-11 17:24:36 843', '2447850386254463978');
INSERT INTO `ai_stayopen_invoice` VALUES ('850', 'ac07c870-43df-11e9-b3bb-adc3708a6a13', '512345678900000040', 'ds', '026', '0', '0', '2019-03-11 17:25:55 395', '2447850471080068073');
INSERT INTO `ai_stayopen_invoice` VALUES ('851', 'd4a08b50-43df-11e9-b3bb-adc3708a6a13', '512345678900000040', 'ds', '026', '0', '1', '2019-03-11 17:27:03 646', '2447850544094512106');
INSERT INTO `ai_stayopen_invoice` VALUES ('852', 'fc7ee260-43e0-11e9-b3bb-adc3708a6a13', '512345678900000040', 'ds', '026', '0', '1', '2019-03-11 17:35:20 824', '2447851077744198634');
INSERT INTO `ai_stayopen_invoice` VALUES ('853', '28864b70-446b-11e9-acf9-43ca7adb3da2', '512345678900000040', 'ds', '026', '0', '0', '2019-03-12 10:04:24 780', '2447914797879002090');
INSERT INTO `ai_stayopen_invoice` VALUES ('854', '751f0f30-446b-11e9-acf9-43ca7adb3da2', '512345678900000040', 'ds', '026', '0', '0', '2019-03-12 10:06:36 387', '2447914939612922857');
INSERT INTO `ai_stayopen_invoice` VALUES ('855', '6fc02190-446c-11e9-acf9-43ca7adb3da2', '512345678900000040', 'ds', '026', '0', '0', '2019-03-12 10:13:33 218', '2447915387363263465');
INSERT INTO `ai_stayopen_invoice` VALUES ('856', '9bd455f0-4474-11e9-acf9-43ca7adb3da2', '512345678900000040', 'ds', '026', '0', '1', '2019-03-12 11:12:03 628', '2447919156197065706');
INSERT INTO `ai_stayopen_invoice` VALUES ('857', '75574b80-4492-11e9-acf9-43ca7adb3da2', '512345678900000040', 'ds', '026', '0', '1', '2019-03-12 14:45:42 680', '1800019439754');
INSERT INTO `ai_stayopen_invoice` VALUES ('858', '952b55f0-4492-11e9-acf9-43ca7adb3da2', '512345678900000040', 'ds', '026', '0', '0', '2019-03-12 14:46:36 134', '1800019438953');
INSERT INTO `ai_stayopen_invoice` VALUES ('859', '1e2cefd0-4498-11e9-b631-fd2ea87ea6ee', '512345678900000040', 'xinds', '026', '0', '0', '2019-03-12 15:26:13 309', '1800019439807');
INSERT INTO `ai_stayopen_invoice` VALUES ('860', '27142460-4498-11e9-b631-fd2ea87ea6ee', '512345678900000040', 'xinds', '026', '0', '1', '2019-03-12 15:26:28 172', '1800019439808');
INSERT INTO `ai_stayopen_invoice` VALUES ('861', 'bb17aec0-4498-11e9-b631-fd2ea87ea6ee', '512345678900000040', 'xinds', '026', '0', '1', '2019-03-12 15:30:36 488', '1800019439814');
INSERT INTO `ai_stayopen_invoice` VALUES ('862', '2633eba0-449a-11e9-b631-fd2ea87ea6ee', '512345678900000040', 'xinds', '026', '0', '1', '2019-03-12 15:40:45 661', '1800019439033');
INSERT INTO `ai_stayopen_invoice` VALUES ('863', '43f7b3b0-449a-11e9-b631-fd2ea87ea6ee', '512345678900000040', 'xinds', '026', '0', '1', '2019-03-12 15:41:36 471', '1800019439035');
INSERT INTO `ai_stayopen_invoice` VALUES ('864', '4eaf77a0-449c-11e9-b631-fd2ea87ea6ee', '512345678900000040', 'xinds', '026', '0', '1', '2019-03-12 15:56:13 117', '1800019439847');
INSERT INTO `ai_stayopen_invoice` VALUES ('865', '4fa53520-4553-11e9-8b60-dd57d338acbd', '512345678900000040', 'xinds', '026', '0', '1', '2019-03-13 13:46:12 831', '1800019441827');
INSERT INTO `ai_stayopen_invoice` VALUES ('866', '97037760-45fd-11e9-94fb-fdaf2b8cb148', '512345678900000040', 'xinds', '026', '0', '1', '2019-03-14 10:05:07 459', '1800019444156');
INSERT INTO `ai_stayopen_invoice` VALUES ('867', '2f09a8d0-45ff-11e9-94fb-fdaf2b8cb148', '512345678900000040', 'xinds', '026', '0', '1', '2019-03-14 10:16:31 995', '1800019444171');
INSERT INTO `ai_stayopen_invoice` VALUES ('868', '764940c0-45ff-11e9-94fb-fdaf2b8cb148', '512345678900000040', 'xinds', '026', '0', '0', '2019-03-14 10:18:31 616', '1800019444368');
INSERT INTO `ai_stayopen_invoice` VALUES ('869', 'b25a1660-4605-11e9-94fb-fdaf2b8cb148', '512345678900000040', 'xinds', '026', '0', '1', '2019-03-14 11:03:09 741', '2448104125406118889');
INSERT INTO `ai_stayopen_invoice` VALUES ('870', '51fb6270-4609-11e9-a70e-850bd85596f8', '512345678900000040', 'xinds', '026', '0', '1', '2019-03-14 11:29:07 342', '2448105798295880681');
INSERT INTO `ai_stayopen_invoice` VALUES ('871', '5fd9ccb0-4609-11e9-a70e-850bd85596f8', '512345678900000040', 'xinds', '026', '0', '1', '2019-03-14 11:29:29 635', '2448105821918200809');
INSERT INTO `ai_stayopen_invoice` VALUES ('872', 'afdc4650-461f-11e9-a70e-850bd85596f8', '11010120181019078', '499000153512', '026', '1', '0', '2019-03-14 14:09:12 069', '1800019444633');
INSERT INTO `ai_stayopen_invoice` VALUES ('873', '7d066660-4620-11e9-a70e-850bd85596f8', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-14 14:14:56 240', '1800019444641');
INSERT INTO `ai_stayopen_invoice` VALUES ('874', '2d4c4f50-4629-11e9-90bc-e5a52e9fddba', '11010120181019078', '499000153512', '026', '1', '0', '2019-03-14 15:17:07 888', '1800019445557');
INSERT INTO `ai_stayopen_invoice` VALUES ('875', '00ab74e0-462d-11e9-a70e-850bd85596f8', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-14 15:44:31 085', '1800019445589');
INSERT INTO `ai_stayopen_invoice` VALUES ('876', '18dcd8b0-462d-11e9-a70e-850bd85596f8', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-14 15:45:11 665', '1800019444782');
INSERT INTO `ai_stayopen_invoice` VALUES ('877', '7736b060-4633-11e9-b3c0-e3e7c97f9bb1', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-14 16:30:46 926', '1800019444861');
INSERT INTO `ai_stayopen_invoice` VALUES ('878', '85cd4a40-4637-11e9-b3c0-e3e7c97f9bb1', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-14 16:59:49 365', '1800019446105');
INSERT INTO `ai_stayopen_invoice` VALUES ('879', 'd498b820-46c9-11e9-92f3-8d64c5c3ae03', '11010120181019078', '499000153512', '026', '1', '0', '2019-03-15 10:27:08 090', '1800019448877');
INSERT INTO `ai_stayopen_invoice` VALUES ('880', 'e290ebf0-46c9-11e9-92f3-8d64c5c3ae03', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-15 10:27:31 439', '1800019449789');
INSERT INTO `ai_stayopen_invoice` VALUES ('881', '61aeb3b0-46cd-11e9-92f3-8d64c5c3ae03', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-15 10:52:33 220', '1800019449842');
INSERT INTO `ai_stayopen_invoice` VALUES ('882', '0a9ba730-46ec-11e9-8c3b-f31f14eb084a', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-15 14:32:01 533', '1800019451464');
INSERT INTO `ai_stayopen_invoice` VALUES ('883', '99f5b970-492b-11e9-9474-314f088edbfd', '51234567890010BWGF', 'ysczhongd', '026', '0', '1', '2019-03-18 11:12:02 986', '1800019471312');
INSERT INTO `ai_stayopen_invoice` VALUES ('884', '766b8400-495b-11e9-9b74-dd151c54cbc2', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-18 16:54:38 763', '1800019474776');
INSERT INTO `ai_stayopen_invoice` VALUES ('885', '3e16b5e0-495e-11e9-9b74-dd151c54cbc2', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-18 17:14:32 534', '1800019476012');
INSERT INTO `ai_stayopen_invoice` VALUES ('886', '9a694a70-49e9-11e9-9b74-dd151c54cbc2', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-19 09:52:10 906', '1800019479452');
INSERT INTO `ai_stayopen_invoice` VALUES ('887', '2dbc4980-49ea-11e9-9b74-dd151c54cbc2', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-19 09:56:14 501', '1800019478479');
INSERT INTO `ai_stayopen_invoice` VALUES ('888', '4d683280-49ea-11e9-9b74-dd151c54cbc2', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-19 09:57:11 307', '1800019478481');
INSERT INTO `ai_stayopen_invoice` VALUES ('889', 'f12293d0-49ee-11e9-9b74-dd151c54cbc2', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-19 10:30:24 154', '1800019478540');
INSERT INTO `ai_stayopen_invoice` VALUES ('890', '99224320-49f7-11e9-bb8b-6dbc32ada1f5', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-19 11:32:18 199', '1800019479641');
INSERT INTO `ai_stayopen_invoice` VALUES ('891', '8b2e9e00-4a09-11e9-ba12-4baf2d466a63', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-19 13:40:49 262', '1800019478826');
INSERT INTO `ai_stayopen_invoice` VALUES ('892', 'ae826710-4a0e-11e9-ba12-4baf2d466a63', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-19 14:17:39 588', '1800019478908');
INSERT INTO `ai_stayopen_invoice` VALUES ('893', '46a7aeb0-4a0f-11e9-ba12-4baf2d466a63', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-19 14:21:47 689', '1800019479917');
INSERT INTO `ai_stayopen_invoice` VALUES ('894', '609ed2d0-4a19-11e9-ba12-4baf2d466a63', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-19 15:34:10 113', '1800019480060');
INSERT INTO `ai_stayopen_invoice` VALUES ('895', '25ba9550-4a1e-11e9-ba12-4baf2d466a63', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-19 16:08:18 578', '1800019479137');
INSERT INTO `ai_stayopen_invoice` VALUES ('896', '61679ce0-4a20-11e9-90ce-874e17938f37', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-19 16:24:20 109', '1800019479164');
INSERT INTO `ai_stayopen_invoice` VALUES ('897', '8b25ccf0-4a20-11e9-90ce-874e17938f37', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-19 16:25:30 102', '1800019479170');
INSERT INTO `ai_stayopen_invoice` VALUES ('898', 'ac26bea0-4a20-11e9-ba12-4baf2d466a63', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-19 16:26:24 057', '1800019479184');
INSERT INTO `ai_stayopen_invoice` VALUES ('899', 'c18ec940-4a20-11e9-ba12-4baf2d466a63', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-19 16:26:59 563', '1800019479204');
INSERT INTO `ai_stayopen_invoice` VALUES ('900', 'f0168f50-4a20-11e9-90ce-874e17938f37', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-19 16:28:19 443', '1800019480233');
INSERT INTO `ai_stayopen_invoice` VALUES ('901', '07602b30-4a21-11e9-90ce-874e17938f37', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-19 16:28:58 521', '1800019480234');
INSERT INTO `ai_stayopen_invoice` VALUES ('902', '3df0d3c0-4a21-11e9-90ce-874e17938f37', '51234567890010BWGF', 'dp8', '026', '0', '1', '2019-03-19 16:30:30 541', '2448589071237252074');
INSERT INTO `ai_stayopen_invoice` VALUES ('903', 'd0d64e80-4a22-11e9-9f46-173deb3a73ff', '51234567890010BWGF', 'dp8', '026', '0', '1', '2019-03-19 16:41:50 063', '2448589800307950569');
INSERT INTO `ai_stayopen_invoice` VALUES ('904', '23382170-4a24-11e9-8ba2-01aed1904cf9', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-19 16:51:13 715', '1800019486859');
INSERT INTO `ai_stayopen_invoice` VALUES ('905', '089a42c0-4a2a-11e9-ad41-65337a645a6e', '90000000004BWGF', '499000151752', '026', '1', '0', '2019-03-19 17:33:20 214', '1800019505399');
INSERT INTO `ai_stayopen_invoice` VALUES ('906', '18280ab0-4a2a-11e9-ad41-65337a645a6e', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-19 17:33:46 110', '1800019505486');
INSERT INTO `ai_stayopen_invoice` VALUES ('907', '625e7470-4a2a-11e9-ad41-65337a645a6e', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-19 17:35:50 623', '1800019505887');
INSERT INTO `ai_stayopen_invoice` VALUES ('908', '4568b550-4a2b-11e9-ad41-65337a645a6e', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-19 17:42:11 590', '1800019506757');
INSERT INTO `ai_stayopen_invoice` VALUES ('909', '5136dd30-4a2b-11e9-ad41-65337a645a6e', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-19 17:42:31 368', '1800019507805');
INSERT INTO `ai_stayopen_invoice` VALUES ('910', '59ff8d40-4a2b-11e9-ad41-65337a645a6e', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-19 17:42:46 060', '1800019506821');
INSERT INTO `ai_stayopen_invoice` VALUES ('911', '5d9eb720-4aa6-11e9-953a-81b3dba5102c', '90000000004BWGF', '499000151752', '026', '1', '0', '2019-03-20 08:23:20 314', '1800019626048');
INSERT INTO `ai_stayopen_invoice` VALUES ('912', 'e0c50010-4aaf-11e9-953a-81b3dba5102c', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-20 09:31:25 710', '1800019625268');
INSERT INTO `ai_stayopen_invoice` VALUES ('913', '428eb8e0-4ab0-11e9-953a-81b3dba5102c', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-20 09:34:09 763', '1800019626139');
INSERT INTO `ai_stayopen_invoice` VALUES ('914', '5402a5f0-4ab0-11e9-953a-81b3dba5102c', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-20 09:34:39 051', '1800019625271');
INSERT INTO `ai_stayopen_invoice` VALUES ('915', '849e65a0-4ab5-11e9-953a-81b3dba5102c', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-20 10:12:01 531', '1800019626223');
INSERT INTO `ai_stayopen_invoice` VALUES ('916', '402834a0-4aba-11e9-953a-81b3dba5102c', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-20 10:45:46 825', '1800019626288');
INSERT INTO `ai_stayopen_invoice` VALUES ('917', '1ce9bcc0-4abf-11e9-bcb0-374bc94f8e24', '90000000004BWGF', '499000151752', '026', '1', '0', '2019-03-20 11:20:29 114', '1800019641834');
INSERT INTO `ai_stayopen_invoice` VALUES ('918', '6ec75140-4ad0-11e9-83e4-6fb17c9c83d5', '51234567890010BWGF', 'dp8', '026', '0', '1', '2019-03-20 13:24:35 349', '1800019694099');
INSERT INTO `ai_stayopen_invoice` VALUES ('919', '57b3ee50-4ad5-11e9-91c2-5dc7581080b5', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-20 14:09:04 864', '1800019713512');
INSERT INTO `ai_stayopen_invoice` VALUES ('920', 'e5b7e8d0-4ad7-11e9-8e1d-554973d29a0d', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-20 14:17:58 427', '1800019718455');
INSERT INTO `ai_stayopen_invoice` VALUES ('921', 'f76c3a40-4ad7-11e9-8e1d-554973d29a0d', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-20 14:18:23 625', '1800019719395');
INSERT INTO `ai_stayopen_invoice` VALUES ('922', '0c23b990-4ad8-11e9-8e1d-554973d29a0d', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-20 14:18:58 356', '1800019719559');
INSERT INTO `ai_stayopen_invoice` VALUES ('923', '50e71f30-4ade-11e9-b56d-7dba667431dc', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-20 15:03:50 741', '1800019735592');
INSERT INTO `ai_stayopen_invoice` VALUES ('924', '826cd110-4ae0-11e9-a6e7-8f62c6c5af95', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-20 15:19:32 863', '1800019742600');
INSERT INTO `ai_stayopen_invoice` VALUES ('925', 'db6f8780-4ae0-11e9-a6e7-8f62c6c5af95', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-20 15:22:02 495', '1800019743379');
INSERT INTO `ai_stayopen_invoice` VALUES ('926', 'c63b08a0-4ae3-11e9-8f19-35597c0532eb', '90000000004BWGF', '499000151752', '026', '1', '0', '2019-03-20 15:42:55 102', '1800019752782');
INSERT INTO `ai_stayopen_invoice` VALUES ('927', '2a77e450-4ae4-11e9-8f19-35597c0532eb', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-20 15:45:43 205', '1800019754696');
INSERT INTO `ai_stayopen_invoice` VALUES ('928', 'e44ea190-4ae7-11e9-8f19-35597c0532eb', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-20 16:12:23 524', '1800019764816');
INSERT INTO `ai_stayopen_invoice` VALUES ('929', '385196d0-4ae8-11e9-8f19-35597c0532eb', '11010120181019078', '499000153512', '026', '1', '0', '2019-03-20 16:14:44 507', '1800019764833');
INSERT INTO `ai_stayopen_invoice` VALUES ('930', 'd029b360-4ae9-11e9-8659-5193309e122d', '51234567890010BWGF', 'dp8', '026', '0', '1', '2019-03-20 16:26:21 989', '2448681575169131497');
INSERT INTO `ai_stayopen_invoice` VALUES ('931', 'f3838930-4ae9-11e9-8659-5193309e122d', '51234567890010BWGF', 'dp8', '026', '0', '1', '2019-03-20 16:27:18 988', '2448681636372415466');
INSERT INTO `ai_stayopen_invoice` VALUES ('932', '549483e0-4aeb-11e9-8659-5193309e122d', '51234567890010BWGF', 'dp8', '026', '0', '1', '2019-03-20 16:37:11 383', '2448682273101317098');
INSERT INTO `ai_stayopen_invoice` VALUES ('933', '2a8c31d0-4af3-11e9-8659-5193309e122d', '51234567890010BWGF', 'dp8', '026', '0', '1', '2019-03-20 17:33:17 011', '2448685886242554857');
INSERT INTO `ai_stayopen_invoice` VALUES ('934', '589762f0-4af5-11e9-8f19-35597c0532eb', '51234567890010BWGF', 'dp8', '026', '0', '1', '2019-03-20 17:48:49 233', '2448686888043676650');
INSERT INTO `ai_stayopen_invoice` VALUES ('935', '21402420-4af7-11e9-9a3f-8bb6ae96ff4b', '90000000004BWGF', '499000151752', '026', '1', '0', '2019-03-20 18:01:32 388', '1800019772812');
INSERT INTO `ai_stayopen_invoice` VALUES ('936', '8966e430-4af7-11e9-8659-5193309e122d', '51234567890010BWGF', 'dp8', '026', '0', '1', '2019-03-20 18:04:34 140', '2448687902729700329');
INSERT INTO `ai_stayopen_invoice` VALUES ('937', 'd2383550-4b1b-11e9-8f19-35597c0532eb', '51234567890010BWGF', 'ysczhongd', '026', '0', '0', '2019-03-20 22:24:11 593', '2448704628406092777');
INSERT INTO `ai_stayopen_invoice` VALUES ('938', 'b5f2da70-4b1c-11e9-8f19-35597c0532eb', '51234567890010BWGF', 'ysczhongd', '026', '0', '0', '2019-03-20 22:30:33 530', '2448705038575469545');
INSERT INTO `ai_stayopen_invoice` VALUES ('939', '87d04bf0-4b76-11e9-93cb-d7a83535a213', '51234567890010BWGF', 'dp8', '026', '0', '1', '2019-03-21 09:13:38 529', '2448746468903748585');
INSERT INTO `ai_stayopen_invoice` VALUES ('940', 'b2016210-4b76-11e9-93cb-d7a83535a213', '51234567890010BWGF', 'dp8', '026', '0', '1', '2019-03-21 09:14:49 513', '2448746545139418089');
INSERT INTO `ai_stayopen_invoice` VALUES ('941', 'dd813f50-4b76-11e9-93cb-d7a83535a213', '51234567890010BWGF', 'dp8', '026', '0', '1', '2019-03-21 09:16:02 334', '2448746623522571241');
INSERT INTO `ai_stayopen_invoice` VALUES ('942', '4b8eec40-4b77-11e9-93cb-d7a83535a213', '51234567890010BWGF', 'dp8', '026', '0', '1', '2019-03-21 09:19:06 872', '2448746821091066858');
INSERT INTO `ai_stayopen_invoice` VALUES ('943', '9173af20-4b77-11e9-93cb-d7a83535a213', '51234567890010BWGF', 'dp8', '026', '0', '1', '2019-03-21 09:21:08 546', '2448746952087569385');
INSERT INTO `ai_stayopen_invoice` VALUES ('944', 'abdf2470-4b77-11e9-93cb-d7a83535a213', '51234567890010BWGF', 'dp8', '026', '0', '1', '2019-03-21 09:21:48 283', '2448746995037242346');
INSERT INTO `ai_stayopen_invoice` VALUES ('945', '0d174ba0-4b78-11e9-93cb-d7a83535a213', '51234567890010BWGF', 'dp8', '026', '0', '1', '2019-03-21 09:24:31 624', '2448747170057159658');
INSERT INTO `ai_stayopen_invoice` VALUES ('946', '4e676b30-4b78-11e9-93cb-d7a83535a213', '51234567890010BWGF', 'dp8', '026', '0', '1', '2019-03-21 09:26:21 090', '2448747288168760298');
INSERT INTO `ai_stayopen_invoice` VALUES ('947', '61d839b0-4b78-11e9-93cb-d7a83535a213', '51234567890010BWGF', 'dp8', '026', '0', '1', '2019-03-21 09:26:54 074', '2448747322528498666');
INSERT INTO `ai_stayopen_invoice` VALUES ('948', '77277610-4b81-11e9-8ee6-dd001b7fa4f8', '51234567890010BWGF', 'dp8', '026', '0', '1', '2019-03-21 10:31:55 325', '2448751512269095913');
INSERT INTO `ai_stayopen_invoice` VALUES ('949', 'b126b880-4b81-11e9-8ee6-dd001b7fa4f8', '51234567890010BWGF', 'dp8', '026', '0', '1', '2019-03-21 10:33:32 430', '2448751616422052841');
INSERT INTO `ai_stayopen_invoice` VALUES ('950', 'f027e560-4b89-11e9-8ee6-dd001b7fa4f8', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-21 11:32:31 491', '1800019794292');
INSERT INTO `ai_stayopen_invoice` VALUES ('951', '7964e750-4b9f-11e9-98fe-a9621247810e', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-21 14:06:40 248', '1800019799437');
INSERT INTO `ai_stayopen_invoice` VALUES ('952', '64637140-4ba0-11e9-98fe-a9621247810e', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-21 14:13:14 528', '1800019799451');
INSERT INTO `ai_stayopen_invoice` VALUES ('953', '4f28fdf0-4bae-11e9-a0a0-2b05e00844be', '51234567890010BWGF', 'ysczhongd', '026', '0', '1', '2019-03-21 15:52:48 440', '2448772185020433385');
INSERT INTO `ai_stayopen_invoice` VALUES ('954', '6f329750-4bae-11e9-a0a0-2b05e00844be', '51234567890010BWGF', 'dp8', '026', '0', '1', '2019-03-21 15:53:41 303', '2448772241928750058');
INSERT INTO `ai_stayopen_invoice` VALUES ('955', '7d182d80-4bae-11e9-a0a0-2b05e00844be', '51234567890010BWGF', 'dp8', '026', '0', '1', '2019-03-21 15:54:05 090', '2448772266624812010');
INSERT INTO `ai_stayopen_invoice` VALUES ('956', 'f4d5eb00-4bb3-11e9-aa1c-75bb1d5d5895', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-21 16:33:10 195', '1800019799848');
INSERT INTO `ai_stayopen_invoice` VALUES ('957', '7302a360-4bb4-11e9-aa1c-75bb1d5d5895', '11010120181019078', '499000153512', '007', '1', '1', '2019-03-21 16:36:48 229', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('958', 'f6aab590-4bb4-11e9-aa1c-75bb1d5d5895', '11010120181019078', '499000153512', '007', '1', '1', '2019-03-21 16:40:25 225', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('959', '684abb90-4bb6-11e9-aa1c-75bb1d5d5895', '90000000004BWGF', '499000151752', '026', '1', '0', '2019-03-21 16:50:43 205', '1800019799296');
INSERT INTO `ai_stayopen_invoice` VALUES ('960', '7e2345d0-4bb7-11e9-aa1c-75bb1d5d5895', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-21 16:58:29 367', '1800019799312');
INSERT INTO `ai_stayopen_invoice` VALUES ('961', '9d1c3280-4bb7-11e9-aa1c-75bb1d5d5895', '51234567890010BWGF', 'dp8', '026', '0', '0', '2019-03-21 16:59:23 611', '2448776474619020266');
INSERT INTO `ai_stayopen_invoice` VALUES ('962', 'e507e8f0-4bb7-11e9-9db2-ffe09eea9fbf', '90000000004BWGF', '499000151752', '007', '1', '1', '2019-03-21 17:01:32 252', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('963', '18e9c530-4bb8-11e9-aa1c-75bb1d5d5895', '51234567890010BWGF', 'dp8', '026', '0', '1', '2019-03-21 17:02:51 722', '2448776697957319658');
INSERT INTO `ai_stayopen_invoice` VALUES ('964', '33183180-4bb8-11e9-aa1c-75bb1d5d5895', '51234567890010BWGF', 'dp8', '007', '0', '1', '2019-03-21 17:03:35 833', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('965', '66c53030-4bba-11e9-81a2-6555a005c7a8', '51234567890010BWGF', '7043518285', '026', '0', '1', '2019-03-21 17:19:35 133', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('966', '9dedfa10-4bba-11e9-81a2-6555a005c7a8', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-21 17:20:56 476', '1800019799952');
INSERT INTO `ai_stayopen_invoice` VALUES ('967', '38e46310-4bbb-11e9-81a2-6555a005c7a8', '90000000004BWGF', '499000151752', '007', '1', '1', '2019-03-21 17:25:19 785', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('968', 'ab3efbf0-4bbb-11e9-81a2-6555a005c7a8', '51234567890010BWGF', 'ysczhongd', '007', '0', '1', '2019-03-21 17:28:36 265', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('969', 'cc9d9e00-4bbb-11e9-81a2-6555a005c7a8', '51234567890010BWGF', 'ysczhongd', '007', '0', '1', '2019-03-21 17:29:29 529', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('970', 'cc9fc0e0-4bbb-11e9-81a2-6555a005c7a8', '51234567890010BWGF', 'ysczhongd', '007', '0', '1', '2019-03-21 17:29:29 851', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('971', 'ef8773f0-4bbb-11e9-81a2-6555a005c7a8', '51234567890010BWGF', 'ysczhongd', '007', '0', '1', '2019-03-21 17:30:29 811', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('972', '5ded8f30-4bbe-11e9-8076-419b304ab836', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-21 17:47:48 633', '1800019800436');
INSERT INTO `ai_stayopen_invoice` VALUES ('973', '8c78d7b0-4bbe-11e9-8076-419b304ab836', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-21 17:49:06 701', '1800019800442');
INSERT INTO `ai_stayopen_invoice` VALUES ('974', 'f2ab2550-4bbf-11e9-8076-419b304ab836', '51234567890010BWGF', 'ysczhongd', '026', '0', '1', '2019-03-21 17:59:15 491', '2448780331499652073');
INSERT INTO `ai_stayopen_invoice` VALUES ('975', '1b39d610-4bc0-11e9-b3b7-116e96739cad', '51234567890010BWGF', '7043518285', '026', '0', '1', '2019-03-21 18:00:21 430', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('976', 'be6d2280-4bc3-11e9-8482-9be42d91b340', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-21 18:26:17 999', '1800019800125');
INSERT INTO `ai_stayopen_invoice` VALUES ('977', 'de93b9c0-4bc3-11e9-8482-9be42d91b340', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-21 18:27:15 625', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('978', '5f398870-4bc4-11e9-aa1c-75bb1d5d5895', '90000000004BWGF', '499000151752', '026', '1', '0', '2019-03-21 18:30:39 006', '1800019800147');
INSERT INTO `ai_stayopen_invoice` VALUES ('979', '2ecda3a0-4bc5-11e9-a66c-8790d25e4cdb', '51234567890010BWGF', 'ysczhongd', '004', '0', '1', '2019-03-21 18:36:39 893', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('980', '51d644d0-4bc8-11e9-a66c-8790d25e4cdb', '51234567890010BWGF', 'ysczhongd', '026', '0', '1', '2019-03-21 18:59:07 914', '2448784188380283881');
INSERT INTO `ai_stayopen_invoice` VALUES ('981', 'c63b0590-4bc8-11e9-a4f9-85c41a4f79ea', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-21 19:02:18 567', '1800019800691');
INSERT INTO `ai_stayopen_invoice` VALUES ('982', 'd90f1ee0-4bc8-11e9-a4f9-85c41a4f79ea', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-21 19:02:50 171', '1800019800692');
INSERT INTO `ai_stayopen_invoice` VALUES ('983', 'd25cfd50-4bc9-11e9-9bde-71033837a0af', '51234567890010BWGF', 'ysczhongd', '026', '0', '1', '2019-03-21 19:09:51 658', '2448784879870018538');
INSERT INTO `ai_stayopen_invoice` VALUES ('984', 'd221b720-4bcb-11e9-aa1c-75bb1d5d5895', '90000000004BWGF', '499000151752', '007', '1', '1', '2019-03-21 19:24:01 624', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('985', 'eb8643c0-4bcb-11e9-aa1c-75bb1d5d5895', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-21 19:24:40 821', '1800019800738');
INSERT INTO `ai_stayopen_invoice` VALUES ('986', 'bd977770-4bcd-11e9-85cd-b3efbd1b4058', '51234567890010BWGF', 'ysczhongd', '007', '0', '1', '2019-03-21 19:37:54 650', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('987', 'e2edb980-4bcd-11e9-85cd-b3efbd1b4058', '51234567890010BWGF', 'ysczhongd', '007', '0', '1', '2019-03-21 19:38:57 707', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('988', '13bd4cb0-4bce-11e9-85cd-b3efbd1b4058', '51234567890010BWGF', 'ysczhongd', '004', '0', '1', '2019-03-21 19:40:18 750', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('989', 'fb223520-4bce-11e9-a4f9-85c41a4f79ea', '90000000004BWGF', '499000151752', '026', '1', '0', '2019-03-21 19:46:44 343', '1800019800823');
INSERT INTO `ai_stayopen_invoice` VALUES ('990', '53e809a0-4bcf-11e9-85cd-b3efbd1b4058', '90000000004BWGF', '499000151752', '026', '1', '0', '2019-03-21 19:49:11 592', '1800019801389');
INSERT INTO `ai_stayopen_invoice` VALUES ('991', '93f10330-4bcf-11e9-a4f9-85c41a4f79ea', '51234567890010BWGF', 'ysczhongd', '026', '0', '0', '2019-03-21 19:51:05 150', '2448787536307291114');
INSERT INTO `ai_stayopen_invoice` VALUES ('992', 'ac3b1f20-4bcf-11e9-85cd-b3efbd1b4058', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-21 19:51:39 777', '1800019801400');
INSERT INTO `ai_stayopen_invoice` VALUES ('993', 'be5b51c0-4bcf-11e9-85cd-b3efbd1b4058', '90000000004BWGF', '499000151752', '007', '1', '1', '2019-03-21 19:52:13 704', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('994', '698dc410-4bd0-11e9-85cd-b3efbd1b4058', '90000000004BWGF', '499000151752', '004', '1', '1', '2019-03-21 19:57:00 654', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('995', 'a7aacc20-4bd0-11e9-85cd-b3efbd1b4058', '90000000004BWGF', '499000151752', '026', '1', '0', '2019-03-21 19:58:41 622', '1800019801425');
INSERT INTO `ai_stayopen_invoice` VALUES ('996', 'd36e4210-4bd0-11e9-85cd-b3efbd1b4058', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-21 19:59:58 823', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('997', 'de8b9080-4bd0-11e9-85cd-b3efbd1b4058', '90000000004BWGF', '499000151752', '007', '1', '1', '2019-03-21 20:00:16 992', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('998', 'fdc30cd0-4bd0-11e9-85cd-b3efbd1b4058', '90000000004BWGF', '499000151752', '007', '1', '1', '2019-03-21 20:01:09 654', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('999', '20521890-4bd1-11e9-85cd-b3efbd1b4058', '90000000004BWGF', '499000151752', '004', '1', '1', '2019-03-21 20:02:07 441', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1000', '7c179880-4bd1-11e9-85cd-b3efbd1b4058', '51234567890010BWGF', 'dp8', '026', '0', '0', '2019-03-21 20:04:42 232', '2448788413554361322');
INSERT INTO `ai_stayopen_invoice` VALUES ('1001', 'd59f19e0-4bd2-11e9-8c0b-e3b59b7f2df2', '90000000004BWGF', '499000151752', '007', '1', '1', '2019-03-21 20:14:13 853', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1002', '9a187eb0-4bd3-11e9-8c0b-e3b59b7f2df2', '90000000004BWGF', '499000151752', '007', '1', '1', '2019-03-21 20:19:47 300', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1003', 'c1d8bbe0-4bd3-11e9-aa1d-4f00ffee357a', '51234567890010BWGF', 'dp8', '026', '0', '1', '2019-03-21 20:20:51 164', '2448789454010188778');
INSERT INTO `ai_stayopen_invoice` VALUES ('1004', 'd7285c80-4bd3-11e9-8c0b-e3b59b7f2df2', '90000000004BWGF', '499000151752', '004', '1', '1', '2019-03-21 20:21:27 810', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1005', 'd5750730-4bd3-11e9-8c0b-e3b59b7f2df2', '90000000004BWGF', '499000151752', '004', '1', '1', '2019-03-21 20:21:30 871', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1006', 'e7528b80-4bd3-11e9-aa1d-4f00ffee357a', '51234567890010BWGF', '7043518285', '026', '0', '1', '2019-03-21 20:21:55 288', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1007', '34e40720-4bd4-11e9-8c0b-e3b59b7f2df2', '90000000004BWGF', '499000151752', '007', '1', '1', '2019-03-21 20:24:08 382', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1008', '56b6eed0-4bd4-11e9-aa1d-4f00ffee357a', '51234567890010BWGF', 'dp8', '026', '0', '1', '2019-03-21 20:25:05 058', '2448789725666870249');
INSERT INTO `ai_stayopen_invoice` VALUES ('1009', '7c4de360-4bd4-11e9-aa1d-4f00ffee357a', '51234567890010BWGF', '7043518285', '026', '0', '1', '2019-03-21 20:26:14 561', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1010', '9e04dea0-4bd4-11e9-8c0b-e3b59b7f2df2', '90000000004BWGF', '499000151752', '007', '1', '1', '2019-03-21 20:27:03 086', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1011', '1203ffc0-4bd5-11e9-8c0b-e3b59b7f2df2', '90000000004BWGF', '499000151752', '026', '1', '0', '2019-03-21 20:30:16 644', '1800019800977');
INSERT INTO `ai_stayopen_invoice` VALUES ('1012', '79861b60-4bd5-11e9-abe0-49871a88e9b8', '90000000004BWGF', '499000151752', '026', '1', '0', '2019-03-21 20:33:07 959', '1800019801550');
INSERT INTO `ai_stayopen_invoice` VALUES ('1013', 'd4661d50-4bd5-11e9-aa1d-4f00ffee357a', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-21 20:35:42 250', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1014', '1794c0e0-4bd6-11e9-aa1d-4f00ffee357a', '90000000004BWGF', '499000151752', '007', '1', '1', '2019-03-21 20:37:36 897', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1015', 'a1dc3a80-4bd6-11e9-9912-7d480eb661e8', '51234567890010BWGF', 'dp8', '026', '0', '0', '2019-03-21 20:41:33 089', '2448790786523792361');
INSERT INTO `ai_stayopen_invoice` VALUES ('1016', 'ac25be30-4bd6-11e9-9912-7d480eb661e8', '51234567890010BWGF', 'dp8', '026', '0', '0', '2019-03-21 20:41:53 903', '2448790809072370665');
INSERT INTO `ai_stayopen_invoice` VALUES ('1017', '23ea72d0-4bd7-11e9-aa1d-4f00ffee357a', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-21 20:45:00 439', '1800019801577');
INSERT INTO `ai_stayopen_invoice` VALUES ('1018', '4408ccb0-4bd7-11e9-aa1d-4f00ffee357a', '90000000004BWGF', '499000151752', '007', '1', '1', '2019-03-21 20:45:57 203', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1019', '4404ae00-4bd7-11e9-aa1d-4f00ffee357a', '90000000004BWGF', '499000151752', '007', '1', '1', '2019-03-21 20:46:00 556', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1020', '6f608880-4bd7-11e9-aa1d-4f00ffee357a', '90000000004BWGF', '499000151752', '004', '1', '1', '2019-03-21 20:47:12 205', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1021', '4aff1140-4bd8-11e9-aa1d-4f00ffee357a', '51234567890010BWGF', 'dp8', '026', '0', '1', '2019-03-21 20:53:19 287', '2448791545659261930');
INSERT INTO `ai_stayopen_invoice` VALUES ('1022', '7d65e640-4bd8-11e9-aa1d-4f00ffee357a', '51234567890010BWGF', '7043518285', '026', '0', '1', '2019-03-21 20:54:58 841', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1023', 'e2113b30-4bd8-11e9-8751-a7bc89f96c68', '51234567890010BWGF', 'ysczhongd', '007', '0', '1', '2019-03-21 20:57:42 953', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1024', '19221040-4bd9-11e9-8751-a7bc89f96c68', '51234567890010BWGF', 'ysczhongd', '007', '0', '1', '2019-03-21 20:59:19 100', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1025', '67738080-4bd9-11e9-8751-a7bc89f96c68', '51234567890010BWGF', 'ysczhongd', '004', '0', '1', '2019-03-21 21:01:23 878', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1026', '95a5d390-4bd9-11e9-8751-a7bc89f96c68', '51234567890010BWGF', 'ysczhongd', '026', '0', '0', '2019-03-21 21:02:41 263', '2448792149102167017');
INSERT INTO `ai_stayopen_invoice` VALUES ('1027', 'd9e01ac0-4bd9-11e9-950f-c1a54c399d6a', '51234567890010BWGF', '7043518285', '026', '0', '1', '2019-03-21 21:04:37 035', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1028', 'f7838990-4bd9-11e9-950f-c1a54c399d6a', '51234567890010BWGF', 'ysczhongd', '026', '0', '1', '2019-03-21 21:05:26 035', '2448792325195826153');
INSERT INTO `ai_stayopen_invoice` VALUES ('1029', '21715520-4bda-11e9-aa1d-4f00ffee357a', '51234567890010BWGF', '7043518285', '026', '0', '1', '2019-03-21 21:06:29 862', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1030', '67825820-4bda-11e9-a16a-1176800ea9a1', '51234567890010BWGF', 'ysczhongd', '026', '0', '1', '2019-03-21 21:08:33 218', '2448792527059289066');
INSERT INTO `ai_stayopen_invoice` VALUES ('1031', 'de4aab60-4bda-11e9-ad68-9bef6d426e6e', '512345678900000040', 'xinds', '026', '0', '1', '2019-03-21 21:11:54 262', '2448792742881395690');
INSERT INTO `ai_stayopen_invoice` VALUES ('1032', '042b5320-4bdb-11e9-8f24-0de8e775376e', '51234567890010BWGF', 'ysczhongd', '026', '0', '1', '2019-03-21 21:12:56 857', '2448792809453388778');
INSERT INTO `ai_stayopen_invoice` VALUES ('1033', '21403d90-4bdb-11e9-bde7-d92c89ee4773', '51234567890010BWGF', 'ysczhongd', '026', '0', '1', '2019-03-21 21:13:45 319', '2448792862066738153');
INSERT INTO `ai_stayopen_invoice` VALUES ('1034', '401f87c0-4bdb-11e9-bde7-d92c89ee4773', '51234567890010BWGF', 'ysczhongd', '026', '0', '1', '2019-03-21 21:14:36 555', '2448792916827571178');
INSERT INTO `ai_stayopen_invoice` VALUES ('1035', '518ee0f0-4bdb-11e9-bde7-d92c89ee4773', '51234567890010BWGF', 'ysczhongd', '004', '0', '1', '2019-03-21 21:15:09 030', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1036', '655178f0-4bdb-11e9-bde7-d92c89ee4773', '51234567890010BWGF', 'ysczhongd', '007', '0', '1', '2019-03-21 21:15:44 215', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1037', '8dc6d550-4bdb-11e9-bde7-d92c89ee4773', '51234567890010BWGF', 'ysczhongd', '007', '0', '1', '2019-03-21 21:16:50 995', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1038', 'a7dcb090-4bdb-11e9-bde7-d92c89ee4773', '51234567890010BWGF', 'ysczhongd', '007', '0', '1', '2019-03-21 21:17:35 680', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1039', 'e7c095f0-4bdb-11e9-bde7-d92c89ee4773', '51234567890010BWGF', 'ysczhongd', '007', '0', '1', '2019-03-21 21:19:22 191', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1040', '4045df00-4bdc-11e9-9ec0-7bef3cd4d2f7', '51234567890010BWGF', 'ysczhongd', '007', '0', '1', '2019-03-21 21:21:47 115', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1041', '71187f70-4bdc-11e9-b383-c1630e8bb9c1', '51234567890010BWGF', 'ysczhongd', '007', '0', '1', '2019-03-21 21:23:08 663', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1042', 'cb6011f0-4bdc-11e9-997b-57b9e08e0a85', '51234567890010BWGF', 'ysczhongd', '026', '0', '1', '2019-03-21 21:25:44 961', '2448793634087109610');
INSERT INTO `ai_stayopen_invoice` VALUES ('1043', 'e91f4620-4bdc-11e9-90e2-93e515574700', '51234567890010BWGF', 'ysczhongd', '007', '0', '1', '2019-03-21 21:26:30 149', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1044', '11764510-4bdd-11e9-90e2-93e515574700', '51234567890010BWGF', 'ysczhongd', '007', '0', '1', '2019-03-21 21:27:37 595', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1045', '303276e0-4bdd-11e9-90e2-93e515574700', '51234567890010BWGF', 'ysczhongd', '026', '0', '0', '2019-03-21 21:28:29 349', '2448793811254510570');
INSERT INTO `ai_stayopen_invoice` VALUES ('1046', '361237d0-4bdd-11e9-90e2-93e515574700', '51234567890010BWGF', 'ysczhongd', '026', '0', '0', '2019-03-21 21:28:38 953', '2448793820918186986');
INSERT INTO `ai_stayopen_invoice` VALUES ('1047', '43db4550-4bdd-11e9-90e2-93e515574700', '51234567890010BWGF', 'ysczhongd', '026', '0', '0', '2019-03-21 21:29:02 259', '2448793846687990762');
INSERT INTO `ai_stayopen_invoice` VALUES ('1048', 'eb520f30-4bdd-11e9-9340-fdd2f42c5bec', '90000000004BWGF', '499000151752', '026', '1', '0', '2019-03-21 21:33:31 486', '1800019801121');
INSERT INTO `ai_stayopen_invoice` VALUES ('1049', '15afb390-4bde-11e9-9340-fdd2f42c5bec', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-21 21:34:42 474', '1800019801670');
INSERT INTO `ai_stayopen_invoice` VALUES ('1050', '4b6b7ff0-4bde-11e9-9340-fdd2f42c5bec', '90000000004BWGF', '499000151752', '007', '1', '1', '2019-03-21 21:36:16 285', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1051', '08a8a110-4bdf-11e9-9340-fdd2f42c5bec', '90000000004BWGF', '499000151752', '007', '1', '1', '2019-03-21 21:41:33 562', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1052', '72071dd0-4bdf-11e9-9340-fdd2f42c5bec', '90000000004BWGF', '499000151752', '004', '1', '1', '2019-03-21 21:44:30 287', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1053', '7e491620-4bdf-11e9-9340-fdd2f42c5bec', '90000000004BWGF', '499000151752', '026', '1', '0', '2019-03-21 21:44:47 518', '1800019801691');
INSERT INTO `ai_stayopen_invoice` VALUES ('1054', '56cd3f80-4be0-11e9-a21c-9f77a4bf2964', '90000000004BWGF', '499000151752', '026', '1', '0', '2019-03-21 21:50:50 822', '1800019801700');
INSERT INTO `ai_stayopen_invoice` VALUES ('1055', '6f08dc80-4be0-11e9-a21c-9f77a4bf2964', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-21 21:51:31 379', '1800019801702');
INSERT INTO `ai_stayopen_invoice` VALUES ('1056', '8b3cdcd0-4be0-11e9-a21c-9f77a4bf2964', '90000000004BWGF', '499000151752', '007', '1', '1', '2019-03-21 21:52:22 206', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1057', 'a4f2bdc0-4be0-11e9-a21c-9f77a4bf2964', '90000000004BWGF', '499000151752', '004', '1', '1', '2019-03-21 21:53:05 148', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1058', 'a4f83c00-4be0-11e9-a21c-9f77a4bf2964', '90000000004BWGF', '499000151752', '004', '1', '1', '2019-03-21 21:53:08 270', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1059', 'f717cb40-4be0-11e9-a21c-9f77a4bf2964', '90000000004BWGF', '499000151752', '004', '1', '1', '2019-03-21 21:55:22 974', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1060', 'f72056c0-4be0-11e9-a21c-9f77a4bf2964', '90000000004BWGF', '499000151752', '004', '1', '1', '2019-03-21 21:55:26 248', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1061', '75c4b020-4be1-11e9-a21c-9f77a4bf2964', '90000000004BWGF', '499000151752', '007', '1', '1', '2019-03-21 21:58:55 875', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1062', '1fb5c8d0-4be2-11e9-a21c-9f77a4bf2964', '90000000004BWGF', '499000151752', '026', '1', '0', '2019-03-21 22:03:37 351', '1800019801727');
INSERT INTO `ai_stayopen_invoice` VALUES ('1063', '59c07cf0-4be2-11e9-a21c-9f77a4bf2964', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-21 22:05:14 686', '1800019801172');
INSERT INTO `ai_stayopen_invoice` VALUES ('1064', '7e59b090-4be2-11e9-a21c-9f77a4bf2964', '90000000004BWGF', '499000151752', '007', '1', '1', '2019-03-21 22:06:19 559', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1065', 'e49ff0d0-4be2-11e9-a21c-9f77a4bf2964', '51234567890010BWGF', 'dp8', '026', '0', '0', '2019-03-21 22:09:14 472', '2448796436553270249');
INSERT INTO `ai_stayopen_invoice` VALUES ('1066', '1b507d70-4be3-11e9-a21c-9f77a4bf2964', '51234567890010BWGF', '7043518285', '026', '0', '1', '2019-03-21 22:10:46 710', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1067', '3cc91020-4be3-11e9-a21c-9f77a4bf2964', '51234567890010BWGF', 'dp8', '026', '0', '1', '2019-03-21 22:11:40 975', '2448796593319576553');
INSERT INTO `ai_stayopen_invoice` VALUES ('1068', '5c66ef60-4be3-11e9-a21c-9f77a4bf2964', '51234567890010BWGF', '7043518285', '026', '0', '1', '2019-03-21 22:12:34 129', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1069', 'aabc3030-4be3-11e9-a21c-9f77a4bf2964', '51234567890010BWGF', 'ysczhongd', '007', '0', '1', '2019-03-21 22:14:44 397', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1070', 'd0c06580-4be3-11e9-a21c-9f77a4bf2964', '51234567890010BWGF', 'ysczhongd', '007', '0', '1', '2019-03-21 22:15:52 464', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1071', 'e59b4b50-4be3-11e9-a21c-9f77a4bf2964', '51234567890010BWGF', 'ysczhongd', '004', '0', '1', '2019-03-21 22:16:23 220', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1072', '96b12810-4be4-11e9-986b-57725e51b17d', '51234567890010BWGF', 'dp8', '026', '0', '1', '2019-03-21 22:21:24 138', '2448797220384801769');
INSERT INTO `ai_stayopen_invoice` VALUES ('1073', 'b4ae4fa0-4be4-11e9-a21c-9f77a4bf2964', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-21 22:22:06 224', '1800019801763');
INSERT INTO `ai_stayopen_invoice` VALUES ('1074', 'c020ea00-4be4-11e9-a21c-9f77a4bf2964', '90000000004BWGF', '499000151752', '007', '1', '1', '2019-03-21 22:22:29 119', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1075', 'e2711800-4be4-11e9-a21c-9f77a4bf2964', '90000000004BWGF', '499000151752', '004', '1', '1', '2019-03-21 22:23:26 447', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1076', '29147a80-4be6-11e9-a21c-9f77a4bf2964', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-21 22:32:31 013', '1800019801782');
INSERT INTO `ai_stayopen_invoice` VALUES ('1077', '4f133190-4be6-11e9-a21c-9f77a4bf2964', '90000000004BWGF', '499000151752', '007', '1', '1', '2019-03-21 22:33:38 434', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1078', '65914010-4be6-11e9-a21c-9f77a4bf2964', '90000000004BWGF', '499000151752', '004', '1', '1', '2019-03-21 22:34:15 761', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1079', '861e3a40-4be6-11e9-a21c-9f77a4bf2964', '90000000004BWGF', '499000151752', '007', '1', '1', '2019-03-21 22:35:10 738', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1080', 'edb627d0-4be6-11e9-a21c-9f77a4bf2964', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-21 22:38:00 880', '1800019801221');
INSERT INTO `ai_stayopen_invoice` VALUES ('1081', '0f5618a0-4be7-11e9-a21c-9f77a4bf2964', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-21 22:39:01 105', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1082', '76e9e780-4be7-11e9-9d67-659d5ead3d44', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-21 22:41:51 077', '1800019801229');
INSERT INTO `ai_stayopen_invoice` VALUES ('1083', '85e72f40-4be7-11e9-9d67-659d5ead3d44', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-21 22:42:16 236', '1800019801231');
INSERT INTO `ai_stayopen_invoice` VALUES ('1084', 'aa8a26e0-4be7-11e9-9d67-659d5ead3d44', '11010120181019078', '499000153512', '007', '1', '1', '2019-03-21 22:43:21 861', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1085', 'ecafbee0-4be7-11e9-9d67-659d5ead3d44', '11010120181019078', '499000153512', '007', '1', '1', '2019-03-21 22:45:14 242', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1086', '20003090-4be8-11e9-9d67-659d5ead3d44', '11010120181019078', '499000153512', '004', '1', '1', '2019-03-21 22:46:38 522', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1087', '5ea49110-4be8-11e9-9d67-659d5ead3d44', '11010120181019078', '499000153512', '026', '1', '0', '2019-03-21 22:48:19 909', '1800019801248');
INSERT INTO `ai_stayopen_invoice` VALUES ('1088', '886a3b30-4be8-11e9-9d67-659d5ead3d44', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-21 22:49:29 939', '1800019801250');
INSERT INTO `ai_stayopen_invoice` VALUES ('1089', '945a6a00-4be8-11e9-9d67-659d5ead3d44', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-21 22:49:49 960', '1800019801253');
INSERT INTO `ai_stayopen_invoice` VALUES ('1090', 'd5879840-4be8-11e9-9d67-659d5ead3d44', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-21 22:51:39 338', '1800019801811');
INSERT INTO `ai_stayopen_invoice` VALUES ('1091', 'd7c07bd0-4be9-11e9-9d67-659d5ead3d44', '90000000004BWGF', '499000151752', '007', '1', '1', '2019-03-21 22:58:55 995', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1092', 'f1da9cd0-4be9-11e9-9d67-659d5ead3d44', '90000000004BWGF', '499000151752', '004', '1', '1', '2019-03-21 22:59:39 721', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1093', '2730a280-4bea-11e9-9d67-659d5ead3d44', '90000000004BWGF', '499000151752', '004', '1', '1', '2019-03-21 23:01:09 177', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1094', '66342810-4bec-11e9-9d67-659d5ead3d44', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-21 23:17:15 279', '1800019801851');
INSERT INTO `ai_stayopen_invoice` VALUES ('1095', '8bb7bbb0-4bec-11e9-9d67-659d5ead3d44', '90000000004BWGF', '499000151752', '026', '1', '0', '2019-03-21 23:18:13 544', '1800019801302');
INSERT INTO `ai_stayopen_invoice` VALUES ('1096', '9f6aa6d0-4bed-11e9-9d67-659d5ead3d44', '90000000004BWGF', '499000151752', '026', '1', '0', '2019-03-21 23:25:56 053', '1800019802317');
INSERT INTO `ai_stayopen_invoice` VALUES ('1097', '8f8277f0-4bef-11e9-af34-cfa14c608a42', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-21 23:39:48 335', '1800019801884');
INSERT INTO `ai_stayopen_invoice` VALUES ('1098', 'c4a0cbd0-4bef-11e9-af34-cfa14c608a42', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-21 23:41:21 275', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1099', 'de0fb8b0-4bef-11e9-af34-cfa14c608a42', '90000000004BWGF', '499000151752', '007', '1', '1', '2019-03-21 23:42:03 437', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1100', 'e9577280-4bef-11e9-af34-cfa14c608a42', '90000000004BWGF', '499000151752', '004', '1', '1', '2019-03-21 23:42:22 366', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1101', '36fdaea0-4bf0-11e9-af34-cfa14c608a42', '90000000004BWGF', '499000151752', '007', '1', '1', '2019-03-21 23:44:32 677', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1102', '472852d0-4bf0-11e9-af34-cfa14c608a42', '90000000004BWGF', '499000151752', '007', '1', '1', '2019-03-21 23:44:59 818', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1103', '65a86600-4bf0-11e9-af34-cfa14c608a42', '90000000004BWGF', '499000151752', '007', '1', '1', '2019-03-21 23:45:51 233', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1104', '753dcf10-4bf0-11e9-af34-cfa14c608a42', '90000000004BWGF', '499000151752', '026', '1', '0', '2019-03-21 23:46:13 781', '1800019801900');
INSERT INTO `ai_stayopen_invoice` VALUES ('1105', '7c56ac40-4bf0-11e9-af34-cfa14c608a42', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-21 23:46:25 641', '1800019801901');
INSERT INTO `ai_stayopen_invoice` VALUES ('1106', '938286f0-4bf0-11e9-af34-cfa14c608a42', '90000000004BWGF', '499000151752', '007', '1', '1', '2019-03-21 23:47:07 885', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1107', 'a9cc6610-4bf0-11e9-af34-cfa14c608a42', '90000000004BWGF', '499000151752', '004', '1', '1', '2019-03-21 23:47:45 370', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1108', 'b4dfa260-4bf0-11e9-af34-cfa14c608a42', '90000000004BWGF', '499000151752', '007', '1', '1', '2019-03-21 23:48:03 894', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1109', '0d429660-4bf1-11e9-af34-cfa14c608a42', '51234567890010BWGF', 'dp8', '026', '0', '0', '2019-03-21 23:50:33 373', '2448802963829818345');
INSERT INTO `ai_stayopen_invoice` VALUES ('1110', '2a8372d0-4bf1-11e9-af34-cfa14c608a42', '51234567890010BWGF', 'ysczhongd', '007', '0', '1', '2019-03-21 23:51:22 146', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1111', '6fb53960-4bf1-11e9-af34-cfa14c608a42', '51234567890010BWGF', 'ysczhongd', '007', '0', '1', '2019-03-21 23:53:18 479', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1112', '7fef46e0-4bf1-11e9-8344-4ffc2ee94a33', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-21 23:53:44 143', '1800019801918');
INSERT INTO `ai_stayopen_invoice` VALUES ('1113', '925b0170-4bf1-11e9-8344-4ffc2ee94a33', '90000000004BWGF', '499000151752', '007', '1', '1', '2019-03-21 23:54:18 416', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1114', 'd4ce27c0-4bf2-11e9-8344-4ffc2ee94a33', '90000000004BWGF', '499000151752', '007', '1', '1', '2019-03-22 00:03:19 311', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1115', '37305000-4bf3-11e9-8344-4ffc2ee94a33', '90000000004BWGF', '499000151752', '007', '1', '1', '2019-03-22 00:06:04 649', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1116', 'b2337150-4bf4-11e9-af34-cfa14c608a42', '90000000004BWGF', '499000151752', '026', '1', '0', '2019-03-22 00:16:38 198', '1800019801959');
INSERT INTO `ai_stayopen_invoice` VALUES ('1117', '2e24dfb0-4bf5-11e9-af34-cfa14c608a42', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-22 00:20:01 959', '1800019802429');
INSERT INTO `ai_stayopen_invoice` VALUES ('1118', '5bc21eb0-4bf5-11e9-af34-cfa14c608a42', '90000000004BWGF', '499000151752', '007', '1', '1', '2019-03-22 00:21:25 795', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1119', 'ac0f37e0-4bf5-11e9-af34-cfa14c608a42', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-22 00:23:33 210', '1800019801983');
INSERT INTO `ai_stayopen_invoice` VALUES ('1120', 'f76992c0-4bf6-11e9-af34-cfa14c608a42', '90000000004BWGF', '499000151752', '007', '1', '1', '2019-03-22 00:32:52 426', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1121', '49d53440-4bf9-11e9-af34-cfa14c608a42', '90000000012BWGF', '499000151867', '026', '1', '1', '2019-03-22 00:49:26 390', '1800019802040');
INSERT INTO `ai_stayopen_invoice` VALUES ('1122', 'f3bb9e90-4bf9-11e9-9e2a-cb0db2a5dd10', '90000000020BWGF', '499000151824', '026', '1', '1', '2019-03-22 00:54:11 550', '1800019802477');
INSERT INTO `ai_stayopen_invoice` VALUES ('1123', '07731300-4bfa-11e9-9e2a-cb0db2a5dd10', '90000000020BWGF', '499000151824', '026', '1', '1', '2019-03-22 00:54:44 505', '1800019802479');
INSERT INTO `ai_stayopen_invoice` VALUES ('1124', '35565bb0-4bfa-11e9-9e2a-cb0db2a5dd10', '90000000020BWGF', '499000151824', '026', '1', '1', '2019-03-22 00:56:04 972', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1125', '610ca9e0-4c08-11e9-9515-83d3e3658907', '512345678900000040', 'ZD01', '026', '0', '0', '2019-03-22 02:37:34 021', '2448813722722894826');
INSERT INTO `ai_stayopen_invoice` VALUES ('1126', '79868100-4c0b-11e9-bb69-5527e8861a40', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-03-22 02:59:45 864', '1800019802697');
INSERT INTO `ai_stayopen_invoice` VALUES ('1127', 'aacc55a0-4c0b-11e9-bb69-5527e8861a40', '51234567890010BWGF', 'ysczhongd', '026', '0', '1', '2019-03-22 03:01:12 957', '2448815246362543081');
INSERT INTO `ai_stayopen_invoice` VALUES ('1128', '65ed7490-4c0c-11e9-8499-351608d2b73a', '51234567890010BWGF', 'ysczhongd', '026', '0', '1', '2019-03-22 03:06:28 104', '2448815585664959465');
INSERT INTO `ai_stayopen_invoice` VALUES ('1129', '91e037e0-4c0c-11e9-8499-351608d2b73a', '51234567890010BWGF', 'ysczhongd', '026', '0', '1', '2019-03-22 03:07:43 925', '2448815666195596265');
INSERT INTO `ai_stayopen_invoice` VALUES ('1130', '23320860-4c10-11e9-895c-8730ce08c109', '51234567890010BWGF', 'ysczhongd', '026', '0', '1', '2019-03-22 03:33:12 880', '2448817307946845161');
INSERT INTO `ai_stayopen_invoice` VALUES ('1131', '94b86150-4c10-11e9-b398-4fc14c43ca8a', '512345678900000040', 'xinds', '007', '0', '1', '2019-03-22 03:36:08 091', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1132', 'a9f1f700-4c12-11e9-91e2-4f2dd2b93e95', '51234567890010BWGF', 'ysczhongd', '007', '0', '1', '2019-03-22 03:51:09 658', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1133', '0ab0f690-4c13-11e9-89b5-cd6d10381237', '51234567890010BWGF', 'ysczhongd', '007', '0', '1', '2019-03-22 03:53:51 822', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1134', '0f4e5700-4c14-11e9-89b5-cd6d10381237', '51234567890010BWGF', 'ysczhongd', '007', '0', '1', '2019-03-22 04:01:09 302', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1135', '3679a730-4c14-11e9-85a8-9987e116e128', '51234567890010BWGF', 'ysczhongd', '007', '0', '1', '2019-03-22 04:02:11 695', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1136', '5a862b30-4c14-11e9-8121-fd0b12fb60ec', '51234567890010BWGF', 'ysczhongd', '007', '0', '1', '2019-03-22 04:03:17 640', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1137', '6c6cfe50-4c14-11e9-8121-fd0b12fb60ec', '51234567890010BWGF', 'ysczhongd', '007', '0', '1', '2019-03-22 04:03:48 284', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1138', '9547fa50-4c14-11e9-8121-fd0b12fb60ec', '51234567890010BWGF', 'ysczhongd', '007', '0', '1', '2019-03-22 04:04:57 379', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1139', 'b948e590-4c14-11e9-8121-fd0b12fb60ec', '90000000004BWGF', '499000151752', '007', '1', '1', '2019-03-22 04:05:59 418', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1140', '06c97140-4c15-11e9-85a8-9987e116e128', '51234567890010BWGF', 'ysczhongd', '007', '0', '1', '2019-03-22 04:07:57 181', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1141', 'cfb69f80-4f79-11e9-ac2b-3b44effa7a43', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-26 11:47:00 678', '1800019824448');
INSERT INTO `ai_stayopen_invoice` VALUES ('1142', '010f4480-5059-11e9-bbc3-513501ea0513', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-27 14:24:40 134', '1800019830202');
INSERT INTO `ai_stayopen_invoice` VALUES ('1143', '167c0a10-5059-11e9-bbc3-513501ea0513', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-27 14:25:16 036', '1800019830204');
INSERT INTO `ai_stayopen_invoice` VALUES ('1144', 'ea6c7a80-5059-11e9-9a74-f70619b1801f', '51234567890010BWGF', 'ysczhongd', '007', '0', '1', '2019-03-27 14:31:24 148', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1145', '80e71f60-505a-11e9-bbc3-513501ea0513', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-27 14:35:24 257', '1800019830481');
INSERT INTO `ai_stayopen_invoice` VALUES ('1146', '84f0c0c0-505a-11e9-bbc3-513501ea0513', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-27 14:35:30 852', '1800019830225');
INSERT INTO `ai_stayopen_invoice` VALUES ('1147', '7bc87240-505f-11e9-a4f1-cbae8c32096d', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-27 15:11:03 016', '1800019830290');
INSERT INTO `ai_stayopen_invoice` VALUES ('1148', '7d96c9a0-505f-11e9-a4f1-cbae8c32096d', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-27 15:11:06 008', '1800019830291');
INSERT INTO `ai_stayopen_invoice` VALUES ('1149', '80a1e6c0-505f-11e9-a4f1-cbae8c32096d', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-27 15:11:11 119', '1800019830549');
INSERT INTO `ai_stayopen_invoice` VALUES ('1150', '2fbd5310-5060-11e9-a4f1-cbae8c32096d', '51234567890010BWGF', 'dp8', '026', '0', '1', '2019-03-27 15:16:09 556', '2449326451623724009');
INSERT INTO `ai_stayopen_invoice` VALUES ('1151', 'ad19ea30-5060-11e9-a4f1-cbae8c32096d', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-27 15:19:35 210', '1800019830308');
INSERT INTO `ai_stayopen_invoice` VALUES ('1152', '0e43c410-5062-11e9-a4f1-cbae8c32096d', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-27 15:29:27 784', '1800019831329');
INSERT INTO `ai_stayopen_invoice` VALUES ('1153', '30e6cd00-5062-11e9-a4f1-cbae8c32096d', '11010120181019078', '499000153512', '007', '1', '1', '2019-03-27 15:30:30 169', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1154', '653ffc20-5062-11e9-a4f1-cbae8c32096d', '11010120181019078', '499000153512', '004', '1', '1', '2019-03-27 15:31:57 592', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1155', 'bf3d1820-5062-11e9-a4f1-cbae8c32096d', '11010120181019078', '499000153512', '007', '1', '1', '2019-03-27 15:34:30 271', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1156', '59a7e2f0-5063-11e9-a4f1-cbae8c32096d', '11010120181019078', '499000153512', '007', '1', '1', '2019-03-27 15:38:47 981', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1157', '9faa6700-5063-11e9-a4f1-cbae8c32096d', '11010120181019078', '499000153512', '007', '1', '1', '2019-03-27 15:40:47 227', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1158', '56a61f30-5064-11e9-a4f1-cbae8c32096d', '51234567890010BWGF', 'ysczhongd', '007', '0', '1', '2019-03-27 15:45:57 173', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1159', '75611880-5064-11e9-a4f1-cbae8c32096d', '51234567890010BWGF', 'ysczhongd', '007', '0', '1', '2019-03-27 15:46:50 323', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1160', '3bc81c80-5065-11e9-a4f1-cbae8c32096d', '11010120181019078', '499000153512', '007', '1', '1', '2019-03-27 15:52:17 026', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1161', '5c7f0ce0-5065-11e9-a4f1-cbae8c32096d', '11010120181019078', '499000153512', '007', '1', '1', '2019-03-27 15:53:13 077', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1162', '04a37be0-5066-11e9-a4f1-cbae8c32096d', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-27 15:57:49 604', '1800019831411');
INSERT INTO `ai_stayopen_invoice` VALUES ('1163', '1737f420-5066-11e9-a4f1-cbae8c32096d', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-27 15:58:26 707', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1164', '6f4067e0-506d-11e9-833b-6b2eaae74948', '51234567890010BWGF', 'ysczhongd', '007', '0', '1', '2019-03-27 16:51:04 057', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1165', '8dd27c70-506d-11e9-b32a-9d928c620ac1', '51234567890010BWGF', 'ysczhongd', '007', '0', '1', '2019-03-27 16:51:53 511', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1166', 'c478f6f0-506d-11e9-aef0-4b52e673f93d', '51234567890010BWGF', 'ysczhongd', '007', '0', '1', '2019-03-27 16:53:25 722', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1167', 'ed766f10-506d-11e9-9e1f-012ae1531676', '51234567890010BWGF', 'ysczhongd', '007', '0', '1', '2019-03-27 16:54:35 566', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1168', '032b1310-506e-11e9-9e1f-012ae1531676', '51234567890010BWGF', 'ysczhongd', '026', '0', '1', '2019-03-27 16:55:14 023', '2449332833945125865');
INSERT INTO `ai_stayopen_invoice` VALUES ('1169', '13a3c550-5070-11e9-8d18-af84e1238f82', '51234567890010BWGF', 'ysczhongd', '007', '0', '1', '2019-03-27 17:09:59 541', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1170', 'b572f540-5070-11e9-9c20-e9666d211e36', '51234567890010BWGF', 'ysczhongd', '007', '0', '1', '2019-03-27 17:14:40 699', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1171', 'cf667b70-5070-11e9-9c20-e9666d211e36', '51234567890010BWGF', 'ysczhongd', '007', '0', '1', '2019-03-27 17:15:10 352', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1172', '1d731a80-5071-11e9-9c20-e9666d211e36', '51234567890010BWGF', 'ysczhongd', '007', '0', '1', '2019-03-27 17:17:25 963', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1173', '3e564890-5101-11e9-9970-cbc42e03705f', '51234567890010BWGF', 'ysczhongd', '007', '0', '1', '2019-03-28 10:29:07 655', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1174', 'c16e1090-5120-11e9-8cf7-b701be5c8c01', '90000000004BWGF', '499000151752', '007', '1', '1', '2019-03-28 14:14:38 219', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1175', 'f1e04180-5120-11e9-8cf7-b701be5c8c01', '90000000004BWGF', '499000151752', '004', '1', '1', '2019-03-28 14:15:59 271', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1176', '48900740-5121-11e9-8cf7-b701be5c8c01', '90000000004BWGF', '499000151752', '007', '1', '1', '2019-03-28 14:18:25 110', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1177', '7eb60720-5121-11e9-8cf7-b701be5c8c01', '90000000004BWGF', '499000151752', '007', '1', '1', '2019-03-28 14:19:55 602', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1178', 'a607cb10-5121-11e9-8cf7-b701be5c8c01', '90000000004BWGF', '499000151752', '007', '1', '1', '2019-03-28 14:21:01 900', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1179', 'f780eab0-512d-11e9-bb75-23308fe08075', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-28 15:49:06 812', '1800019836718');
INSERT INTO `ai_stayopen_invoice` VALUES ('1180', '8f595560-512f-11e9-b48f-754f52dfc293', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-28 16:00:31 052', '1800019837533');
INSERT INTO `ai_stayopen_invoice` VALUES ('1181', '373856f0-5130-11e9-8388-7d5d2717e183', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-28 16:05:12 716', '1800019836752');
INSERT INTO `ai_stayopen_invoice` VALUES ('1182', 'c5fadf20-5135-11e9-a018-3f57606ef2f0', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-28 16:45:36 002', '1800019836844');
INSERT INTO `ai_stayopen_invoice` VALUES ('1183', '0032bdc0-5136-11e9-a018-3f57606ef2f0', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-28 16:46:37 342', '1800019836846');
INSERT INTO `ai_stayopen_invoice` VALUES ('1184', '312e1be0-5136-11e9-a018-3f57606ef2f0', '11010120181019078', '499000153512', '007', '1', '1', '2019-03-28 16:48:09 004', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1185', 'a9d0c670-51d0-11e9-9e32-e148f72133bc', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-29 11:13:44 786', '1800019842231');
INSERT INTO `ai_stayopen_invoice` VALUES ('1186', 'ca35ed50-51d0-11e9-9e32-e148f72133bc', '11010120181019078', '499000153512', '007', '1', '1', '2019-03-29 11:14:54 134', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1187', 'fdc786b0-51d0-11e9-9e32-e148f72133bc', '11010120181019078', '499000153512', '007', '1', '1', '2019-03-29 11:16:28 327', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1188', '049a8140-51d1-11e9-9e32-e148f72133bc', '11010120181019078', '499000153512', '007', '1', '1', '2019-03-29 11:16:54 742', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1189', '527dc660-51d1-11e9-9e32-e148f72133bc', '11010120181019078', '499000153512', '007', '1', '1', '2019-03-29 11:18:42 088', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1190', 'c90e19b0-51d1-11e9-9e32-e148f72133bc', '11010120181019078', '499000153512', '007', '1', '1', '2019-03-29 11:22:06 187', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1191', '3bfb6d20-5208-11e9-836f-f11a3a586716', '11010120181019078', '499000153512', '026', '1', '1', '2019-03-29 17:51:35 450', '1800019843205');
INSERT INTO `ai_stayopen_invoice` VALUES ('1192', '37e06330-5514-11e9-bdab-632e0303e483', '11010120181019078', '499000153512', '026', '1', '1', '2019-04-02 14:54:51 815', '1800019865674');
INSERT INTO `ai_stayopen_invoice` VALUES ('1193', '5c4651d0-5514-11e9-bdab-632e0303e483', '11010120181019078', '499000153512', '026', '1', '1', '2019-04-02 14:55:52 823', '1800019865688');
INSERT INTO `ai_stayopen_invoice` VALUES ('1194', '1555caa0-551c-11e9-b2c5-a16929c4e50e', '11010120181019078', '499000153512', '026', '1', '1', '2019-04-02 15:51:09 839', '1800019866605');
INSERT INTO `ai_stayopen_invoice` VALUES ('1195', '2157d3c0-551c-11e9-b2c5-a16929c4e50e', '11010120181019078', '499000153512', '026', '1', '1', '2019-04-02 15:51:29 935', '1800019866610');
INSERT INTO `ai_stayopen_invoice` VALUES ('1196', 'b2451d70-551c-11e9-b2c5-a16929c4e50e', '11010120181019078', '499000153512', '026', '1', '1', '2019-04-02 15:55:33 060', '1800019867552');
INSERT INTO `ai_stayopen_invoice` VALUES ('1197', 'cb24e9b0-551c-11e9-ad29-77c6a84889b0', '11010120181019078', '499000153512', '026', '1', '1', '2019-04-02 15:56:14 863', '1800019866680');
INSERT INTO `ai_stayopen_invoice` VALUES ('1198', '6efb9780-551f-11e9-ad29-77c6a84889b0', '11010120181019078', '499000153512', '026', '1', '1', '2019-04-02 16:15:08 734', '1800019867837');
INSERT INTO `ai_stayopen_invoice` VALUES ('1199', '72d32c60-551f-11e9-ad29-77c6a84889b0', '11010120181019078', '499000153512', '026', '1', '1', '2019-04-02 16:15:15 114', '1800019866973');
INSERT INTO `ai_stayopen_invoice` VALUES ('1200', '5913ce30-5522-11e9-ad29-77c6a84889b0', '11010120181019078', '499000153512', '026', '1', '1', '2019-04-02 16:36:00 490', '1800019868152');
INSERT INTO `ai_stayopen_invoice` VALUES ('1201', 'db7a6940-552e-11e9-92ee-1b9bdd6acb5a', '11010120181019078', '499000153512', '026', '1', '1', '2019-04-02 18:05:33 202', '1800019870595');
INSERT INTO `ai_stayopen_invoice` VALUES ('1202', 'edea90a0-552e-11e9-92ee-1b9bdd6acb5a', '11010120181019078', '499000153512', '007', '1', '1', '2019-04-02 18:06:07 573', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1203', 'a49ff100-552f-11e9-92ee-1b9bdd6acb5a', '11010120181019078', '499000153512', '007', '1', '1', '2019-04-02 18:11:14 793', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1204', '9273d2e0-55b0-11e9-92ee-1b9bdd6acb5a', '11010120181019078', '499000153512', '026', '1', '1', '2019-04-03 09:34:07 266', '1800019876951');
INSERT INTO `ai_stayopen_invoice` VALUES ('1205', 'dfed32a0-55b0-11e9-92ee-1b9bdd6acb5a', '11010120181019078', '499000153512', '026', '1', '1', '2019-04-03 09:36:21 908', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1206', 'eedaea00-55b0-11e9-92ee-1b9bdd6acb5a', '11010120181019078', '499000153512', '007', '1', '1', '2019-04-03 09:36:45 882', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1207', '70b31e30-55b1-11e9-92ee-1b9bdd6acb5a', '11010120181019078', '499000153512', '007', '1', '1', '2019-04-03 09:40:24 547', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1208', '62baa6d0-55b2-11e9-92ee-1b9bdd6acb5a', '11010120181019078', '499000153512', '004', '1', '1', '2019-04-03 09:47:09 813', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1209', 'a7cfbda0-55b2-11e9-92ee-1b9bdd6acb5a', '11010120181019078', '499000153512', '026', '1', '0', '2019-04-03 09:49:02 193', '1800019877632');
INSERT INTO `ai_stayopen_invoice` VALUES ('1210', '283fa7e0-55b6-11e9-adab-fb930416e845', '11010120181019078', '499000153512', '026', '1', '1', '2019-04-03 10:14:06 118', '1800019877110');
INSERT INTO `ai_stayopen_invoice` VALUES ('1211', 'd146aeb0-55b6-11e9-adab-fb930416e845', '11010120181019078', '499000153512', '026', '1', '1', '2019-04-03 10:18:50 213', '1800019877123');
INSERT INTO `ai_stayopen_invoice` VALUES ('1212', 'ee3cc680-55b6-11e9-adab-fb930416e845', '11010120181019078', '499000153512', '007', '1', '1', '2019-04-03 10:19:42 050', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1213', 'f5cb8fa0-55b9-11e9-adab-fb930416e845', '11010120181019078', '499000153512', '026', '1', '1', '2019-04-03 10:41:19 453', '1800019877200');
INSERT INTO `ai_stayopen_invoice` VALUES ('1214', 'f90b5150-55b9-11e9-adab-fb930416e845', '11010120181019078', '499000153512', '026', '1', '1', '2019-04-03 10:41:24 869', '1800019877827');
INSERT INTO `ai_stayopen_invoice` VALUES ('1215', '20a28d40-55bb-11e9-adab-fb930416e845', '11010120181019078', '499000153512', '026', '1', '1', '2019-04-03 10:49:40 801', '1800019877853');
INSERT INTO `ai_stayopen_invoice` VALUES ('1216', '2e775a90-55bb-11e9-adab-fb930416e845', '11010120181019078', '499000153512', '007', '1', '1', '2019-04-03 10:50:07 620', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1217', '8f232170-55d5-11e9-adab-fb930416e845', '11010120181019078', '499000153512', '007', '1', '1', '2019-04-03 13:58:57 041', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1218', 'd4b668f0-55d5-11e9-9af1-f96a03b7a162', '11010120181019078', '499000153512', '007', '1', '1', '2019-04-03 14:00:52 819', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1219', 'f14fbac0-55d5-11e9-9af1-f96a03b7a162', '11010120181019078', '499000153512', '004', '1', '1', '2019-04-03 14:01:40 897', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1220', '1d0d6020-55dd-11e9-9e71-e7887aafca14', '11010120181019078', '499000153512', '026', '1', '1', '2019-04-03 14:52:57 129', '1800019881696');
INSERT INTO `ai_stayopen_invoice` VALUES ('1221', '299bcac0-55dd-11e9-9e71-e7887aafca14', '11010120181019078', '499000153512', '007', '1', '1', '2019-04-03 14:53:21 749', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1222', '91bda8d0-55dd-11e9-9e71-e7887aafca14', '11010120181019078', '499000153512', '004', '1', '1', '2019-04-03 14:56:22 781', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1223', 'ec9fa690-55dd-11e9-9e71-e7887aafca14', '11010120181019078', '499000153512', '007', '1', '1', '2019-04-03 14:58:49 002', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1224', 'fe3880c0-55dd-11e9-9e71-e7887aafca14', '11010120181019078', '499000153512', '007', '1', '1', '2019-04-03 14:59:18 588', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1225', '156d5c20-55de-11e9-9e71-e7887aafca14', '11010120181019078', '499000153512', '007', '1', '1', '2019-04-03 14:59:57 304', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1226', '3c5d5100-55de-11e9-9e71-e7887aafca14', '11010120181019078', '499000153512', '007', '1', '1', '2019-04-03 15:01:03 766', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1227', '43821fa0-55df-11e9-9e71-e7887aafca14', '11010120181019078', '499000153512', '026', '1', '1', '2019-04-03 15:08:25 414', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1228', '2dfaf200-5b76-11e9-9acb-7bee79202a7a', '11010120181019078', '499000153512', '007', '1', '1', '2019-04-10 17:51:19 098', '');
INSERT INTO `ai_stayopen_invoice` VALUES ('1229', '3cc47f90-5b76-11e9-9acb-7bee79202a7a', '11010120181019078', '499000153512', '026', '1', '1', '2019-04-10 17:51:39 599', '1800019940614');
INSERT INTO `ai_stayopen_invoice` VALUES ('1230', '05fd0e10-7c7c-11e9-8d54-a3bdfb719e22', '915201030630590GY', '499000166647', '026', '1', '1', '2019-05-22 18:26:14 749', '1800020728279');
INSERT INTO `ai_stayopen_invoice` VALUES ('1231', '4814ff90-7c7e-11e9-bc1f-11aa5130946a', '915201030630590GY', '499000166647', '026', '1', '1', '2019-05-22 18:42:23 537', '1800020729420');
INSERT INTO `ai_stayopen_invoice` VALUES ('1232', '8f9c00c0-7c7e-11e9-bc1f-11aa5130946a', '915201030630590GY', '499000166647', '026', '1', '1', '2019-05-22 18:44:23 980', '1800020729422');
INSERT INTO `ai_stayopen_invoice` VALUES ('1233', '75dcbf10-7c80-11e9-83c4-19de482147e4', '915201030630590GY', '499000166647', '026', '1', '0', '2019-05-22 18:58:00 072', '1800020729562');
INSERT INTO `ai_stayopen_invoice` VALUES ('1234', '041ead80-7cf2-11e9-9190-ab4d80454a37', '915201030630590GY', '499000166647', '026', '1', '0', '2019-05-23 08:30:51 530', '1800020743709');
INSERT INTO `ai_stayopen_invoice` VALUES ('1235', 'a7b07500-7cf2-11e9-9190-ab4d80454a37', '915201030630590GY', '499000166647', '026', '1', '0', '2019-05-23 08:35:26 364', '1800020743747');
INSERT INTO `ai_stayopen_invoice` VALUES ('1236', '07a721e0-7cfb-11e9-8438-fb7e32c4de33', '915201030630590GY', '499000166647', '026', '1', '0', '2019-05-23 09:35:22 947', '1800020744245');
INSERT INTO `ai_stayopen_invoice` VALUES ('1237', 'c9423130-7d43-11e9-9c67-1f6934acec21', '91520103063059002', '499000140797', '026', '1', '1', '2019-05-23 18:16:11 832', '1800020753853');
INSERT INTO `ai_stayopen_invoice` VALUES ('1238', 'f3ed9440-7def-11e9-8edd-99a86bf6159b', '91520103063059002', '499000140797', '026', '1', '0', '2019-05-24 14:48:36 858', '1800020776520');
INSERT INTO `ai_stayopen_invoice` VALUES ('1239', '07638820-803b-11e9-9b84-4950a8f5a55b', '915201030630590GY', '499000166647', '026', '1', '1', '2019-05-27 12:51:03 177', '1800020835340');
INSERT INTO `ai_stayopen_invoice` VALUES ('1240', '167e9110-803b-11e9-9b84-4950a8f5a55b', '915201030630590GY', '499000166647', '026', '1', '0', '2019-05-27 12:51:28 566', '1800020834650');
INSERT INTO `ai_stayopen_invoice` VALUES ('1241', '81b42360-81de-11e9-b0df-818c3a4cddcc', '512345678900000040', '40all', '026', '0', '0', '2019-05-29 14:53:47 692', '2455169603208216878');
INSERT INTO `ai_stayopen_invoice` VALUES ('1242', '8ce56f00-81de-11e9-b0df-818c3a4cddcc', '512345678900000040', '40all', '026', '0', '0', '2019-05-29 14:54:06 442', '2455169623610360216');
INSERT INTO `ai_stayopen_invoice` VALUES ('1243', '6f20f870-85b4-11e9-9613-8fe2a2f78480', '91520103063059002', '499000140797', '026', '1', '1', '2019-06-03 12:02:41 548', '1800020875322');
INSERT INTO `ai_stayopen_invoice` VALUES ('1244', '04330770-85c7-11e9-b086-11984086bd31', '91520103063059002', '499000140797', '026', '1', '1', '2019-06-03 14:15:44 776', '1800020875475');
INSERT INTO `ai_stayopen_invoice` VALUES ('1245', '32846510-8694-11e9-adb6-3181456ea886', '90000000041BWGF', '499000151971', '026', '1', '1', '2019-06-04 14:44:27 406', '1800020878573');
INSERT INTO `ai_stayopen_invoice` VALUES ('1246', 'abcb9b00-8694-11e9-adb6-3181456ea886', '90000000041BWGF', '499000151971', '026', '1', '0', '2019-06-04 14:47:50 883', '1800020878182');
INSERT INTO `ai_stayopen_invoice` VALUES ('1247', '3bd7e470-869e-11e9-adb6-3181456ea886', '90000000041BWGF', '499000151971', '026', '1', '0', '2019-06-04 15:56:18 616', '1800020878291');
INSERT INTO `ai_stayopen_invoice` VALUES ('1248', '50667f00-869e-11e9-adb6-3181456ea886', '90000000041BWGF', '499000151971', '026', '1', '1', '2019-06-04 15:56:52 592', '1800020878666');
INSERT INTO `ai_stayopen_invoice` VALUES ('1249', 'e14024f0-8733-11e9-adb6-3181456ea886', '90000000041BWGF', '499000151971', '026', '1', '0', '2019-06-05 09:47:30 689', '1800020880978');
INSERT INTO `ai_stayopen_invoice` VALUES ('1250', '69355f40-8736-11e9-adb6-3181456ea886', '90000000041BWGF', '499000151971', '026', '1', '0', '2019-06-05 10:05:37 597', '1800020881009');
INSERT INTO `ai_stayopen_invoice` VALUES ('1251', '8d048c20-8736-11e9-adb6-3181456ea886', '90000000041BWGF', '499000151971', '026', '1', '1', '2019-06-05 10:06:37 635', '1800020881010');
INSERT INTO `ai_stayopen_invoice` VALUES ('1252', '169cf9b0-873a-11e9-adb6-3181456ea886', '90000000041BWGF', '499000151971', '026', '1', '1', '2019-06-05 10:31:57 048', '1800020881044');
INSERT INTO `ai_stayopen_invoice` VALUES ('1253', 'dc5140f0-8765-11e9-adb6-3181456ea886', '90000000041BWGF', '499000151971', '026', '1', '0', '2019-06-05 15:45:17 116', '1800020882027');
INSERT INTO `ai_stayopen_invoice` VALUES ('1254', 'a16074b0-8838-11e9-876f-edfa0cebcc4e', '91520103063059002', '499000140797', '026', '1', '0', '2019-06-06 16:54:02 765', '1800020885258');
INSERT INTO `ai_stayopen_invoice` VALUES ('1255', '1a6dfd00-8839-11e9-876f-edfa0cebcc4e', '91520103063059002', '499000140797', '026', '1', '1', '2019-06-06 16:57:25 812', '1800020885266');
INSERT INTO `ai_stayopen_invoice` VALUES ('1256', 'e8bd5110-8a87-11e9-a9b4-efc94783b9a4', '91520103063059002', '499000140797', '026', '1', '0', '2019-06-09 15:26:34 998', '1800020893289');
INSERT INTO `ai_stayopen_invoice` VALUES ('1257', '7b2e13e0-8bf0-11e9-a60d-d902f824f128', '91520103063059002', '499000140797', '026', '1', '1', '2019-06-11 10:27:39 983', '1800020899230');
INSERT INTO `ai_stayopen_invoice` VALUES ('1258', '3782ea50-8c11-11e9-af42-1b2a3d77fb68', '90000000004BWGF', '499000151752', '026', '1', '1', '2019-06-11 14:22:00 589', '1800020900512');
INSERT INTO `ai_stayopen_invoice` VALUES ('1259', '044fa0e0-8cfe-11e9-8bb4-1fafaf1d3e1c', '91520103063059002', '499000140797', '026', '1', '0', '2019-06-12 18:37:04 538', '1800020910380');
INSERT INTO `ai_stayopen_invoice` VALUES ('1260', '3648bff0-8cfe-11e9-8bb4-1fafaf1d3e1c', '91520103063059002', '499000140797', '026', '1', '1', '2019-06-12 18:38:28 311', '1800020910381');
INSERT INTO `ai_stayopen_invoice` VALUES ('1261', '87ac9350-8d8d-11e9-851f-d5ea57222fae', '91520103063059002', '499000140797', '026', '1', '0', '2019-06-13 11:44:23 095', '1800020912173');
INSERT INTO `ai_stayopen_invoice` VALUES ('1262', 'f84f4300-8d8d-11e9-851f-d5ea57222fae', '91520103063059002', '499000140797', '026', '1', '0', '2019-06-13 11:47:31 612', '1800020912182');
INSERT INTO `ai_stayopen_invoice` VALUES ('1263', '96ca8d20-8e77-11e9-a022-7d61b9f5e251', '91520103063059002', '499000140797', '026', '1', '0', '2019-06-14 15:39:50 116', '1800020917622');
INSERT INTO `ai_stayopen_invoice` VALUES ('1264', '3a982030-b9dd-11e9-b511-57361abbb8f5', '512345678900000040', 'ceshi40dp', '026', '0', '1', '2019-08-08 21:05:44 976', '2461780326700024809');
INSERT INTO `ai_stayopen_invoice` VALUES ('1265', 'ee8770d0-b9df-11e9-bc3a-057c0279121d', '512345678900000040', 'ceshi40dp', '026', '0', '1', '2019-08-08 21:25:05 700', '2461781573314282473');
INSERT INTO `ai_stayopen_invoice` VALUES ('1266', '0e887eb0-b9e0-11e9-bc3a-057c0279121d', '512345678900000040', 'ceshi40dp', '026', '0', '1', '2019-08-08 21:25:58 745', '2461781630222599145');
INSERT INTO `ai_stayopen_invoice` VALUES ('1267', '1a5965b0-b9e0-11e9-bc3a-057c0279121d', '512345678900000040', 'ceshi40dp', '026', '0', '1', '2019-08-08 21:26:18 628', '2461781651697435625');
INSERT INTO `ai_stayopen_invoice` VALUES ('1268', '43033f90-b9e0-11e9-bc3a-057c0279121d', '512345678900000040', 'ceshi40dp', '026', '0', '1', '2019-08-08 21:27:26 793', '2461781724711879657');
INSERT INTO `ai_stayopen_invoice` VALUES ('1269', '8711bbd0-b9e0-11e9-bc3a-057c0279121d', '512345678900000040', 'ceshi40dp', '026', '0', '0', '2019-08-08 21:29:21 654', '2461781848192189418');
INSERT INTO `ai_stayopen_invoice` VALUES ('1270', 'c5f74400-b9e0-11e9-bc3a-057c0279121d', '512345678900000040', 'ceshi40dp', '026', '0', '1', '2019-08-08 21:31:06 494', '2461781960935080938');
INSERT INTO `ai_stayopen_invoice` VALUES ('1271', '83d14bf0-b9e2-11e9-bc3a-057c0279121d', '512345678900000040', 'ceshi40dp', '026', '0', '1', '2019-08-08 21:43:34 659', '2461782764093965290');
INSERT INTO `ai_stayopen_invoice` VALUES ('1272', 'a303a2b0-b9e3-11e9-bc3a-057c0279121d', '512345678900000040', 'ceshi40dp', '026', '0', '1', '2019-08-08 21:51:36 400', '2461783281637524457');
INSERT INTO `ai_stayopen_invoice` VALUES ('1273', 'ca15a910-b9e4-11e9-bc3a-057c0279121d', '512345678900000040', 'ceshi40dp', '026', '0', '1', '2019-08-08 21:59:51 501', '2461783813139727337');
INSERT INTO `ai_stayopen_invoice` VALUES ('1274', '0d41c9b0-b9e7-11e9-8b76-43114eba48f8', '512345678900000040', 'ceshi40dp', '026', '0', '0', '2019-08-08 22:16:03 302', '2461784856816780266');
INSERT INTO `ai_stayopen_invoice` VALUES ('1275', '99ff26e0-ba4b-11e9-b600-db8436550ff8', '512345678900000040', 'ceshi40dp', '026', '0', '1', '2019-08-09 10:15:51 391', '2461831228504933354');
INSERT INTO `ai_stayopen_invoice` VALUES ('1276', '49555240-ba4c-11e9-b600-db8436550ff8', '512345678900000040', 'ceshi40dp', '026', '0', '1', '2019-08-09 10:20:43 193', '2461831542037545962');
INSERT INTO `ai_stayopen_invoice` VALUES ('1277', 'fdb13240-ba4c-11e9-b600-db8436550ff8', '512345678900000040', 'ceshi40dp', '026', '0', '1', '2019-08-09 10:25:46 341', '2461831867381318634');
INSERT INTO `ai_stayopen_invoice` VALUES ('1278', '42473890-ba4e-11e9-be28-0f00f4549523', '512345678900000040', 'ceshi40dp', '026', '0', '1', '2019-08-09 10:34:51 379', '2461832453644354538');
INSERT INTO `ai_stayopen_invoice` VALUES ('1279', 'fff989b0-ba4e-11e9-be28-0f00f4549523', '512345678900000040', 'ceshi40dp', '026', '0', '1', '2019-08-09 10:40:09 327', '2461832795094254570');
INSERT INTO `ai_stayopen_invoice` VALUES ('1280', '3e8cc7a0-ba59-11e9-be28-0f00f4549523', '36996300000000211', '499000153782', '026', '0', '0', '2019-08-09 11:53:32 419', '2461837521705763818');
INSERT INTO `ai_stayopen_invoice` VALUES ('1281', '84bdfcd0-ba59-11e9-be28-0f00f4549523', '36996300000000211', '499000153782', '026', '0', '1', '2019-08-09 11:55:30 165', '2461837649481040873');
INSERT INTO `ai_stayopen_invoice` VALUES ('1282', 'f2126be0-ba59-11e9-be28-0f00f4549523', '36996300000000211', '499000153782', '026', '0', '1', '2019-08-09 11:58:30 052', '2461837841680827370');
INSERT INTO `ai_stayopen_invoice` VALUES ('1283', '197c0b50-ba5f-11e9-be28-0f00f4549523', '36996300000000211', '499000153782', '026', '0', '1', '2019-08-09 12:35:24 342', '2461840220018967530');
INSERT INTO `ai_stayopen_invoice` VALUES ('1284', 'c323ad00-ba61-11e9-be28-0f00f4549523', '36996300000000211', '499000153782', '026', '0', '1', '2019-08-09 12:54:28 663', '2461841448379614186');
INSERT INTO `ai_stayopen_invoice` VALUES ('1285', 'd174af30-ba61-11e9-be28-0f00f4549523', '36996300000000211', '499000153782', '026', '0', '0', '2019-08-09 12:54:50 511', '2461841472001934314');
INSERT INTO `ai_stayopen_invoice` VALUES ('1286', '4d1342a0-ba62-11e9-a4ae-9da24cc89bde', '36996300000000211', '499000153782', '026', '0', '1', '2019-08-09 12:58:18 484', '2461841695340233705');
INSERT INTO `ai_stayopen_invoice` VALUES ('1287', '76bdb810-ba6c-11e9-bad2-d5b62a1806a1', '36996300000000211', '499000153782', '026', '0', '1', '2019-08-09 14:11:03 628', '2461846382223295466');
INSERT INTO `ai_stayopen_invoice` VALUES ('1288', 'dbceb730-ba6d-11e9-bad2-d5b62a1806a1', '36996300000000211', '499000153782', '026', '0', '1', '2019-08-09 14:21:02 900', '2461847025394648041');
INSERT INTO `ai_stayopen_invoice` VALUES ('1289', 'e9d62d40-ba6d-11e9-bad2-d5b62a1806a1', '36996300000000211', '499000153782', '026', '0', '0', '2019-08-09 14:21:26 069', '2461847050090709993');
INSERT INTO `ai_stayopen_invoice` VALUES ('1290', '644ac730-ba90-11e9-bad2-d5b62a1806a1', '36996300000000211', '499000153782', '026', '0', '1', '2019-08-09 18:28:16 421', '2461862952207123433');
INSERT INTO `ai_stayopen_invoice` VALUES ('1291', 'eba1ecc0-ba92-11e9-bad2-d5b62a1806a1', '36996300000000211', '499000153782', '026', '0', '1', '2019-08-09 18:46:21 284', '2461864117217002473');
INSERT INTO `ai_stayopen_invoice` VALUES ('1292', '6b17d2f0-c8b5-11e9-8747-3dfcfffff71f', '512345678900000040', 'ceshi40', '026', '0', '1', '2019-08-27 18:28:37 346', '2463532859114128362');

-- ----------------------------
-- Table structure for ai_sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `ai_sys_dict`;
CREATE TABLE `ai_sys_dict` (
  `D_ID` bigint(11) NOT NULL AUTO_INCREMENT,
  `DICT_ID` varchar(50) NOT NULL COMMENT '字典ID',
  `DICT_NAME` varchar(50) NOT NULL COMMENT '字典名称',
  `DICT_FLD` varchar(50) NOT NULL COMMENT '字典值',
  `DICT_DISP` varchar(50) NOT NULL COMMENT '字典显示名称',
  `ORDER_ID` bigint(11) NOT NULL COMMENT '排序字段',
  `DISP_STATUS` int(1) NOT NULL DEFAULT '1' COMMENT '显示状态',
  `IS_VALID` int(1) NOT NULL DEFAULT '1' COMMENT '是否有效：0无效，1有效\r是否有效：0无效，1有效\r',
  `UPDATE_TIME` datetime DEFAULT NULL,
  `UPDATE_USER_ID` varchar(20) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATE_USER_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`D_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='系统字典表';

-- ----------------------------
-- Records of ai_sys_dict
-- ----------------------------
INSERT INTO `ai_sys_dict` VALUES ('1', 'conn', '一般纳税人', '01', '纳税人性质', '1', '1', '1', null, null, null, null);
INSERT INTO `ai_sys_dict` VALUES ('2', 'nsrxz', '转登记纳税人', '05', '纳税人性质', '2', '1', '1', null, null, null, null);
INSERT INTO `ai_sys_dict` VALUES ('3', 'nsrxz', '小规模纳税人', '08', '纳税人性质', '3', '1', '1', null, null, null, null);
INSERT INTO `ai_sys_dict` VALUES ('4', 'tlqy', '非铁路相关纳税人', '00', '铁路企业', '1', '1', '1', null, null, null, null);
INSERT INTO `ai_sys_dict` VALUES ('5', 'tlqy', '铁道部集中缴纳纳税人', '01', '铁路企业', '2', '1', '1', null, null, null, null);
INSERT INTO `ai_sys_dict` VALUES ('6', 'tlqy', '跨省合资铁路企业纳税人', '02', '铁路企业', '3', '1', '1', null, null, null, null);
INSERT INTO `ai_sys_dict` VALUES ('7', 'sgqy', '农产品销售收购企业', '00', '收购企业', '1', '1', '1', null, null, null, null);
INSERT INTO `ai_sys_dict` VALUES ('8', 'sgqy', '收购企业', '01', '收购企业', '2', '1', '1', null, null, null, null);
INSERT INTO `ai_sys_dict` VALUES ('9', 'sgqy', '销售企业', '02', '收购企业', '3', '1', '1', null, null, null, null);
INSERT INTO `ai_sys_dict` VALUES ('10', 'sgqy', '销售、收购企业', '03', '收购企业', '4', '1', '1', null, null, null, null);
INSERT INTO `ai_sys_dict` VALUES ('11', 'ssflbmhz', '非特殊行业纳税人', '00', '开具税收分类编码汇总项', '1', '1', '1', null, null, null, null);
INSERT INTO `ai_sys_dict` VALUES ('12', 'ssflbmhz', '电信业特殊纳税人', '01', '开具税收分类编码汇总项', '2', '1', '1', null, null, null, null);
INSERT INTO `ai_sys_dict` VALUES ('13', 'cpylx', '非成品油企业', '00', '成品油企业类型', '1', '1', '1', null, null, null, null);
INSERT INTO `ai_sys_dict` VALUES ('14', 'cpylx', '成品油生产企业', '01', '成品油企业类型', '2', '1', '1', null, null, null, null);
INSERT INTO `ai_sys_dict` VALUES ('15', 'cpylx', '成品油经销企业', '02', '成品油企业类型', '3', '1', '1', null, null, null, null);
INSERT INTO `ai_sys_dict` VALUES ('16', 'esclx', '非二手车企业', '00', '二手车企业类型', '1', '1', '1', null, null, null, null);
INSERT INTO `ai_sys_dict` VALUES ('17', 'esclx', '经营单位', '01', '二手车企业类型', '2', '1', '1', null, null, null, null);
INSERT INTO `ai_sys_dict` VALUES ('18', 'esclx', '拍卖单位', '02', '二手车企业类型', '3', '1', '1', null, null, null, null);
INSERT INTO `ai_sys_dict` VALUES ('19', 'esclx', '二手车市场', '03', '二手车企业类型', '4', '1', '1', null, null, null, null);
