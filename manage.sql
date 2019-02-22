/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1_3306
Source Server Version : 50723
Source Host           : 127.0.0.1:3306
Source Database       : manage

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2019-02-22 17:29:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for articles
-- ----------------------------
DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文章标题',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT '文章简介',
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文章封面',
  `click` int(11) NOT NULL DEFAULT '0' COMMENT '文章点击量',
  `publish_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文章发布时间',
  `author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '作者,程序默认存储登录用户',
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文章内容',
  `is_wechat` int(11) DEFAULT '1' COMMENT '检测是否是微信浏览器  1检测 0不检测',
  `is_jump` int(11) DEFAULT '1' COMMENT '开启随机跳转 1开启 0不开启',
  `arrow` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '点击文章内部箭头返回地址',
  `physics` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '物理按键点击返回',
  `music` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '背景音乐地址',
  `appid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '微信appId',
  `key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '微信密匙',
  `right_now` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '网站立即跳转到指定地址',
  `cnzz` text COLLATE utf8mb4_unicode_ci COMMENT '文章流量统计',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_encryption` tinyint(1) DEFAULT NULL,
  `iframe` tinyint(1) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `source_check` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of articles
-- ----------------------------
INSERT INTO `articles` VALUES ('1', '1', null, null, '0', '2019-02-12 05:58:52', 'ALG', '<p>1</p>', '1', '1', null, null, null, null, null, null, null, '2019-02-12 11:42:19', null, '0', '1', '1');

-- ----------------------------
-- Table structure for authorities
-- ----------------------------
DROP TABLE IF EXISTS `authorities`;
CREATE TABLE `authorities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL COMMENT '所属菜单分类',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '权限名称',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '权限描述',
  `keyword` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '权限标识',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型：{0:接口,1:前端路由}',
  `default` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型：{0:不选中,1:默认选中,2:强制选中}',
  `extented` text COLLATE utf8mb4_unicode_ci COMMENT '权限扩展配置',
  `sort` smallint(6) NOT NULL DEFAULT '1000' COMMENT '排序',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of authorities
-- ----------------------------
INSERT INTO `authorities` VALUES ('1', '2', '菜单管理', '对菜单的所有权限控制', 'menu_all_controller', '1', '0', '{\"type\": true,\r\n                            \"data\": [{\r\n                                \"value\": \"add\",\r\n                                \"label\": \"添加\"\r\n                            }, {\r\n                                \"value\": \"edit\",\r\n                                \"label\": \"编辑\"\r\n                            }, {\r\n                                \"value\": \"delete\",\r\n                                \"label\": \"删除\"\r\n                            }]\r\n                        }', '1000', '2018-11-26 09:42:57', '2018-11-26 09:42:57');
INSERT INTO `authorities` VALUES ('2', '4', '角色管理', '角色的全部控制权限', 'role_all_controller', '1', '0', '{\"type\": true,\r\n                            \"data\": [{\r\n                                \"value\": \"add\",\r\n                                \"label\": \"添加\"\r\n                            }, {\r\n                                \"value\": \"edit\",\r\n                                \"label\": \"编辑\"\r\n                            }, {\r\n                                \"value\": \"delete\",\r\n                                \"label\": \"删除\"\r\n                            }]\r\n                        }', '1000', '2018-11-26 09:42:57', '2018-11-26 09:42:57');
INSERT INTO `authorities` VALUES ('3', '5', '用户管理', '用户的全部控制权限', 'user_all_controller', '1', '0', '{\"type\": true,\n                            \"data\": [{\n                                \"value\": \"add\",\n                                \"label\": \"添加\"\n                            }, {\n                                \"value\": \"edit\",\n                                \"label\": \"编辑\"\n                            }, {\n                                \"value\": \"delete\",\n                                \"label\": \"删除\"\n                            }, {\n                                \"value\": \"disable\",\n                                \"label\": \"禁用用户\"\n                            }, {\n                                \"value\": \"userGiveRole\",\n                                \"label\": \"给予用户权限\"\n                            }, {\n                                \"value\": \"editUserRole\",\n                                \"label\": \"编辑用户权限\"\n                            }]\n                        }', '1000', '2018-11-26 09:42:57', '2019-02-07 06:25:22');
INSERT INTO `authorities` VALUES ('4', '6', '权限管理', '权限的全部控制权限', 'auth_all_controller', '1', '0', '{\"type\": true,\r\n                            \"data\": [{\r\n                                \"value\": \"add\",\r\n                                \"label\": \"添加\"\r\n                            }, {\r\n                                \"value\": \"edit\",\r\n                                \"label\": \"编辑\"\r\n                            }, {\r\n                                \"value\": \"delete\",\r\n                                \"label\": \"删除\"\r\n                            }]\r\n                        }', '1000', '2018-11-26 09:42:57', '2018-11-26 09:42:57');
INSERT INTO `authorities` VALUES ('5', '8', '内容管理', '文章的全部控制权限', 'article_all_controller', '1', '0', '{\"type\": true,\n                            \"data\": [{\n                                \"value\": \"add\",\n                                \"label\": \"添加\"\n                            }, {\n                                \"value\": \"edit\",\n                                \"label\": \"编辑\"\n                            }, {\n                                \"value\": \"delete\",\n                                \"label\": \"删除\"\n                            }, {\n                                \"value\": \"url\",\n                                \"label\": \"文章链接\"\n                            }]\n                        }', '1000', '2018-11-26 09:42:57', '2019-02-12 06:07:07');
INSERT INTO `authorities` VALUES ('6', '9', '内容回收', '文章回收站的全部控制权限', 'recovery_all_controller', '1', '0', '{\"type\": true,\r\n                            \"data\": [{\r\n                                \"value\": \"add\",\r\n                                \"label\": \"添加\"\r\n                            }, {\r\n                                \"value\": \"edit\",\r\n                                \"label\": \"编辑\"\r\n                            }, {\r\n                                \"value\": \"delete\",\r\n                                \"label\": \"删除\"\r\n                            }]\r\n                        }', '1000', '2018-11-26 09:42:57', '2018-11-26 09:42:57');
INSERT INTO `authorities` VALUES ('7', '10', '文章分类', '文章分类的全部控制权限', 'category_all_controller', '1', '0', '{\"type\": true,\r\n                            \"data\": [{\r\n                                \"value\": \"add\",\r\n                                \"label\": \"添加\"\r\n                            }, {\r\n                                \"value\": \"edit\",\r\n                                \"label\": \"编辑\"\r\n                            }, {\r\n                                \"value\": \"delete\",\r\n                                \"label\": \"删除\"\r\n                            }]\r\n                        }', '1000', '2018-11-26 09:42:57', '2018-11-26 09:42:57');
INSERT INTO `authorities` VALUES ('8', '11', '文章发布视图的控制权限', '文章发布视图的控制权限', 'publish_article_all_controller', '1', '0', null, '1000', '2018-11-26 09:42:57', '2019-02-07 07:43:20');
INSERT INTO `authorities` VALUES ('11', '18', '联系我们', '联系我们权限设置', 'contact_all_controller', '1', '0', '{\"type\": true,\n                            \"data\": [{\n                                \"value\": \"add\",\n                                \"label\": \"添加\"\n                            }, {\n                                \"value\": \"edit\",\n                                \"label\": \"编辑\"\n                            }, {\n                                \"value\": \"delete\",\n                                \"label\": \"删除\"\n                            }]\n                        }', '1000', '2019-01-21 12:10:12', '2019-01-21 12:10:12');
INSERT INTO `authorities` VALUES ('12', '20', '来源统计', '来源统计权限设置', 'source_count_all_controller', '1', '0', null, '1000', '2019-01-22 03:42:45', '2019-02-07 08:04:18');
INSERT INTO `authorities` VALUES ('13', '21', '订单列表', '订单列表权限设置', 'goods_list_all_controller', '1', '0', '{\"type\": true,\n                            \"data\": [{\n                                \"value\": \"show\",\n                                \"label\": \"订单详情\"\n                            }, {\n                                \"value\": \"search\",\n                                \"label\": \"属地查询\"\n                            }, {\n                                \"value\": \"delete\",\n                                \"label\": \"删除\"\n                            }]\n                        }', '1000', '2019-01-22 03:43:18', '2019-02-07 08:12:36');
INSERT INTO `authorities` VALUES ('14', '22', '综合统计', '综合统计权限设置', 'zh_all_controller', '1', '0', null, '1000', '2019-01-22 03:43:48', '2019-02-07 08:03:38');
INSERT INTO `authorities` VALUES ('15', '23', '员工统计', '员工统计权限设置', 'staff_count_all_controller', '1', '0', null, '1000', '2019-01-22 03:44:36', '2019-02-07 08:03:28');
INSERT INTO `authorities` VALUES ('16', '24', '订单回收站', '订单回收站权限设置', 'recovery_goods_all_controller', '1', '0', '{\"type\": true,\r\n                            \"data\": [{\r\n                                \"value\": \"add\",\r\n                                \"label\": \"添加\"\r\n                            }, {\r\n                                \"value\": \"edit\",\r\n                                \"label\": \"编辑\"\r\n                            }, {\r\n                                \"value\": \"delete\",\r\n                                \"label\": \"删除\"\r\n                            }]\r\n                        }', '1000', '2019-01-22 03:45:31', '2019-01-22 03:45:31');
INSERT INTO `authorities` VALUES ('17', '29', '来源管理', '来源管理权限设置', 'source_all_controller', '1', '0', '{\"type\": true,\r\n                            \"data\": [{\r\n                                \"value\": \"add\",\r\n                                \"label\": \"添加\"\r\n                            }, {\r\n                                \"value\": \"edit\",\r\n                                \"label\": \"编辑\"\r\n                            }, {\r\n                                \"value\": \"delete\",\r\n                                \"label\": \"删除\"\r\n                            }]\r\n                        }', '1000', '2019-01-22 03:46:25', '2019-01-22 03:46:25');
INSERT INTO `authorities` VALUES ('18', '26', '产品列表', '产品列表权限设置', 'goods_list_all_controller', '1', '0', '{\"type\": true,\n                            \"data\": [{\n                                \"value\": \"add\",\n                                \"label\": \"添加\"\n                            }, {\n                                \"value\": \"edit\",\n                                \"label\": \"编辑\"\n                            }, {\n                                \"value\": \"delete\",\n                                \"label\": \"删除\"\n                            },{\n                              \"value\":\"extension\",\n                              \"label\":\"推广链接\"\n                            \n                            }]\n                        }', '1000', '2019-01-22 03:47:16', '2019-02-07 08:20:50');
INSERT INTO `authorities` VALUES ('19', '27', '发布产品', '产品列表权限设置', 'publish_goods_all_controller', '1', '0', null, '1000', '2019-01-22 03:47:48', '2019-02-07 08:20:20');
INSERT INTO `authorities` VALUES ('20', '28', '产品模板', '产品视图模板管理', 'template_view_controller', '1', '0', '{\"type\": true,\r\n                            \"data\": [{\r\n                                \"value\": \"add\",\r\n                                \"label\": \"添加\"\r\n                            }, {\r\n                                \"value\": \"edit\",\r\n                                \"label\": \"编辑\"\r\n                            }, {\r\n                                \"value\": \"delete\",\r\n                                \"label\": \"删除\"\r\n                            }]\r\n                        }', '1000', '2019-01-22 03:48:33', '2019-01-22 03:48:33');
INSERT INTO `authorities` VALUES ('22', '31', '访问日志', '访问日志控制权限', 'log_control', '1', '0', null, '1000', '2019-02-07 06:42:46', '2019-02-07 06:42:46');
INSERT INTO `authorities` VALUES ('23', '32', '系统配置', '系统配置控制权限', 'system_control', '1', '0', null, '1000', '2019-02-07 06:43:11', '2019-02-07 06:43:11');
INSERT INTO `authorities` VALUES ('24', '33', '文章编辑', '文章编辑权限', 'edit_articles_control', '1', '0', null, '1000', '2019-02-07 07:48:27', '2019-02-07 07:48:27');
INSERT INTO `authorities` VALUES ('25', '30', '域名管理', '域名管理权限', 'domain_control', '1', '0', '{\"type\": true,\n                            \"data\": [{\n                                \"value\": \"add\",\n                                \"label\": \"添加\"\n                            }, {\n                                \"value\": \"edit\",\n                                \"label\": \"编辑\"\n                            }, {\n                                \"value\": \"delete\",\n                                \"label\": \"删除\"\n                            }]\n                        }', '1000', '2019-02-07 07:49:14', '2019-02-07 07:49:14');
INSERT INTO `authorities` VALUES ('26', '34', '产品编辑', '产品编辑权限', 'edit_goods_control', '1', '0', null, '1000', '2019-02-07 08:29:08', '2019-02-07 08:29:08');
INSERT INTO `authorities` VALUES ('27', '35', '订单回收站', '订单回收站权限关联', 'recoveryOrder_all_control', '1', '0', '{\"type\": true,\n                            \"data\": [{\n                                \"value\": \"recovery\",\n                                \"label\": \"恢复\"\n                            }, {\n                                \"value\": \"delete\",\n                                \"label\": \"删除\"\n                            }]\n                        }', '1000', '2019-02-12 11:13:33', '2019-02-12 11:13:33');

