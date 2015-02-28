-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2015-02-28 10:48:18
-- 服务器版本： 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `think`
--

-- --------------------------------------------------------

--
-- 表的结构 `hd_access`
--

CREATE TABLE IF NOT EXISTS `hd_access` (
  `role_id` smallint(6) unsigned NOT NULL,
  `node_id` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) NOT NULL,
  `module` varchar(50) DEFAULT NULL,
  KEY `groupId` (`role_id`),
  KEY `nodeId` (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `hd_access`
--

INSERT INTO `hd_access` (`role_id`, `node_id`, `level`, `module`) VALUES
(1, 6, 3, NULL),
(1, 7, 3, NULL),
(1, 4, 2, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `hd_node`
--

CREATE TABLE IF NOT EXISTS `hd_node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL,
  `sort` smallint(6) unsigned DEFAULT NULL,
  `pid` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `level` (`level`),
  KEY `pid` (`pid`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `hd_node`
--

INSERT INTO `hd_node` (`id`, `name`, `title`, `status`, `remark`, `sort`, `pid`, `level`) VALUES
(1, 'Admin', '后台应用', 1, NULL, 1, 0, 1),
(2, 'Index', '前台应用', 1, NULL, 1, 0, 1),
(4, 'MsgManage', '帖子管理', 1, NULL, 1, 1, 2),
(5, 'Rbac', 'RBAC权限控制', 1, NULL, 1, 1, 1),
(3, 'Index', '后台首页', 1, NULL, 1, 1, 2),
(6, 'index', '贴子列表', 1, NULL, 1, 4, 3),
(7, 'delete', '删除贴子', 1, NULL, 1, 4, 3),
(8, 'index', '用户列表', 1, NULL, 1, 5, 3),
(9, 'role', '角色列表', 1, NULL, 1, 5, 3),
(10, 'node', '节点列表', 1, NULL, 1, 5, 3),
(11, 'addUser', '添加用户', 1, NULL, 1, 5, 3),
(12, 'addRole', '添加角色', 1, NULL, 1, 5, 3),
(13, 'addNode', '添加节点', 1, NULL, 1, 5, 3),
(14, 'Member', '会员中心', 1, NULL, 1, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `hd_role`
--

CREATE TABLE IF NOT EXISTS `hd_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `pid` smallint(6) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `hd_role`
--

INSERT INTO `hd_role` (`id`, `name`, `pid`, `status`, `remark`) VALUES
(1, 'Manager', NULL, 1, '普通管理员'),
(2, 'Editor', NULL, 1, '网站编辑');

-- --------------------------------------------------------

--
-- 表的结构 `hd_role_user`
--

CREATE TABLE IF NOT EXISTS `hd_role_user` (
  `role_id` mediumint(9) unsigned DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL,
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `hd_role_user`
--

INSERT INTO `hd_role_user` (`role_id`, `user_id`) VALUES
(1, '2'),
(2, '3'),
(1, '4'),
(2, '4');

-- --------------------------------------------------------

--
-- 表的结构 `hd_user`
--

CREATE TABLE IF NOT EXISTS `hd_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` char(20) DEFAULT NULL,
  `password` char(32) DEFAULT NULL,
  `logintime` int(10) NOT NULL,
  `loginip` varchar(30) CHARACTER SET utf8 NOT NULL,
  `lock` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `hd_user`
--

INSERT INTO `hd_user` (`id`, `username`, `password`, `logintime`, `loginip`, `lock`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 1415775925, '127.0.0.1', 0),
(2, 'lisi', 'e10adc3949ba59abbe56e057f20f883e', 1415777346, '127.0.0.1', NULL),
(3, 'wangwu', '9f001e4166cf26bfbdd3b4f67d9ef617', 1415775740, '127.0.0.1', NULL),
(4, 'zhaoliu', '27311020efc4ce2806feca0aab933fbd', 1415764855, '127.0.0.1', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `hd_wish`
--

CREATE TABLE IF NOT EXISTS `hd_wish` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `time` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- 转存表中的数据 `hd_wish`
--

INSERT INTO `hd_wish` (`id`, `username`, `content`, `time`) VALUES
(4, '我要许愿', '我要许愿！[害羞]', 1414468071),
(5, '梁舜尧', '我爱你~[害羞]', 1414476142),
(6, '胡益华', '么么哒~', 1414476157),
(7, '伍宇轩', '妈妈咪呀~[钱][酷]', 1414477558),
(8, '吴智欣', '[挤眼]', 1414478584),
(9, '123', '31', 1414481958),
(10, '7658', '56785678', 1414570559),
(11, '7658', '56785678', 1414570607),
(12, '7658', '56785678', 1414570632),
(13, '7658234', '56785678', 1414570674),
(14, '7658234', '56785678', 1414570689),
(15, '76582341234', '567856782134', 1414570692),
(16, '76582341234', '567856782134', 1414570924),
(17, '1232', '41234123', 1414571706);

-- --------------------------------------------------------

--
-- 表的结构 `ht_wish2`
--

CREATE TABLE IF NOT EXISTS `ht_wish2` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `time` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
