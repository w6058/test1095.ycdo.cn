-- MySQL dump 10.13  Distrib 5.5.47, for Win32 (x86)
--
-- Host: localhost    Database: thinkcmf
-- ------------------------------------------------------
-- Server version	5.5.47

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cmf_ad`
--

DROP TABLE IF EXISTS `cmf_ad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_ad` (
  `ad_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `ad_name` varchar(255) NOT NULL COMMENT '广告名称',
  `ad_content` text COMMENT '广告内容',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`ad_id`),
  KEY `ad_name` (`ad_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_ad`
--

LOCK TABLES `cmf_ad` WRITE;
/*!40000 ALTER TABLE `cmf_ad` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmf_ad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_asset`
--

DROP TABLE IF EXISTS `cmf_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_asset` (
  `aid` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `key` varchar(50) NOT NULL COMMENT '资源 key',
  `filename` varchar(50) DEFAULT NULL COMMENT '文件名',
  `filesize` int(11) DEFAULT NULL COMMENT '文件大小,单位Byte',
  `filepath` varchar(200) NOT NULL COMMENT '文件路径，相对于 upload 目录，可以为 url',
  `uploadtime` int(11) NOT NULL COMMENT '上传时间',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1：可用，0：删除，不可用',
  `meta` text COMMENT '其它详细信息，JSON格式',
  `suffix` varchar(50) DEFAULT NULL COMMENT '文件后缀名，不包括点',
  `download_times` int(11) NOT NULL DEFAULT '0' COMMENT '下载次数',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='资源表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_asset`
--

LOCK TABLES `cmf_asset` WRITE;
/*!40000 ALTER TABLE `cmf_asset` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmf_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_auth_access`
--

DROP TABLE IF EXISTS `cmf_auth_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_auth_access` (
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(255) NOT NULL COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) DEFAULT NULL COMMENT '权限规则分类，请加应用前缀,如admin_',
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限授权表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_auth_access`
--

LOCK TABLES `cmf_auth_access` WRITE;
/*!40000 ALTER TABLE `cmf_auth_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmf_auth_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_auth_rule`
--

DROP TABLE IF EXISTS `cmf_auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` varchar(30) NOT NULL DEFAULT '1' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(255) DEFAULT NULL COMMENT '额外url参数',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=174 DEFAULT CHARSET=utf8 COMMENT='权限规则表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_auth_rule`
--

LOCK TABLES `cmf_auth_rule` WRITE;
/*!40000 ALTER TABLE `cmf_auth_rule` DISABLE KEYS */;
INSERT INTO `cmf_auth_rule` VALUES (1,'Admin','admin_url','admin/content/default',NULL,'内容管理',1,''),(2,'Api','admin_url','api/guestbookadmin/index',NULL,'所有留言',1,''),(3,'Api','admin_url','api/guestbookadmin/delete',NULL,'删除网站留言',1,''),(4,'Comment','admin_url','comment/commentadmin/index',NULL,'评论管理',1,''),(5,'Comment','admin_url','comment/commentadmin/delete',NULL,'删除评论',1,''),(6,'Comment','admin_url','comment/commentadmin/check',NULL,'评论审核',1,''),(7,'Portal','admin_url','portal/adminpost/index',NULL,'文章管理',1,''),(8,'Portal','admin_url','portal/adminpost/listorders',NULL,'文章排序',1,''),(9,'Portal','admin_url','portal/adminpost/top',NULL,'文章置顶',1,''),(10,'Portal','admin_url','portal/adminpost/recommend',NULL,'文章推荐',1,''),(11,'Portal','admin_url','portal/adminpost/move',NULL,'批量移动',1,''),(12,'Portal','admin_url','portal/adminpost/check',NULL,'文章审核',1,''),(13,'Portal','admin_url','portal/adminpost/delete',NULL,'删除文章',1,''),(14,'Portal','admin_url','portal/adminpost/edit',NULL,'编辑文章',1,''),(15,'Portal','admin_url','portal/adminpost/edit_post',NULL,'提交编辑',1,''),(16,'Portal','admin_url','portal/adminpost/add',NULL,'添加文章',1,''),(17,'Portal','admin_url','portal/adminpost/add_post',NULL,'提交添加',1,''),(18,'Portal','admin_url','portal/adminterm/index',NULL,'分类管理',1,''),(19,'Portal','admin_url','portal/adminterm/listorders',NULL,'文章分类排序',1,''),(20,'Portal','admin_url','portal/adminterm/delete',NULL,'删除分类',1,''),(21,'Portal','admin_url','portal/adminterm/edit',NULL,'编辑分类',1,''),(22,'Portal','admin_url','portal/adminterm/edit_post',NULL,'提交编辑',1,''),(23,'Portal','admin_url','portal/adminterm/add',NULL,'添加分类',1,''),(24,'Portal','admin_url','portal/adminterm/add_post',NULL,'提交添加',1,''),(25,'Portal','admin_url','portal/adminpage/index',NULL,'页面管理',1,''),(26,'Portal','admin_url','portal/adminpage/listorders',NULL,'页面排序',1,''),(27,'Portal','admin_url','portal/adminpage/delete',NULL,'删除页面',1,''),(28,'Portal','admin_url','portal/adminpage/edit',NULL,'编辑页面',1,''),(29,'Portal','admin_url','portal/adminpage/edit_post',NULL,'提交编辑',1,''),(30,'Portal','admin_url','portal/adminpage/add',NULL,'添加页面',1,''),(31,'Portal','admin_url','portal/adminpage/add_post',NULL,'提交添加',1,''),(32,'Admin','admin_url','admin/recycle/default',NULL,'回收站',1,''),(33,'Portal','admin_url','portal/adminpost/recyclebin',NULL,'文章回收',1,''),(34,'Portal','admin_url','portal/adminpost/restore',NULL,'文章还原',1,''),(35,'Portal','admin_url','portal/adminpost/clean',NULL,'彻底删除',1,''),(36,'Portal','admin_url','portal/adminpage/recyclebin',NULL,'页面回收',1,''),(37,'Portal','admin_url','portal/adminpage/clean',NULL,'彻底删除',1,''),(38,'Portal','admin_url','portal/adminpage/restore',NULL,'页面还原',1,''),(39,'Admin','admin_url','admin/extension/default',NULL,'扩展工具',1,''),(40,'Admin','admin_url','admin/backup/default',NULL,'备份管理',1,''),(41,'Admin','admin_url','admin/backup/restore',NULL,'数据还原',1,''),(42,'Admin','admin_url','admin/backup/index',NULL,'数据备份',1,''),(43,'Admin','admin_url','admin/backup/index_post',NULL,'提交数据备份',1,''),(44,'Admin','admin_url','admin/backup/download',NULL,'下载备份',1,''),(45,'Admin','admin_url','admin/backup/del_backup',NULL,'删除备份',1,''),(46,'Admin','admin_url','admin/backup/import',NULL,'数据备份导入',1,''),(47,'Admin','admin_url','admin/plugin/index',NULL,'插件管理',1,''),(48,'Admin','admin_url','admin/plugin/toggle',NULL,'插件启用切换',1,''),(49,'Admin','admin_url','admin/plugin/setting',NULL,'插件设置',1,''),(50,'Admin','admin_url','admin/plugin/setting_post',NULL,'插件设置提交',1,''),(51,'Admin','admin_url','admin/plugin/install',NULL,'插件安装',1,''),(52,'Admin','admin_url','admin/plugin/uninstall',NULL,'插件卸载',1,''),(53,'Admin','admin_url','admin/slide/default',NULL,'幻灯片',1,''),(54,'Admin','admin_url','admin/slide/index',NULL,'幻灯片管理',1,''),(55,'Admin','admin_url','admin/slide/listorders',NULL,'幻灯片排序',1,''),(56,'Admin','admin_url','admin/slide/toggle',NULL,'幻灯片显示切换',1,''),(57,'Admin','admin_url','admin/slide/delete',NULL,'删除幻灯片',1,''),(58,'Admin','admin_url','admin/slide/edit',NULL,'编辑幻灯片',1,''),(59,'Admin','admin_url','admin/slide/edit_post',NULL,'提交编辑',1,''),(60,'Admin','admin_url','admin/slide/add',NULL,'添加幻灯片',1,''),(61,'Admin','admin_url','admin/slide/add_post',NULL,'提交添加',1,''),(62,'Admin','admin_url','admin/slidecat/index',NULL,'幻灯片分类',1,''),(63,'Admin','admin_url','admin/slidecat/delete',NULL,'删除分类',1,''),(64,'Admin','admin_url','admin/slidecat/edit',NULL,'编辑分类',1,''),(65,'Admin','admin_url','admin/slidecat/edit_post',NULL,'提交编辑',1,''),(66,'Admin','admin_url','admin/slidecat/add',NULL,'添加分类',1,''),(67,'Admin','admin_url','admin/slidecat/add_post',NULL,'提交添加',1,''),(68,'Admin','admin_url','admin/ad/index',NULL,'网站广告',1,''),(69,'Admin','admin_url','admin/ad/toggle',NULL,'广告显示切换',1,''),(70,'Admin','admin_url','admin/ad/delete',NULL,'删除广告',1,''),(71,'Admin','admin_url','admin/ad/edit',NULL,'编辑广告',1,''),(72,'Admin','admin_url','admin/ad/edit_post',NULL,'提交编辑',1,''),(73,'Admin','admin_url','admin/ad/add',NULL,'添加广告',1,''),(74,'Admin','admin_url','admin/ad/add_post',NULL,'提交添加',1,''),(75,'Admin','admin_url','admin/link/index',NULL,'友情链接',1,''),(76,'Admin','admin_url','admin/link/listorders',NULL,'友情链接排序',1,''),(77,'Admin','admin_url','admin/link/toggle',NULL,'友链显示切换',1,''),(78,'Admin','admin_url','admin/link/delete',NULL,'删除友情链接',1,''),(79,'Admin','admin_url','admin/link/edit',NULL,'编辑友情链接',1,''),(80,'Admin','admin_url','admin/link/edit_post',NULL,'提交编辑',1,''),(81,'Admin','admin_url','admin/link/add',NULL,'添加友情链接',1,''),(82,'Admin','admin_url','admin/link/add_post',NULL,'提交添加',1,''),(83,'Api','admin_url','api/oauthadmin/setting',NULL,'第三方登陆',1,''),(84,'Api','admin_url','api/oauthadmin/setting_post',NULL,'提交设置',1,''),(85,'Admin','admin_url','admin/menu/default',NULL,'菜单管理',1,''),(86,'Admin','admin_url','admin/navcat/default1',NULL,'前台菜单',1,''),(87,'Admin','admin_url','admin/nav/index',NULL,'菜单管理',1,''),(88,'Admin','admin_url','admin/nav/listorders',NULL,'前台导航排序',1,''),(89,'Admin','admin_url','admin/nav/delete',NULL,'删除菜单',1,''),(90,'Admin','admin_url','admin/nav/edit',NULL,'编辑菜单',1,''),(91,'Admin','admin_url','admin/nav/edit_post',NULL,'提交编辑',1,''),(92,'Admin','admin_url','admin/nav/add',NULL,'添加菜单',1,''),(93,'Admin','admin_url','admin/nav/add_post',NULL,'提交添加',1,''),(94,'Admin','admin_url','admin/navcat/index',NULL,'菜单分类',1,''),(95,'Admin','admin_url','admin/navcat/delete',NULL,'删除分类',1,''),(96,'Admin','admin_url','admin/navcat/edit',NULL,'编辑分类',1,''),(97,'Admin','admin_url','admin/navcat/edit_post',NULL,'提交编辑',1,''),(98,'Admin','admin_url','admin/navcat/add',NULL,'添加分类',1,''),(99,'Admin','admin_url','admin/navcat/add_post',NULL,'提交添加',1,''),(100,'Admin','admin_url','admin/menu/index',NULL,'后台菜单',1,''),(101,'Admin','admin_url','admin/menu/add',NULL,'添加菜单',1,''),(102,'Admin','admin_url','admin/menu/add_post',NULL,'提交添加',1,''),(103,'Admin','admin_url','admin/menu/listorders',NULL,'后台菜单排序',1,''),(104,'Admin','admin_url','admin/menu/export_menu',NULL,'菜单备份',1,''),(105,'Admin','admin_url','admin/menu/edit',NULL,'编辑菜单',1,''),(106,'Admin','admin_url','admin/menu/edit_post',NULL,'提交编辑',1,''),(107,'Admin','admin_url','admin/menu/delete',NULL,'删除菜单',1,''),(108,'Admin','admin_url','admin/menu/lists',NULL,'所有菜单',1,''),(109,'Admin','admin_url','admin/setting/default',NULL,'设置',1,''),(110,'Admin','admin_url','admin/setting/userdefault',NULL,'个人信息',1,''),(111,'Admin','admin_url','admin/user/userinfo',NULL,'修改信息',1,''),(112,'Admin','admin_url','admin/user/userinfo_post',NULL,'修改信息提交',1,''),(113,'Admin','admin_url','admin/setting/password',NULL,'修改密码',1,''),(114,'Admin','admin_url','admin/setting/password_post',NULL,'提交修改',1,''),(115,'Admin','admin_url','admin/setting/site',NULL,'网站信息',1,''),(116,'Admin','admin_url','admin/setting/site_post',NULL,'提交修改',1,''),(117,'Admin','admin_url','admin/route/index',NULL,'路由列表',1,''),(118,'Admin','admin_url','admin/route/add',NULL,'路由添加',1,''),(119,'Admin','admin_url','admin/route/add_post',NULL,'路由添加提交',1,''),(120,'Admin','admin_url','admin/route/edit',NULL,'路由编辑',1,''),(121,'Admin','admin_url','admin/route/edit_post',NULL,'路由编辑提交',1,''),(122,'Admin','admin_url','admin/route/delete',NULL,'路由删除',1,''),(123,'Admin','admin_url','admin/route/ban',NULL,'路由禁止',1,''),(124,'Admin','admin_url','admin/route/open',NULL,'路由启用',1,''),(125,'Admin','admin_url','admin/route/listorders',NULL,'路由排序',1,''),(126,'Admin','admin_url','admin/mailer/default',NULL,'邮箱配置',1,''),(127,'Admin','admin_url','admin/mailer/index',NULL,'SMTP配置',1,''),(128,'Admin','admin_url','admin/mailer/index_post',NULL,'提交配置',1,''),(129,'Admin','admin_url','admin/mailer/active',NULL,'注册邮件模板',1,''),(130,'Admin','admin_url','admin/mailer/active_post',NULL,'提交模板',1,''),(131,'Admin','admin_url','admin/setting/clearcache',NULL,'清除缓存',1,''),(132,'User','admin_url','user/indexadmin/default',NULL,'用户管理',1,''),(133,'User','admin_url','user/indexadmin/default1',NULL,'用户组',1,''),(134,'User','admin_url','user/indexadmin/index',NULL,'本站用户',1,''),(135,'User','admin_url','user/indexadmin/ban',NULL,'拉黑会员',1,''),(136,'User','admin_url','user/indexadmin/cancelban',NULL,'启用会员',1,''),(137,'User','admin_url','user/oauthadmin/index',NULL,'第三方用户',1,''),(138,'User','admin_url','user/oauthadmin/delete',NULL,'第三方用户解绑',1,''),(139,'User','admin_url','user/indexadmin/default3',NULL,'管理组',1,''),(140,'Admin','admin_url','admin/rbac/index',NULL,'角色管理',1,''),(141,'Admin','admin_url','admin/rbac/member',NULL,'成员管理',1,''),(142,'Admin','admin_url','admin/rbac/authorize',NULL,'权限设置',1,''),(143,'Admin','admin_url','admin/rbac/authorize_post',NULL,'提交设置',1,''),(144,'Admin','admin_url','admin/rbac/roleedit',NULL,'编辑角色',1,''),(145,'Admin','admin_url','admin/rbac/roleedit_post',NULL,'提交编辑',1,''),(146,'Admin','admin_url','admin/rbac/roledelete',NULL,'删除角色',1,''),(147,'Admin','admin_url','admin/rbac/roleadd',NULL,'添加角色',1,''),(148,'Admin','admin_url','admin/rbac/roleadd_post',NULL,'提交添加',1,''),(149,'Admin','admin_url','admin/user/index',NULL,'管理员',1,''),(150,'Admin','admin_url','admin/user/delete',NULL,'删除管理员',1,''),(151,'Admin','admin_url','admin/user/edit',NULL,'管理员编辑',1,''),(152,'Admin','admin_url','admin/user/edit_post',NULL,'编辑提交',1,''),(153,'Admin','admin_url','admin/user/add',NULL,'管理员添加',1,''),(154,'Admin','admin_url','admin/user/add_post',NULL,'添加提交',1,''),(155,'Admin','admin_url','admin/plugin/update',NULL,'插件更新',1,''),(156,'Admin','admin_url','admin/storage/index',NULL,'文件存储',1,''),(157,'Admin','admin_url','admin/storage/setting_post',NULL,'文件存储设置提交',1,''),(158,'Admin','admin_url','admin/slide/ban',NULL,'禁用幻灯片',1,''),(159,'Admin','admin_url','admin/slide/cancelban',NULL,'启用幻灯片',1,''),(160,'Admin','admin_url','admin/user/ban',NULL,'禁用管理员',1,''),(161,'Admin','admin_url','admin/user/cancelban',NULL,'启用管理员',1,''),(162,'Demo','admin_url','demo/adminindex/index',NULL,'',1,''),(163,'Demo','admin_url','demo/adminindex/last',NULL,'',1,''),(166,'Admin','admin_url','admin/mailer/test',NULL,'测试邮件',1,''),(167,'Admin','admin_url','admin/setting/upload',NULL,'上传设置',1,''),(168,'Admin','admin_url','admin/setting/upload_post',NULL,'上传设置提交',1,''),(169,'Portal','admin_url','portal/adminpost/copy',NULL,'文章批量复制',1,''),(170,'Admin','admin_url','admin/menu/backup_menu',NULL,'备份菜单',1,''),(171,'Admin','admin_url','admin/menu/export_menu_lang',NULL,'导出后台菜单多语言包',1,''),(172,'Admin','admin_url','admin/menu/restore_menu',NULL,'还原菜单',1,''),(173,'Admin','admin_url','admin/menu/getactions',NULL,'导入新菜单',1,'');
/*!40000 ALTER TABLE `cmf_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_comments`
--

DROP TABLE IF EXISTS `cmf_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_table` varchar(100) NOT NULL COMMENT '评论内容所在表，不带表前缀',
  `post_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论内容 id',
  `url` varchar(255) DEFAULT NULL COMMENT '原文地址',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_uid` int(11) NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `full_name` varchar(50) DEFAULT NULL COMMENT '评论者昵称',
  `email` varchar(255) DEFAULT NULL COMMENT '评论者邮箱',
  `createtime` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '评论时间',
  `content` text NOT NULL COMMENT '评论内容',
  `type` smallint(1) NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `parentid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `path` varchar(500) DEFAULT NULL,
  `status` smallint(1) NOT NULL DEFAULT '1' COMMENT '状态，1已审核，0未审核',
  PRIMARY KEY (`id`),
  KEY `comment_post_ID` (`post_id`),
  KEY `comment_approved_date_gmt` (`status`),
  KEY `comment_parent` (`parentid`),
  KEY `table_id_status` (`post_table`,`post_id`,`status`),
  KEY `createtime` (`createtime`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_comments`
--

LOCK TABLES `cmf_comments` WRITE;
/*!40000 ALTER TABLE `cmf_comments` DISABLE KEYS */;
INSERT INTO `cmf_comments` VALUES (1,'posts',4,'index.php?g=&amp;m=article&amp;a=index&amp;id=4&amp;cid=1',2,0,'457674394_qq_com','457674394@qq.com','2017-09-20 18:04:35','你好',1,0,'0-1',1),(2,'posts',71,'://',2,0,'457674394_qq_com','457674394@qq.com','2017-09-20 18:23:37','少',1,0,'0-2',1),(3,'posts',0,'://',2,0,'457674394_qq_com','457674394@qq.com','2017-09-20 22:36:19','nihao',1,0,'0-3',1),(4,'posts',0,'://',2,0,'457674394_qq_com','457674394@qq.com','2017-09-20 22:39:35','a',1,0,'0-4',1),(5,'posts',4,'index.php?g=&amp;m=article&amp;a=index&amp;id=4&amp;cid=1',2,2,'457674394_qq_com','457674394@qq.com','2017-09-20 22:47:00','nih oaa ',1,1,'0-1-5',1),(6,'posts',0,'://',2,0,'457674394_qq_com','457674394@qq.com','2017-09-20 23:00:33','ni hao',1,0,'0-6',1),(7,'posts',4,'index.php?g=&amp;m=article&amp;a=index&amp;id=4&amp;cid=1',2,0,'457674394_qq_com','457674394@qq.com','2017-09-20 23:52:43','a',1,0,'0-7',1),(8,'posts',0,'://',2,0,'457674394_qq_com','457674394@qq.com','2017-09-21 00:04:41','阿萨',1,0,'0-8',1),(9,'posts',0,'://',2,0,'457674394_qq_com','457674394@qq.com','2017-09-21 00:07:53','啊实打实',1,0,'0-9',1),(10,'posts',0,'://',2,0,'457674394_qq_com','457674394@qq.com','2017-09-21 00:10:32','是vs',1,0,'0-10',1),(11,'posts',0,'://',2,0,'457674394_qq_com','457674394@qq.com','2017-09-21 00:13:15','啊飒飒',1,0,'0-11',1),(12,'posts',0,'://',2,0,'457674394_qq_com','457674394@qq.com','2017-09-21 00:31:19','ASA ',1,0,'0-12',1),(13,'posts',0,'://',2,0,'457674394_qq_com','457674394@qq.com','2017-09-21 00:32:22','sasa',1,0,'0-13',1),(14,'posts',0,'://',2,0,'457674394_qq_com','457674394@qq.com','2017-09-25 09:30:33','sascasfs',1,0,'0-14',1),(15,'posts',0,'://',1,0,'admin','admin@admin.com','2017-09-27 16:17:40','34234',1,0,'0-15',1);
/*!40000 ALTER TABLE `cmf_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_common_action_log`
--

DROP TABLE IF EXISTS `cmf_common_action_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_common_action_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` bigint(20) DEFAULT '0' COMMENT '用户id',
  `object` varchar(100) DEFAULT NULL COMMENT '访问对象的id,格式：不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) DEFAULT NULL COMMENT '操作名称；格式规定为：应用名+控制器+操作名；也可自己定义格式只要不发生冲突且惟一；',
  `count` int(11) DEFAULT '0' COMMENT '访问次数',
  `last_time` int(11) DEFAULT '0' COMMENT '最后访问的时间戳',
  `ip` varchar(15) DEFAULT NULL COMMENT '访问者最后访问ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user`,`object`,`action`),
  KEY `user_object_action_ip` (`user`,`object`,`action`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='访问记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_common_action_log`
--

LOCK TABLES `cmf_common_action_log` WRITE;
/*!40000 ALTER TABLE `cmf_common_action_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmf_common_action_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_guestbook`
--

DROP TABLE IF EXISTS `cmf_guestbook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) NOT NULL COMMENT '留言者姓名',
  `email` varchar(100) NOT NULL COMMENT '留言者邮箱',
  `title` varchar(255) DEFAULT NULL COMMENT '留言标题',
  `msg` text NOT NULL COMMENT '留言内容',
  `createtime` datetime NOT NULL COMMENT '留言时间',
  `status` smallint(2) NOT NULL DEFAULT '1' COMMENT '留言状态，1：正常，0：删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='留言表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_guestbook`
--

LOCK TABLES `cmf_guestbook` WRITE;
/*!40000 ALTER TABLE `cmf_guestbook` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmf_guestbook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_links`
--

DROP TABLE IF EXISTS `cmf_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL COMMENT '友情链接地址',
  `link_name` varchar(255) NOT NULL COMMENT '友情链接名称',
  `link_image` varchar(255) DEFAULT NULL COMMENT '友情链接图标',
  `link_target` varchar(25) NOT NULL DEFAULT '_blank' COMMENT '友情链接打开方式',
  `link_description` text NOT NULL COMMENT '友情链接描述',
  `link_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `link_rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `link_rel` varchar(255) DEFAULT NULL COMMENT '链接与网站的关系',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='友情链接表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_links`
--

LOCK TABLES `cmf_links` WRITE;
/*!40000 ALTER TABLE `cmf_links` DISABLE KEYS */;
INSERT INTO `cmf_links` VALUES (1,'http://www.thinkcmf.com','ThinkCMF','','_blank','',1,0,'',0);
/*!40000 ALTER TABLE `cmf_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_menu`
--

DROP TABLE IF EXISTS `cmf_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `app` varchar(30) NOT NULL DEFAULT '' COMMENT '应用名称app',
  `model` varchar(30) NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作名称',
  `data` varchar(50) NOT NULL DEFAULT '' COMMENT '额外参数',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '菜单类型  1：权限认证+菜单；0：只作为菜单',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态，1显示，0不显示',
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序ID',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parentid` (`parentid`),
  KEY `model` (`model`)
) ENGINE=MyISAM AUTO_INCREMENT=187 DEFAULT CHARSET=utf8 COMMENT='后台菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_menu`
--

LOCK TABLES `cmf_menu` WRITE;
/*!40000 ALTER TABLE `cmf_menu` DISABLE KEYS */;
INSERT INTO `cmf_menu` VALUES (1,0,'Admin','Content','default','',0,1,'内容管理','th','',30),(2,1,'Api','Guestbookadmin','index','',1,1,'所有留言','','',0),(3,2,'Api','Guestbookadmin','delete','',1,0,'删除网站留言','','',0),(4,1,'Comment','Commentadmin','index','',1,1,'评论管理','','',0),(5,4,'Comment','Commentadmin','delete','',1,0,'删除评论','','',0),(6,4,'Comment','Commentadmin','check','',1,0,'评论审核','','',0),(7,1,'Portal','AdminPost','index','',1,1,'文章管理','','',1),(8,7,'Portal','AdminPost','listorders','',1,0,'文章排序','','',0),(9,7,'Portal','AdminPost','top','',1,0,'文章置顶','','',0),(10,7,'Portal','AdminPost','recommend','',1,0,'文章推荐','','',0),(11,7,'Portal','AdminPost','move','',1,0,'批量移动','','',1000),(12,7,'Portal','AdminPost','check','',1,0,'文章审核','','',1000),(13,7,'Portal','AdminPost','delete','',1,0,'删除文章','','',1000),(14,7,'Portal','AdminPost','edit','',1,0,'编辑文章','','',1000),(15,14,'Portal','AdminPost','edit_post','',1,0,'提交编辑','','',0),(16,7,'Portal','AdminPost','add','',1,0,'添加文章','','',1000),(17,16,'Portal','AdminPost','add_post','',1,0,'提交添加','','',0),(18,1,'Portal','AdminTerm','index','',0,1,'分类管理','','',2),(19,18,'Portal','AdminTerm','listorders','',1,0,'文章分类排序','','',0),(20,18,'Portal','AdminTerm','delete','',1,0,'删除分类','','',1000),(21,18,'Portal','AdminTerm','edit','',1,0,'编辑分类','','',1000),(22,21,'Portal','AdminTerm','edit_post','',1,0,'提交编辑','','',0),(23,18,'Portal','AdminTerm','add','',1,0,'添加分类','','',1000),(24,23,'Portal','AdminTerm','add_post','',1,0,'提交添加','','',0),(25,1,'Portal','AdminPage','index','',1,1,'页面管理','','',3),(26,25,'Portal','AdminPage','listorders','',1,0,'页面排序','','',0),(27,25,'Portal','AdminPage','delete','',1,0,'删除页面','','',1000),(28,25,'Portal','AdminPage','edit','',1,0,'编辑页面','','',1000),(29,28,'Portal','AdminPage','edit_post','',1,0,'提交编辑','','',0),(30,25,'Portal','AdminPage','add','',1,0,'添加页面','','',1000),(31,30,'Portal','AdminPage','add_post','',1,0,'提交添加','','',0),(32,1,'Admin','Recycle','default','',1,1,'回收站','','',4),(33,32,'Portal','AdminPost','recyclebin','',1,1,'文章回收','','',0),(34,33,'Portal','AdminPost','restore','',1,0,'文章还原','','',1000),(35,33,'Portal','AdminPost','clean','',1,0,'彻底删除','','',1000),(36,32,'Portal','AdminPage','recyclebin','',1,1,'页面回收','','',1),(37,36,'Portal','AdminPage','clean','',1,0,'彻底删除','','',1000),(38,36,'Portal','AdminPage','restore','',1,0,'页面还原','','',1000),(39,0,'Admin','Extension','default','',0,1,'扩展工具','cloud','',40),(40,39,'Admin','Backup','default','',1,0,'备份管理','','',0),(41,40,'Admin','Backup','restore','',1,1,'数据还原','','',0),(42,40,'Admin','Backup','index','',1,1,'数据备份','','',0),(43,42,'Admin','Backup','index_post','',1,0,'提交数据备份','','',0),(44,40,'Admin','Backup','download','',1,0,'下载备份','','',1000),(45,40,'Admin','Backup','del_backup','',1,0,'删除备份','','',1000),(46,40,'Admin','Backup','import','',1,0,'数据备份导入','','',1000),(47,39,'Admin','Plugin','index','',1,1,'插件管理','','',0),(48,47,'Admin','Plugin','toggle','',1,0,'插件启用切换','','',0),(49,47,'Admin','Plugin','setting','',1,0,'插件设置','','',0),(50,49,'Admin','Plugin','setting_post','',1,0,'插件设置提交','','',0),(51,47,'Admin','Plugin','install','',1,0,'插件安装','','',0),(52,47,'Admin','Plugin','uninstall','',1,0,'插件卸载','','',0),(53,39,'Admin','Slide','default','',1,1,'幻灯片','','',1),(54,53,'Admin','Slide','index','',1,1,'幻灯片管理','','',0),(55,54,'Admin','Slide','listorders','',1,0,'幻灯片排序','','',0),(56,54,'Admin','Slide','toggle','',1,0,'幻灯片显示切换','','',0),(57,54,'Admin','Slide','delete','',1,0,'删除幻灯片','','',1000),(58,54,'Admin','Slide','edit','',1,0,'编辑幻灯片','','',1000),(59,58,'Admin','Slide','edit_post','',1,0,'提交编辑','','',0),(60,54,'Admin','Slide','add','',1,0,'添加幻灯片','','',1000),(61,60,'Admin','Slide','add_post','',1,0,'提交添加','','',0),(62,53,'Admin','Slidecat','index','',1,1,'幻灯片分类','','',0),(63,62,'Admin','Slidecat','delete','',1,0,'删除分类','','',1000),(64,62,'Admin','Slidecat','edit','',1,0,'编辑分类','','',1000),(65,64,'Admin','Slidecat','edit_post','',1,0,'提交编辑','','',0),(66,62,'Admin','Slidecat','add','',1,0,'添加分类','','',1000),(67,66,'Admin','Slidecat','add_post','',1,0,'提交添加','','',0),(68,39,'Admin','Ad','index','',1,1,'网站广告','','',2),(69,68,'Admin','Ad','toggle','',1,0,'广告显示切换','','',0),(70,68,'Admin','Ad','delete','',1,0,'删除广告','','',1000),(71,68,'Admin','Ad','edit','',1,0,'编辑广告','','',1000),(72,71,'Admin','Ad','edit_post','',1,0,'提交编辑','','',0),(73,68,'Admin','Ad','add','',1,0,'添加广告','','',1000),(74,73,'Admin','Ad','add_post','',1,0,'提交添加','','',0),(75,39,'Admin','Link','index','',0,1,'友情链接','','',3),(76,75,'Admin','Link','listorders','',1,0,'友情链接排序','','',0),(77,75,'Admin','Link','toggle','',1,0,'友链显示切换','','',0),(78,75,'Admin','Link','delete','',1,0,'删除友情链接','','',1000),(79,75,'Admin','Link','edit','',1,0,'编辑友情链接','','',1000),(80,79,'Admin','Link','edit_post','',1,0,'提交编辑','','',0),(81,75,'Admin','Link','add','',1,0,'添加友情链接','','',1000),(82,81,'Admin','Link','add_post','',1,0,'提交添加','','',0),(83,39,'Api','Oauthadmin','setting','',1,1,'第三方登陆','leaf','',4),(84,83,'Api','Oauthadmin','setting_post','',1,0,'提交设置','','',0),(85,0,'Admin','Menu','default','',1,1,'菜单管理','list','',20),(86,85,'Admin','Navcat','default1','',1,1,'前台菜单','','',0),(87,86,'Admin','Nav','index','',1,1,'菜单管理','','',0),(88,87,'Admin','Nav','listorders','',1,0,'前台导航排序','','',0),(89,87,'Admin','Nav','delete','',1,0,'删除菜单','','',1000),(90,87,'Admin','Nav','edit','',1,0,'编辑菜单','','',1000),(91,90,'Admin','Nav','edit_post','',1,0,'提交编辑','','',0),(92,87,'Admin','Nav','add','',1,0,'添加菜单','','',1000),(93,92,'Admin','Nav','add_post','',1,0,'提交添加','','',0),(94,86,'Admin','Navcat','index','',1,1,'菜单分类','','',0),(95,94,'Admin','Navcat','delete','',1,0,'删除分类','','',1000),(96,94,'Admin','Navcat','edit','',1,0,'编辑分类','','',1000),(97,96,'Admin','Navcat','edit_post','',1,0,'提交编辑','','',0),(98,94,'Admin','Navcat','add','',1,0,'添加分类','','',1000),(99,98,'Admin','Navcat','add_post','',1,0,'提交添加','','',0),(100,85,'Admin','Menu','index','',1,1,'后台菜单','','',0),(101,100,'Admin','Menu','add','',1,0,'添加菜单','','',0),(102,101,'Admin','Menu','add_post','',1,0,'提交添加','','',0),(103,100,'Admin','Menu','listorders','',1,0,'后台菜单排序','','',0),(104,100,'Admin','Menu','export_menu','',1,0,'菜单备份','','',1000),(105,100,'Admin','Menu','edit','',1,0,'编辑菜单','','',1000),(106,105,'Admin','Menu','edit_post','',1,0,'提交编辑','','',0),(107,100,'Admin','Menu','delete','',1,0,'删除菜单','','',1000),(108,100,'Admin','Menu','lists','',1,0,'所有菜单','','',1000),(109,0,'Admin','Setting','default','',0,1,'设置','cogs','',0),(110,109,'Admin','Setting','userdefault','',0,1,'个人信息','','',0),(111,110,'Admin','User','userinfo','',1,1,'修改信息','','',0),(112,111,'Admin','User','userinfo_post','',1,0,'修改信息提交','','',0),(113,110,'Admin','Setting','password','',1,1,'修改密码','','',0),(114,113,'Admin','Setting','password_post','',1,0,'提交修改','','',0),(115,109,'Admin','Setting','site','',1,1,'网站信息','','',0),(116,115,'Admin','Setting','site_post','',1,0,'提交修改','','',0),(117,115,'Admin','Route','index','',1,0,'路由列表','','',0),(118,115,'Admin','Route','add','',1,0,'路由添加','','',0),(119,118,'Admin','Route','add_post','',1,0,'路由添加提交','','',0),(120,115,'Admin','Route','edit','',1,0,'路由编辑','','',0),(121,120,'Admin','Route','edit_post','',1,0,'路由编辑提交','','',0),(122,115,'Admin','Route','delete','',1,0,'路由删除','','',0),(123,115,'Admin','Route','ban','',1,0,'路由禁止','','',0),(124,115,'Admin','Route','open','',1,0,'路由启用','','',0),(125,115,'Admin','Route','listorders','',1,0,'路由排序','','',0),(126,109,'Admin','Mailer','default','',1,1,'邮箱配置','','',0),(127,126,'Admin','Mailer','index','',1,1,'SMTP配置','','',0),(128,127,'Admin','Mailer','index_post','',1,0,'提交配置','','',0),(129,126,'Admin','Mailer','active','',1,1,'注册邮件模板','','',0),(130,129,'Admin','Mailer','active_post','',1,0,'提交模板','','',0),(131,109,'Admin','Setting','clearcache','',1,1,'清除缓存','','',1),(132,0,'User','Indexadmin','default','',1,1,'用户管理','group','',10),(133,132,'User','Indexadmin','default1','',1,1,'用户组','','',0),(134,133,'User','Indexadmin','index','',1,1,'本站用户','leaf','',0),(135,134,'User','Indexadmin','ban','',1,0,'拉黑会员','','',0),(136,134,'User','Indexadmin','cancelban','',1,0,'启用会员','','',0),(137,133,'User','Oauthadmin','index','',1,1,'第三方用户','leaf','',0),(138,137,'User','Oauthadmin','delete','',1,0,'第三方用户解绑','','',0),(139,132,'User','Indexadmin','default3','',1,1,'管理组','','',0),(140,139,'Admin','Rbac','index','',1,1,'角色管理','','',0),(141,140,'Admin','Rbac','member','',1,0,'成员管理','','',1000),(142,140,'Admin','Rbac','authorize','',1,0,'权限设置','','',1000),(143,142,'Admin','Rbac','authorize_post','',1,0,'提交设置','','',0),(144,140,'Admin','Rbac','roleedit','',1,0,'编辑角色','','',1000),(145,144,'Admin','Rbac','roleedit_post','',1,0,'提交编辑','','',0),(146,140,'Admin','Rbac','roledelete','',1,1,'删除角色','','',1000),(147,140,'Admin','Rbac','roleadd','',1,1,'添加角色','','',1000),(148,147,'Admin','Rbac','roleadd_post','',1,0,'提交添加','','',0),(149,139,'Admin','User','index','',1,1,'管理员','','',0),(150,149,'Admin','User','delete','',1,0,'删除管理员','','',1000),(151,149,'Admin','User','edit','',1,0,'管理员编辑','','',1000),(152,151,'Admin','User','edit_post','',1,0,'编辑提交','','',0),(153,149,'Admin','User','add','',1,0,'管理员添加','','',1000),(154,153,'Admin','User','add_post','',1,0,'添加提交','','',0),(155,47,'Admin','Plugin','update','',1,0,'插件更新','','',0),(156,109,'Admin','Storage','index','',1,1,'文件存储','','',0),(157,156,'Admin','Storage','setting_post','',1,0,'文件存储设置提交','','',0),(158,54,'Admin','Slide','ban','',1,0,'禁用幻灯片','','',0),(159,54,'Admin','Slide','cancelban','',1,0,'启用幻灯片','','',0),(160,149,'Admin','User','ban','',1,0,'禁用管理员','','',0),(161,149,'Admin','User','cancelban','',1,0,'启用管理员','','',0),(166,127,'Admin','Mailer','test','',1,0,'测试邮件','','',0),(167,109,'Admin','Setting','upload','',1,1,'上传设置','','',0),(168,167,'Admin','Setting','upload_post','',1,0,'上传设置提交','','',0),(169,7,'Portal','AdminPost','copy','',1,0,'文章批量复制','','',0),(174,100,'Admin','Menu','backup_menu','',1,0,'备份菜单','','',0),(175,100,'Admin','Menu','export_menu_lang','',1,0,'导出后台菜单多语言包','','',0),(176,100,'Admin','Menu','restore_menu','',1,0,'还原菜单','','',0),(177,100,'Admin','Menu','getactions','',1,0,'导入新菜单','','',0);
/*!40000 ALTER TABLE `cmf_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_nav`
--

DROP TABLE IF EXISTS `cmf_nav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT '导航分类 id',
  `parentid` int(11) NOT NULL COMMENT '导航父 id',
  `label` varchar(255) NOT NULL COMMENT '导航标题',
  `target` varchar(50) DEFAULT NULL COMMENT '打开方式',
  `href` varchar(255) NOT NULL COMMENT '导航链接',
  `icon` varchar(255) NOT NULL COMMENT '导航图标',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(6) DEFAULT '0' COMMENT '排序',
  `path` varchar(255) NOT NULL DEFAULT '0' COMMENT '层级关系',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='前台导航表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_nav`
--

LOCK TABLES `cmf_nav` WRITE;
/*!40000 ALTER TABLE `cmf_nav` DISABLE KEYS */;
INSERT INTO `cmf_nav` VALUES (1,1,0,'首页','','','',1,0,'0-1'),(2,1,0,'关于我们','','http://localhost/index.php?g=&m=about&a=index','',1,0,'0-2'),(3,1,0,'菜单','','http://localhost/index.php?g=&m=ourmenu&a=index','',1,0,'0-3'),(4,1,0,'在线预定','','http://localhost/index.php?g=&m=reservation&a=index','',1,0,'0-4'),(5,1,0,'服务','','http://localhost/index.php?g=&m=services&a=index','',1,0,'0-5'),(6,1,0,'画廊','','http://localhost/index.php?g=&m=gallery&a=index','',1,0,'0-6'),(7,1,0,'联系我们','','http://localhost/index.php?g=&m=contact&a=index','',1,0,'0-7'),(8,1,0,'新闻热点','','http://localhost/index.php?g=&m=news&a=index','',1,0,'0-8');
/*!40000 ALTER TABLE `cmf_nav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_nav_cat`
--

DROP TABLE IF EXISTS `cmf_nav_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_nav_cat` (
  `navcid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '导航分类名',
  `active` int(1) NOT NULL DEFAULT '1' COMMENT '是否为主菜单，1是，0不是',
  `remark` text COMMENT '备注',
  PRIMARY KEY (`navcid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='前台导航分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_nav_cat`
--

LOCK TABLES `cmf_nav_cat` WRITE;
/*!40000 ALTER TABLE `cmf_nav_cat` DISABLE KEYS */;
INSERT INTO `cmf_nav_cat` VALUES (1,'主导航',1,'主导航');
/*!40000 ALTER TABLE `cmf_nav_cat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_oauth_user`
--

DROP TABLE IF EXISTS `cmf_oauth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_oauth_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `from` varchar(20) NOT NULL COMMENT '用户来源key',
  `name` varchar(30) NOT NULL COMMENT '第三方昵称',
  `head_img` varchar(200) NOT NULL COMMENT '头像',
  `uid` int(20) NOT NULL COMMENT '关联的本站用户id',
  `create_time` datetime NOT NULL COMMENT '绑定时间',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(16) NOT NULL COMMENT '最后登录ip',
  `login_times` int(6) NOT NULL COMMENT '登录次数',
  `status` tinyint(2) NOT NULL,
  `access_token` varchar(512) NOT NULL,
  `expires_date` int(11) NOT NULL COMMENT 'access_token过期时间',
  `openid` varchar(40) NOT NULL COMMENT '第三方用户id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='第三方用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_oauth_user`
--

LOCK TABLES `cmf_oauth_user` WRITE;
/*!40000 ALTER TABLE `cmf_oauth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmf_oauth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_options`
--

DROP TABLE IF EXISTS `cmf_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL COMMENT '配置名',
  `option_value` longtext NOT NULL COMMENT '配置值',
  `autoload` int(2) NOT NULL DEFAULT '1' COMMENT '是否自动加载',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='全站配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_options`
--

LOCK TABLES `cmf_options` WRITE;
/*!40000 ALTER TABLE `cmf_options` DISABLE KEYS */;
INSERT INTO `cmf_options` VALUES (1,'member_email_active','{\"title\":\"ThinkCMF\\u90ae\\u4ef6\\u6fc0\\u6d3b\\u901a\\u77e5.\",\"template\":\"<p>\\u672c\\u90ae\\u4ef6\\u6765\\u81ea<a href=\\\"http:\\/\\/www.thinkcmf.com\\\">ThinkCMF<\\/a><br\\/><br\\/>&nbsp; &nbsp;<strong>---------------<strong style=\\\"white-space: normal;\\\">---<\\/strong><\\/strong><br\\/>&nbsp; &nbsp;<strong>\\u5e10\\u53f7\\u6fc0\\u6d3b\\u8bf4\\u660e<\\/strong><br\\/>&nbsp; &nbsp;<strong>---------------<strong style=\\\"white-space: normal;\\\">---<\\/strong><\\/strong><br\\/><br\\/>&nbsp; &nbsp; \\u5c0a\\u656c\\u7684<span style=\\\"FONT-SIZE: 16px; FONT-FAMILY: Arial; COLOR: rgb(51,51,51); LINE-HEIGHT: 18px; BACKGROUND-COLOR: rgb(255,255,255)\\\">#username#\\uff0c\\u60a8\\u597d\\u3002<\\/span>\\u5982\\u679c\\u60a8\\u662fThinkCMF\\u7684\\u65b0\\u7528\\u6237\\uff0c\\u6216\\u5728\\u4fee\\u6539\\u60a8\\u7684\\u6ce8\\u518cEmail\\u65f6\\u4f7f\\u7528\\u4e86\\u672c\\u5730\\u5740\\uff0c\\u6211\\u4eec\\u9700\\u8981\\u5bf9\\u60a8\\u7684\\u5730\\u5740\\u6709\\u6548\\u6027\\u8fdb\\u884c\\u9a8c\\u8bc1\\u4ee5\\u907f\\u514d\\u5783\\u573e\\u90ae\\u4ef6\\u6216\\u5730\\u5740\\u88ab\\u6ee5\\u7528\\u3002<br\\/>&nbsp; &nbsp; \\u60a8\\u53ea\\u9700\\u70b9\\u51fb\\u4e0b\\u9762\\u7684\\u94fe\\u63a5\\u5373\\u53ef\\u6fc0\\u6d3b\\u60a8\\u7684\\u5e10\\u53f7\\uff1a<br\\/>&nbsp; &nbsp; <a title=\\\"\\\" href=\\\"http:\\/\\/#link#\\\" target=\\\"_self\\\">http:\\/\\/#link#<\\/a><br\\/>&nbsp; &nbsp; (\\u5982\\u679c\\u4e0a\\u9762\\u4e0d\\u662f\\u94fe\\u63a5\\u5f62\\u5f0f\\uff0c\\u8bf7\\u5c06\\u8be5\\u5730\\u5740\\u624b\\u5de5\\u7c98\\u8d34\\u5230\\u6d4f\\u89c8\\u5668\\u5730\\u5740\\u680f\\u518d\\u8bbf\\u95ee)<br\\/>&nbsp; &nbsp; \\u611f\\u8c22\\u60a8\\u7684\\u8bbf\\u95ee\\uff0c\\u795d\\u60a8\\u4f7f\\u7528\\u6109\\u5feb\\uff01<br\\/><br\\/>&nbsp; &nbsp; \\u6b64\\u81f4<br\\/>&nbsp; &nbsp; ThinkCMF \\u7ba1\\u7406\\u56e2\\u961f.<\\/p>\"}',1),(6,'site_options','{\"site_name\":\"\\u7231\\u70d8\\u7119\",\"site_admin_url_password\":\"\",\"site_tpl\":\"simplebootx\",\"site_adminstyle\":\"flat\",\"site_icp\":\"\",\"site_admin_email\":\"admin@admin.com\",\"site_tongji\":\"\",\"site_copyright\":\"\",\"site_seo_title\":\"ThinkCMF\\u5185\\u5bb9\\u7ba1\\u7406\\u6846\\u67b6\",\"site_seo_keywords\":\"ThinkCMF,php,\\u5185\\u5bb9\\u7ba1\\u7406\\u6846\\u67b6,cmf,cms,\\u7b80\\u7ea6\\u98ce, simplewind,framework\",\"site_seo_description\":\"ThinkCMF\\u662f\\u7b80\\u7ea6\\u98ce\\u7f51\\u7edc\\u79d1\\u6280\\u53d1\\u5e03\\u7684\\u4e00\\u6b3e\\u7528\\u4e8e\\u5feb\\u901f\\u5f00\\u53d1\\u7684\\u5185\\u5bb9\\u7ba1\\u7406\\u6846\\u67b6\",\"urlmode\":\"0\",\"html_suffix\":\"\",\"comment_time_interval\":\"60\"}',1),(7,'cmf_settings','{\"banned_usernames\":\"\"}',1),(8,'cdn_settings','{\"cdn_static_root\":\"\"}',1);
/*!40000 ALTER TABLE `cmf_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_plugins`
--

DROP TABLE IF EXISTS `cmf_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_plugins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(50) NOT NULL COMMENT '插件名，英文',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '插件名称',
  `description` text COMMENT '插件描述',
  `type` tinyint(2) DEFAULT '0' COMMENT '插件类型, 1:网站；8;微信',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态；1开启；',
  `config` text COMMENT '插件配置',
  `hooks` varchar(255) DEFAULT NULL COMMENT '实现的钩子;以“，”分隔',
  `has_admin` tinyint(2) DEFAULT '0' COMMENT '插件是否有后台管理界面',
  `author` varchar(50) DEFAULT '' COMMENT '插件作者',
  `version` varchar(20) DEFAULT '' COMMENT '插件版本号',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `listorder` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='插件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_plugins`
--

LOCK TABLES `cmf_plugins` WRITE;
/*!40000 ALTER TABLE `cmf_plugins` DISABLE KEYS */;
INSERT INTO `cmf_plugins` VALUES (1,'Comment','系统评论插件','系统评论插件',0,1,'','comment',0,'ThinkCMF','1.0',0,0);
/*!40000 ALTER TABLE `cmf_plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_posts`
--

DROP TABLE IF EXISTS `cmf_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned DEFAULT '0' COMMENT '发表者id',
  `post_keywords` varchar(150) NOT NULL COMMENT 'seo keywords',
  `post_source` varchar(150) DEFAULT NULL COMMENT '转载文章的来源',
  `post_date` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post发布日期',
  `post_content` longtext COMMENT 'post内容',
  `post_title` text COMMENT 'post标题',
  `post_excerpt` text COMMENT 'post摘要',
  `post_status` int(2) DEFAULT '1' COMMENT 'post状态，1已审核，0未审核,3删除',
  `comment_status` int(2) DEFAULT '1' COMMENT '评论状态，1允许，0不允许',
  `post_modified` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post更新时间，可在前台修改，显示给用户',
  `post_content_filtered` longtext,
  `post_parent` bigint(20) unsigned DEFAULT '0' COMMENT 'post的父级post id,表示post层级关系',
  `post_type` int(2) DEFAULT '1' COMMENT 'post类型，1文章,2页面',
  `post_mime_type` varchar(100) DEFAULT '',
  `comment_count` bigint(20) DEFAULT '0',
  `smeta` text COMMENT 'post的扩展字段，保存相关扩展属性，如缩略图；格式为json',
  `post_hits` int(11) DEFAULT '0' COMMENT 'post点击数，查看数',
  `post_like` int(11) DEFAULT '0' COMMENT 'post赞数',
  `istop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶 1置顶； 0不置顶',
  `recommended` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐 1推荐 0不推荐',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`id`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),
  KEY `post_date` (`post_date`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COMMENT='Portal文章表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_posts`
--

LOCK TABLES `cmf_posts` WRITE;
/*!40000 ALTER TABLE `cmf_posts` DISABLE KEYS */;
INSERT INTO `cmf_posts` VALUES (8,1,'玛丽','','2017-09-19 19:18:27','<p>褒奖1褒奖1褒奖1褒奖1褒奖1褒奖1褒奖1褒奖1褒奖1褒奖1褒奖1褒奖1</p>','褒奖1','玛丽一',3,1,'2017-09-19 21:57:40',NULL,0,1,'',0,'{\"thumb\":\"portal\\/20170919\\/59c0fd28549d2.jpg\",\"template\":\"\",\"photo\":[{\"url\":\"http:\\/\\/localhost\\/data\\/upload\\/portal\\/20170919\\/59c0fd1c2e1b0.jpg\",\"alt\":\"avatar-1.jpg\"}]}',0,0,0,0),(2,1,'测试food1','','2017-09-18 17:24:49','<p><img src=\"/data/upload/ueditor/20170919/59c0db3dd0c60.jpg\" title=\"food-1.jpg\" alt=\"food-1.jpg\"/></p>','测试food1','',1,1,'2017-09-19 16:54:44',NULL,0,1,'',0,'{\"thumb\":\"portal\\/20170919\\/59c0db48cfe10.jpg\",\"template\":\"index\",\"photo\":[{\"url\":\"portal\\/20170919\\/59c0db51a554f.jpg\",\"alt\":\"food-1.jpg\"}]}',17,0,0,0),(4,1,'测试food2','','2017-09-19 16:54:51','<p><img src=\"/data/upload/ueditor/20170919/59c0db887b6b9.jpg\" title=\"food-2.jpg\" alt=\"food-2.jpg\"/></p>','测试food2','测试food2',1,1,'2017-09-19 16:55:58',NULL,0,1,'',3,'{\"thumb\":\"portal\\/20170919\\/59c0db9524605.jpg\",\"template\":\"\",\"photo\":[{\"url\":\"portal\\/20170919\\/59c0db9c70970.jpg\",\"alt\":\"food-2.jpg\"}]}',33,0,0,0),(3,1,'121','121','2017-09-19 10:15:03','<p>文章内容写这里 &nbsp;测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试</p>','主页关于我们 标题测试','测试',1,1,'2017-09-27 10:36:17',NULL,0,1,'',0,'{\"thumb\":\"portal\\/20170927\\/59cb0e0b31836.png\",\"template\":\"\",\"photo\":[{\"url\":\"http:\\/\\/localhost\\/data\\/upload\\/portal\\/20170919\\/59c0f00dca837.png\",\"alt\":\"avtar-about.png\"}]}',5,0,0,0),(5,1,'测试food3','','2017-09-19 16:56:00','<p><img src=\"/data/upload/ueditor/20170919/59c0dbb20186d.jpg\" title=\"food-3.jpg\" alt=\"food-3.jpg\"/></p>','测试food3','测试food3',1,1,'2017-09-19 17:35:14',NULL,0,1,'',0,'{\"thumb\":\"portal\\/20170919\\/59c0dbc5b59c2.jpg\",\"template\":\"\",\"photo\":[{\"url\":\"http:\\/\\/localhost\\/data\\/upload\\/portal\\/20170919\\/59c0dbbe480e1.jpg\",\"alt\":\"food-3.jpg\"}]}',6,0,0,0),(7,1,'测试膳食','','2017-09-19 18:53:13','<p>测试膳食测试膳食测试膳食测试膳食测试膳食测试膳食测试膳食测试膳食测试膳食测试膳食测试膳食测试膳食测试膳食</p>','测试膳食','测试膳食',1,1,'2017-09-27 10:39:17',NULL,0,1,'',0,'{\"thumb\":\"\",\"template\":\"\",\"photo\":[{\"url\":\"http:\\/\\/localhost\\/data\\/upload\\/portal\\/20170919\\/59c0f77b187cd.png\",\"alt\":\"avtar.png\"},{\"url\":\"http:\\/\\/localhost\\/data\\/upload\\/portal\\/20170919\\/59c0f784c75fe.jpg\",\"alt\":\"services-1.jpg\"}]}',0,0,0,0),(9,1,'艾特','','2017-09-19 19:19:10','<p>褒奖2褒奖2褒奖2褒奖2褒奖2褒奖2褒奖2褒奖2褒奖2褒奖2褒奖2</p>','褒奖2','艾特一',3,1,'2017-09-19 21:54:33',NULL,0,1,'',0,'{\"thumb\":\"portal\\/20170919\\/59c0fd52b2ee0.jpg\",\"template\":\"\",\"photo\":[{\"url\":\"http:\\/\\/localhost\\/data\\/upload\\/portal\\/20170919\\/59c0fd4a526a2.jpg\",\"alt\":\"avatar-2.jpg\"}]}',0,0,0,0),(10,1,'活动1','','2017-09-19 22:06:05','<p>活动1活动1活动1活动1活动1活动1活动1活动1活动1活动1活动1</p>','活动1','时间测试',1,1,'2017-09-20 09:44:09',NULL,0,1,'',0,'{\"thumb\":\"portal\\/20170919\\/59c124d5b668e.jpg\",\"template\":\"\",\"photo\":[{\"url\":\"http:\\/\\/localhost\\/data\\/upload\\/portal\\/20170919\\/59c124c133d63.jpg\",\"alt\":\"services-2.jpg\"}]}',0,0,0,0),(11,1,'活动2','','2017-09-19 22:08:30','<p>活动1活动1活动1活动1活动1活动1活动1</p>','活动2','时间测试',1,1,'2017-09-20 09:43:59',NULL,0,1,'',0,'{\"thumb\":\"portal\\/20170919\\/59c1254a2d471.jpg\",\"template\":\"\",\"photo\":[{\"url\":\"http:\\/\\/localhost\\/data\\/upload\\/portal\\/20170919\\/59c1253cf25a4.jpg\",\"alt\":\"services-3.jpg\"}]}',0,0,0,0),(12,1,'活动3','','2017-09-19 22:10:25','<p>活动3活动3活动3活动3活动3活动3活动3活动3活动3活动3活动3活动3</p>','活动3','时间测试',1,1,'2017-09-20 09:43:48',NULL,0,1,'',0,'{\"thumb\":\"portal\\/20170919\\/59c125702fb86.jpg\",\"template\":\"\",\"photo\":[{\"url\":\"http:\\/\\/localhost\\/data\\/upload\\/portal\\/20170919\\/59c1257d34004.jpg\",\"alt\":\"services-4.jpg\"}]}',1,0,0,0),(13,1,'测试','','2017-09-20 09:56:31','<p>测试测试测试测试测试测试测试测试测试</p>','测试','测试',1,1,'2017-09-20 09:56:49',NULL,0,1,'',0,'{\"thumb\":\"\",\"template\":\"\"}',0,0,0,0),(14,1,'','测试','2017-09-20 10:16:58','<p>测试测试测试测试测试</p>','测试','测试',1,1,'2017-09-20 10:17:51',NULL,0,1,'',0,'{\"thumb\":\"portal\\/20170920\\/59c1cfcc26db9.jpg\",\"template\":\"\",\"photo\":[{\"url\":\"portal\\/20170920\\/59c1cfc3103ac.jpg\",\"alt\":\"page-banner.jpg\"}]}',0,0,0,0),(15,1,'测试','','2017-09-20 10:36:47','<p>测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试</p>','关于我们-文章一-测试','测试测试',1,1,'2017-09-27 09:41:17',NULL,0,1,'',0,'{\"thumb\":\"portal\\/20170920\\/59c1d6cd0b606.jpg\",\"template\":\"\",\"photo\":[{\"url\":\"http:\\/\\/localhost\\/data\\/upload\\/portal\\/20170920\\/59c1d49572fe9.jpg\",\"alt\":\"about-1.jpg\"},{\"url\":\"http:\\/\\/localhost\\/data\\/upload\\/portal\\/20170920\\/59c1d6c0af0e0.jpg\",\"alt\":\"about-2.jpg\"}]}',0,0,0,0),(16,1,'关于我们-文章二-测试','','2017-09-20 10:55:59','<p>测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试</p>','关于我们-文章二-测试','测试',1,1,'2017-09-27 09:42:02',NULL,0,1,'',0,'{\"thumb\":\"\",\"template\":\"\"}',0,0,0,0),(17,1,'测试1','','2017-09-20 11:03:46','<p>测试1测试1测试1测试1测试1测试1</p>','关于我们-文章三-测试1','测试1',1,1,'2017-09-27 09:29:51',NULL,0,1,'',0,'{\"thumb\":\"portal\\/20170920\\/59c1dae297f05.png\",\"template\":\"\",\"photo\":[{\"url\":\"http:\\/\\/localhost\\/data\\/upload\\/portal\\/20170920\\/59c1dad1d5630.png\",\"alt\":\"avtar.png\"}]}',0,0,0,0),(18,1,'测试2','','2017-09-20 11:05:12','<p>测试2测试2测试2测试2测试2测试2</p>','关于我们-文章三-测试2','测试2',1,1,'2017-09-27 09:30:45',NULL,0,1,'',0,'{\"thumb\":\"portal\\/20170920\\/59c1daf13603e.png\",\"template\":\"\",\"photo\":[{\"url\":\"http:\\/\\/localhost\\/data\\/upload\\/portal\\/20170920\\/59c1db04d848d.png\",\"alt\":\"avtar.png\"}]}',0,0,0,0),(19,1,'测试3','','2017-09-20 11:05:59','<p>测试3测试3测试3测试3测试3测试3</p>','关于我们-文章三-测试3','测试3',1,1,'2017-09-27 09:31:26',NULL,0,1,'',0,'{\"thumb\":\"portal\\/20170920\\/59c1db31498d3.png\",\"template\":\"\",\"photo\":[{\"url\":\"http:\\/\\/localhost\\/data\\/upload\\/portal\\/20170920\\/59c1db28eb12d.png\",\"alt\":\"avtar.png\"}]}',0,0,0,0),(20,1,'菜单文章一-测试测试1','','2017-09-20 12:28:16','<p>测试1测试1测试1测试1</p>','菜单文章一-测试测试1','测试1',1,1,'2017-09-27 09:47:09',NULL,0,1,'',0,'{\"thumb\":\"portal\\/20170920\\/59c1f1c7971fd.jpg\",\"template\":\"\",\"photo\":[{\"url\":\"http:\\/\\/localhost\\/data\\/upload\\/portal\\/20170920\\/59c1f1bd31077.jpg\",\"alt\":\"hot-deal.jpg\"}]}',0,0,0,0),(21,1,'测试1','','2017-09-20 13:02:07','<p>测试1测试1测试1测试1测试1测试1测试1</p>','测试1','测试1',1,1,'2017-09-20 13:03:36',NULL,0,1,'',0,'{\"thumb\":\"\",\"template\":\"\"}',0,0,0,0),(22,1,'测试2','','2017-09-20 13:03:38','<p>测试2测试2测试2测试2测试2</p>','测试2','测试2',1,1,'2017-09-20 13:03:56',NULL,0,1,'',0,'{\"thumb\":\"\",\"template\":\"\"}',0,0,0,0),(23,1,'测试3','','2017-09-20 13:03:57','<p>测试3测试3测试3测试3测试3测试3</p>','测试3','测试3',1,1,'2017-09-20 13:04:12',NULL,0,1,'',0,'{\"thumb\":\"\",\"template\":\"\"}',0,0,0,0),(24,1,'测试','','2017-09-20 13:16:20','<p>测试测试测试测试</p>','菜单文章三测试','测试',1,1,'2017-09-20 13:57:13',NULL,0,1,'',0,'{\"thumb\":\"\",\"template\":\"\",\"photo\":[{\"url\":\"http:\\/\\/localhost\\/data\\/upload\\/portal\\/20170920\\/59c1f9da71388.jpg\",\"alt\":\"menu-food-1.jpg\"},{\"url\":\"http:\\/\\/localhost\\/data\\/upload\\/portal\\/20170920\\/59c1f9fbaa17c.jpg\",\"alt\":\"menu-food-2.jpg\"}]}',0,0,0,0),(25,1,'测试1','','2017-09-20 13:27:30','<p>测试1测试1测试1测试1</p>','菜单文章四测试1','测试1',1,1,'2017-09-20 13:30:53',NULL,0,1,'',0,'{\"thumb\":\"\",\"template\":\"\"}',0,0,0,0),(26,1,'测试2','','2017-09-20 13:28:13','<p>测试2测试2测试2测试2</p>','菜单文章四测试2','测试2',1,1,'2017-09-20 13:31:07',NULL,0,1,'',0,'{\"thumb\":\"\",\"template\":\"\"}',0,0,0,0),(27,1,'测试3','','2017-09-20 13:28:26','<p>测试3测试3测试3测试3测试3</p>','菜单文章四测试3','测试3',1,1,'2017-09-20 13:31:22',NULL,0,1,'',0,'{\"thumb\":\"\",\"template\":\"\"}',0,0,0,0),(28,1,'测试4','','2017-09-20 13:28:42','<p>测试4测试4测试4测试4测试4</p>','菜单文章四测试4','测试4',1,1,'2017-09-20 13:31:33',NULL,0,1,'',0,'{\"thumb\":\"\",\"template\":\"\"}',0,0,0,0),(29,1,'测试5','','2017-09-20 13:28:56','<p>测试5测试5测试5测试5</p>','菜单文章四测试5','测试5',1,1,'2017-09-20 13:31:49',NULL,0,1,'',0,'{\"thumb\":\"\",\"template\":\"\"}',0,0,0,0),(30,1,'测试6','','2017-09-20 13:29:09','<p>测试6测试6测试6测试6</p>','菜单文章四测试6','测试6',1,1,'2017-09-20 13:32:02',NULL,0,1,'',0,'{\"thumb\":\"\",\"template\":\"\"}',0,0,0,0),(31,1,'测试7','','2017-09-20 13:29:35','<p>测试7</p>','菜单文章四测试7','测试7测试7测试7测试7测试7',1,1,'2017-09-20 13:52:54',NULL,0,1,'',0,'{\"thumb\":\"\",\"template\":\"\"}',0,0,0,0),(32,1,'测试8','','2017-09-20 13:30:16','<p>测试8测试8测试8测试8</p>','菜单文章四测试8','测试8',1,1,'2017-09-20 13:30:36',NULL,0,1,'',0,'{\"thumb\":\"\",\"template\":\"\"}',0,0,0,0),(33,1,'测试','','2017-09-20 13:58:59','<p>测试测试测试测试测试测试</p>','菜单文章五测试','测试',1,1,'2017-09-27 09:51:06',NULL,0,1,'',0,'{\"thumb\":\"portal\\/20170920\\/59c203f313154.jpg\",\"template\":\"\",\"photo\":[{\"url\":\"http:\\/\\/localhost\\/data\\/upload\\/portal\\/20170920\\/59c2041484f19.jpg\",\"alt\":\"menu-food-3.jpg\"},{\"url\":\"http:\\/\\/localhost\\/data\\/upload\\/portal\\/20170920\\/59c2040943ce8.jpg\",\"alt\":\"menu-food-4.jpg\"}]}',0,0,0,0),(34,1,'菜单文章六测试1','','2017-09-20 14:08:11','<p>菜单文章六测试1菜单文章六测试1菜单文章六测试1</p>','菜单文章六测试1','菜单文章六测试1',1,1,'2017-09-20 14:08:38',NULL,0,1,'',0,'{\"thumb\":\"\",\"template\":\"\"}',0,0,0,0),(35,1,'菜单文章六测试2','','2017-09-20 14:08:40','<p>菜单文章六测试2菜单文章六测试2菜单文章六测试2</p>','菜单文章六测试2','菜单文章六测试2',1,1,'2017-09-20 14:08:56',NULL,0,1,'',0,'{\"thumb\":\"\",\"template\":\"\"}',0,0,0,0),(36,1,'菜单文章六测试3','','2017-09-20 14:08:57','<p>菜单文章六测试3菜单文章六测试3菜单文章六测试3</p>','菜单文章六测试3','菜单文章六测试3',1,1,'2017-09-20 14:09:12',NULL,0,1,'',0,'{\"thumb\":\"\",\"template\":\"\"}',0,0,0,0),(37,1,'菜单文章六测试4','','2017-09-20 14:09:13','<p>菜单文章六测试4菜单文章六测试4菜单文章六测试4</p>','菜单文章六测试4','菜单文章六测试4',1,1,'2017-09-20 14:09:26',NULL,0,1,'',0,'{\"thumb\":\"\",\"template\":\"\"}',0,0,0,0),(38,1,'菜单文章六测试5','','2017-09-20 14:09:27','<p>菜单文章六测试5菜单文章六测试5菜单文章六测试5</p>','菜单文章六测试5','菜单文章六测试5',1,1,'2017-09-20 14:09:54',NULL,0,1,'',0,'{\"thumb\":\"\",\"template\":\"\"}',0,0,0,0),(39,1,'菜单文章六测试6','','2017-09-20 14:09:56','<p>菜单文章六测试6菜单文章六测试6菜单文章六测试6</p>','菜单文章六测试6','菜单文章六测试6',1,1,'2017-09-20 14:10:21',NULL,0,1,'',0,'{\"thumb\":\"\",\"template\":\"\"}',0,0,0,0),(40,1,'菜单文章六测试7','','2017-09-20 14:10:30','<p>菜单文章六测试7菜单文章六测试7菜单文章六测试7</p>','菜单文章六测试7','菜单文章六测试7',1,1,'2017-09-20 14:10:44',NULL,0,1,'',0,'{\"thumb\":\"\",\"template\":\"\"}',0,0,0,0),(41,1,'菜单文章六测试8','','2017-09-20 14:10:46','<p>菜单文章六测试8菜单文章六测试8菜单文章六测试8</p>','菜单文章六测试8','菜单文章六测试8',1,1,'2017-09-20 14:11:00',NULL,0,1,'',0,'{\"thumb\":\"\",\"template\":\"\"}',0,0,0,0),(42,1,'菜单文章七测试','菜单文章七测试','2017-09-20 14:20:43','<p>菜单文章七测试菜单文章七测试</p>','菜单文章七测试','菜单文章七测试',1,1,'2017-09-27 09:51:28',NULL,0,1,'',0,'{\"thumb\":\"portal\\/20170920\\/59c208fd2d724.jpg\",\"template\":\"\",\"photo\":[{\"url\":\"http:\\/\\/localhost\\/data\\/upload\\/portal\\/20170920\\/59c208eb2550a.jpg\",\"alt\":\"menu-food-5.jpg\"},{\"url\":\"http:\\/\\/localhost\\/data\\/upload\\/portal\\/20170920\\/59c208f2c1738.jpg\",\"alt\":\"menu-food-6.jpg\"}]}',0,0,0,0),(43,1,'菜单文章八测试1','菜单文章八测试1','2017-09-20 14:36:52','<p>菜单文章八测试1菜单文章八测试1</p>','菜单文章八测试1','菜单文章八测试1',1,1,'2017-09-20 14:37:12',NULL,0,1,'',0,'{\"thumb\":\"\",\"template\":\"\"}',0,0,0,0),(44,1,'菜单文章八测试2','菜单文章八测试2','2017-09-20 14:37:14','<p>菜单文章八测试2菜单文章八测试2</p>','菜单文章八测试2','菜单文章八测试2',1,1,'2017-09-20 14:37:25',NULL,0,1,'',0,'{\"thumb\":\"\",\"template\":\"\"}',0,0,0,0),(45,1,'菜单文章八测试3','菜单文章八测试3','2017-09-20 14:37:27','<p>菜单文章八测试3菜单文章八测试3</p>','菜单文章八测试3','菜单文章八测试3',1,1,'2017-09-20 14:37:43',NULL,0,1,'',0,'{\"thumb\":\"\",\"template\":\"\"}',0,0,0,0),(46,1,'菜单文章八测试4','菜单文章八测试4','2017-09-20 14:37:45','<p>菜单文章八测试4菜单文章八测试3菜单文章八测试4</p>','菜单文章八测试4','菜单文章八测试4',1,1,'2017-09-20 14:38:22',NULL,0,1,'',0,'{\"thumb\":\"\",\"template\":\"\"}',0,0,0,0),(47,1,'菜单文章八测试5','菜单文章八测试5','2017-09-20 14:38:33','<p>菜单文章八测试5菜单文章八测试5</p>','菜单文章八测试5','菜单文章八测试5',1,1,'2017-09-20 14:38:44',NULL,0,1,'',0,'{\"thumb\":\"\",\"template\":\"\"}',0,0,0,0),(48,1,'菜单文章八测试6','菜单文章八测试6','2017-09-20 14:38:45','<p>菜单文章八测试6菜单文章八测试6</p>','菜单文章八测试6','菜单文章八测试6',1,1,'2017-09-20 14:39:06',NULL,0,1,'',0,'{\"thumb\":\"\",\"template\":\"\"}',0,0,0,0),(49,1,'菜单文章八测试7','菜单文章八测试7','2017-09-20 14:39:08','<p>菜单文章八测试7菜单文章八测试7</p>','菜单文章八测试7','菜单文章八测试7',1,1,'2017-09-20 14:39:20',NULL,0,1,'',0,'{\"thumb\":\"\",\"template\":\"\"}',0,0,0,0),(50,1,'菜单文章八测试8','菜单文章八测试8','2017-09-20 14:39:21','<p>菜单文章八测试8菜单文章八测试8</p>','菜单文章八测试8','菜单文章八测试8',1,1,'2017-09-20 14:39:34',NULL,0,1,'',0,'{\"thumb\":\"\",\"template\":\"\"}',0,0,0,0),(51,1,'在线预定文章一测试','在线预定文章一测试','2017-09-20 14:46:22','<p>在线预定文章一测试在线预定文章一测试</p>','在线预定文章一测试','在线预定文章一测试',1,1,'2017-09-20 14:46:52',NULL,0,1,'',0,'{\"thumb\":\"\",\"template\":\"\"}',0,0,0,0),(52,1,'在线预定文章二測試','在线预定文章二測試','2017-09-20 15:14:17','<p>在线预定文章二測試在线预定文章二測試</p>','在线预定文章二測試','在线预定文章二測試',1,1,'2017-09-27 09:57:07',NULL,0,1,'',0,'{\"thumb\":\"portal\\/20170920\\/59c215b8b4301.jpg\",\"template\":\"\",\"photo\":[{\"url\":\"http:\\/\\/localhost\\/data\\/upload\\/portal\\/20170920\\/59c215d6552a1.jpg\",\"alt\":\"bg-5.jpg\"}]}',0,0,0,0),(53,1,'在线预定文章三測試','在线预定文章三測試','2017-09-20 15:20:21','<p>在线预定文章三測試在线预定文章三測試</p><p><br/></p><p>在线预定文章三測試在线预定文章三測試</p>','在线预定文章三測試','在线预定文章三測試',1,1,'2017-09-20 15:34:00',NULL,0,1,'',0,'{\"thumb\":\"portal\\/20170920\\/59c2171229bfc.jpg\",\"template\":\"\",\"photo\":[{\"url\":\"http:\\/\\/localhost\\/data\\/upload\\/portal\\/20170920\\/59c216e8572e9.jpg\",\"alt\":\"about-3.jpg\"},{\"url\":\"http:\\/\\/localhost\\/data\\/upload\\/portal\\/20170920\\/59c216eb89fe7.jpg\",\"alt\":\"about-4.jpg\"}]}',0,0,0,0),(54,1,'服务文章一测试1','服务文章一测试1','2017-09-20 15:36:11','<p>服务文章一测试1服务文章一测试1服务文章一测试1服务文章一测试1</p>','服务文章一测试1','服务文章一测试1',1,1,'2017-09-27 09:59:30',NULL,0,1,'',0,'{\"thumb\":\"portal\\/20170920\\/59c21aab4e66a.jpg\",\"template\":\"\",\"photo\":[{\"url\":\"http:\\/\\/localhost\\/data\\/upload\\/portal\\/20170920\\/59c21aa30c3c4.jpg\",\"alt\":\"services-1.jpg\"}]}',0,0,0,0),(55,1,'服务文章一测试2','服务文章一测试2','2017-09-20 15:37:20','<p>服务文章一测试2服务文章一测试2服务文章一测试2服务文章一测试2</p>','服务文章一测试2','服务文章一测试2',1,1,'2017-09-27 09:59:19',NULL,0,1,'',0,'{\"thumb\":\"portal\\/20170920\\/59c21adbcb5cc.jpg\",\"template\":\"\",\"photo\":[{\"url\":\"http:\\/\\/localhost\\/data\\/upload\\/portal\\/20170920\\/59c21acd0b320.jpg\",\"alt\":\"services-2.jpg\"}]}',0,0,0,0),(56,1,'服务文章一测试3','服务文章一测试3','2017-09-20 15:38:15','<p>服务文章一测试3</p>','服务文章一测试3','服务文章一测试3',1,1,'2017-09-27 09:59:07',NULL,0,1,'',0,'{\"thumb\":\"portal\\/20170920\\/59c21afd56635.jpg\",\"template\":\"\",\"photo\":[{\"url\":\"http:\\/\\/localhost\\/data\\/upload\\/portal\\/20170920\\/59c21b058bcac.jpg\",\"alt\":\"services-3.jpg\"}]}',0,0,0,0),(57,1,'服务文章一测试4','服务文章一测试4','2017-09-20 15:38:50','<p>服务文章一测试4服务文章一测试4服务文章一测试4服务文章一测试4</p>','服务文章一测试4','服务文章一测试4',1,1,'2017-09-27 09:58:52',NULL,0,1,'',0,'{\"thumb\":\"portal\\/20170920\\/59c21b2388ad5.jpg\",\"template\":\"\",\"photo\":[{\"url\":\"http:\\/\\/localhost\\/data\\/upload\\/portal\\/20170920\\/59c21b1d26638.jpg\",\"alt\":\"services-4.jpg\"}]}',0,0,0,0),(58,1,'画廊文章一测试1','画廊文章一测试1','2017-09-20 16:09:11','<p>画廊文章一测试1</p>','画廊文章一测试1','画廊文章一测试1',1,1,'2017-09-27 09:58:23',NULL,0,1,'',0,'{\"thumb\":\"portal\\/20170920\\/59c22270ec3ee.jpg\",\"template\":\"\",\"photo\":[{\"url\":\"http:\\/\\/localhost\\/data\\/upload\\/portal\\/20170920\\/59c2226b110ec.jpg\",\"alt\":\"pic-1.jpg\"}]}',0,0,0,0),(59,1,'画廊文章一测试2','画廊文章一测试2','2017-09-20 16:10:32','<p>画廊文章一测试2</p>','画廊文章一测试2','画廊文章一测试2',1,1,'2017-09-27 10:02:06',NULL,0,1,'',0,'{\"thumb\":\"portal\\/20170920\\/59c2229210a7a.jpg\",\"template\":\"\",\"photo\":[{\"url\":\"http:\\/\\/localhost\\/data\\/upload\\/portal\\/20170920\\/59c222979a928.jpg\",\"alt\":\"pic-8.jpg\"}]}',0,0,0,0),(60,1,'画廊文章一测试3','画廊文章一测试3','2017-09-20 16:11:08','<p>画廊文章一测试3</p>','画廊文章一测试3','画廊文章一测试3',1,1,'2017-09-27 10:01:54',NULL,0,1,'',0,'{\"thumb\":\"portal\\/20170920\\/59c222c75cc4c.jpg\",\"template\":\"\",\"photo\":[{\"url\":\"http:\\/\\/localhost\\/data\\/upload\\/portal\\/20170920\\/59c2257f889bd.jpg\",\"alt\":\"pic-7.jpg\"}]}',0,0,0,0),(61,1,'画廊文章一测试4','画廊文章一测试4','2017-09-20 16:12:32','<p>画廊文章一测试4</p>','画廊文章一测试4','画廊文章一测试4',1,1,'2017-09-27 10:01:44',NULL,0,1,'',0,'{\"thumb\":\"portal\\/20170920\\/59c22317d6037.jpg\",\"template\":\"\",\"photo\":[{\"url\":\"http:\\/\\/localhost\\/data\\/upload\\/portal\\/20170920\\/59c2231f5cfa3.jpg\",\"alt\":\"pic-6.jpg\"}]}',0,0,0,0),(62,1,'画廊文章一测试5','画廊文章一测试5','2017-09-20 16:13:23','<p>画廊文章一测试5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>','画廊文章一测试5','画廊文章一测试5',1,1,'2017-09-27 10:01:35',NULL,0,1,'',0,'{\"thumb\":\"portal\\/20170920\\/59c223e926aa2.jpg\",\"template\":\"\",\"photo\":[{\"url\":\"http:\\/\\/localhost\\/data\\/upload\\/portal\\/20170920\\/59c223e00462e.jpg\",\"alt\":\"pic-5.jpg\"}]}',0,0,0,0),(63,1,'画廊文章一测试6','画廊文章一测试6','2017-09-20 16:14:00','<p>画廊文章一测试6</p>','画廊文章一测试6','画廊文章一测试6',1,1,'2017-09-27 10:01:24',NULL,0,1,'',0,'{\"thumb\":\"portal\\/20170920\\/59c22362ac439.jpg\",\"template\":\"\",\"photo\":[{\"url\":\"http:\\/\\/localhost\\/data\\/upload\\/portal\\/20170920\\/59c2235ce7056.jpg\",\"alt\":\"pic-4.jpg\"}]}',0,0,0,0),(64,1,'画廊文章一测试7','画廊文章一测试7','2017-09-20 16:14:33','<p>画廊文章一测试7</p>','画廊文章一测试7','画廊文章一测试7',1,1,'2017-09-27 10:01:16',NULL,0,1,'',0,'{\"thumb\":\"portal\\/20170920\\/59c2239114f49.jpg\",\"template\":\"\",\"photo\":[{\"url\":\"http:\\/\\/localhost\\/data\\/upload\\/portal\\/20170920\\/59c2238b8258d.jpg\",\"alt\":\"pic-3.jpg\"}]}',0,0,0,0),(65,1,'画廊文章一测试8','画廊文章一测试8','2017-09-20 16:15:17','<p>画廊文章一测试8</p>','画廊文章一测试8','画廊文章一测试8',1,1,'2017-09-27 10:01:07',NULL,0,1,'',0,'{\"thumb\":\"portal\\/20170920\\/59c223ade989f.jpg\",\"template\":\"\",\"photo\":[{\"url\":\"http:\\/\\/localhost\\/data\\/upload\\/portal\\/20170920\\/59c223a7ee0d4.jpg\",\"alt\":\"pic-2.jpg\"}]}',0,0,0,0),(66,1,'画廊文章一测试9','画廊文章一测试9','2017-09-20 16:15:46','<p>画廊文章一测试9</p>','画廊文章一测试9','画廊文章一测试9',1,1,'2017-09-27 10:00:58',NULL,0,1,'',0,'{\"thumb\":\"portal\\/20170920\\/59c223c7abec4.jpg\",\"template\":\"\",\"photo\":[{\"url\":\"http:\\/\\/localhost\\/data\\/upload\\/portal\\/20170920\\/59c223c15dbae.jpg\",\"alt\":\"pic-1.jpg\"}]}',0,0,0,0),(67,1,'联系我们文章一电话号码','联系我们文章一电话号码','2017-09-20 16:39:30','<p>测试号码123123</p>','联系我们文章一电话号码','联系我们文章一电话号码',1,1,'2017-09-20 16:40:39',NULL,0,1,'',0,'{\"thumb\":\"\",\"template\":\"\"}',0,0,0,0),(68,1,'联系我们文章一地址','联系我们文章一地址','2017-09-20 16:40:41','<p>测试地址 &nbsp;四川绵阳市游仙区·······</p>','联系我们文章一地址','联系我们文章一地址',1,1,'2017-09-20 16:41:47',NULL,0,1,'',0,'{\"thumb\":\"\",\"template\":\"\"}',0,0,0,0),(69,1,'联系我们文章一邮箱','联系我们文章一邮箱','2017-09-20 16:41:49','<p>测试邮箱admin@admin.com</p>','联系我们文章一邮箱','联系我们文章一邮箱',1,1,'2017-09-20 16:43:36',NULL,0,1,'',0,'{\"thumb\":\"\",\"template\":\"\"}',0,0,0,0),(70,1,'新闻热点测试1','','2017-09-20 18:15:49','<p>新闻热点测试1新闻热点测试1</p>','新闻热点测试1','新闻热点测试1',1,1,'2017-09-27 10:04:03',NULL,0,1,'',0,'{\"thumb\":\"portal\\/20170920\\/59c240094425f.jpg\",\"template\":\"\",\"photo\":[{\"url\":\"http:\\/\\/localhost\\/data\\/upload\\/portal\\/20170920\\/59c240004585c.jpg\",\"alt\":\"pic-1.jpg\"}]}',0,0,0,0),(71,1,'新闻热点测试2','','2017-09-20 18:16:47','<p>新闻热点测试2新闻热点测试2新闻热点测试2</p>','新闻热点测试2','新闻热点测试2',1,1,'2017-09-27 10:04:09',NULL,0,1,'',1,'{\"thumb\":\"portal\\/20170920\\/59c240251d899.jpg\",\"template\":\"\",\"photo\":[{\"url\":\"http:\\/\\/localhost\\/data\\/upload\\/portal\\/20170920\\/59c2401e92b02.jpg\",\"alt\":\"pic-2.jpg\"}]}',3,0,0,0);
/*!40000 ALTER TABLE `cmf_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_role`
--

DROP TABLE IF EXISTS `cmf_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `pid` smallint(6) DEFAULT NULL COMMENT '父角色ID',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `listorder` int(3) NOT NULL DEFAULT '0' COMMENT '排序字段',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_role`
--

LOCK TABLES `cmf_role` WRITE;
/*!40000 ALTER TABLE `cmf_role` DISABLE KEYS */;
INSERT INTO `cmf_role` VALUES (1,'超级管理员',0,1,'拥有网站最高管理员权限！',1329633709,1329633709,0);
/*!40000 ALTER TABLE `cmf_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_role_user`
--

DROP TABLE IF EXISTS `cmf_role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_role_user` (
  `role_id` int(11) unsigned DEFAULT '0' COMMENT '角色 id',
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_role_user`
--

LOCK TABLES `cmf_role_user` WRITE;
/*!40000 ALTER TABLE `cmf_role_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmf_role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_route`
--

DROP TABLE IF EXISTS `cmf_route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `full_url` varchar(255) DEFAULT NULL COMMENT '完整url， 如：portal/list/index?id=1',
  `url` varchar(255) DEFAULT NULL COMMENT '实际显示的url',
  `listorder` int(5) DEFAULT '0' COMMENT '排序，优先级，越小优先级越高',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态，1：启用 ;0：不启用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='url路由表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_route`
--

LOCK TABLES `cmf_route` WRITE;
/*!40000 ALTER TABLE `cmf_route` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmf_route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_slide`
--

DROP TABLE IF EXISTS `cmf_slide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_slide` (
  `slide_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slide_cid` int(11) NOT NULL COMMENT '幻灯片分类 id',
  `slide_name` varchar(255) NOT NULL COMMENT '幻灯片名称',
  `slide_pic` varchar(255) DEFAULT NULL COMMENT '幻灯片图片',
  `slide_url` varchar(255) DEFAULT NULL COMMENT '幻灯片链接',
  `slide_des` varchar(255) DEFAULT NULL COMMENT '幻灯片描述',
  `slide_content` text COMMENT '幻灯片内容',
  `slide_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(10) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`slide_id`),
  KEY `slide_cid` (`slide_cid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='幻灯片表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_slide`
--

LOCK TABLES `cmf_slide` WRITE;
/*!40000 ALTER TABLE `cmf_slide` DISABLE KEYS */;
INSERT INTO `cmf_slide` VALUES (1,1,'糕点1','admin/20170920/59c23f406a6a8.jpg','','糕点1','糕点1',1,0),(2,1,'糕点2','admin/20170920/59c23f534d1e1.jpg','','糕点2','糕点2',1,0),(3,1,'糕点3','admin/20170920/59c23f7138933.jpg','','糕点3','糕点3',1,0),(4,2,'测试1','admin/20170919/59c0d811c48f3.png','C:\\Users\\asus1\\Downloads\\about-img-1.png','测试1','测试1',1,0),(5,2,'测试2','admin/20170919/59c0d82fc2d10.png','C:\\Users\\asus1\\Downloads\\about-img-2.png','测试2','测试2',1,0),(6,2,'测试3','admin/20170919/59c0d84550abb.png','C:\\Users\\asus1\\Downloads\\about-img-3.png','测试3','测试3',1,0),(7,2,'测试4','admin/20170919/59c0d89887082.png','C:\\Users\\asus1\\Downloads\\about-img-4.png','测试4','测试4',1,0);
/*!40000 ALTER TABLE `cmf_slide` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_slide_cat`
--

DROP TABLE IF EXISTS `cmf_slide_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_slide_cat` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL COMMENT '幻灯片分类',
  `cat_idname` varchar(255) NOT NULL COMMENT '幻灯片分类标识',
  `cat_remark` text COMMENT '分类备注',
  `cat_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`cid`),
  KEY `cat_idname` (`cat_idname`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='幻灯片分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_slide_cat`
--

LOCK TABLES `cmf_slide_cat` WRITE;
/*!40000 ALTER TABLE `cmf_slide_cat` DISABLE KEYS */;
INSERT INTO `cmf_slide_cat` VALUES (1,'portal_index','portal_index','portal_index',1),(2,'首页关于我们','portal_about','首页关于我们',1);
/*!40000 ALTER TABLE `cmf_slide_cat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_term_relationships`
--

DROP TABLE IF EXISTS `cmf_term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_term_relationships` (
  `tid` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'posts表里文章id',
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`tid`),
  KEY `term_taxonomy_id` (`term_id`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类对应表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_term_relationships`
--

LOCK TABLES `cmf_term_relationships` WRITE;
/*!40000 ALTER TABLE `cmf_term_relationships` DISABLE KEYS */;
INSERT INTO `cmf_term_relationships` VALUES (9,8,4,0,1),(2,2,1,0,1),(6,3,2,0,1),(4,4,1,0,1),(5,5,1,0,1),(7,6,1,0,1),(8,7,3,0,1),(10,9,4,0,1),(11,10,5,0,1),(12,11,5,0,1),(13,12,5,0,1),(14,13,6,0,1),(15,14,7,0,1),(16,15,8,0,1),(17,16,9,0,1),(18,17,10,0,1),(19,18,10,0,1),(20,19,10,0,1),(21,20,11,0,1),(22,21,12,0,1),(23,22,12,0,1),(24,23,12,0,1),(25,24,13,0,1),(26,25,14,0,1),(27,26,14,0,1),(28,27,14,0,1),(29,28,14,0,1),(30,29,14,0,1),(31,30,14,0,1),(32,31,14,0,1),(33,32,14,0,1),(34,33,15,0,1),(35,34,16,0,1),(36,35,16,0,1),(37,36,16,0,1),(38,37,16,0,1),(39,38,16,0,1),(40,39,16,0,1),(41,40,16,0,1),(42,41,16,0,1),(43,42,17,0,1),(44,43,18,0,1),(45,44,18,0,1),(46,45,18,0,1),(47,46,18,0,1),(48,47,18,0,1),(49,48,18,0,1),(50,49,18,0,1),(51,50,18,0,1),(52,51,19,0,1),(53,52,20,0,1),(54,53,21,0,1),(55,54,22,0,1),(56,55,22,0,1),(57,56,22,0,1),(58,57,22,0,1),(59,58,23,0,1),(60,59,23,0,1),(61,60,23,0,1),(62,61,23,0,1),(63,62,23,0,1),(64,63,23,0,1),(65,64,23,0,1),(66,65,23,0,1),(67,66,23,0,1),(68,67,24,0,1),(69,68,24,0,1),(70,69,24,0,1),(71,70,25,0,1),(72,71,25,0,1);
/*!40000 ALTER TABLE `cmf_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_terms`
--

DROP TABLE IF EXISTS `cmf_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `slug` varchar(200) DEFAULT '',
  `taxonomy` varchar(32) DEFAULT NULL COMMENT '分类类型',
  `description` longtext COMMENT '分类描述',
  `parent` bigint(20) unsigned DEFAULT '0' COMMENT '分类父id',
  `count` bigint(20) DEFAULT '0' COMMENT '分类文章数',
  `path` varchar(500) DEFAULT NULL COMMENT '分类层级关系路径',
  `seo_title` varchar(500) DEFAULT NULL,
  `seo_keywords` varchar(500) DEFAULT NULL,
  `seo_description` varchar(500) DEFAULT NULL,
  `list_tpl` varchar(50) DEFAULT NULL COMMENT '分类列表模板',
  `one_tpl` varchar(50) DEFAULT NULL COMMENT '分类文章页模板',
  `listorder` int(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`term_id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_terms`
--

LOCK TABLES `cmf_terms` WRITE;
/*!40000 ALTER TABLE `cmf_terms` DISABLE KEYS */;
INSERT INTO `cmf_terms` VALUES (1,'主页我们的菜单','','picture','主页我们的菜单',0,0,'0-1','','','','list','article',0,1),(2,'主页关于我们厨师简介','','picture','主页关于我们厨师简介',0,0,'0-2','','','','list_masonry','article',0,1),(3,'一天的膳食','','picture','一天的膳食',0,0,'0-3','','','','list','article',0,1),(4,'褒奖','','picture','褒奖',0,0,'0-4','','','','list','article',0,1),(5,'即将举行的活动','','picture','即将举行的活动\n\n',0,0,'0-5','','','','list','article',0,1),(6,'首页预定','','article','首页预定',0,0,'0-6','','','','list','article',0,1),(7,'header','','picture','header',0,0,'0-7','','','','list','article',0,1),(8,'关于我们文章一','','picture','关于我们文章一',0,0,'0-8','','','','list','article',0,1),(9,'关于我们文章二','','article','关于我们文章二',0,0,'0-9','','','','list','article',0,1),(10,'关于我们文章三','','picture','关于我们文章三',0,0,'0-10','','','','list','article',0,1),(11,'菜单文章一','','picture','菜单文章一',0,0,'0-11','','','','list','article',0,1),(12,'菜单文章二','','picture','菜单文章二',0,0,'0-12','','','','list','article',0,1),(13,'菜单文章三','','article','菜单文章三',0,0,'0-13','','','','list','article',0,1),(14,'菜单文章四','','article','菜单文章四',0,0,'0-14','','','','list','article',0,1),(15,'菜单文章五','','picture','菜单文章五',0,0,'0-15','','','','list','article',0,1),(16,'菜单文章六','','article','菜单文章六',0,0,'0-16','','','','list','article',0,1),(17,'菜单文章七','','picture','菜单文章七',0,0,'0-17','','','','list','article',0,1),(18,'菜单文章八','','article','菜单文章八',0,0,'0-18','','','','list','article',0,1),(19,'在线预定文章一','','article','在线预定文章一',0,0,'0-19','','','','list','article',0,1),(20,'在线预定文章二','','picture','在线预定文章二',0,0,'0-20','','','','list','article',0,1),(21,'在线预定文章三','','picture','在线预定文章三',0,0,'0-21','','','','list','article',0,1),(22,'服務文章一','','picture','服務文章一',0,0,'0-22','','','','list','article',0,1),(23,'画廊文章一','','picture','画廊文章一',0,0,'0-23','','','','list','article',0,1),(24,'联系我们文章一','','article','联系我们文章一',0,0,'0-24','','','','list','article',0,1),(25,'新闻热点','','article','新闻热点',0,0,'0-25','','','','list','article',0,1);
/*!40000 ALTER TABLE `cmf_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_user_favorites`
--

DROP TABLE IF EXISTS `cmf_user_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_user_favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL COMMENT '用户 id',
  `title` varchar(255) DEFAULT NULL COMMENT '收藏内容的标题',
  `url` varchar(255) DEFAULT NULL COMMENT '收藏内容的原文地址，不带域名',
  `description` varchar(500) DEFAULT NULL COMMENT '收藏内容的描述',
  `table` varchar(50) DEFAULT NULL COMMENT '收藏实体以前所在表，不带前缀',
  `object_id` int(11) DEFAULT NULL COMMENT '收藏内容原来的主键id',
  `createtime` int(11) DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户收藏表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_user_favorites`
--

LOCK TABLES `cmf_user_favorites` WRITE;
/*!40000 ALTER TABLE `cmf_user_favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmf_user_favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmf_users`
--

DROP TABLE IF EXISTS `cmf_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmf_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码；sp_password加密',
  `user_nicename` varchar(50) NOT NULL DEFAULT '' COMMENT '用户美名',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网站',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像，相对于upload/avatar目录',
  `sex` smallint(1) DEFAULT '0' COMMENT '性别；0：保密，1：男；2：女',
  `birthday` date DEFAULT '2000-01-01' COMMENT '生日',
  `signature` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `last_login_ip` varchar(16) DEFAULT NULL COMMENT '最后登录ip',
  `last_login_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '最后登录时间',
  `create_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '注册时间',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `user_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态 0：禁用； 1：正常 ；2：未验证',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `user_type` smallint(1) DEFAULT '1' COMMENT '用户类型，1:admin ;2:会员',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '金币',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  PRIMARY KEY (`id`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmf_users`
--

LOCK TABLES `cmf_users` WRITE;
/*!40000 ALTER TABLE `cmf_users` DISABLE KEYS */;
INSERT INTO `cmf_users` VALUES (1,'admin','###11f9c23f5990fdb3800c7a3d452f5621','admin','admin@admin.com','',NULL,0,'2000-01-01',NULL,'0.0.0.0','2017-09-27 16:17:28','2017-09-18 02:59:03','',1,0,1,0,''),(2,'457674394_qq_com','###f73a656355857a2b9fcc7181eb15c0bf','457674394_qq_com','457674394@qq.com','',NULL,0,'2000-01-01',NULL,'0.0.0.0','2017-09-26 14:14:01','2017-09-18 16:25:46','',1,0,2,0,'');
/*!40000 ALTER TABLE `cmf_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-27 17:12:42