-- ----------------------------
-- Table structure for categroys
-- ----------------------------
DROP TABLE IF EXISTS `categroys`;
CREATE TABLE `categroys` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '父类id',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类名称',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of categroys
-- ----------------------------

-- ----------------------------
-- Table structure for config_models
-- ----------------------------
DROP TABLE IF EXISTS `config_models`;
CREATE TABLE `config_models` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '父id',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '类型',
  `keyword` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '关键字',
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '配置项',
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of config_models
-- ----------------------------
INSERT INTO `config_models` VALUES ('1', '0', 'json', 'admin_base', '{\"article_total\":0,\"pv\":0,\"share\":0,\"submit\":0,\"monday\":0,\"tuesday\":0,\"wednesday\":0,\"thursday\":0,\"friday\":0,\"saturday\":0,\"sunday\":0}', '后台首页配置项', '1');
INSERT INTO `config_models` VALUES ('2', '0', 'json', 'sitebase', '{\"site_name\":\"\\u54fc\\u54fc\\u529e\\u516c\",\"icp\":\"\\u8700ICP\\u590718024407\\u53f7-3\",\"qq\":\"2052728227\",\"phone\":\"17323057831\",\"tel\":\"17323057831\",\"keyword\":\"sitebase\",\"items\":[{\"address\":\"\\u6210\\u90fd\\u5e02\\u6b66\\u4faf\\u533a\\u7ea2\\u724c\\u697c\\u5e7f\\u573a2\\u53f7\\u5199\\u5b57\\u697c601\\u5ba4\",\"tel\":null,\"index\":2,\"status\":1}],\"site_keyword\":\"1234\",\"desc\":\"1234\",\"postNum\":\"610000\",\"jsSlot\":[{\"code\":\"<scritp><\\/scritp>\"},{\"code\":\"<scritp><\\/scritp>\"}]}', '没有描述', '1');
INSERT INTO `config_models` VALUES ('3', '0', 'json', 'point', '{\"english\":\"PRODUCT HIGHLIGHTS\",\"title\":\"\\u4ea7\\u54c1\\u4eae\\u70b9\",\"desc\":\"\\u6211\\u4eec\\u4e13\\u6ce8\\u4e8e\\u4e2d\\u4ecb\\u516c\\u53f8\\u5de5\\u4f5c\\u6d41\\u7a0b\\u7684\\u7ba1\\u7406,\\u6211\\u4eec\\u662f\\u8ffd\\u6c42\\u5b8c\\u7f8e\\u7684\\u6280\\u672f\\u6d41\\u6d3e,\\u6211\\u4eec\\u662f\\\"\\u6210\\u719f\\u7ba1\\u7406\\\" \\u7684\\u521b\\u9020\\u8005,\\u6211\\u4eec\\u62e5\\u6709.....\",\"keyword\":\"point\",\"items\":[{\"index\":1,\"address\":\"\\u5168\\u5c40\\u6027\",\"tel\":\"\\u7b80\\u5316\\u6d41\\u7a0b\\u4e36\\u5168\\u5c40\\u638c\\u63a7\",\"status\":1,\"title\":\"\\u7075\\u6d3b\\u6027\",\"desc\":\"\\u7b80\\u5316\\u6d41\\u7a0b\\uff0c\\u5168\\u5c40\\u638c\\u63a7\"},{\"address\":\"\\u667a\\u80fd\\u6027\",\"tel\":\"\\u6ce8\\u91cd\\u529f\\u80fd\\u4e36\\u4e00\\u952e\\u6392\\u8bc1\",\"index\":2,\"status\":1,\"title\":\"\\u8fde\\u901a\\u6027\",\"desc\":\"\\u4fe1\\u606f\\u5173\\u8054\\u3001\\u4e00\\u952e\\u6392\\u8bc1\"},{\"address\":\"\\u79d1\\u5b66\\u6027\",\"tel\":\"\\u8d44\\u6e90\\u6570\\u636e\\u5316\\u4e36\\u4fe1\\u606f\\u5316\",\"index\":3,\"status\":1,\"title\":\"\\u79d1\\u5b66\\u6027\",\"desc\":\"\\u8d44\\u6e90\\u6570\\u636e\\u5316\\u3001\\u4fe1\\u606f\\u5316\"},{\"address\":\"\\u6613\\u7528\\u6027\",\"tel\":\"\\u64cd\\u4f5c\\u7b80\\u5355\\u4e0a\\u624b\\u5feb\",\"index\":4,\"status\":1,\"title\":\"\\u6570\\u5b57\\u5316\",\"desc\":\"\\u591a\\u7ef4\\u5ea6\\u6570\\u636e\\u56fe\\u3001\\u62a5\\u8868\"},{\"address\":\"\\u53ef\\u89c6\\u5316\",\"tel\":\"\\u591a\\u7ef4\\u5ea6\\u6570\\u636e\\u56fe\\u8868\\u5c55\\u73b0\",\"index\":5,\"status\":1,\"title\":\"\\u4e13\\u4e1a\\u6027\",\"desc\":\"\\u5ba2\\u6237\\u4fe1\\u606f\\u8d44\\u6599\\u8be6\\u5c3d\\u8bb0\\u5f55\"}]}', '没有描述', '1');
INSERT INTO `config_models` VALUES ('4', '0', 'json', 'henhen', '{\"english\":\"HENG HENG OA\",\"title\":\"\\u54fc\\u54fc\\u529e\\u516c\",\"content\":\"<p style=\\\"margin: 10px 0px 0px; padding: 0px; background: rgb(255, 255, 255); text-indent: 2em; line-height: 3em;\\\"><span style=\\\"color: rgb(47, 47, 47); letter-spacing: 0px; font-size: 16px; font-family: \\u5fae\\u8f6f\\u96c5\\u9ed1;\\\">\\u54fc\\u54fc\\u529e\\u516c\\u662f\\u7531\\u56db\\u5ddd\\u732a\\u592a\\u5e05\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\\u81ea\\u4e3b\\u7814\\u53d1\\u5e76\\u8fd0\\u8425\\u7684\\u6838\\u5fc3\\u4ea7\\u54c1\\uff0c\\u610f\\u5728\\u4e3a\\u5efa\\u7b51\\u4e2d\\u4ecb\\u4f01\\u4e1a\\u63d0\\u4f9b\\u9ad8\\u6548\\u4fbf\\u5229\\u7684\\u6280\\u672f\\u670d\\u52a1\\u3002\\u4ea7\\u54c1\\u878d\\u5165\\u79d1\\u5b66\\u7684\\u7ba1\\u7406\\u601d\\u60f3\\u3001\\u7ba1\\u7406\\u6a21\\u5f0f\\uff0c\\u7ed3\\u5408\\u5148\\u8fdb\\u7684\\u8f6f\\u4ef6\\u6280\\u672f\\u3001\\u7f51\\u7edc\\u6280\\u672f\\uff0c\\u4e3a\\u7528\\u6237\\u63d0\\u4f9b\\u4e86\\u4f4e\\u6210\\u672c\\u3001\\u9ad8\\u6548\\u80fd\\u7684\\u534f\\u540c\\u529e\\u516c\\u548c\\u7ba1\\u7406\\u5e73\\u53f0\\u3002<\\/span><\\/p><p style=\\\"margin: 10px 0px 0px; padding: 0px; background: rgb(255, 255, 255); text-indent: 2em; line-height: 3em;\\\"><span style=\\\"color: rgb(47, 47, 47); letter-spacing: 0px; font-size: 16px; font-family: \\u5b8b\\u4f53, SimSun;\\\">&nbsp;<\\/span><\\/p><p style=\\\"margin: 10px 0px 0px; padding: 0px; background: rgb(255, 255, 255); text-indent: 2em; line-height: 3em;\\\"><span style=\\\"color: rgb(47, 47, 47); letter-spacing: 0px; font-size: 16px; font-family: \\u5fae\\u8f6f\\u96c5\\u9ed1;\\\">\\u54fc\\u54fc\\u529e\\u516c\\uff0c\\u5e2e\\u52a9\\u4f01\\u4e1a\\u89c4\\u8303\\u5de5\\u4f5c\\u6d41\\u7a0b\\u3001\\u5f3a\\u5316\\u56e2\\u961f\\u6267\\u884c\\u3001\\u63a8\\u52a8\\u7cbe\\u7ec6\\u7ba1\\u7406\\u3001\\u4fc3\\u8fdb\\u4f01\\u4e1a\\u8425\\u4e1a\\u589e\\u957f\\u3002<\\/span><\\/p><p><br\\/><\\/p>\",\"keyword\":\"henhen\",\"desc\":\"\\u54fc\\u54fc\\u529e\\u516c\\u662f\\u7531\\u56db\\u5ddd\\u732a\\u592a\\u5e05\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\\u81ea\\u4e3b\\u7814\\u53d1\\u5e76\\u8fd0\\u8425\\u7684\\u6838\\u5fc3\\u4ea7\\u54c1\\uff0c\\u610f\\u5728\\u4e3a\\u5efa\\u7b51\\u4e2d\\u4ecb\\u4f01\\u4e1a\\u63d0\\u4f9b\\u9ad8\\u6548\\u4fbf\\u5229\\u7684\\u6280\\u672f\\u670d\\u52a1\\u3002\\u4ea7\\u54c1\\u878d\\u5165\\u79d1\\u5b66\\u7684\\u7ba1\\u7406\\u601d\\u60f3\\u3001\\u7ba1\\u7406\\u6a21\\u5f0f\\uff0c\\u7ed3\\u5408\\u5148\\u8fdb\\u7684\\u8f6f\\u4ef6\\u6280\\u672f\\u3001\\u7f51\\u7edc\\u6280\\u672f\\uff0c\\u4e3a\\u7528\\u6237\\u63d0\\u4f9b\\u4e86\\u4f4e\\u6210\\u672c\\u3001\\u9ad8\\u6548\\u80fd\\u7684\\u534f\\u540c\\u529e\\u516c\\u548c\\u7ba1\\u7406\\u5e73\\u53f0\\u3002     \\u54fc\\u54fc\\u529e\\u516c\\uff0c\\u5e2e\\u52a9\\u4f01\\u4e1a\\u89c4\\u8303\\u5de5\\u4f5c\\u6d41\\u7a0b\\u3001\\u5f3a\\u5316\\u56e2\\u961f\\u6267\\u884c\\u3001\\u63a8\\u52a8\\u7cbe\\u7ec6\\u7ba1\\u7406\\u3001\\u4fc3\\u8fdb\\u4f01\\u4e1a\\u8425\\u4e1a\\u589e\\u957f\\u3002\"}', '没有描述', '1');
INSERT INTO `config_models` VALUES ('5', '0', 'json', 'company', '{\"english\":\"COMPANY INTRODUCTION\",\"title\":\"\\u516c\\u53f8\\u4ecb\\u7ecd\",\"content\":\"<p style=\\\"margin: 10px 0px 0px; text-indent: 0px; padding: 0px; background: rgb(255, 255, 255); line-height: 2em;\\\"><span style=\\\"font-family: \\u5fae\\u8f6f\\u96c5\\u9ed1;color: rgb(47, 47, 47);letter-spacing: 0;font-size: 16px\\\"><span style=\\\"font-family:\\u5fae\\u8f6f\\u96c5\\u9ed1\\\">\\u56db\\u5ddd\\u732a\\u592a\\u5e05\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\\u4f5c\\u4e3a\\u4e00\\u5bb6\\u4e92\\u8054\\u7f51\\u79d1\\u6280\\u516c\\u53f8\\uff0c\\u4e3b\\u8981\\u4e1a\\u52a1\\u5305\\u62ec\\uff1a\\u4e92\\u8054\\u7f51\\u5efa\\u8bbe\\u4e36\\u7535\\u5b50\\u5546\\u52a1\\u4e36\\u4f01\\u4e1a\\u54a8\\u8be2\\u4e36\\u8f6f\\u4ef6\\u7ba1\\u7406\\u7cfb\\u7edf\\u5f00\\u53d1<\\/span> <span style=\\\"font-family:\\u5fae\\u8f6f\\u96c5\\u9ed1\\\">\\u3002<\\/span><\\/span><\\/p><p style=\\\"margin: 10px 0px 0px; text-indent: 0px; padding: 0px; background: rgb(255, 255, 255); line-height: 2em;\\\"><span style=\\\"font-family: \\u5fae\\u8f6f\\u96c5\\u9ed1;color: rgb(47, 47, 47);letter-spacing: 0;font-size: 16px\\\">&nbsp;<\\/span><\\/p><p style=\\\"margin: 10px 0px 0px; text-indent: 0px; padding: 0px; background: rgb(255, 255, 255); line-height: 2em;\\\"><span style=\\\"font-family: \\u5fae\\u8f6f\\u96c5\\u9ed1;color: rgb(47, 47, 47);letter-spacing: 0;font-size: 16px\\\"><span style=\\\"font-family:\\u5fae\\u8f6f\\u96c5\\u9ed1\\\">\\u516c\\u53f8\\u521b\\u59cb\\u4eba\\u624e\\u6839\\u4e8e\\u5efa\\u7b51\\u884c\\u4e1a\\u591a\\u5e74\\uff0c\\u6df1\\u77e5\\u5efa\\u7b51\\u884c\\u4e1a<\\/span>\\u201c\\u75db\\u70b9\\u201d\\uff0c\\u5728\\u79fb\\u52a8\\u4e92\\u8054\\u7f51\\u7684\\u5927\\u6f6e\\u4e0b\\uff0c\\u732a\\u592a\\u5e05\\u53d1\\u5e03\\u4e86\\u4ee5\\u201c\\u667a\\u80fd\\u5316\\u3001\\u6d41\\u7a0b\\u5316\\u3001\\u5e73\\u53f0\\u5316\\u3001\\u6570\\u636e\\u5316\\u201d\\u56db\\u5316\\u4e3a\\u6838\\u5fc3\\u7684\\u7cfb\\u5217\\u4ea7\\u54c1\\uff0c\\u5305\\u62ec\\u9762\\u5411\\u4e2d\\u5c0f\\u578b\\u5efa\\u7b51\\u4e2d\\u4ecb\\u4f01\\u4e1a\\u7684\\u529e\\u516c\\u4ea7\\u54c1\\u2014\\u2014\\u54fc\\u54fc\\u529e\\u516c\\uff0c\\u4ee5\\u53ca\\u5e2e\\u52a9\\u5efa\\u7b51\\u4f01\\u4e1a\\u7ba1\\u7406\\u9879\\u76ee\\u3001\\u8bc1\\u4e66\\u3001\\u4eba\\u5458\\u7684\\u5e94\\u7528\\u578b\\u4ea7\\u54c1\\u2014\\u2014\\u5efa\\u7b51\\u4eba\\u7ba1\\u7406\\u7cfb\\u7edf\\u3002<\\/span><\\/p><p style=\\\"margin: 10px 0px 0px; text-indent: 0px; padding: 0px; background: rgb(255, 255, 255); line-height: 2em;\\\"><span style=\\\"font-family: \\u5fae\\u8f6f\\u96c5\\u9ed1;color: rgb(47, 47, 47);letter-spacing: 0;font-size: 16px\\\"><\\/span><\\/p><p style=\\\"margin-bottom: 0px; white-space: normal; padding: 0px; background: rgb(255, 255, 255); line-height: 2em; margin-top: 10px;\\\"><span style=\\\"font-family: \\u5fae\\u8f6f\\u96c5\\u9ed1; color: rgb(47, 47, 47); letter-spacing: 0px;\\\">\\u56db\\u5ddd\\u732a\\u592a\\u5e05\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\\u4f5c\\u4e3a\\u4e00\\u5bb6\\u4e92\\u8054\\u7f51\\u79d1\\u6280\\u516c\\u53f8\\uff0c\\u4e3b\\u8981\\u4e1a\\u52a1\\u5305\\u62ec\\uff1a\\u4e92\\u8054\\u7f51\\u5efa\\u8bbe\\u4e36\\u7535\\u5b50\\u5546\\u52a1\\u4e36\\u4f01\\u4e1a\\u54a8\\u8be2\\u4e36\\u8f6f\\u4ef6\\u7ba1\\u7406\\u7cfb\\u7edf\\u5f00\\u53d1&nbsp;\\u3002<\\/span><\\/p><p style=\\\"margin-bottom: 0px; white-space: normal; padding: 0px; background: rgb(255, 255, 255); line-height: 2em; margin-top: 10px;\\\"><span style=\\\"font-family: \\u5fae\\u8f6f\\u96c5\\u9ed1; color: rgb(47, 47, 47); letter-spacing: 0px;\\\">&nbsp;<\\/span><\\/p><p style=\\\"margin-bottom: 0px; white-space: normal; padding: 0px; background: rgb(255, 255, 255); line-height: 2em; margin-top: 10px;\\\"><span style=\\\"font-family: \\u5fae\\u8f6f\\u96c5\\u9ed1; color: rgb(47, 47, 47); letter-spacing: 0px;\\\">\\u516c\\u53f8\\u521b\\u59cb\\u4eba\\u624e\\u6839\\u4e8e\\u5efa\\u7b51\\u884c\\u4e1a\\u591a\\u5e74\\uff0c\\u6df1\\u77e5\\u5efa\\u7b51\\u884c\\u4e1a\\u201c\\u75db\\u70b9\\u201d\\uff0c\\u5728\\u79fb\\u52a8\\u4e92\\u8054\\u7f51\\u7684\\u5927\\u6f6e\\u4e0b\\uff0c\\u732a\\u592a\\u5e05\\u53d1\\u5e03\\u4e86\\u4ee5\\u201c\\u667a\\u80fd\\u5316\\u3001\\u6d41\\u7a0b\\u5316\\u3001\\u5e73\\u53f0\\u5316\\u3001\\u6570\\u636e\\u5316\\u201d\\u56db\\u5316\\u4e3a\\u6838\\u5fc3\\u7684\\u7cfb\\u5217\\u4ea7\\u54c1\\uff0c\\u5305\\u62ec\\u9762\\u5411\\u4e2d\\u5c0f\\u578b\\u5efa\\u7b51\\u4e2d\\u4ecb\\u4f01\\u4e1a\\u7684\\u529e\\u516c\\u4ea7\\u54c1\\u2014\\u2014\\u54fc\\u54fc\\u529e\\u516c\\uff0c\\u4ee5\\u53ca\\u5e2e\\u52a9\\u5efa\\u7b51\\u4f01\\u4e1a\\u7ba1\\u7406\\u9879\\u76ee\\u3001\\u8bc1\\u4e66\\u3001\\u4eba\\u5458\\u7684\\u5e94\\u7528\\u578b\\u4ea7\\u54c1\\u2014\\u2014\\u5efa\\u7b51\\u4eba\\u7ba1\\u7406\\u7cfb\\u7edf\\u3002<\\/span><\\/p><p style=\\\"margin: 10px 0px 0px; text-indent: 0px; padding: 0px; background: rgb(255, 255, 255); line-height: 2em;\\\"><span style=\\\"font-family: \\u5fae\\u8f6f\\u96c5\\u9ed1;color: rgb(47, 47, 47);letter-spacing: 0;font-size: 16px\\\"><br\\/><\\/span><\\/p><p style=\\\"margin: 10px 0px 0px; text-indent: 0px; padding: 0px; background: rgb(255, 255, 255); line-height: 2em;\\\"><span style=\\\"font-family: \\u5fae\\u8f6f\\u96c5\\u9ed1;color: rgb(47, 47, 47);letter-spacing: 0;font-size: 16px\\\"><\\/span><\\/p><p style=\\\"margin-bottom: 0px; white-space: normal; padding: 0px; background: rgb(255, 255, 255); line-height: 2em; margin-top: 10px;\\\"><span style=\\\"font-family: \\u5fae\\u8f6f\\u96c5\\u9ed1; color: rgb(47, 47, 47); letter-spacing: 0px;\\\">\\u56db\\u5ddd\\u732a\\u592a\\u5e05\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\\u4f5c\\u4e3a\\u4e00\\u5bb6\\u4e92\\u8054\\u7f51\\u79d1\\u6280\\u516c\\u53f8\\uff0c\\u4e3b\\u8981\\u4e1a\\u52a1\\u5305\\u62ec\\uff1a\\u4e92\\u8054\\u7f51\\u5efa\\u8bbe\\u4e36\\u7535\\u5b50\\u5546\\u52a1\\u4e36\\u4f01\\u4e1a\\u54a8\\u8be2\\u4e36\\u8f6f\\u4ef6\\u7ba1\\u7406\\u7cfb\\u7edf\\u5f00\\u53d1&nbsp;\\u3002<\\/span><\\/p><p style=\\\"margin-bottom: 0px; white-space: normal; padding: 0px; background: rgb(255, 255, 255); line-height: 2em; margin-top: 10px;\\\"><span style=\\\"font-family: \\u5fae\\u8f6f\\u96c5\\u9ed1; color: rgb(47, 47, 47); letter-spacing: 0px;\\\">&nbsp;<\\/span><\\/p><p style=\\\"margin-bottom: 0px; white-space: normal; padding: 0px; background: rgb(255, 255, 255); line-height: 2em; margin-top: 10px;\\\"><span style=\\\"font-family: \\u5fae\\u8f6f\\u96c5\\u9ed1; color: rgb(47, 47, 47); letter-spacing: 0px;\\\">\\u516c\\u53f8\\u521b\\u59cb\\u4eba\\u624e\\u6839\\u4e8e\\u5efa\\u7b51\\u884c\\u4e1a\\u591a\\u5e74\\uff0c\\u6df1\\u77e5\\u5efa\\u7b51\\u884c\\u4e1a\\u201c\\u75db\\u70b9\\u201d\\uff0c\\u5728\\u79fb\\u52a8\\u4e92\\u8054\\u7f51\\u7684\\u5927\\u6f6e\\u4e0b\\uff0c\\u732a\\u592a\\u5e05\\u53d1\\u5e03\\u4e86\\u4ee5\\u201c\\u667a\\u80fd\\u5316\\u3001\\u6d41\\u7a0b\\u5316\\u3001\\u5e73\\u53f0\\u5316\\u3001\\u6570\\u636e\\u5316\\u201d\\u56db\\u5316\\u4e3a\\u6838\\u5fc3\\u7684\\u7cfb\\u5217\\u4ea7\\u54c1\\uff0c\\u5305\\u62ec\\u9762\\u5411\\u4e2d\\u5c0f\\u578b\\u5efa\\u7b51\\u4e2d\\u4ecb\\u4f01\\u4e1a\\u7684\\u529e\\u516c\\u4ea7\\u54c1\\u2014\\u2014\\u54fc\\u54fc\\u529e\\u516c\\uff0c\\u4ee5\\u53ca\\u5e2e\\u52a9\\u5efa\\u7b51\\u4f01\\u4e1a\\u7ba1\\u7406\\u9879\\u76ee\\u3001\\u8bc1\\u4e66\\u3001\\u4eba\\u5458\\u7684\\u5e94\\u7528\\u578b\\u4ea7\\u54c1\\u2014\\u2014\\u5efa\\u7b51\\u4eba\\u7ba1\\u7406\\u7cfb\\u7edf\\u3002<\\/span><\\/p><p style=\\\"margin: 10px 0px 0px; text-indent: 0px; padding: 0px; background: rgb(255, 255, 255); line-height: 2em;\\\"><span style=\\\"font-family: \\u5fae\\u8f6f\\u96c5\\u9ed1;color: rgb(47, 47, 47);letter-spacing: 0;font-size: 16px\\\"><br\\/><\\/span><\\/p><p style=\\\"margin: 10px 0px 0px; text-indent: 0px; padding: 0px; background: rgb(255, 255, 255); line-height: 2em;\\\"><span style=\\\"font-family: \\u5fae\\u8f6f\\u96c5\\u9ed1;color: rgb(47, 47, 47);letter-spacing: 0;font-size: 16px\\\"><\\/span><\\/p><p style=\\\"margin-bottom: 0px; white-space: normal; padding: 0px; background: rgb(255, 255, 255); line-height: 2em; margin-top: 10px;\\\"><span style=\\\"font-family: \\u5fae\\u8f6f\\u96c5\\u9ed1; color: rgb(47, 47, 47); letter-spacing: 0px;\\\">\\u56db\\u5ddd\\u732a\\u592a\\u5e05\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\\u4f5c\\u4e3a\\u4e00\\u5bb6\\u4e92\\u8054\\u7f51\\u79d1\\u6280\\u516c\\u53f8\\uff0c\\u4e3b\\u8981\\u4e1a\\u52a1\\u5305\\u62ec\\uff1a\\u4e92\\u8054\\u7f51\\u5efa\\u8bbe\\u4e36\\u7535\\u5b50\\u5546\\u52a1\\u4e36\\u4f01\\u4e1a\\u54a8\\u8be2\\u4e36\\u8f6f\\u4ef6\\u7ba1\\u7406\\u7cfb\\u7edf\\u5f00\\u53d1&nbsp;\\u3002<\\/span><\\/p><p style=\\\"margin-bottom: 0px; white-space: normal; padding: 0px; background: rgb(255, 255, 255); line-height: 2em; margin-top: 10px;\\\"><span style=\\\"font-family: \\u5fae\\u8f6f\\u96c5\\u9ed1; color: rgb(47, 47, 47); letter-spacing: 0px;\\\">&nbsp;<\\/span><\\/p><p style=\\\"margin-bottom: 0px; white-space: normal; padding: 0px; background: rgb(255, 255, 255); line-height: 2em; margin-top: 10px;\\\"><span style=\\\"font-family: \\u5fae\\u8f6f\\u96c5\\u9ed1; color: rgb(47, 47, 47); letter-spacing: 0px;\\\">\\u516c\\u53f8\\u521b\\u59cb\\u4eba\\u624e\\u6839\\u4e8e\\u5efa\\u7b51\\u884c\\u4e1a\\u591a\\u5e74\\uff0c\\u6df1\\u77e5\\u5efa\\u7b51\\u884c\\u4e1a\\u201c\\u75db\\u70b9\\u201d\\uff0c\\u5728\\u79fb\\u52a8\\u4e92\\u8054\\u7f51\\u7684\\u5927\\u6f6e\\u4e0b\\uff0c\\u732a\\u592a\\u5e05\\u53d1\\u5e03\\u4e86\\u4ee5\\u201c\\u667a\\u80fd\\u5316\\u3001\\u6d41\\u7a0b\\u5316\\u3001\\u5e73\\u53f0\\u5316\\u3001\\u6570\\u636e\\u5316\\u201d\\u56db\\u5316\\u4e3a\\u6838\\u5fc3\\u7684\\u7cfb\\u5217\\u4ea7\\u54c1\\uff0c\\u5305\\u62ec\\u9762\\u5411\\u4e2d\\u5c0f\\u578b\\u5efa\\u7b51\\u4e2d\\u4ecb\\u4f01\\u4e1a\\u7684\\u529e\\u516c\\u4ea7\\u54c1\\u2014\\u2014\\u54fc\\u54fc\\u529e\\u516c\\uff0c\\u4ee5\\u53ca\\u5e2e\\u52a9\\u5efa\\u7b51\\u4f01\\u4e1a\\u7ba1\\u7406\\u9879\\u76ee\\u3001\\u8bc1\\u4e66\\u3001\\u4eba\\u5458\\u7684\\u5e94\\u7528\\u578b\\u4ea7\\u54c1\\u2014\\u2014\\u5efa\\u7b51\\u4eba\\u7ba1\\u7406\\u7cfb\\u7edf\\u3002<\\/span><\\/p><p style=\\\"margin: 10px 0px 0px; text-indent: 0px; padding: 0px; background: rgb(255, 255, 255); line-height: 2em;\\\"><span style=\\\"font-family: \\u5fae\\u8f6f\\u96c5\\u9ed1;color: rgb(47, 47, 47);letter-spacing: 0;font-size: 16px\\\"><br\\/><\\/span><\\/p><p style=\\\"margin: 10px 0px 0px; text-indent: 0px; padding: 0px; background: rgb(255, 255, 255); line-height: 2em;\\\"><span style=\\\"font-family: \\u5fae\\u8f6f\\u96c5\\u9ed1;color: rgb(47, 47, 47);letter-spacing: 0;font-size: 16px\\\"><\\/span><\\/p><p style=\\\"margin-bottom: 0px; white-space: normal; padding: 0px; background: rgb(255, 255, 255); line-height: 2em; margin-top: 10px;\\\"><span style=\\\"font-family: \\u5fae\\u8f6f\\u96c5\\u9ed1; color: rgb(47, 47, 47); letter-spacing: 0px;\\\">\\u56db\\u5ddd\\u732a\\u592a\\u5e05\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\\u4f5c\\u4e3a\\u4e00\\u5bb6\\u4e92\\u8054\\u7f51\\u79d1\\u6280\\u516c\\u53f8\\uff0c\\u4e3b\\u8981\\u4e1a\\u52a1\\u5305\\u62ec\\uff1a\\u4e92\\u8054\\u7f51\\u5efa\\u8bbe\\u4e36\\u7535\\u5b50\\u5546\\u52a1\\u4e36\\u4f01\\u4e1a\\u54a8\\u8be2\\u4e36\\u8f6f\\u4ef6\\u7ba1\\u7406\\u7cfb\\u7edf\\u5f00\\u53d1&nbsp;\\u3002<\\/span><\\/p><p style=\\\"margin-bottom: 0px; white-space: normal; padding: 0px; background: rgb(255, 255, 255); line-height: 2em; margin-top: 10px;\\\"><span style=\\\"font-family: \\u5fae\\u8f6f\\u96c5\\u9ed1; color: rgb(47, 47, 47); letter-spacing: 0px;\\\">&nbsp;<\\/span><\\/p><p style=\\\"margin-bottom: 0px; white-space: normal; padding: 0px; background: rgb(255, 255, 255); line-height: 2em; margin-top: 10px;\\\"><span style=\\\"font-family: \\u5fae\\u8f6f\\u96c5\\u9ed1; color: rgb(47, 47, 47); letter-spacing: 0px;\\\">\\u516c\\u53f8\\u521b\\u59cb\\u4eba\\u624e\\u6839\\u4e8e\\u5efa\\u7b51\\u884c\\u4e1a\\u591a\\u5e74\\uff0c\\u6df1\\u77e5\\u5efa\\u7b51\\u884c\\u4e1a\\u201c\\u75db\\u70b9\\u201d\\uff0c\\u5728\\u79fb\\u52a8\\u4e92\\u8054\\u7f51\\u7684\\u5927\\u6f6e\\u4e0b\\uff0c\\u732a\\u592a\\u5e05\\u53d1\\u5e03\\u4e86\\u4ee5\\u201c\\u667a\\u80fd\\u5316\\u3001\\u6d41\\u7a0b\\u5316\\u3001\\u5e73\\u53f0\\u5316\\u3001\\u6570\\u636e\\u5316\\u201d\\u56db\\u5316\\u4e3a\\u6838\\u5fc3\\u7684\\u7cfb\\u5217\\u4ea7\\u54c1\\uff0c\\u5305\\u62ec\\u9762\\u5411\\u4e2d\\u5c0f\\u578b\\u5efa\\u7b51\\u4e2d\\u4ecb\\u4f01\\u4e1a\\u7684\\u529e\\u516c\\u4ea7\\u54c1\\u2014\\u2014\\u54fc\\u54fc\\u529e\\u516c\\uff0c\\u4ee5\\u53ca\\u5e2e\\u52a9\\u5efa\\u7b51\\u4f01\\u4e1a\\u7ba1\\u7406\\u9879\\u76ee\\u3001\\u8bc1\\u4e66\\u3001\\u4eba\\u5458\\u7684\\u5e94\\u7528\\u578b\\u4ea7\\u54c1\\u2014\\u2014\\u5efa\\u7b51\\u4eba\\u7ba1\\u7406\\u7cfb\\u7edf\\u3002<\\/span><\\/p><p style=\\\"margin-bottom: 0px; white-space: normal; padding: 0px; background: rgb(255, 255, 255); line-height: 2em; margin-top: 10px;\\\"><span style=\\\"font-family: \\u5fae\\u8f6f\\u96c5\\u9ed1; color: rgb(47, 47, 47); letter-spacing: 0px;\\\">\\u56db\\u5ddd\\u732a\\u592a\\u5e05\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\\u4f5c\\u4e3a\\u4e00\\u5bb6\\u4e92\\u8054\\u7f51\\u79d1\\u6280\\u516c\\u53f8\\uff0c\\u4e3b\\u8981\\u4e1a\\u52a1\\u5305\\u62ec\\uff1a\\u4e92\\u8054\\u7f51\\u5efa\\u8bbe\\u4e36\\u7535\\u5b50\\u5546\\u52a1\\u4e36\\u4f01\\u4e1a\\u54a8\\u8be2\\u4e36\\u8f6f\\u4ef6\\u7ba1\\u7406\\u7cfb\\u7edf\\u5f00\\u53d1&nbsp;\\u3002<\\/span><\\/p><p style=\\\"margin-bottom: 0px; white-space: normal; padding: 0px; background: rgb(255, 255, 255); line-height: 2em; margin-top: 10px;\\\"><span style=\\\"font-family: \\u5fae\\u8f6f\\u96c5\\u9ed1; color: rgb(47, 47, 47); letter-spacing: 0px;\\\">&nbsp;<\\/span><\\/p><p style=\\\"margin-bottom: 0px; white-space: normal; padding: 0px; background: rgb(255, 255, 255); line-height: 2em; margin-top: 10px;\\\"><span style=\\\"font-family: \\u5fae\\u8f6f\\u96c5\\u9ed1; color: rgb(47, 47, 47); letter-spacing: 0px;\\\">\\u516c\\u53f8\\u521b\\u59cb\\u4eba\\u624e\\u6839\\u4e8e\\u5efa\\u7b51\\u884c\\u4e1a\\u591a\\u5e74\\uff0c\\u6df1\\u77e5\\u5efa\\u7b51\\u884c\\u4e1a\\u201c\\u75db\\u70b9\\u201d\\uff0c\\u5728\\u79fb\\u52a8\\u4e92\\u8054\\u7f51\\u7684\\u5927\\u6f6e\\u4e0b\\uff0c\\u732a\\u592a\\u5e05\\u53d1\\u5e03\\u4e86\\u4ee5\\u201c\\u667a\\u80fd\\u5316\\u3001\\u6d41\\u7a0b\\u5316\\u3001\\u5e73\\u53f0\\u5316\\u3001\\u6570\\u636e\\u5316\\u201d\\u56db\\u5316\\u4e3a\\u6838\\u5fc3\\u7684\\u7cfb\\u5217\\u4ea7\\u54c1\\uff0c\\u5305\\u62ec\\u9762\\u5411\\u4e2d\\u5c0f\\u578b\\u5efa\\u7b51\\u4e2d\\u4ecb\\u4f01\\u4e1a\\u7684\\u529e\\u516c\\u4ea7\\u54c1\\u2014\\u2014\\u54fc\\u54fc\\u529e\\u516c\\uff0c\\u4ee5\\u53ca\\u5e2e\\u52a9\\u5efa\\u7b51\\u4f01\\u4e1a\\u7ba1\\u7406\\u9879\\u76ee\\u3001\\u8bc1\\u4e66\\u3001\\u4eba\\u5458\\u7684\\u5e94\\u7528\\u578b\\u4ea7\\u54c1\\u2014\\u2014\\u5efa\\u7b51\\u4eba\\u7ba1\\u7406\\u7cfb\\u7edf\\u3002<\\/span><\\/p><p style=\\\"margin: 10px 0px 0px; text-indent: 0px; padding: 0px; background: rgb(255, 255, 255); line-height: 2em;\\\"><span style=\\\"font-family: \\u5fae\\u8f6f\\u96c5\\u9ed1;color: rgb(47, 47, 47);letter-spacing: 0;font-size: 16px\\\"><br\\/><\\/span><br\\/><\\/p><p><br\\/><\\/p>\",\"keyword\":\"company\",\"desc\":\"\\u56db\\u5ddd\\u732a\\u592a\\u5e05\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\\u4f5c\\u4e3a\\u4e00\\u5bb6\\u4e92\\u8054\\u7f51\\u79d1\\u6280\\u516c\\u53f8\\uff0c\\u4e3b\\u8981\\u4e1a\\u52a1\\u5305\\u62ec\\uff1a\\u4e92\\u8054\\u7f51\\u5efa\\u8bbe\\u4e36\\u7535\\u5b50\\u5546\\u52a1\\u4e36\\u4f01\\u4e1a\\u54a8\\u8be2\\u4e36\\u8f6f\\u4ef6\\u7ba1\\u7406\\u7cfb\\u7edf\\u5f00\\u53d1 \\u3002     \\u516c\\u53f8\\u521b\\u59cb\\u4eba\\u624e\\u6839\\u4e8e\\u5efa\\u7b51\\u884c\\u4e1a\\u591a\\u5e74\\uff0c\\u6df1\\u77e5\\u5efa\\u7b51\\u884c\\u4e1a\\u201c\\u75db\\u70b9\\u201d\\uff0c\\u5728\\u79fb\\u52a8\\u4e92\\u8054\\u7f51\\u7684\\u5927\\u6f6e\\u4e0b\\uff0c\\u732a\\u592a\\u5e05\\u53d1\\u5e03\\u4e86\\u4ee5\\u201c\\u667a\\u80fd\\u5316\\u3001\\u6d41\\u7a0b\\u5316\\u3001\\u5e73\\u53f0\\u5316\\u3001\\u6570\\u636e\\u5316\\u201d\\u56db\\u5316\\u4e3a\\u6838\\u5fc3\\u7684\\u7cfb\\u5217\\u4ea7\\u54c1\\uff0c\\u5305\\u62ec\\u9762\\u5411\\u4e2d\\u5c0f\\u578b\\u5efa\\u7b51\\u4e2d\\u4ecb\\u4f01\\u4e1a\\u7684\\u529e\\u516c\\u4ea7\\u54c1\\u2014\\u2014\\u54fc\\u54fc\\u529e\\u516c\\uff0c\\u4ee5\\u53ca\\u5e2e\\u52a9\\u5efa\\u7b51\\u4f01\\u4e1a\\u7ba1\\u7406\\u9879\\u76ee\\u3001\\u8bc1\\u4e66\\u3001\\u4eba\\u5458\\u7684\\u5e94\\u7528\\u578b\\u4ea7\\u54c1\\u2014\\u2014\\u5efa\\u7b51\\u4eba\\u7ba1\\u7406\\u7cfb\\u7edf\\u3002\"}', '没有描述', '1');
INSERT INTO `config_models` VALUES ('7', '0', 'json', 'batchOrder', '{\"status\":\"0\",\"number\":\"6\"}', '防刷订单配置', '1');
INSERT INTO `config_models` VALUES ('8', '0', 'json', 'emailNotify', '{\"status\":\"1\",\"smtp_server\":\"smtp.qq.com\",\"smtp_port\":\"465\",\"smtp_user\":\"2475710452@qq.com\",\"smtp_password\":\"jlklhuxflbnqdjah\",\"email_title\":\"\\u4f60\\u597d\\u5440!\"}', '邮件消息通知配置', '1');
INSERT INTO `config_models` VALUES ('9', '0', 'json', 'phoneNotify', '{\"status\":\"1\",\"provider\":\"smsbao\",\"access_key_id\":\"wang223000\",\"secret\":\"935180069wang\",\"content\":\"\\u3010\\u5feb\\u4e50\\u8d2d\\u3011\\u60a8\\u597d!\\u60a8\\u8ba2\\u8d2d\\u7684{product} \\u8ba2\\u5355\\u63d0\\u4ea4\\u6210\\u529f,\\u8bf7\\u572815\\u5206\\u949f\\u5185\\u56de\\u590d\\u672c\\u77ed\\u4fe1,\\u786e\\u8ba4\\u8ba2\\u8d2d\\u8bf7\\u56de\\u590d1, \\u6211\\u4eec\\u4f1a\\u5c3d\\u5feb\\u5b89\\u6392\\u53d1\\u8d27\",\"sing_anme\":\"\\u5feb\\u4e50\\u8d2d\",\"TemplateCode\":\"SMS_157446831\"}', '手机短信通知配置', '1');
INSERT INTO `config_models` VALUES ('10', '0', 'json', 'wx', '{\"appid\":\"1123\",\"secret\":\"123\"}', '微信配置', null);
INSERT INTO `config_models` VALUES ('11', '0', 'json', 'wx', '{\"appid\":\"1123\",\"secret\":\"123\"}', '微信配置', null);
INSERT INTO `config_models` VALUES ('12', '0', 'json', 'wx', '{\"appid\":\"1123\",\"secret\":\"123\"}', '微信配置', null);

-- ----------------------------
-- Table structure for contacts
-- ----------------------------
DROP TABLE IF EXISTS `contacts`;
CREATE TABLE `contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '联系人',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '联系电话',
  `qq` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'QQ号码',
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '公司名称',
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '留言内容',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of contacts
-- ----------------------------

-- ----------------------------
-- Table structure for friend_links
-- ----------------------------
DROP TABLE IF EXISTS `friend_links`;
CREATE TABLE `friend_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of friend_links
-- ----------------------------

-- ----------------------------
-- Table structure for html_templates
-- ----------------------------
DROP TABLE IF EXISTS `html_templates`;
CREATE TABLE `html_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板名称',
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of html_templates
-- ----------------------------
INSERT INTO `html_templates` VALUES ('1', '默认模板', 'goods/default/view');
INSERT INTO `html_templates` VALUES ('2', '纪念币模板', 'goods/jlb/view');

-- ----------------------------
-- Table structure for menus
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父级分类ID',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单名',
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '菜单图标',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '菜单链接',
  `sort` smallint(6) NOT NULL DEFAULT '1000' COMMENT '排序',
  `state` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态：{0：不显示，1：正常显示}',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of menus
-- ----------------------------
INSERT INTO `menus` VALUES ('1', '0', '系统设置', 'el-icon-setting', null, '1000', '1', '2018-11-26 09:42:57', '2018-11-26 09:42:57');
INSERT INTO `menus` VALUES ('2', '1', '菜单管理', null, '/menu', '1000', '1', '2018-11-26 09:42:57', '2018-11-26 09:42:57');
INSERT INTO `menus` VALUES ('3', '0', '用户管理', 'el-icon-menu', null, '1000', '1', '2018-11-26 09:42:57', '2018-11-26 09:42:57');
INSERT INTO `menus` VALUES ('4', '3', '角色管理', null, '/role', '1000', '1', '2018-11-26 09:42:57', '2018-11-26 09:42:57');
INSERT INTO `menus` VALUES ('5', '3', '用户管理', null, '/user', '1000', '1', '2018-11-26 09:42:57', '2018-11-26 09:42:57');
INSERT INTO `menus` VALUES ('6', '3', '权限管理', null, '/auth', '1000', '1', '2018-11-26 09:42:57', '2018-11-26 09:42:57');
INSERT INTO `menus` VALUES ('7', '0', '内容管理', 'el-icon-location', null, '1000', '1', '2018-11-26 09:42:57', '2018-11-26 09:42:57');
INSERT INTO `menus` VALUES ('8', '7', '文章列表', null, '/article_list', '1000', '1', '2018-11-26 09:42:57', '2018-11-26 09:42:57');
INSERT INTO `menus` VALUES ('9', '7', '回收站', null, '/recovery', '1000', '1', '2018-11-26 09:42:57', '2018-11-26 09:42:57');
INSERT INTO `menus` VALUES ('11', '7', '发布文章', null, '/publish_article', '1000', '1', '2018-11-26 09:42:57', '2018-11-26 09:42:57');
INSERT INTO `menus` VALUES ('19', '0', '订单管理', 'el-icon-goods', null, '1000', '1', '2019-01-22 03:22:18', '2019-01-22 03:22:18');
INSERT INTO `menus` VALUES ('20', '19', '来源统计', null, '/source_count', '1000', '1', '2019-01-22 03:23:15', '2019-01-22 03:31:01');
INSERT INTO `menus` VALUES ('21', '19', '订单列表', null, '/goods_order', '1000', '1', '2019-01-22 03:23:52', '2019-01-22 03:31:08');
INSERT INTO `menus` VALUES ('22', '19', '综合统计', null, '/zh_count', '1000', '1', '2019-01-22 03:24:39', '2019-01-22 03:31:14');
INSERT INTO `menus` VALUES ('23', '19', '员工统计', null, '/staff_count', '1000', '1', '2019-01-22 03:25:21', '2019-01-22 03:31:20');
INSERT INTO `menus` VALUES ('25', '0', '产品管理', 'el-icon-star-on', null, '1000', '1', '2019-01-22 03:28:27', '2019-01-22 03:28:34');
INSERT INTO `menus` VALUES ('26', '25', '产品列表', null, '/goods_list', '1000', '1', '2019-01-22 03:29:22', '2019-01-22 03:30:53');
INSERT INTO `menus` VALUES ('27', '25', '发布产品', null, '/publish_goods', '1000', '1', '2019-01-22 03:29:37', '2019-01-22 03:30:46');
INSERT INTO `menus` VALUES ('28', '25', '模板管理', null, '/template', '1000', '1', '2019-01-22 03:30:14', '2019-01-22 03:30:14');
INSERT INTO `menus` VALUES ('29', '19', '来源管理', null, '/source', '1000', '1', '2019-01-22 03:40:06', '2019-01-22 03:40:15');
INSERT INTO `menus` VALUES ('30', '7', '域名管理', null, '/url', '1000', '1', '2019-01-28 04:32:13', '2019-01-28 04:32:13');
INSERT INTO `menus` VALUES ('31', '1', '访问日志', null, '/visit', '1000', '1', '2019-01-29 03:30:08', '2019-01-29 03:30:08');
INSERT INTO `menus` VALUES ('32', '1', '系统配置', null, '/config', '1000', '1', '2019-01-30 01:53:27', '2019-01-30 01:53:27');
INSERT INTO `menus` VALUES ('33', '7', '文章编辑', null, '/article_edit', '1000', '0', '2019-02-07 06:48:55', '2019-02-07 06:48:55');
INSERT INTO `menus` VALUES ('34', '25', '产品编辑', null, '/edit_goods', '1000', '0', '2019-02-07 08:28:38', '2019-02-07 08:28:38');
INSERT INTO `menus` VALUES ('35', '19', '回收站', null, '/recoveryOrder', '1000', '1', '2019-02-12 11:11:20', '2019-02-12 11:11:52');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('2', '2016_06_01_000001_create_oauth_auth_codes_table', '1');
INSERT INTO `migrations` VALUES ('3', '2016_06_01_000002_create_oauth_access_tokens_table', '1');
INSERT INTO `migrations` VALUES ('4', '2016_06_01_000003_create_oauth_refresh_tokens_table', '1');
INSERT INTO `migrations` VALUES ('5', '2016_06_01_000004_create_oauth_clients_table', '1');
INSERT INTO `migrations` VALUES ('6', '2016_06_01_000005_create_oauth_personal_access_clients_table', '1');
INSERT INTO `migrations` VALUES ('7', '2018_08_27_020528_create_users_table', '1');
INSERT INTO `migrations` VALUES ('8', '2018_08_27_071042_create_menus_table', '1');
INSERT INTO `migrations` VALUES ('9', '2018_08_28_060312_create_roles_table', '1');
INSERT INTO `migrations` VALUES ('10', '2018_08_28_060732_create_authorities_table', '1');
INSERT INTO `migrations` VALUES ('11', '2018_09_21_045401_create_role_and_auth_table', '1');
INSERT INTO `migrations` VALUES ('12', '2018_09_21_045431_create_user_and_role_table', '1');
INSERT INTO `migrations` VALUES ('13', '2018_10_22_063109_create_role_and_menu_table', '1');
INSERT INTO `migrations` VALUES ('15', '2018_11_23_065846_create_categroys_table', '3');
INSERT INTO `migrations` VALUES ('16', '2018_11_26_032618_create_html_templates_table', '4');
INSERT INTO `migrations` VALUES ('17', '2018_11_26_072838_create_friend_links_table', '5');
INSERT INTO `migrations` VALUES ('18', '2018_09_17_071636_create_config_models_table', '6');
INSERT INTO `migrations` VALUES ('19', '2018_12_05_084521_create_products_table', '7');
INSERT INTO `migrations` VALUES ('20', '2018_12_06_011225_create_contacts_table', '8');
INSERT INTO `migrations` VALUES ('21', '2018_12_06_011341_create_orders_table', '8');
INSERT INTO `migrations` VALUES ('22', '2018_12_06_075043_create_navs_table', '9');
INSERT INTO `migrations` VALUES ('23', '2018_12_06_075200_create_s_e_os_table', '9');
INSERT INTO `migrations` VALUES ('24', '2018_11_22_075138_create_articles_table', '10');
INSERT INTO `migrations` VALUES ('25', '2019_01_22_071729_create_sources_table', '11');
INSERT INTO `migrations` VALUES ('26', '2019_01_23_011235_create_meals_table', '12');
INSERT INTO `migrations` VALUES ('27', '2019_01_23_035128_create_sizes_table', '13');
INSERT INTO `migrations` VALUES ('28', '2019_01_23_055519_create_source_urls_table', '14');
INSERT INTO `migrations` VALUES ('29', '2019_01_23_061532_create_goods_table', '15');
INSERT INTO `migrations` VALUES ('30', '2019_01_24_080311_create_goods_orders_table', '16');
INSERT INTO `migrations` VALUES ('31', '2019_01_28_034251_create_urls_table', '17');
INSERT INTO `migrations` VALUES ('32', '2019_01_30_004042_create_visit_logs_table', '18');

-- ----------------------------
-- Table structure for navs
-- ----------------------------
DROP TABLE IF EXISTS `navs`;
CREATE TABLE `navs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '导航名称',
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '导航链接地址',
  `seo_id` int(11) DEFAULT NULL COMMENT '页面所使用的 seo信息',
  `nav_banner` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of navs
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '公司名称',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '留言人',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '联系电话',
  `status` int(11) NOT NULL COMMENT '处理状态',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色名称',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '角色描述',
  `sort` smallint(6) NOT NULL DEFAULT '1000' COMMENT '排序',
  `state` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态：{0：禁用，1：正常}',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', '超管', '系统超级管理员默认拥有所有权限', '1000', '1', '2018-11-26 09:42:57', '2018-12-04 03:49:48');
INSERT INTO `roles` VALUES ('2', '运营', '基础运营权限', '1000', '1', '2019-02-08 03:16:04', '2019-02-08 03:16:04');

-- ----------------------------
-- Table structure for role_and_auth
-- ----------------------------
DROP TABLE IF EXISTS `role_and_auth`;
CREATE TABLE `role_and_auth` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL COMMENT '角色ID',
  `auth_id` int(10) unsigned NOT NULL COMMENT '权限ID',
  `extented` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '权限扩展配置',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `page` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '该权限是属于哪个菜单页面的',
  `state` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=423 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of role_and_auth
-- ----------------------------
INSERT INTO `role_and_auth` VALUES ('393', '2', '23', '[]', null, null, 'config', '1');
INSERT INTO `role_and_auth` VALUES ('394', '2', '5', '[\"add\",\"edit\",\"delete\",\"url\"]', null, null, 'article_list', '1');
INSERT INTO `role_and_auth` VALUES ('395', '2', '6', '[\"add\",\"edit\",\"delete\"]', null, null, 'recovery', '1');
INSERT INTO `role_and_auth` VALUES ('396', '2', '8', '[]', null, null, 'publish_article', '1');
INSERT INTO `role_and_auth` VALUES ('397', '2', '25', '[\"add\",\"edit\",\"delete\"]', null, null, 'url', '1');
INSERT INTO `role_and_auth` VALUES ('398', '2', '24', '[]', null, null, 'article_edit', '1');
INSERT INTO `role_and_auth` VALUES ('399', '2', '13', '[\"show\",\"search\",\"delete\"]', null, null, 'goods_order', '1');
INSERT INTO `role_and_auth` VALUES ('400', '2', '27', '[\"recovery\",\"delete\"]', null, null, 'recoveryOrder', '1');
INSERT INTO `role_and_auth` VALUES ('401', '2', '18', '[\"extension\"]', null, null, 'goods_list', '1');
INSERT INTO `role_and_auth` VALUES ('402', '1', '1', '[\"add\",\"edit\",\"delete\"]', null, null, 'menu', '1');
INSERT INTO `role_and_auth` VALUES ('403', '1', '22', '[]', null, null, 'visit', '1');
INSERT INTO `role_and_auth` VALUES ('404', '1', '23', '[]', null, null, 'config', '1');
INSERT INTO `role_and_auth` VALUES ('405', '1', '2', '[\"add\",\"edit\",\"delete\"]', null, null, 'role', '1');
INSERT INTO `role_and_auth` VALUES ('406', '1', '3', '[\"add\",\"edit\",\"delete\",\"disable\",\"userGiveRole\",\"editUserRole\"]', null, null, 'user', '1');
INSERT INTO `role_and_auth` VALUES ('407', '1', '4', '[\"add\",\"edit\",\"delete\"]', null, null, 'auth', '1');
INSERT INTO `role_and_auth` VALUES ('408', '1', '5', '[\"add\",\"edit\",\"delete\",\"url\"]', null, null, 'article_list', '1');
INSERT INTO `role_and_auth` VALUES ('409', '1', '6', '[\"add\",\"edit\",\"delete\"]', null, null, 'recovery', '1');
INSERT INTO `role_and_auth` VALUES ('410', '1', '8', '[]', null, null, 'publish_article', '1');
INSERT INTO `role_and_auth` VALUES ('411', '1', '25', '[\"add\",\"edit\",\"delete\"]', null, null, 'url', '1');
INSERT INTO `role_and_auth` VALUES ('412', '1', '24', '[]', null, null, 'article_edit', '1');
INSERT INTO `role_and_auth` VALUES ('413', '1', '12', '[\"add\",\"edit\",\"delete\"]', null, null, 'source_count', '1');
INSERT INTO `role_and_auth` VALUES ('414', '1', '13', '[\"show\",\"search\",\"delete\"]', null, null, 'goods_order', '1');
INSERT INTO `role_and_auth` VALUES ('415', '1', '14', '[\"add\",\"edit\",\"delete\"]', null, null, 'zh_count', '1');
INSERT INTO `role_and_auth` VALUES ('416', '1', '15', '[\"add\",\"edit\",\"delete\"]', null, null, 'staff_count', '1');
INSERT INTO `role_and_auth` VALUES ('417', '1', '17', '[\"add\",\"edit\",\"delete\"]', null, null, 'source', '1');
INSERT INTO `role_and_auth` VALUES ('418', '1', '27', '[\"recovery\",\"delete\"]', null, null, 'recoveryOrder', '1');
INSERT INTO `role_and_auth` VALUES ('419', '1', '18', '[\"add\",\"edit\",\"delete\",\"extension\"]', null, null, 'goods_list', '1');
INSERT INTO `role_and_auth` VALUES ('420', '1', '19', '[\"add\",\"edit\",\"delete\"]', null, null, 'publish_goods', '1');
INSERT INTO `role_and_auth` VALUES ('421', '1', '20', '[\"add\",\"edit\",\"delete\"]', null, null, 'template', '1');
INSERT INTO `role_and_auth` VALUES ('422', '1', '26', '[]', null, null, 'edit_goods', '1');

-- ----------------------------
-- Table structure for s_e_os
-- ----------------------------
DROP TABLE IF EXISTS `s_e_os`;
CREATE TABLE `s_e_os` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of s_e_os
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户密码',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '手机号码',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户头像',
  `sex` tinyint(4) NOT NULL DEFAULT '0' COMMENT '用户性别:{0:未填写,1:男,2:女}',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '用户类型：{0:管理员，1:普通用户}',
  `state` tinyint(4) NOT NULL DEFAULT '1' COMMENT '用户状态：{0:禁用,1:正常}',
  `options` text COLLATE utf8mb4_unicode_ci COMMENT '个人信息配置',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '记住密码',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_mobile_unique` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'ALG', '$2y$10$pmF42Zhx.Lxk6OCdEXvgmOHgXkzDAm80w/JAZhbZJAYdoa3FumtSi', '13686840083', '513051043@qq.com', 'https://qudongit.oss-cn-beijing.aliyuncs.com/QQ%E5%9B%BE%E7%89%8720181120143701.jpg', '1', '0', '1', '', null, '2018-11-26 09:42:57', '2019-02-07 06:29:45', null);

-- ----------------------------
-- Table structure for user_and_role
-- ----------------------------
DROP TABLE IF EXISTS `user_and_role`;
CREATE TABLE `user_and_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL COMMENT '角色ID',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `role_name` int(11) DEFAULT NULL COMMENT '角色名称',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of user_and_role
-- ----------------------------
INSERT INTO `user_and_role` VALUES ('1', '1', '1', null, '2018-11-26 09:42:57', '2018-11-26 09:42:57');

-- ----------------------------
-- Table structure for visit_logs
-- ----------------------------
DROP TABLE IF EXISTS `visit_logs`;
CREATE TABLE `visit_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ip地址',
  `system_type` text COLLATE utf8mb4_unicode_ci COMMENT '系统及其型号',
  `event` text COLLATE utf8mb4_unicode_ci COMMENT '触发事件',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of visit_logs
-- ----------------------------
