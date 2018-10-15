-- phpMyAdmin SQL Dump
-- version 4.4.15.7
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 15, 2018 at 01:18 PM
-- Server version: 5.6.37
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rolpel`
--

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE IF NOT EXISTS `company` (
  `company_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cuit` bigint(15) NOT NULL,
  `iva_id` int(5) NOT NULL,
  `purchase_condition_id` int(11) NOT NULL,
  `iibb` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `vat` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `international` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `customer` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `provider` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `provider_number` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `reputation` int(2) NOT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A',
  `balance` decimal(30,2) NOT NULL,
  `balance_positive` decimal(20,2) NOT NULL,
  `balance_initial` decimal(20,2) NOT NULL,
  `credit_limit` bigint(11) NOT NULL,
  `currency_id` int(11) NOT NULL DEFAULT '1',
  `creation_date` datetime NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `old_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=11697 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`company_id`, `type_id`, `name`, `cuit`, `iva_id`, `purchase_condition_id`, `iibb`, `vat`, `international`, `customer`, `provider`, `provider_number`, `reputation`, `logo`, `status`, `balance`, `balance_positive`, `balance_initial`, `credit_limit`, `currency_id`, `creation_date`, `last_update`, `old_id`, `created_by`, `updated_by`, `organization_id`) VALUES
(11694, 2, 'Prueba', 11232322123, 1, 0, '0', '0', 'N', 'Y', 'N', '', 0, '../../../../skin/images/companies/11694/img627676412.png', 'A', 0.00, 0.00, 0.00, 0, 1, '2018-06-18 00:17:22', '2018-08-13 00:41:37', 0, 8, 8, 1),
(11695, 3, 'Empresa Internacional', 0, 1, 0, '0', '1234567890', 'Y', 'Y', 'Y', '', 0, '../../../../skin/images/companies/default/default.png', 'A', 0.00, 0.00, 0.00, 0, 1, '2018-06-18 00:51:29', '2018-06-22 02:36:47', 0, 8, 8, 1),
(11696, 2, 'RolPel', 0, 0, 0, '0', '0', 'N', 'Y', 'N', '', 0, '../../../../skin/images/companies/default/default.png', 'A', 0.00, 0.00, 0.00, 0, 1, '2018-06-25 16:35:05', '2018-06-25 19:36:47', 0, 95, 95, 1);

-- --------------------------------------------------------

--
-- Table structure for table `company_agent`
--

CREATE TABLE IF NOT EXISTS `company_agent` (
  `agent_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `charge` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `extra` text COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=1342 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `company_agent`
--

INSERT INTO `company_agent` (`agent_id`, `company_id`, `branch_id`, `name`, `charge`, `email`, `phone`, `extra`, `creation_date`, `created_by`, `organization_id`) VALUES
(1340, 11694, 5082, 'Carlos Prueba', 'Dueño', 'carlos@prueba.com.ar', '12345678', 'Carlos prefiere que le escriban por WhatsApp', '2018-08-12 21:41:37', 8, 1),
(1327, 11695, 5078, 'Michael Scott', 'Gerente', 'michael@mail.com', '', 'Habla español', '2018-06-21 23:36:47', 8, 1),
(1335, 11696, 5080, 'Sergio', 'CEO', '', '', '', '2018-06-25 16:36:47', 95, 1),
(1336, 11696, 5081, 'Beto', 'Papá', '', '', 'Usa bata verde', '2018-06-25 16:36:47', 95, 1),
(1337, 11696, 5080, 'Pepe', '', '', '', '', '2018-06-25 16:37:31', 95, 1);

-- --------------------------------------------------------

--
-- Table structure for table `company_branch`
--

CREATE TABLE IF NOT EXISTS `company_branch` (
  `branch_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `province_id` int(11) NOT NULL,
  `region_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `postal_code` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fax` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `main_branch` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `lat` decimal(18,16) NOT NULL,
  `lng` decimal(18,16) NOT NULL,
  `monday_from` char(5) COLLATE utf8_unicode_ci NOT NULL,
  `monday_to` char(5) COLLATE utf8_unicode_ci NOT NULL,
  `tuesday_from` char(5) COLLATE utf8_unicode_ci NOT NULL,
  `tuesday_to` char(5) COLLATE utf8_unicode_ci NOT NULL,
  `wensday_from` char(5) COLLATE utf8_unicode_ci NOT NULL,
  `wensday_to` char(5) COLLATE utf8_unicode_ci NOT NULL,
  `thursday_from` char(5) COLLATE utf8_unicode_ci NOT NULL,
  `thursday_to` char(5) COLLATE utf8_unicode_ci NOT NULL,
  `friday_from` char(5) COLLATE utf8_unicode_ci NOT NULL,
  `friday_to` char(5) COLLATE utf8_unicode_ci NOT NULL,
  `saturday_from` char(5) COLLATE utf8_unicode_ci NOT NULL,
  `saturday_to` char(5) COLLATE utf8_unicode_ci NOT NULL,
  `sunday_from` char(5) COLLATE utf8_unicode_ci NOT NULL,
  `sunday_to` char(5) COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=5083 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `company_branch`
--

INSERT INTO `company_branch` (`branch_id`, `company_id`, `country_id`, `province_id`, `region_id`, `zone_id`, `name`, `address`, `postal_code`, `phone`, `email`, `website`, `fax`, `main_branch`, `lat`, `lng`, `monday_from`, `monday_to`, `tuesday_from`, `tuesday_to`, `wensday_from`, `wensday_to`, `thursday_from`, `thursday_to`, `friday_from`, `friday_to`, `saturday_from`, `saturday_to`, `sunday_from`, `sunday_to`, `creation_date`, `created_by`, `organization_id`) VALUES
(5082, 11694, 1, 1, 26, 28, 'Central', 'Robertson 1041', 'C1406', '12345678', 'mail@prueba.com.ar', 'www.prueba.com.ar', '12348900', 'Y', -34.6403159000000000, -58.4542103999999650, '10:00', '17:00', '10:00', '17:00', '', '', '10:00', '17:00', '', '', '12:00', '14:00', '', '', '2018-08-12 21:41:37', 8, 1),
(5078, 11695, 6, 244, 0, 30, 'Central', 'Camp St 27', '9300', '922-12312303', 'internacional@mail.com', 'www.international.com', '', 'Y', -45.0313185000000000, 99.9999999999999999, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2018-06-21 23:36:47', 8, 1),
(5080, 11696, 1, 1, 1, 31, 'Central', 'Río Cuarto 2698', 'C1292', '', '', '', '', 'Y', -34.6517410000000000, -58.3830000000000400, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2018-06-25 16:36:47', 95, 1),
(5081, 11696, 1, 1, 26, 28, 'Beto', 'Robertson 1041', 'C1406', '', '', '', '', 'N', -34.6403159000000000, -58.4542103999999650, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2018-06-25 16:36:47', 95, 1);

-- --------------------------------------------------------

--
-- Table structure for table `company_type`
--

CREATE TABLE IF NOT EXISTS `company_type` (
  `type_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A',
  `creation_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `company_type`
--

INSERT INTO `company_type` (`type_id`, `name`, `status`, `creation_date`, `created_by`, `last_update`, `updated_by`, `organization_id`) VALUES
(2, 'PyME', 'A', '0000-00-00 00:00:00', 0, '2018-06-18 03:09:38', 0, 1),
(3, 'Multinacional', 'A', '0000-00-00 00:00:00', 0, '2018-06-18 03:09:41', 0, 1),
(1, 'Persona', 'A', '0000-00-00 00:00:00', 0, '2018-06-18 03:09:30', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `core_country`
--

CREATE TABLE IF NOT EXISTS `core_country` (
  `country_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `short_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lat` float NOT NULL,
  `lng` float NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `core_country`
--

INSERT INTO `core_country` (`country_id`, `name`, `short_name`, `lat`, `lng`) VALUES
(1, 'Argentina', 'AR', 0, 0),
(2, 'México', 'MX', 0, 0),
(3, 'Singapur', 'SG', 0, 0),
(4, 'Japón', 'JP', 0, 0),
(5, 'Estados Unidos', 'US', 0, 0),
(6, 'Nueva Zelanda', 'NZ', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `core_group`
--

CREATE TABLE IF NOT EXISTS `core_group` (
  `group_id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET latin1 NOT NULL,
  `image` varchar(255) CHARACTER SET latin1 NOT NULL,
  `status` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'A',
  `creation_date` datetime NOT NULL,
  `last_modification` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `core_group`
--

INSERT INTO `core_group` (`group_id`, `organization_id`, `title`, `image`, `status`, `creation_date`, `last_modification`, `created_by`) VALUES
(1, 1, 'prueba', '../../../../skin/images/groups/default/groupgen.jpg', 'I', '2016-04-20 03:23:03', '2016-04-20 06:23:03', 0),
(2, 1, 'test ale', '../../../../skin/images/groups/default/groupgen.jpg', 'I', '2016-04-20 19:19:17', '2016-04-20 22:19:17', 0),
(3, 1, 'pepepepe', '../../../../skin/images/groups/default/groupgen.jpg', 'I', '2016-04-20 19:28:40', '2016-04-20 22:28:40', 0),
(4, 1, 'osa', '../../../../skin/images/groups/default/groupgen.jpg', 'I', '2016-04-20 19:51:46', '2016-04-20 22:51:46', 0),
(5, 1, 'Pepsi', '../../../../skin/images/groups/5/img5426380480.jpeg', 'I', '2016-04-20 20:35:39', '2016-04-20 23:35:39', 0),
(6, 1, 'Coca Cola', '../../../../skin/images/groups/6/img601643968.jpeg', 'I', '2016-04-25 03:09:11', '2016-04-25 06:09:11', 0),
(7, 1, 'Sprite', '../../../../skin/images/groups/7/img393144030.jpeg', 'I', '2016-04-25 03:09:19', '2016-04-25 06:09:19', 0),
(8, 1, '7UP', '../../../../skin/images/groups/default/groupgen.jpg', 'A', '2016-04-25 03:09:27', '2016-04-25 06:09:27', 0),
(9, 1, 'Fanta', '../../../../skin/images/groups/9/img891009154.png', 'I', '2016-04-25 03:09:35', '2016-04-25 06:09:35', 0),
(10, 1, 'Cheketo', '../../../../skin/images/groups/default/groupgen.jpg', 'I', '2016-10-24 21:53:42', '2016-10-24 21:53:42', 0),
(11, 1, 'Manaos', '../../../../skin/images/groups/11/img671812767.jpeg', 'I', '2016-10-25 01:10:05', '2016-10-25 01:10:05', 0),
(12, 1, 'Mirinda', '../../../../skin/images/groups/12/img601173992.jpeg', 'I', '2016-10-25 01:11:06', '2016-10-25 01:11:06', 0),
(13, 1, 'Familia', '../../../../skin/images/groups/13/img668341038.png', 'A', '2017-06-19 14:41:41', '2017-06-19 14:41:41', 0),
(14, 1, 'Almacén', '../../../../skin/images/groups/group1065666482.jpeg', 'A', '2017-07-07 23:21:12', '2017-07-07 23:21:12', 0),
(15, 1, 'Almacén', '../../../../skin/images/groups/15/img426376800.png', 'A', '2017-07-07 23:25:31', '2017-07-07 23:25:31', 0),
(16, 1, 'Almacenero', '../../../../skin/images/groups/group2774159538.png', 'A', '2017-07-07 23:31:50', '2017-07-07 23:31:50', 0),
(17, 1, 'Fábrica', '../../../../skin/images/groups/17/img-2086102016.png', 'A', '2017-07-15 21:09:24', '2017-07-15 21:09:24', 0),
(18, 1, 'Camiones', '../../../../skin/images/groups/18/img410962256.png', 'A', '2018-06-18 02:51:44', '2018-06-18 05:51:44', 0);

-- --------------------------------------------------------

--
-- Table structure for table `core_log_email`
--

CREATE TABLE IF NOT EXISTS `core_log_email` (
  `log_id` int(11) NOT NULL,
  `associated_id` int(11) NOT NULL,
  `sent` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sender` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `receiver` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `error` text COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_log_error`
--

CREATE TABLE IF NOT EXISTS `core_log_error` (
  `log_id` int(11) NOT NULL,
  `error` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `creation_date` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=157706 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `core_log_error`
--

INSERT INTO `core_log_error` (`log_id`, `error`, `type`, `description`, `created_by`, `creation_date`) VALUES
(157375, 'Table ''rolpel.tax_iva_type'' doesn''t exist', 'MySQL', 'SELECT type_id,name FROM tax_iva_type WHERE status=''A'' ORDER BY name', 8, '2018-04-27 14:10:29'),
(157376, 'Table ''rolpel.tax_iva_type'' doesn''t exist', 'MySQL', 'SELECT type_id,name FROM tax_iva_type WHERE status=''A'' ORDER BY name', 8, '2018-04-27 14:15:25'),
(157377, 'Table ''rolpel.purchase_type'' doesn''t exist', 'MySQL', 'SELECT type_id FROM purchase_type WHERE international=''N'' AND customer=''N'' AND provider=''Y''', 8, '2018-04-27 14:30:17'),
(157378, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''AND status=''A'''' at line 1', 'MySQL', 'SELECT profile_id,title FROM core_profile WHERE organization_id= AND status=''A''', 0, '2018-04-27 14:41:58'),
(157379, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''AND status=''A'' ORDER BY title'' at line 1', 'MySQL', 'SELECT group_id,title FROM core_group WHERE organization_id= AND status=''A'' ORDER BY title', 0, '2018-04-27 14:41:58'),
(157380, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ORDER BY title'' at line 1', 'MySQL', 'SELECT * FROM core_group WHERE status = ''A'' AND group_id IN (SELECT group_id FROM core_relation_menu_group WHERE menu_id=1) AND organization_id= ORDER BY title', 0, '2018-04-27 14:41:58'),
(157381, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ORDER BY title'' at line 1', 'MySQL', 'SELECT * FROM core_profile WHERE status = ''A'' AND profile_id IN (SELECT profile_id FROM core_relation_menu_profile WHERE menu_id=1) AND organization_id= ORDER BY title', 0, '2018-04-27 14:41:58'),
(157382, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ORDER BY title'' at line 1', 'MySQL', 'SELECT * FROM core_group WHERE status = ''A'' AND group_id IN (SELECT group_id FROM core_relation_menu_group WHERE menu_id=2) AND organization_id= ORDER BY title', 0, '2018-04-27 14:41:58'),
(157383, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ORDER BY title'' at line 1', 'MySQL', 'SELECT * FROM core_profile WHERE status = ''A'' AND profile_id IN (SELECT profile_id FROM core_relation_menu_profile WHERE menu_id=2) AND organization_id= ORDER BY title', 0, '2018-04-27 14:41:58'),
(157384, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ORDER BY title'' at line 1', 'MySQL', 'SELECT * FROM core_group WHERE status = ''A'' AND group_id IN (SELECT group_id FROM core_relation_menu_group WHERE menu_id=3) AND organization_id= ORDER BY title', 0, '2018-04-27 14:41:59'),
(157385, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ORDER BY title'' at line 1', 'MySQL', 'SELECT * FROM core_profile WHERE status = ''A'' AND profile_id IN (SELECT profile_id FROM core_relation_menu_profile WHERE menu_id=3) AND organization_id= ORDER BY title', 0, '2018-04-27 14:41:59'),
(157386, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ORDER BY title'' at line 1', 'MySQL', 'SELECT * FROM core_group WHERE status = ''A'' AND group_id IN (SELECT group_id FROM core_relation_menu_group WHERE menu_id=4) AND organization_id= ORDER BY title', 0, '2018-04-27 14:41:59'),
(157387, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ORDER BY title'' at line 1', 'MySQL', 'SELECT * FROM core_profile WHERE status = ''A'' AND profile_id IN (SELECT profile_id FROM core_relation_menu_profile WHERE menu_id=4) AND organization_id= ORDER BY title', 0, '2018-04-27 14:41:59'),
(157388, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ORDER BY title'' at line 1', 'MySQL', 'SELECT * FROM core_group WHERE status = ''A'' AND group_id IN (SELECT group_id FROM core_relation_menu_group WHERE menu_id=5) AND organization_id= ORDER BY title', 0, '2018-04-27 14:41:59'),
(157389, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ORDER BY title'' at line 1', 'MySQL', 'SELECT * FROM core_profile WHERE status = ''A'' AND profile_id IN (SELECT profile_id FROM core_relation_menu_profile WHERE menu_id=5) AND organization_id= ORDER BY title', 0, '2018-04-27 14:41:59'),
(157390, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ORDER BY title'' at line 1', 'MySQL', 'SELECT * FROM core_group WHERE status = ''A'' AND group_id IN (SELECT group_id FROM core_relation_menu_group WHERE menu_id=6) AND organization_id= ORDER BY title', 0, '2018-04-27 14:41:59'),
(157391, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ORDER BY title'' at line 1', 'MySQL', 'SELECT * FROM core_profile WHERE status = ''A'' AND profile_id IN (SELECT profile_id FROM core_relation_menu_profile WHERE menu_id=6) AND organization_id= ORDER BY title', 0, '2018-04-27 14:41:59'),
(157392, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ORDER BY title'' at line 1', 'MySQL', 'SELECT * FROM core_group WHERE status = ''A'' AND group_id IN (SELECT group_id FROM core_relation_menu_group WHERE menu_id=7) AND organization_id= ORDER BY title', 0, '2018-04-27 14:41:59'),
(157393, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ORDER BY title'' at line 1', 'MySQL', 'SELECT * FROM core_profile WHERE status = ''A'' AND profile_id IN (SELECT profile_id FROM core_relation_menu_profile WHERE menu_id=7) AND organization_id= ORDER BY title', 0, '2018-04-27 14:41:59'),
(157394, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ORDER BY title'' at line 1', 'MySQL', 'SELECT * FROM core_group WHERE status = ''A'' AND group_id IN (SELECT group_id FROM core_relation_menu_group WHERE menu_id=8) AND organization_id= ORDER BY title', 0, '2018-04-27 14:41:59'),
(157395, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ORDER BY title'' at line 1', 'MySQL', 'SELECT * FROM core_profile WHERE status = ''A'' AND profile_id IN (SELECT profile_id FROM core_relation_menu_profile WHERE menu_id=8) AND organization_id= ORDER BY title', 0, '2018-04-27 14:41:59'),
(157396, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ORDER BY title'' at line 1', 'MySQL', 'SELECT * FROM core_group WHERE status = ''A'' AND group_id IN (SELECT group_id FROM core_relation_menu_group WHERE menu_id=9) AND organization_id= ORDER BY title', 0, '2018-04-27 14:41:59'),
(157397, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ORDER BY title'' at line 1', 'MySQL', 'SELECT * FROM core_profile WHERE status = ''A'' AND profile_id IN (SELECT profile_id FROM core_relation_menu_profile WHERE menu_id=9) AND organization_id= ORDER BY title', 0, '2018-04-27 14:41:59'),
(157398, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ORDER BY title'' at line 1', 'MySQL', 'SELECT * FROM core_group WHERE status = ''A'' AND group_id IN (SELECT group_id FROM core_relation_menu_group WHERE menu_id=10) AND organization_id= ORDER BY title', 0, '2018-04-27 14:41:59'),
(157399, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ORDER BY title'' at line 1', 'MySQL', 'SELECT * FROM core_profile WHERE status = ''A'' AND profile_id IN (SELECT profile_id FROM core_relation_menu_profile WHERE menu_id=10) AND organization_id= ORDER BY title', 0, '2018-04-27 14:41:59'),
(157400, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ORDER BY title'' at line 1', 'MySQL', 'SELECT * FROM core_group WHERE status = ''A'' AND group_id IN (SELECT group_id FROM core_relation_menu_group WHERE menu_id=11) AND organization_id= ORDER BY title', 0, '2018-04-27 14:41:59'),
(157401, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ORDER BY title'' at line 1', 'MySQL', 'SELECT * FROM core_profile WHERE status = ''A'' AND profile_id IN (SELECT profile_id FROM core_relation_menu_profile WHERE menu_id=11) AND organization_id= ORDER BY title', 0, '2018-04-27 14:41:59'),
(157402, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ORDER BY title'' at line 1', 'MySQL', 'SELECT * FROM core_group WHERE status = ''A'' AND group_id IN (SELECT group_id FROM core_relation_menu_group WHERE menu_id=12) AND organization_id= ORDER BY title', 0, '2018-04-27 14:41:59'),
(157403, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ORDER BY title'' at line 1', 'MySQL', 'SELECT * FROM core_profile WHERE status = ''A'' AND profile_id IN (SELECT profile_id FROM core_relation_menu_profile WHERE menu_id=12) AND organization_id= ORDER BY title', 0, '2018-04-27 14:41:59'),
(157404, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ORDER BY title'' at line 1', 'MySQL', 'SELECT * FROM core_group WHERE status = ''A'' AND group_id IN (SELECT group_id FROM core_relation_menu_group WHERE menu_id=13) AND organization_id= ORDER BY title', 0, '2018-04-27 14:41:59'),
(157405, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ORDER BY title'' at line 1', 'MySQL', 'SELECT * FROM core_profile WHERE status = ''A'' AND profile_id IN (SELECT profile_id FROM core_relation_menu_profile WHERE menu_id=13) AND organization_id= ORDER BY title', 0, '2018-04-27 14:41:59'),
(157406, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ORDER BY title'' at line 1', 'MySQL', 'SELECT * FROM core_group WHERE status = ''A'' AND group_id IN (SELECT group_id FROM core_relation_menu_group WHERE menu_id=16) AND organization_id= ORDER BY title', 0, '2018-04-27 14:41:59'),
(157407, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ORDER BY title'' at line 1', 'MySQL', 'SELECT * FROM core_profile WHERE status = ''A'' AND profile_id IN (SELECT profile_id FROM core_relation_menu_profile WHERE menu_id=16) AND organization_id= ORDER BY title', 0, '2018-04-27 14:41:59'),
(157408, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ORDER BY title'' at line 1', 'MySQL', 'SELECT * FROM core_group WHERE status = ''A'' AND group_id IN (SELECT group_id FROM core_relation_menu_group WHERE menu_id=17) AND organization_id= ORDER BY title', 0, '2018-04-27 14:41:59'),
(157409, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ORDER BY title'' at line 1', 'MySQL', 'SELECT * FROM core_profile WHERE status = ''A'' AND profile_id IN (SELECT profile_id FROM core_relation_menu_profile WHERE menu_id=17) AND organization_id= ORDER BY title', 0, '2018-04-27 14:41:59'),
(157410, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ORDER BY title'' at line 1', 'MySQL', 'SELECT * FROM core_group WHERE status = ''A'' AND group_id IN (SELECT group_id FROM core_relation_menu_group WHERE menu_id=18) AND organization_id= ORDER BY title', 0, '2018-04-27 14:41:59'),
(157411, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ORDER BY title'' at line 1', 'MySQL', 'SELECT * FROM core_profile WHERE status = ''A'' AND profile_id IN (SELECT profile_id FROM core_relation_menu_profile WHERE menu_id=18) AND organization_id= ORDER BY title', 0, '2018-04-27 14:41:59'),
(157412, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ORDER BY title'' at line 1', 'MySQL', 'SELECT * FROM core_group WHERE status = ''A'' AND group_id IN (SELECT group_id FROM core_relation_menu_group WHERE menu_id=19) AND organization_id= ORDER BY title', 0, '2018-04-27 14:41:59'),
(157413, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ORDER BY title'' at line 1', 'MySQL', 'SELECT * FROM core_profile WHERE status = ''A'' AND profile_id IN (SELECT profile_id FROM core_relation_menu_profile WHERE menu_id=19) AND organization_id= ORDER BY title', 0, '2018-04-27 14:41:59'),
(157414, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ORDER BY title'' at line 1', 'MySQL', 'SELECT * FROM core_group WHERE status = ''A'' AND group_id IN (SELECT group_id FROM core_relation_menu_group WHERE menu_id=20) AND organization_id= ORDER BY title', 0, '2018-04-27 14:41:59'),
(157415, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ORDER BY title'' at line 1', 'MySQL', 'SELECT * FROM core_profile WHERE status = ''A'' AND profile_id IN (SELECT profile_id FROM core_relation_menu_profile WHERE menu_id=20) AND organization_id= ORDER BY title', 0, '2018-04-27 14:41:59'),
(157416, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ORDER BY title'' at line 1', 'MySQL', 'SELECT * FROM core_group WHERE status = ''A'' AND group_id IN (SELECT group_id FROM core_relation_menu_group WHERE menu_id=21) AND organization_id= ORDER BY title', 0, '2018-04-27 14:41:59'),
(157417, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ORDER BY title'' at line 1', 'MySQL', 'SELECT * FROM core_profile WHERE status = ''A'' AND profile_id IN (SELECT profile_id FROM core_relation_menu_profile WHERE menu_id=21) AND organization_id= ORDER BY title', 0, '2018-04-27 14:41:59'),
(157418, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ORDER BY title'' at line 1', 'MySQL', 'SELECT * FROM core_group WHERE status = ''A'' AND group_id IN (SELECT group_id FROM core_relation_menu_group WHERE menu_id=22) AND organization_id= ORDER BY title', 0, '2018-04-27 14:42:00'),
(157419, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ORDER BY title'' at line 1', 'MySQL', 'SELECT * FROM core_profile WHERE status = ''A'' AND profile_id IN (SELECT profile_id FROM core_relation_menu_profile WHERE menu_id=22) AND organization_id= ORDER BY title', 0, '2018-04-27 14:42:00'),
(157420, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ORDER BY title'' at line 1', 'MySQL', 'SELECT * FROM core_group WHERE status = ''A'' AND group_id IN (SELECT group_id FROM core_relation_menu_group WHERE menu_id=23) AND organization_id= ORDER BY title', 0, '2018-04-27 14:42:00'),
(157421, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ORDER BY title'' at line 1', 'MySQL', 'SELECT * FROM core_profile WHERE status = ''A'' AND profile_id IN (SELECT profile_id FROM core_relation_menu_profile WHERE menu_id=23) AND organization_id= ORDER BY title', 0, '2018-04-27 14:42:00'),
(157422, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ORDER BY title'' at line 1', 'MySQL', 'SELECT * FROM core_group WHERE status = ''A'' AND group_id IN (SELECT group_id FROM core_relation_menu_group WHERE menu_id=24) AND organization_id= ORDER BY title', 0, '2018-04-27 14:42:00'),
(157423, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ORDER BY title'' at line 1', 'MySQL', 'SELECT * FROM core_profile WHERE status = ''A'' AND profile_id IN (SELECT profile_id FROM core_relation_menu_profile WHERE menu_id=24) AND organization_id= ORDER BY title', 0, '2018-04-27 14:42:00'),
(157424, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ORDER BY title'' at line 1', 'MySQL', 'SELECT * FROM core_group WHERE status = ''A'' AND group_id IN (SELECT group_id FROM core_relation_menu_group WHERE menu_id=25) AND organization_id= ORDER BY title', 0, '2018-04-27 14:42:00'),
(157425, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ORDER BY title'' at line 1', 'MySQL', 'SELECT * FROM core_profile WHERE status = ''A'' AND profile_id IN (SELECT profile_id FROM core_relation_menu_profile WHERE menu_id=25) AND organization_id= ORDER BY title', 0, '2018-04-27 14:42:00'),
(157426, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ORDER BY title'' at line 1', 'MySQL', 'SELECT * FROM core_group WHERE status = ''A'' AND group_id IN (SELECT group_id FROM core_relation_menu_group WHERE menu_id=26) AND organization_id= ORDER BY title', 0, '2018-04-27 14:42:00'),
(157427, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ORDER BY title'' at line 1', 'MySQL', 'SELECT * FROM core_profile WHERE status = ''A'' AND profile_id IN (SELECT profile_id FROM core_relation_menu_profile WHERE menu_id=26) AND organization_id= ORDER BY title', 0, '2018-04-27 14:42:00'),
(157428, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ORDER BY title'' at line 1', 'MySQL', 'SELECT * FROM core_group WHERE status = ''A'' AND group_id IN (SELECT group_id FROM core_relation_menu_group WHERE menu_id=27) AND organization_id= ORDER BY title', 0, '2018-04-27 14:42:00'),
(157429, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ORDER BY title'' at line 1', 'MySQL', 'SELECT * FROM core_profile WHERE status = ''A'' AND profile_id IN (SELECT profile_id FROM core_relation_menu_profile WHERE menu_id=27) AND organization_id= ORDER BY title', 0, '2018-04-27 14:42:00'),
(157430, 'Table ''rolpel.tax_iva_type'' doesn''t exist', 'MySQL', 'SELECT type_id,name FROM tax_iva_type WHERE status=''A'' ORDER BY name', 8, '2018-05-11 15:09:57'),
(157431, 'The user specified as a definer (''roller''@''%'') does not exist', 'MySQL', 'SELECT * FROM core_view_menu_list WHERE link LIKE ''%core/modules/login/login.php%''', 0, '2018-06-17 23:36:06'),
(157432, 'The user specified as a definer (''roller''@''%'') does not exist', 'MySQL', 'SELECT * FROM core_view_menu_list WHERE link LIKE ''%core/modules/login/login.php%''', 0, '2018-06-17 23:42:27'),
(157433, 'Column ''user_id'' in field list is ambiguous', 'MySQL', 'SELECT user_id,CONCAT(a.last_name,'' '',a.first_name) as name FROM core_user a JOIN core_relation_user_group b ON (b.user_id=a.user_id) JOIN core_group c ON (c.group_id=b.group_id) WHERE c.name LIKE ''%chofer%'' ORDER BY last_name,first_name', 8, '2018-06-18 02:48:23'),
(157434, 'Unknown column ''c.name'' in ''where clause''', 'MySQL', 'SELECT a.user_id,CONCAT(a.last_name,'' '',a.first_name) as name FROM core_user a JOIN core_relation_user_group b ON (b.user_id=a.user_id) JOIN core_group c ON (c.group_id=b.group_id) WHERE c.name LIKE ''%chofer%'' ORDER BY a.last_name,a.first_name', 8, '2018-06-18 02:48:48'),
(157435, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''''O'',''Y'',1)'' at line 1', 'MySQL', 'INSERT INTO core_menu (title,link,position,icon,parent_id,view_status,public,organization_id)VALUES('''',''#'',0,'''',,''O'',''Y'',1)', 8, '2018-06-18 03:00:41'),
(157436, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '''',NOW(),8,1)'' at line 1', 'MySQL', 'INSERT INTO truck (driver_id,name,plate,code,brand,model,year,capacity,creation_date,created_by,organization_id)VALUES(96,''Cami?n Rojo'',''AB-123-CD'',''C1'',''Mercedes-Benz'',''Axor 1933 LS/36'',2017,12009'',NOW(),8,1)', 8, '2018-06-18 03:04:43'),
(157437, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '''',NOW(),8,1)'' at line 1', 'MySQL', 'INSERT INTO truck (driver_id,name,plate,code,brand,model,year,capacity,creation_date,created_by,organization_id)VALUES(96,''Cami?n Rojo'',''AB-123-CD'',''C1'',''Mercedes-Benz'',''Axor 1933 LS/36'',2017,12009'',NOW(),8,1)', 8, '2018-06-18 03:06:33'),
(157438, 'Unknown column ''name'' in ''field list''', 'MySQL', 'INSERT INTO truck (driver_id,name,plate,code,brand,model,year,capacity,creation_date,created_by,organization_id)VALUES(96,''Cami?n Rojo'',''AB-123-CD'',''C1'',''Mercedes-Benz'',''Axor 1933 LS/36'',2017,12009,NOW(),8,1)', 8, '2018-06-18 03:07:06'),
(157439, 'Table ''rolpel.view_quotation_list'' doesn''t exist', 'MySQL', 'DESCRIBE view_quotation_list', 8, '2018-06-21 19:57:23'),
(157440, 'Table ''rolpel.view_quotation_list'' doesn''t exist', 'MySQL', 'SELECT * FROM view_quotation_list WHERE 1=1 GROUP BY quotation_id ORDER BY quotation_id DESC', 8, '2018-06-21 19:57:23'),
(157441, 'Table ''rolpel.view_quotation_list'' doesn''t exist', 'MySQL', 'SELECT * FROM view_quotation_list WHERE 1=1 GROUP BY quotation_id ORDER BY quotation_id DESC LIMIT 0, 0', 8, '2018-06-21 19:57:23'),
(157442, 'Table ''rolpel.view_category_list'' doesn''t exist', 'MySQL', 'DESCRIBE view_category_list', 8, '2018-06-21 21:45:54'),
(157443, 'Table ''rolpel.view_category_list'' doesn''t exist', 'MySQL', 'SELECT * FROM view_category_list WHERE 1=1 GROUP BY category_id', 8, '2018-06-21 21:45:54'),
(157444, 'Table ''rolpel.view_category_list'' doesn''t exist', 'MySQL', 'SELECT * FROM view_category_list WHERE 1=1 GROUP BY category_id LIMIT 0, 0', 8, '2018-06-21 21:45:54'),
(157445, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''164,0.00,1000,'''','''',0,0,''Una caja cuadrada o rectangular hecha de cart?n'',NOW()'' at line 1', 'MySQL', 'INSERT INTO product (code,order_number,category_id,price,brand_id,rack,size,stock_min,stock_max,description,creation_date,organization_id,created_by)VALUES('''',,164,0.00,1000,'''','''',0,0,''Una caja cuadrada o rectangular hecha de cart?n'',NOW(),1,8)', 8, '2018-06-21 22:15:03'),
(157446, 'Table ''rolpel.purchase_type'' doesn''t exist', 'MySQL', 'SELECT type_id FROM purchase_type WHERE international=''N'' AND customer=''Y'' AND provider=''N''', 8, '2018-06-21 23:35:05'),
(157447, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-06-21 23:35:05'),
(157448, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-06-21 23:35:05'),
(157449, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-06-22 01:08:30'),
(157450, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-06-22 01:09:40'),
(157451, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-06-22 01:09:53'),
(157452, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-06-22 01:13:24'),
(157453, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-06-22 01:37:12'),
(157454, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-06-22 01:39:04'),
(157455, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-06-22 01:40:00'),
(157456, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-06-22 01:40:37'),
(157457, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-06-22 01:42:03'),
(157458, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-06-22 01:45:53'),
(157459, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-06-22 01:48:15'),
(157460, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-06-22 01:54:26'),
(157461, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-06-22 02:10:20'),
(157462, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-06-22 02:10:22'),
(157463, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-06-22 02:10:46'),
(157464, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 95, '2018-06-22 02:28:28'),
(157465, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 95, '2018-06-22 02:34:02'),
(157466, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 95, '2018-06-22 02:34:08'),
(157467, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 95, '2018-06-22 02:35:58'),
(157468, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 95, '2018-06-22 02:38:51'),
(157469, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-06-22 02:39:12'),
(157470, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 95, '2018-06-22 02:39:25'),
(157471, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 95, '2018-06-22 02:40:07'),
(157472, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 95, '2018-06-22 02:40:07'),
(157473, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 95, '2018-06-22 02:40:08'),
(157474, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 95, '2018-06-22 02:41:48'),
(157475, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 95, '2018-06-22 02:41:48'),
(157476, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 95, '2018-06-22 02:44:48'),
(157477, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 95, '2018-06-22 02:46:43'),
(157478, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 95, '2018-06-22 02:53:28'),
(157479, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 95, '2018-06-22 02:53:43'),
(157480, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 95, '2018-06-22 02:54:50'),
(157481, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 95, '2018-06-22 02:56:35'),
(157482, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 95, '2018-06-22 03:02:06'),
(157483, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 95, '2018-06-22 03:07:18'),
(157484, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 95, '2018-06-25 16:35:23'),
(157485, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 95, '2018-06-25 16:36:52'),
(157486, 'Unknown column ''undefined'' in ''where clause''', 'MySQL', 'DELETE FROM company_agent WHERE agent_id=undefined', 95, '2018-06-25 16:37:37'),
(157487, 'Unknown column ''undefined'' in ''where clause''', 'MySQL', 'DELETE FROM company_agent WHERE agent_id=undefined', 95, '2018-06-25 16:37:38'),
(157488, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 95, '2018-06-25 16:53:06'),
(157489, 'View ''rolpel.view_category_list'' references invalid table(s) or column(s) or function(s) or definer/invoker of view lack rights to use them', 'MySQL', 'DESCRIBE view_category_list', 95, '2018-06-25 17:16:24'),
(157490, 'View ''rolpel.view_category_list'' references invalid table(s) or column(s) or function(s) or definer/invoker of view lack rights to use them', 'MySQL', 'SELECT * FROM view_category_list WHERE 1=1 GROUP BY category_id', 95, '2018-06-25 17:16:24'),
(157491, 'View ''rolpel.view_category_list'' references invalid table(s) or column(s) or function(s) or definer/invoker of view lack rights to use them', 'MySQL', 'SELECT * FROM view_category_list WHERE 1=1 GROUP BY category_id LIMIT 0, 0', 95, '2018-06-25 17:16:24'),
(157492, 'View ''rolpel.view_category_list'' references invalid table(s) or column(s) or function(s) or definer/invoker of view lack rights to use them', 'MySQL', 'DESCRIBE view_category_list', 95, '2018-06-25 17:17:15'),
(157493, 'View ''rolpel.view_category_list'' references invalid table(s) or column(s) or function(s) or definer/invoker of view lack rights to use them', 'MySQL', 'SELECT * FROM view_category_list WHERE 1=1 GROUP BY category_id', 95, '2018-06-25 17:17:15'),
(157494, 'View ''rolpel.view_category_list'' references invalid table(s) or column(s) or function(s) or definer/invoker of view lack rights to use them', 'MySQL', 'SELECT * FROM view_category_list WHERE 1=1 GROUP BY category_id LIMIT 0, 0', 95, '2018-06-25 17:17:15'),
(157495, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 95, '2018-06-25 17:18:09'),
(157496, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-07-18 19:37:34'),
(157497, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-07-28 19:36:31'),
(157498, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-11 17:19:45'),
(157499, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-11 17:28:27'),
(157500, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-11 17:29:38'),
(157501, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-11 17:35:20'),
(157502, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-11 17:36:37'),
(157503, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-11 17:39:54'),
(157504, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-11 17:40:26'),
(157505, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-11 17:40:49'),
(157506, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-11 17:41:05'),
(157507, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-11 17:41:18'),
(157508, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-11 17:43:38'),
(157509, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-11 17:45:48'),
(157510, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-11 17:46:20'),
(157511, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-11 17:47:07'),
(157512, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-11 17:47:36'),
(157513, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-11 17:48:07'),
(157514, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-11 17:48:31'),
(157515, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-11 17:48:46'),
(157516, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-11 17:49:05'),
(157517, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-11 17:50:23'),
(157518, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-11 17:52:03'),
(157519, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-11 17:55:14'),
(157520, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-11 17:58:57'),
(157521, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-11 17:59:37'),
(157522, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-11 18:03:36'),
(157523, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-11 18:04:35'),
(157524, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-11 18:05:09'),
(157525, 'View ''rolpel.view_category_list'' references invalid table(s) or column(s) or function(s) or definer/invoker of view lack rights to use them', 'MySQL', 'DESCRIBE view_category_list', 8, '2018-08-11 18:07:10'),
(157526, 'View ''rolpel.view_category_list'' references invalid table(s) or column(s) or function(s) or definer/invoker of view lack rights to use them', 'MySQL', 'SELECT * FROM view_category_list WHERE 1=1 GROUP BY category_id', 8, '2018-08-11 18:07:10'),
(157527, 'View ''rolpel.view_category_list'' references invalid table(s) or column(s) or function(s) or definer/invoker of view lack rights to use them', 'MySQL', 'SELECT * FROM view_category_list WHERE 1=1 GROUP BY category_id LIMIT 0, 0', 8, '2018-08-11 18:07:10'),
(157528, 'View ''rolpel.view_category_list'' references invalid table(s) or column(s) or function(s) or definer/invoker of view lack rights to use them', 'MySQL', 'DESCRIBE view_category_list', 8, '2018-08-11 18:08:09'),
(157529, 'View ''rolpel.view_category_list'' references invalid table(s) or column(s) or function(s) or definer/invoker of view lack rights to use them', 'MySQL', 'SELECT * FROM view_category_list WHERE 1=1 GROUP BY category_id', 8, '2018-08-11 18:08:09'),
(157530, 'View ''rolpel.view_category_list'' references invalid table(s) or column(s) or function(s) or definer/invoker of view lack rights to use them', 'MySQL', 'SELECT * FROM view_category_list WHERE 1=1 GROUP BY category_id LIMIT 0, 0', 8, '2018-08-11 18:08:09'),
(157531, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-11 20:11:04'),
(157532, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-11 20:20:22'),
(157533, 'Unknown column ''undefined'' in ''where clause''', 'MySQL', 'UPDATE purchase_file_new SET status=''I'',updated_by=8 WHERE file_id=undefined', 8, '2018-08-11 20:25:03'),
(157534, 'Unknown column ''undefined'' in ''where clause''', 'MySQL', 'UPDATE purchase_file_new SET status=''I'',updated_by=8 WHERE file_id=undefined', 8, '2018-08-11 20:29:31'),
(157535, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''''roadtrip'',''../../../../skin/files/purchase/new/roadtrip.jpg'',NOW(),8,1)'' at line 1', 'MySQL', 'INSERT INTO purchase_file_new (product_id,name,url,creation_date,created_by,organization_id)VALUES(,''roadtrip'',''../../../../skin/files/purchase/new/roadtrip.jpg'',NOW(),8,1)', 8, '2018-08-11 20:50:08'),
(157536, 'Unknown column ''undefined'' in ''where clause''', 'MySQL', 'UPDATE quotation_file_new SET status=''I'',updated_by=8 WHERE file_id=undefined', 8, '2018-08-12 01:06:11'),
(157537, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-12 01:10:34'),
(157538, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-12 01:12:49'),
(157539, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-12 22:53:50'),
(157540, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-12 23:05:33'),
(157541, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-12 23:06:20'),
(157542, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-12 23:09:02'),
(157543, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-14 19:08:36'),
(157544, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-14 19:08:54'),
(157545, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-14 19:13:28'),
(157546, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-14 19:16:38'),
(157547, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-14 19:17:09'),
(157548, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-14 19:20:44'),
(157549, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-14 19:35:16'),
(157550, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-14 19:37:36'),
(157551, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-14 19:40:06'),
(157552, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-14 19:42:27'),
(157553, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-14 19:43:25'),
(157554, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-14 19:49:29'),
(157555, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-14 19:51:22'),
(157556, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-14 19:56:39'),
(157557, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-14 19:57:33'),
(157558, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-18 17:22:25'),
(157559, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-18 19:17:32'),
(157560, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-18 19:28:27'),
(157561, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-18 19:29:07'),
(157562, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-18 19:38:12'),
(157563, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-18 19:39:09'),
(157564, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-18 19:45:11'),
(157565, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-18 19:47:03'),
(157566, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-18 19:49:54'),
(157567, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-18 19:50:43'),
(157568, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-18 19:51:09'),
(157569, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-18 19:54:10'),
(157570, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-18 19:54:37'),
(157571, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-18 19:54:46'),
(157572, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-18 19:55:11'),
(157573, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-18 19:55:29'),
(157574, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-18 19:56:12'),
(157575, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-18 19:56:57'),
(157576, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-18 19:57:29'),
(157577, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-18 19:59:43'),
(157578, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-18 20:02:38'),
(157579, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-18 20:08:30'),
(157580, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-18 20:09:46'),
(157581, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-18 20:09:56'),
(157582, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 02:18:54'),
(157583, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 02:30:57'),
(157584, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 02:31:49'),
(157585, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 02:32:05'),
(157586, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 02:32:52'),
(157587, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 02:33:33'),
(157588, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 02:36:08'),
(157589, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 02:36:19'),
(157590, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 02:36:55'),
(157591, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 04:05:10'),
(157592, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 04:05:49'),
(157593, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 04:51:42'),
(157594, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 04:52:38'),
(157595, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 04:53:22'),
(157596, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 04:54:31'),
(157597, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 04:56:28'),
(157598, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 04:57:16'),
(157599, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 04:57:30'),
(157600, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 04:57:59'),
(157601, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 05:00:32'),
(157602, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 05:01:16'),
(157603, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 05:01:50'),
(157604, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 05:03:01'),
(157605, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 05:03:23'),
(157606, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 05:03:50'),
(157607, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 05:06:00'),
(157608, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 05:06:24'),
(157609, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 05:07:05'),
(157610, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 05:07:18'),
(157611, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 05:09:50'),
(157612, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 05:12:33'),
(157613, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 05:13:31'),
(157614, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 05:20:02'),
(157615, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 05:20:41'),
(157616, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 05:22:01'),
(157617, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 05:23:43'),
(157618, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 05:24:52'),
(157619, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 05:26:57'),
(157620, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 05:28:16'),
(157621, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 05:32:03'),
(157622, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 05:33:26'),
(157623, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 05:35:03'),
(157624, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 05:44:56'),
(157625, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 05:46:26'),
(157626, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 05:47:49'),
(157627, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 05:50:33'),
(157628, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 06:52:13'),
(157629, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 06:57:02'),
(157630, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 08:26:31'),
(157631, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 08:27:35'),
(157632, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 08:29:14'),
(157633, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 08:35:09'),
(157634, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 08:35:28'),
(157635, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 08:35:57'),
(157636, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 08:41:48'),
(157637, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 08:46:38'),
(157638, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 08:47:27'),
(157639, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 08:47:52'),
(157640, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 08:50:00'),
(157641, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 09:07:14'),
(157642, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 09:10:13'),
(157643, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 09:12:04'),
(157644, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 13:55:32'),
(157645, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 13:55:42'),
(157646, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 14:34:46'),
(157647, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 14:35:19'),
(157648, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 14:48:01'),
(157649, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '''' at line 1', 'MySQL', 'SELECT * FROM product WHERE product_id=', 8, '2018-08-20 14:48:08'),
(157650, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '''' at line 1', 'MySQL', 'SELECT * FROM product WHERE product_id=', 8, '2018-08-20 14:48:10'),
(157651, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '''' at line 1', 'MySQL', 'SELECT * FROM product WHERE product_id=', 8, '2018-08-20 14:48:10'),
(157652, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '''' at line 1', 'MySQL', 'SELECT * FROM product WHERE product_id=', 8, '2018-08-20 14:48:12'),
(157653, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '''' at line 1', 'MySQL', 'SELECT * FROM product WHERE product_id=', 8, '2018-08-20 14:48:13'),
(157654, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '''' at line 1', 'MySQL', 'SELECT * FROM product WHERE product_id=', 8, '2018-08-20 14:48:13'),
(157655, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '''' at line 1', 'MySQL', 'SELECT * FROM product WHERE product_id=', 8, '2018-08-20 14:48:14'),
(157656, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '''' at line 1', 'MySQL', 'SELECT * FROM product WHERE product_id=', 8, '2018-08-20 14:48:16'),
(157657, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '''' at line 1', 'MySQL', 'SELECT * FROM product WHERE product_id=', 8, '2018-08-20 14:48:16'),
(157658, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 14:49:48'),
(157659, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 14:51:17'),
(157660, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 14:53:00'),
(157661, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 14:54:16'),
(157662, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 14:55:21'),
(157663, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-20 15:18:55'),
(157664, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-21 08:21:08'),
(157665, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-21 08:22:14'),
(157666, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-21 08:22:27'),
(157667, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-21 08:22:54'),
(157668, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-21 08:38:27'),
(157669, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-21 09:14:10'),
(157670, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-21 09:15:02'),
(157671, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-21 09:20:23'),
(157672, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-21 09:22:39'),
(157673, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-26 18:09:23'),
(157674, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-26 19:40:47'),
(157675, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-26 20:10:09'),
(157676, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-26 20:11:48'),
(157677, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-26 20:13:02'),
(157678, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-26 20:15:45'),
(157679, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-27 00:17:34'),
(157680, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-27 00:17:43'),
(157681, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-27 00:24:54'),
(157682, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-27 00:25:23'),
(157683, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-27 00:26:33'),
(157684, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-27 00:28:15'),
(157685, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-27 00:34:53'),
(157686, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-27 00:36:00'),
(157687, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-27 00:36:38'),
(157688, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-27 02:07:06'),
(157689, 'Unknown column ''branch_id'' in ''field list''', 'MySQL', 'INSERT INTO purchase (company_id,receiver_id,branch_id,agent_id,total,extra,delivery_date,status,creation_date,created_by,organization_id)VALUES(11694,11694,5082,1341,0,''Datos para el cliente'',''2018-08-31'',''A'',NOW(),8,1)', 8, '2018-08-27 02:10:26'),
(157690, 'Unknown column ''$1.23'' in ''field list''', 'MySQL', 'INSERT INTO purchase_item (purchase_id,company_id,branch_id,product_id,price,quantity,total,delivery_date,days,creation_date,created_by,organization_id)VALUES(157689,11694,5082,50489,$1.23,2,0,''2018-08-29'',2,NOW(),8,1),(157689,11694,5082,50491,$1,3,0,''2018-08-31'',4,NOW(),8,1)', 8, '2018-08-27 02:10:26'),
(157691, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''creation_date,organization_id,created_by)VALUES(''Cart?n'',164,1000,NOW(),1,8)'' at line 1', 'MySQL', 'INSERT INTO product (title,category_id,brand_id,,creation_date,organization_id,created_by)VALUES(''Cart?n'',164,1000,NOW(),1,8)', 8, '2018-08-27 02:14:45'),
(157692, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-08-27 02:19:36'),
(157693, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''0.00,0.00,0.00,NOW(),1,8)'' at line 1', 'MySQL', 'INSERT INTO product (title,category_id,brand_id,price,width,height,depth,creation_date,organization_id,created_by)VALUES(''Prueb?n'',165,1000,,0.00,0.00,0.00,NOW(),1,8)', 8, '2018-08-27 02:20:08'),
(157694, 'Unknown column ''$12.45'' in ''field list''', 'MySQL', 'INSERT INTO product (title,category_id,brand_id,price,width,height,depth,creation_date,organization_id,created_by)VALUES(''Prueb?n'',166,1000,$12.45,1.5,0.00,1.5,NOW(),1,8)', 8, '2018-08-27 02:21:15'),
(157695, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''1.5,0.00,1.5,NOW(),1,8)'' at line 1', 'MySQL', 'INSERT INTO product (title,category_id,brand_id,price,width,height,depth,creation_date,organization_id,created_by)VALUES(''Prueb?n'',166,1000,,1.5,0.00,1.5,NOW(),1,8)', 8, '2018-08-27 02:21:49'),
(157696, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-09-25 17:21:30'),
(157697, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-09-25 17:21:35'),
(157698, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-09-25 17:21:50'),
(157699, 'Unknown column ''branch_id'' in ''field list''', 'MySQL', 'INSERT INTO purchase (company_id,receiver_id,branch_id,agent_id,total,extra,expire_date,monday_from,monday_to,tuesday_from,tuesday_to,wensday_from,wensday_to,thursday_from,thursday_to,friday_from,friday_to,saturday_from,saturday_to,sunday_from,sunday_to,status,creation_date,created_by,organization_id)VALUES(11694,11694,5082,0,0,''Info para el cliente'',''2018-09-30'',''10:00'',''17:00'',''10:00'',''17:00'','''','''',''10:00'',''17:00'','''','''',''12:00'',''14:00'','''','''',''A'',NOW(),8,1)', 8, '2018-09-25 17:34:34'),
(157700, 'Unknown column ''$1200'' in ''field list''', 'MySQL', 'INSERT INTO purchase_item (purchase_id,company_id,branch_id,product_id,price,width,height,depth,quantity,total,delivery_date,days,creation_date,created_by,organization_id)VALUES(157699,11694,5082,50491,$1200,1,5,1,5,0,''2018-09-30'',5,NOW(),8,1)', 8, '2018-09-25 17:34:34'),
(157701, 'Unknown column ''monday_from'' in ''field list''', 'MySQL', 'INSERT INTO purchase (company_id,receiver_id,branch_id,agent_id,total,extra,expire_date,monday_from,monday_to,tuesday_from,tuesday_to,wensday_from,wensday_to,thursday_from,thursday_to,friday_from,friday_to,saturday_from,saturday_to,sunday_from,sunday_to,status,creation_date,created_by,organization_id)VALUES(11694,11694,5082,0,0,''Info para el cliente'',''2018-09-30'',''10:00'',''17:00'',''10:00'',''17:00'','''','''',''10:00'',''17:00'','''','''',''12:00'',''14:00'','''','''',''A'',NOW(),8,1)', 8, '2018-09-25 17:38:29'),
(157702, 'Unknown column ''branch_id'' in ''field list''', 'MySQL', 'INSERT INTO purchase_item (purchase_id,company_id,branch_id,product_id,price,width,height,depth,quantity,total,delivery_date,days,creation_date,created_by,organization_id)VALUES(157701,11694,5082,50491,1200,1,5,1,5,0,''2018-09-30'',5,NOW(),8,1)', 8, '2018-09-25 17:38:29'),
(157703, 'Unknown column ''monday_from'' in ''field list''', 'MySQL', 'INSERT INTO purchase (company_id,receiver_id,branch_id,agent_id,total,extra,expire_date,monday_from,monday_to,tuesday_from,tuesday_to,wensday_from,wensday_to,thursday_from,thursday_to,friday_from,friday_to,saturday_from,saturday_to,sunday_from,sunday_to,status,creation_date,created_by,organization_id)VALUES(11694,11694,5082,0,6000,''Info para el cliente'',''2018-09-30'',''10:00'',''17:00'',''10:00'',''17:00'','''','''',''10:00'',''17:00'','''','''',''12:00'',''14:00'','''','''',''A'',NOW(),8,1)', 8, '2018-09-25 17:39:48'),
(157704, 'Unknown column ''branch_id'' in ''field list''', 'MySQL', 'INSERT INTO purchase_item (purchase_id,company_id,branch_id,product_id,price,width,height,depth,quantity,total,delivery_date,days,creation_date,created_by,organization_id)VALUES(157703,11694,5082,50491,1200,1,5,1,5,6000,''2018-09-30'',5,NOW(),8,1)', 8, '2018-09-25 17:39:48'),
(157705, 'Unknown column ''monday_from'' in ''field list''', 'MySQL', 'INSERT INTO purchase (company_id,receiver_id,branch_id,agent_id,total,extra,expire_date,monday_from,monday_to,tuesday_from,tuesday_to,wensday_from,wensday_to,thursday_from,thursday_to,friday_from,friday_to,saturday_from,saturday_to,sunday_from,sunday_to,status,creation_date,created_by,organization_id)VALUES(11694,11694,5082,0,6000,''Info para el cliente'',''2018-09-30'',''10:00'',''17:00'',''10:00'',''17:00'','''','''',''10:00'',''17:00'','''','''',''12:00'',''14:00'','''','''',''A'',NOW(),8,1)', 8, '2018-09-25 17:40:49');

-- --------------------------------------------------------

--
-- Table structure for table `core_log_login`
--

CREATE TABLE IF NOT EXISTS `core_log_login` (
  `log_id` int(11) NOT NULL,
  `user` varchar(255) CHARACTER SET latin1 NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 NOT NULL,
  `ip` varchar(255) CHARACTER SET latin1 NOT NULL,
  `tries` int(11) NOT NULL,
  `event` varchar(255) CHARACTER SET latin1 NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM AUTO_INCREMENT=135 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `core_log_login`
--

INSERT INTO `core_log_login` (`log_id`, `user`, `password`, `ip`, `tries`, `event`, `date`) VALUES
(86, 'Cheketo', '', '10.240.1.21', 0, 'OK', '2018-04-27 14:04:38'),
(87, 'cheketo', '', '10.240.0.171', 0, 'OK', '2018-04-27 14:15:53'),
(88, 'ana', '', '10.240.0.233', 0, 'OK', '2018-04-27 14:18:50'),
(89, 'cheketo', 'Oraprod1810', '10.240.0.171', 1, 'Clave Incorrecta', '2018-04-27 14:20:00'),
(90, 'cheketo', '', '10.240.0.171', 0, 'OK', '2018-04-27 14:20:09'),
(91, 'cheketo', '', '10.240.1.60', 0, 'OK', '2018-04-27 14:23:29'),
(92, 'cheketo', '', '10.240.0.116', 0, 'OK', '2018-04-27 14:42:03'),
(93, 'cheketo', '', '10.240.1.21', 0, 'OK', '2018-05-11 15:09:41'),
(94, 'cheketo', '', '10.240.1.21', 0, 'OK', '2018-05-23 17:49:03'),
(95, 'cheketo', '', '127.0.0.1', 0, 'OK', '2018-06-18 02:49:12'),
(96, 'sergio', '', '127.0.0.1', 0, 'OK', '2018-06-18 06:24:06'),
(97, 'cheketo', '', '127.0.0.1', 0, 'OK', '2018-06-18 06:24:26'),
(98, 'sergio', '', '127.0.0.1', 0, 'OK', '2018-06-18 06:26:13'),
(99, 'cheketo', '', '127.0.0.1', 0, 'OK', '2018-06-21 22:57:17'),
(100, 'sergio', '', '127.0.0.1', 0, 'OK', '2018-06-22 05:21:23'),
(101, 'cheketo', '', '127.0.0.1', 0, 'OK', '2018-06-22 05:21:39'),
(102, 'sergio', '', '127.0.0.1', 0, 'OK', '2018-06-22 05:23:32'),
(103, 'cheketo', '', '127.0.0.1', 0, 'OK', '2018-06-22 05:26:43'),
(104, 'sergio', '', '127.0.0.1', 0, 'OK', '2018-06-22 05:27:27'),
(105, 'cheketo', '', '127.0.0.1', 0, 'OK', '2018-06-22 05:39:06'),
(106, 'sergio', '', '127.0.0.1', 0, 'OK', '2018-06-22 05:39:21'),
(107, 'cheketo', '', '127.0.0.1', 0, 'OK', '2018-06-22 06:15:06'),
(108, 'ana', '123456', '127.0.0.1', 1, 'Clave Incorrecta', '2018-06-22 12:17:31'),
(109, 'sergio', '', '127.0.0.1', 0, 'OK', '2018-06-22 12:17:40'),
(110, 'ana', '1234', '127.0.0.1', 1, 'Clave Incorrecta', '2018-06-22 12:18:03'),
(111, 'ana', '123', '127.0.0.1', 1, 'Clave Incorrecta', '2018-06-22 12:18:06'),
(112, 'sergio', '', '127.0.0.1', 0, 'OK', '2018-06-22 12:18:10'),
(113, 'ana', '', '127.0.0.1', 0, 'OK', '2018-06-22 12:18:50'),
(114, 'ana', '', '127.0.0.1', 0, 'OK', '2018-06-22 12:20:18'),
(115, 'sergio', '', '127.0.0.1', 0, 'OK', '2018-06-22 12:36:46'),
(116, 'cheketo', '', '127.0.0.1', 0, 'OK', '2018-06-24 22:51:30'),
(117, 'cheketo', '', '127.0.0.1', 0, 'OK', '2018-06-25 03:04:34'),
(118, 'cheketo', '', '127.0.0.1', 0, 'OK', '2018-06-25 03:05:46'),
(119, 'sergio', '', '127.0.0.1', 0, 'OK', '2018-06-25 19:31:15'),
(120, 'cheketo', '', '127.0.0.1', 0, 'OK', '2018-07-18 22:36:12'),
(121, 'sergio', '', '127.0.0.1', 0, 'OK', '2018-07-18 22:39:01'),
(122, 'cheketo', '', '127.0.0.1', 0, 'OK', '2018-07-28 20:06:24'),
(123, 'cheketo', '', '127.0.0.1', 0, 'OK', '2018-07-28 20:06:30'),
(124, 'cheketo', '', '127.0.0.1', 0, 'OK', '2018-08-11 20:18:27'),
(125, 'cheketo', '', '127.0.0.1', 0, 'OK', '2018-08-12 04:02:41'),
(126, 'cheketo', '', '127.0.0.1', 0, 'OK', '2018-08-12 21:58:17'),
(127, 'cheketo', '', '127.0.0.1', 0, 'OK', '2018-08-14 22:08:29'),
(128, 'cheketo', '', '127.0.0.1', 0, 'OK', '2018-08-18 20:22:16'),
(129, 'cheketo', '', '127.0.0.1', 0, 'OK', '2018-08-20 05:18:43'),
(130, 'cheketo', '', '127.0.0.1', 0, 'OK', '2018-08-20 16:55:35'),
(131, 'cheketo', '', '127.0.0.1', 0, 'OK', '2018-08-21 11:19:09'),
(132, 'cheketo', '', '127.0.0.1', 0, 'OK', '2018-08-26 21:06:20'),
(133, 'cheketo', '', '127.0.0.1', 0, 'OK', '2018-08-27 03:17:36'),
(134, 'cheketo', '', '127.0.0.1', 0, 'OK', '2018-09-25 20:20:35');

-- --------------------------------------------------------

--
-- Table structure for table `core_menu`
--

CREATE TABLE IF NOT EXISTS `core_menu` (
  `menu_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET latin1 NOT NULL,
  `link` varchar(255) CHARACTER SET latin1 NOT NULL,
  `icon` varchar(255) CHARACTER SET latin1 NOT NULL,
  `position` int(11) NOT NULL,
  `public` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'Y',
  `status` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'A',
  `view_status` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'A',
  `organization_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=143 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `core_menu`
--

INSERT INTO `core_menu` (`menu_id`, `parent_id`, `title`, `link`, `icon`, `position`, `public`, `status`, `view_status`, `organization_id`) VALUES
(1, 0, 'Administración', '#', 'fa-desktop', 9999, 'N', 'A', 'A', 0),
(2, 53, 'Productos', '#', 'fa-cube', 85, 'N', 'A', 'A', 1),
(3, 53, 'Categorías', '#', 'fa-sitemap', 3, 'N', 'A', 'A', 1),
(4, 6, 'Listado de Perfiles', '../../../core/modules/profile/list.php', 'fa-list-ul', 1, 'N', 'A', 'A', 0),
(5, 1, 'Usuarios', '#', 'fa-user', 1, 'N', 'A', 'A', 0),
(6, 1, 'Perfiles', '#', 'fa-lock', 2, 'N', 'A', 'A', 0),
(7, 1, 'Grupos', '#', 'fa-users', 3, 'N', 'A', 'A', 0),
(8, 1, 'Menúes', '#', 'fa-align-left', 4, 'N', 'A', 'A', 0),
(9, 8, 'Nuevo Menú', '../../../core/modules/menu/new.php', 'fa-plus-square', 1, 'N', 'A', 'A', 0),
(10, 8, 'Listado de Menúes', '../../../core/modules/menu/list.php', 'fa-list-ul', 1, 'N', 'A', 'A', 0),
(11, 5, 'Nuevo Usuario', '../../../core/modules/user/new.php', 'fa-user-plus', 1, 'N', 'A', 'A', 0),
(12, 5, 'Listado de Usuarios', '../../../core/modules/user/list.php', 'fa-list-ul', 2, 'N', 'A', 'A', 0),
(13, 0, 'Inicio', '../../../core/modules/main/main.php', 'fa-home', -100, 'N', 'A', 'A', 0),
(16, 5, 'Editar Usuario', '../../../core/modules/user/edit.php', 'fa-edit', 3, 'N', 'A', 'O', 0),
(17, 8, 'Editar Menú', '../../../core/modules/menu/edit.php', 'fa-edit', 3, 'N', 'A', 'O', 0),
(18, 2, 'Listado de Productos', '../../../project/modules/product/list.php', 'fa-list-ul', 3, 'N', 'A', 'A', 1),
(19, 2, 'Crear Producto', '../../../project/modules/product/new.php', 'fa-plus-square', 0, 'N', 'A', 'A', 1),
(20, 5, 'Usuarios Eliminados', '../user/list.php?status=I', 'fa-trash', 4, 'N', 'A', 'A', 0),
(21, 6, 'Nuevo Perfil', '../profile/new.php', 'fa-plus-square', 1, 'N', 'A', 'A', 0),
(22, 3, 'Listado de Categorías', '../../../project/modules/category/list.php', 'fa-list-ul', 2, 'N', 'A', 'A', 1),
(23, 3, 'Nueva Categoría', '../../../project/modules/category/new.php', 'fa-plus-square', 1, 'N', 'A', 'A', 1),
(24, 3, 'Categorías Eliminadas', '../../../project/modules/category/list.php?status=I', 'fa-trash', 9, 'N', 'A', 'A', 1),
(25, 2, 'Productos Eliminados', '../../../project/modules/product/list.php?status=I', 'fa-trash', 9, 'N', 'A', 'A', 1),
(26, 7, 'Nuevo Grupo', '../../../core/modules/group/new.php', 'fa-plus-square', 1, 'N', 'A', 'A', 0),
(27, 7, 'Listado de Grupos', '../../../core/modules/group/list.php', 'fa-list-ul', 2, 'N', 'A', 'A', 0),
(28, 7, 'Editar Grupo', '../../../core/modules/group/edit.php', 'fa-pencil', 3, 'N', 'A', 'O', 0),
(29, 8, 'Switcher', '../menu/switcher.php', '', 9, 'N', 'A', 'O', 0),
(30, 0, 'Pepepito', '../modulo/pepe2php', 'fa-magic', 678, 'Y', 'I', 'O', 1),
(31, 6, 'Perfiles Eliminados', '../profile/list.php?status=I', 'fa-trash', 3, 'N', 'A', 'A', 0),
(32, 8, 'Menúes Eliminados', '../menu/list.php?status=I', 'fa-trash', 3, 'N', 'A', 'A', 0),
(33, 7, 'Grupos Eliminados', '../../../core/modules/group/list.php?status=I', 'fa-trash', 3, 'N', 'A', 'A', 0),
(34, 5, 'Mi Perfil', '../../../core/modules/user/profile.php', 'fa-child', 4, 'Y', 'A', 'O', 0),
(35, 6, 'Editar Perfil', '../../../core/modules/profile/edit.php', 'fa-pencil', 3, 'N', 'A', 'O', 0),
(36, 61, 'Clientes Prueba', '#', 'fa-suitcase', 90, 'N', 'A', 'A', 1),
(37, 36, 'Nuevo Cliente', '../customer_test/new.php', 'fa-plus', 1, 'N', 'I', 'A', 1),
(38, 36, 'Listado de Clientes', '../customer_test/list.php', 'fa-bars', 2, 'N', 'I', 'A', 1),
(39, 36, 'Cuenta Corriente', '../customer_test/account.php', 'fa-dollar', 3, 'N', 'A', 'A', 1),
(40, 1, 'Geolocalización', '#', 'fa-globe', 5, 'N', 'A', 'O', 1),
(41, 40, 'Países', '#', 'fa-flag', 1, 'N', 'A', 'A', 1),
(42, 40, 'Provincias', '#', 'fa-flag-checkered', 2, 'N', 'A', 'A', 1),
(43, 40, 'Zonas', '#', 'fa-flag-o', 3, 'N', 'A', 'A', 1),
(44, 41, 'Listado de Países', '../geolocation_country/list.php', 'fa-list-ul', 1, 'N', 'A', 'A', 1),
(45, 41, 'Nuevo País', '../geolocation_country/new.php', 'fa-plus-square', 0, 'N', 'A', 'A', 1),
(46, 36, 'Nueva Cuenta Corriente', '../customer_test/new-account.php', 'fa-calculator', 3, 'N', 'A', 'A', 1),
(47, 0, 'Empresas', '#', 'fa-building', 4, 'N', 'A', 'O', 1),
(48, 47, 'Nueva Empresa', '../company/new.php', 'fa-plus-square', 1, 'N', 'A', 'A', 1),
(49, 0, 'Prueba', '#', 'fa-university', 9, 'N', 'I', 'A', 1),
(54, 0, 'Proveedores', '#', 'fa-building', 6, 'N', 'A', 'O', 1),
(50, 53, 'Marcas', '#', 'fa-trademark', 4, 'N', 'A', 'A', 1),
(51, 50, 'Listado de Marcas', '../../../project/modules/brand/list.php', 'fa-list-ul', 2, 'N', 'A', 'A', 1),
(52, 50, 'Nueva Marca', '../../../project/modules/brand/new.php', 'fa-plus-square', 1, 'N', 'A', 'A', 1),
(53, 0, 'Productos', '#', 'fa-cubes', 0, 'N', 'A', 'A', 1),
(55, 54, 'Nacionales', '#', 'fa-flag', 1, 'N', 'A', 'A', 1),
(56, 54, 'Internacionales', '#', 'fa-globe', 2, 'N', 'A', 'A', 1),
(57, 2, 'Editar Producto', '../../../project/modules/product/edit.php', 'fa-pencil', 3, 'N', 'A', 'O', 1),
(58, 55, 'Crear Proveedor', '../provider_national/new.php', 'fa-plus-square', 1, 'N', 'I', 'A', 1),
(59, 55, 'Editar Proveedor', '../provider_national/edit.php', 'fa-pencil-square', 4, 'N', 'I', 'O', 1),
(60, 55, 'Listado de Proveedores', '../provider_national/list.php', 'fa-list-ul', 2, 'N', 'I', 'A', 1),
(61, 0, 'Pruebas', '#', 'fa-bug', 9999, 'N', 'I', 'O', 1),
(62, 61, 'Listado', '../prueba/list.php', 'fa-bed', 3, 'N', 'I', 'A', 1),
(63, 0, 'Clientes', '#', 'fa-industry', 3, 'N', 'A', 'O', 1),
(64, 67, 'Nuevo Cliente', '../customer_national/new.php', 'fa-plus-square', 1, 'N', 'I', 'A', 1),
(65, 67, 'Listado de Clientes', '../customer_national/list.php', 'fa-align-justify', 2, 'N', 'I', 'A', 1),
(66, 67, 'Editar Cliente', '../customer_national/edit.php', 'fa-pencil', 0, 'N', 'I', 'O', 1),
(67, 63, 'Nacionales', '#', 'fa-flag', 1, 'N', 'A', 'A', 1),
(68, 63, 'Internacionales', '#', 'fa-globe', 2, 'N', 'A', 'A', 1),
(69, 0, 'Ventas', '#', 'fa-dollar', 2, 'N', 'A', 'O', 1),
(70, 0, 'Estadísticas', '#', 'fa-area-chart', 15, 'N', 'I', 'O', 1),
(71, 53, 'Stock', '#', 'fa-th', 0, 'N', 'I', 'O', 1),
(72, 71, 'Modificar Stock', '#', 'fa-qrcode', 0, 'N', 'I', 'A', 1),
(73, 107, 'Nueva Orden', '../../../project/modules/purchase/new.php?provider=Y', 'fa-ambulance', 1, 'N', 'A', 'A', 1),
(74, 76, 'Ordenes Sin Confirmar', '../provider_national_order/list.php?status=P', 'fa-shopping-cart', 2, 'N', 'I', 'A', 1),
(75, 102, 'Editar Cotización', '../../../project/modules/quotation/edit.php', 'fa-clipboard', 12, 'N', 'A', 'O', 1),
(76, 0, 'Ordenes de Compra', '#', 'fa-truck', 10, 'N', 'A', 'A', 1),
(77, 107, 'Ordenes Pedidas', '../../../er_national_order/list.php?status=A', 'fa-truck', 3, 'N', 'A', 'A', 1),
(78, 107, 'Historial de Ordenes', '../../../er_national_order/list.php?status=F', 'fa-hourglass-half', 6, 'N', 'A', 'A', 1),
(79, 71, 'Ingresos Pendientes', '../stock/stock_pending.php?status=A', 'fa-sign-in', 5, 'N', 'I', 'A', 1),
(80, 76, 'Generar Factura', '../../../er_national_order/invoice.php', 'fa-file-text', 99, 'N', 'I', 'O', 1),
(81, 76, 'Ordenes a Controlar', '../provider_national_order/list.php?status=S', 'fa-list-alt', 4, 'N', 'I', 'A', 1),
(82, 76, 'Ordenes Pend. Ingreso', '../provider_national_order/list.php?status=C', 'fa-sign-in', 4, 'N', 'I', 'A', 1),
(83, 0, 'Facturación', '#', 'fa-file-text', 2, 'N', 'I', 'O', 1),
(84, 83, 'A Proveedores', '#', 'fa-building', 2, 'N', 'A', 'A', 1),
(85, 84, 'Pendientes', '../provider_national_invoice/list.php?status=P&operation=2', 'fa-exclamation-circle', 1, 'N', 'I', 'A', 1),
(86, 84, 'En Proceso', '../provider_national_invoice/list.php?status=A&operation=2', 'fa-inbox', 2, 'N', 'I', 'A', 1),
(87, 84, 'Archivo', '../provider_national_invoice/list.php?status=F&operation=2', 'fa-archive', 3, 'N', 'I', 'A', 1),
(88, 71, 'Ingreso de Stock', '../stock/stock_entrance.php', 'fa-sign-in', 5, 'N', 'I', 'O', 1),
(89, 55, 'Cotizaciones (Viejo)', '#', 'fa-clipboard', 3, 'N', 'A', 'A', 1),
(90, 89, 'Nueva Cotización', '../provider_national_order/new.php?status=P', 'fa-cart-plus', 1, 'N', 'A', 'A', 1),
(91, 89, 'Cotizaciones Activas', '../provider_national_order/list.php?status=P', 'fa-shopping-cart', 2, 'N', 'A', 'A', 1),
(92, 89, 'Cotizaciones Archivadas', '../provider_national_order/list.php?status=Z', 'fa-archive', 5, 'N', 'A', 'A', 1),
(93, 76, 'Ver Detalle', '../provider_national_order/view.php', 'fa-eye', 99, 'N', 'A', 'O', 1),
(94, 1, 'Configuración', '#', 'fa-cogs', 90, 'N', 'I', 'A', 0),
(95, 94, 'Datos de la Empresa', '../configuration_company/edit.php?id=1', 'fa-home', 1, 'N', 'I', 'A', 0),
(96, 84, 'Cargar Factura', '../provider_national_invoice/fill.php', 'fa-download', 99, 'N', 'I', 'O', 1),
(97, 0, 'Alejandro', '../../../core/modules/user/list.php', 'fa-graduation-cap', 5, 'N', 'I', 'A', 1),
(98, 0, 'Empresas', '#', 'fa-building', 5, 'N', 'A', 'A', 1),
(99, 98, 'Todas las Empresas', '../../../project/modules/company/list.php', 'fa-book', 0, 'N', 'A', 'A', 1),
(100, 98, 'Proveedores', '../../../project/modules/company/list.php?provider=Y', 'fa-shopping-cart', 2, 'N', 'A', 'A', 1),
(101, 98, 'Clientes', '../../../project/modules/company/list.php?customer=Y', 'fa-group', 3, 'N', 'A', 'A', 1),
(102, 0, 'Cotizaciones', '#', 'fa-clipboard', 6, 'N', 'A', 'A', 1),
(103, 102, 'De Proveedores', '#', 'fa-shopping-cart', 1, 'N', 'A', 'A', 1),
(104, 102, 'A Clientes', '#', 'fa-users', 2, 'N', 'A', 'A', 1),
(105, 98, 'Nueva Empresa', '../../../project/modules/company/new.php', 'fa-plus-square', 9, 'N', 'A', 'A', 1),
(106, 70, 'Pepe', '#', 'fa-pie-chart', 9, 'N', 'I', 'A', 1),
(107, 76, 'De Proveedores', '#', 'fa-industry', 1, 'N', 'A', 'A', 1),
(108, 76, 'A Clientes', '#', 'fa-building', 2, 'N', 'A', 'A', 1),
(109, 98, 'Editar Empresa', '../../../project/modules/company/edit.php', 'fa-building', 0, 'N', 'A', 'O', 1),
(110, 103, 'Proveedores Nacionales', '../../../project/modules/quotation/list.php?provider=Y&international=N', 'fa-flag', 1, 'N', 'A', 'A', 1),
(111, 103, 'Proveedores Internacionales', '../../../project/modules/quotation/list.php?provider=Y&international=Y', 'fa-globe', 2, 'N', 'A', 'A', 1),
(112, 104, 'Clientes Nacionales', '../../../project/modules/quotation/list.php?customer=Y&international=N', 'fa-flag', 1, 'N', 'A', 'A', 1),
(113, 104, 'Clientes Internacionales', '../../../project/modules/quotation/list.php?customer=Y&international=Y', 'fa-globe', 2, 'N', 'A', 'A', 1),
(114, 103, 'Nueva Cotización', '../../../project/modules/quotation/new.php?provider=Y', 'fa-plus-square', 0, 'N', 'A', 'A', 1),
(115, 104, 'Nueva Cotización', '../../../project/modules/quotation/new.php?customer=Y', 'fa-plus-square', 0, 'N', 'A', 'A', 1),
(116, 104, 'Historial', '../../../project/modules/quotation/list.php?status=F&customer=Y', 'fa-hourglass-2', 99, 'N', 'A', 'A', 1),
(117, 103, 'Historial', '../../../project/modules/quotation/list.php?status=F&provider=Y', 'fa-hourglass-2', 99, 'N', 'A', 'A', 1),
(118, 53, 'Relaciones', '#', 'fa-exchange', 9, 'N', 'I', 'A', 1),
(119, 118, 'Listado de Relaciones', '../../../project/modules/product/list.relation.php', 'fa-exchange', 3, 'N', 'I', 'A', 1),
(120, 118, 'Nueva Relación', '../../../project/modules/product/new.relation.php', 'fa-plus-square', 1, 'N', 'I', 'A', 1),
(121, 53, 'Artículos Genéricos', '#', 'fa-certificate', 80, 'N', 'I', 'O', 1),
(122, 121, 'Nuevo Artículo', '../../../project/modules/product_abstract/new.php', 'fa-plus-square', 1, 'N', 'I', 'A', 1),
(123, 121, 'Editar Artículo Genérico', '../../../project/modules/product_abstract/edit.php', 'fa-pencil-square', 0, 'N', 'I', 'O', 1),
(124, 121, 'Listado de Artículos Pen.', '../../../project/modules/product_abstract/list.php?relation_status=A', 'fa-certificate', 4, 'N', 'I', 'A', 1),
(125, 53, 'Listas de Precios', '#', 'fa-tag', 70, 'N', 'I', 'O', 1),
(126, 125, 'Importar', '../../../project/modules/product_price_list/import.php', 'fa-database', 5, 'N', 'I', 'A', 1),
(127, 121, 'Listado de Artículos Fin.', '../../../project/modules/product_abstract/list.php?relation_status=F', 'fa-check', 6, 'N', 'I', 'A', 1),
(128, 125, 'Listado de Artículos', '../../../project/modules/product_price_list/list.php', 'fa-list-ul', 1, 'N', 'I', 'A', 1),
(129, 125, 'Nueva Relación', '../../../project/modules/product_price_list/new.php', 'fa-plus-square', 1, 'N', 'I', 'A', 1),
(130, 125, 'Comparar Listas de Precio', '#', 'fa-copy', 20, 'N', 'I', 'A', 1),
(131, 130, 'Nueva Comparación', '../../../project/modules/product_comparation/new.php', 'fa-clone', 1, 'N', 'I', 'A', 1),
(132, 130, 'Ver Comparaciones', '../../../project/modules/product_comparation/list.php', 'fa-list-ul', 5, 'N', 'I', 'A', 1),
(133, 0, 'Configuración', '#', 'fa-cogs', 97, 'N', 'A', 'A', 1),
(134, 133, 'Monedas', '#', 'fa-money', 2, 'N', 'I', 'O', 1),
(135, 134, 'Nueva Moneda', '../../../project/modules/currency/new.php', 'fa-plus-square', 1, 'N', 'A', 'A', 1),
(136, 134, 'Listado de Monedas', '../../../project/modules/currency/list.php', 'fa-list-ul', 5, 'N', 'A', 'A', 1),
(137, 0, 'Camiones', '#', 'fa-truck', 4, 'N', 'A', 'A', 1),
(138, 137, 'Nuevo Camión', '../../../project/modules/truck/new.php', 'fa-plus-circle', 1, 'N', 'A', 'A', 1),
(139, 137, 'Editar Camión', '../../../project/modules/truck/edit.php', 'fa-truck', 2, 'N', 'A', 'O', 1),
(140, 137, 'Listar Camiones', '../../../project/modules/truck/list.php', 'fa-truck', 3, 'N', 'A', 'A', 1),
(141, 108, 'Nueva Orden', '../../../project/modules/purchase/new.php?customer=Y', 'fa-ambulance', 1, 'N', 'A', 'A', 1),
(142, 108, 'Ordenes Pendientes', '../../../project/modules/purchase/list.php?status=P', 'fa-exclamation-circle', 2, 'N', 'A', 'A', 1);

-- --------------------------------------------------------

--
-- Table structure for table `core_organization`
--

CREATE TABLE IF NOT EXISTS `core_organization` (
  `organization_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `corporate_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `postal_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `zone_id` int(11) NOT NULL,
  `region_id` int(11) NOT NULL,
  `province_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `lat` decimal(30,28) NOT NULL,
  `lng` decimal(30,28) NOT NULL,
  `cuit` bigint(15) NOT NULL,
  `gross_income_tax` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `iva` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fax` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `loader_text` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `core_organization`
--

INSERT INTO `core_organization` (`organization_id`, `name`, `corporate_name`, `logo`, `icon`, `address`, `postal_code`, `zone_id`, `region_id`, `province_id`, `country_id`, `lat`, `lng`, `cuit`, `gross_income_tax`, `iva`, `email`, `phone`, `fax`, `website`, `loader_text`) VALUES
(1, 'RolPel', '', '../../../../skin/images/configuration/company/rolpel.png', 'dropbox', 'Río Cuarto 2698', 'C1292', 10, 10, 6, 1, -34.6376643999999900000000000000, -58.4095608999999740000000000000, 33647656779, '33647656779', 1, 'administracion@rolpel.com.ar', '4303-2464/5', '4303-2464/5', 'www.rolpel.com.ar', '<i class="fa fa-dropbox animated faa-tada faa-fast"></i> RolPel'),
(2, 'Pepe Autos', '', '', 'car', '', '', 0, 0, 0, 0, 0.0000000000000000000000000000, 0.0000000000000000000000000000, 0, '', 0, '', '', '', '', 'Pepe <i class="fa fa-car faa-tada animated"></i> Autos');

-- --------------------------------------------------------

--
-- Table structure for table `core_profile`
--

CREATE TABLE IF NOT EXISTS `core_profile` (
  `profile_id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET latin1 NOT NULL,
  `image` varchar(255) CHARACTER SET latin1 NOT NULL,
  `status` char(1) CHARACTER SET latin1 DEFAULT 'A',
  `creation_date` datetime NOT NULL,
  `last_modification` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=366 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `core_profile`
--

INSERT INTO `core_profile` (`profile_id`, `organization_id`, `title`, `image`, `status`, `creation_date`, `last_modification`, `created_by`) VALUES
(333, 1, 'Superadministrador', '../../../../skin/images/profiles/333/img1771575065.png', 'A', '2013-03-03 03:03:03', '2018-06-18 04:13:26', 0),
(350, 1, 'Prueba', '../../../skin/images/profiles/default/profilegen.jpg', 'I', '2016-04-06 20:03:28', '2016-10-25 01:35:58', 0),
(351, 1, 'Pepe', '../../../skin/images/profiles/default/profilegen.jpg', 'I', '2016-04-06 20:05:21', '2016-10-25 01:35:58', 0),
(352, 1, 'Joni', '../../../skin/images/profiles/default/profilegen.jpg', 'I', '2016-04-08 00:10:19', '2016-10-25 01:35:58', 0),
(353, 1, 'Pruebas Administrador', '../../../skin/images/profiles/default/profilegen.jpg', 'I', '2016-04-11 02:56:59', '2016-11-24 14:41:21', 0),
(354, 1, 'Asd', '../../../skin/images/profiles/default/profilegen.jpg', 'I', '2016-04-11 04:29:43', '2016-10-25 01:35:58', 0),
(355, 1, 'Pruebas', '../../../skin/images/profiles/default/profilegen.jpg', 'I', '2016-10-21 09:02:22', '2016-10-25 19:38:15', 0),
(356, 1, 'Grupo de Prueba', '../../../skin/images/profiles/default/profilegen.jpg', 'I', '2016-10-24 21:38:49', '2016-10-25 01:35:58', 0),
(357, 1, 'Grupo de Prueba', '../../../skin/images/profiles/default/profilegen.jpg', 'I', '2016-10-24 21:44:29', '2016-10-25 19:34:16', 0),
(358, 1, 'Perfil de Prueba', '../../../skin/images/profiles/default/profilegen.jpg', 'I', '2016-10-25 01:34:23', '2016-10-25 19:37:53', 0),
(359, 1, 'Contador', '../../../../skin/images/profiles/359/img98707528.png', 'A', '2016-11-11 19:56:40', '2018-06-18 04:10:40', 0),
(360, 1, 'Dueño', '../../../../skin/images/profiles/360/img153011154.png', 'A', '2016-11-24 14:42:53', '2018-06-18 04:04:33', 0),
(361, 1, 'Corredor', '../../../../skin/images/profiles/361/img379997310.png', 'A', '2017-01-18 14:25:14', '2017-07-16 19:58:02', 0),
(362, 1, 'Empleado', '../../../../skin/images/profiles/362/img351539661.png', 'A', '2017-06-19 15:27:23', '2018-06-18 04:05:52', 0),
(363, 1, 'Externo', '', 'I', '2017-07-07 23:15:45', '2017-07-07 23:17:45', 0),
(364, 1, 'Externo2', '../../../skin/images/profiles/profile109244029.png', 'I', '2017-07-07 23:17:35', '2018-06-18 04:13:32', 0),
(365, 1, 'TestAle', '../../../../skin/images/profiles/365/img1023976385.png', 'I', '2017-07-15 23:04:19', '2018-06-18 03:44:51', 0);

-- --------------------------------------------------------

--
-- Table structure for table `core_province`
--

CREATE TABLE IF NOT EXISTS `core_province` (
  `province_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `short_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lat` float NOT NULL,
  `lng` float NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=245 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `core_province`
--

INSERT INTO `core_province` (`province_id`, `country_id`, `name`, `short_name`, `lat`, `lng`) VALUES
(1, 1, 'Ciudad Autónoma de Buenos Aires', 'CABA', 0, 0),
(21, 1, 'Santa Fe', 'Santa Fe', 0, 0),
(4, 1, 'Córdoba', 'Córdoba', 0, 0),
(8, 1, 'Entre Ríos', 'Entre Ríos', 0, 0),
(5, 1, 'Corrientes', 'Corrientes', 0, 0),
(14, 1, 'Misiónes', 'Misiónes', 0, 0),
(24, 1, 'Tucumán', 'Tucumán', 0, 0),
(10, 1, 'Jujuy', 'Jujuy', 0, 0),
(17, 1, 'Salta', 'Salta', 0, 0),
(9, 1, 'Formosa', 'Formosa', 0, 0),
(3, 1, 'Catamarca', 'Catamarca', 0, 0),
(12, 1, 'La Rioja', 'La Rioja', 0, 0),
(13, 1, 'Mendoza', 'Mendoza', 0, 0),
(19, 1, 'San Luis', 'San Luis', 0, 0),
(18, 1, 'San Juan', 'San Juan', 0, 0),
(15, 1, 'Neuquén', 'Neuquén', 0, 0),
(22, 1, 'Santiago del Estero', 'Santiago del Estero', 0, 0),
(11, 1, 'La Pampa', 'La Pampa', 0, 0),
(16, 1, 'Río Negro', 'Río Negro', 0, 0),
(7, 1, 'Chubut', 'Chubut', 0, 0),
(20, 1, 'Santa Cruz', 'Santa Cruz', 0, 0),
(23, 1, 'Tierra del Fuego', 'Tierra del Fuego', 0, 0),
(6, 1, 'Chaco', 'Chaco', 0, 0),
(2, 1, 'Buenos Aires', 'Bs. As.', 0, 0),
(241, 2, 'San Luis Potosí', 'S.L.P.', 0, 0),
(242, 4, 'Shizuoka-ken', 'Shizuoka-ken', 0, 0),
(243, 5, 'Colorado', 'CO', 0, 0),
(244, 6, 'Otago', 'OTA', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `core_region`
--

CREATE TABLE IF NOT EXISTS `core_region` (
  `region_id` int(11) NOT NULL COMMENT ' ',
  `province_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `short_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `core_region`
--

INSERT INTO `core_region` (`region_id`, `province_id`, `country_id`, `name`, `short_name`) VALUES
(1, 1, 1, 'Comuna 4', 'Comuna 4'),
(2, 2, 1, 'Quilmes', 'Quilmes'),
(3, 7, 1, 'Rosario', 'Rosario'),
(4, 4, 1, 'Punilla', 'Punilla'),
(5, 6, 1, 'Federación', 'Federación'),
(6, 5, 1, 'Capital', 'Capital'),
(7, 13, 1, 'Capital', 'Capital'),
(8, 6, 1, 'Capital', 'Capital'),
(9, 15, 1, 'Doctor Manuel Belgrano', 'Dr Manuel Belgrano'),
(10, 15, 1, 'Capital', 'Capital'),
(11, 9, 1, 'Formosa', 'Formosa'),
(12, 3, 1, 'Capital', 'Capital'),
(13, 12, 1, 'Capital', 'Capital'),
(14, 13, 1, 'Capital', 'Capital'),
(15, 11, 1, 'La Capital', 'La Capital'),
(16, 20, 1, 'Capital', 'Capital'),
(17, 15, 1, 'Confluencia', 'Confluencia'),
(18, 20, 1, 'La Banda', 'La Banda'),
(19, 11, 1, 'Capital', 'Capital'),
(20, 16, 1, 'Adolfo Alsina', 'Adolfo Alsina'),
(21, 7, 1, 'Rawson', 'Rawson'),
(22, 20, 1, 'Güer Aike', 'Güer Aike'),
(23, 23, 1, 'Ushuaia', 'Ushuaia'),
(24, 6, 1, 'San Fernando', 'San Fernando'),
(25, 19, 1, 'Comuna 4', 'Comuna 4'),
(26, 1, 1, 'Comuna 7', 'Comuna 7'),
(27, 243, 5, 'Adams County', 'Adams County');

-- --------------------------------------------------------

--
-- Table structure for table `core_relation_group_profile`
--

CREATE TABLE IF NOT EXISTS `core_relation_group_profile` (
  `relation_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=195 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `core_relation_group_profile`
--

INSERT INTO `core_relation_group_profile` (`relation_id`, `group_id`, `profile_id`) VALUES
(150, 12, 365),
(149, 11, 365),
(27, 10, 355),
(148, 7, 365),
(192, 18, 360),
(129, 5, 364),
(119, 6, 364),
(131, 7, 364),
(181, 17, 362),
(180, 17, 361),
(191, 17, 360),
(190, 15, 360),
(177, 15, 362),
(178, 17, 359),
(147, 6, 365),
(183, 18, 362),
(194, 13, 360);

-- --------------------------------------------------------

--
-- Table structure for table `core_relation_menu_group`
--

CREATE TABLE IF NOT EXISTS `core_relation_menu_group` (
  `relation_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=242 DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `core_relation_menu_group`
--

INSERT INTO `core_relation_menu_group` (`relation_id`, `menu_id`, `group_id`) VALUES
(216, 13, 5),
(87, 7, 10),
(208, 7, 12),
(207, 29, 11),
(206, 17, 11),
(205, 10, 11),
(204, 9, 11),
(203, 8, 11),
(199, 7, 11),
(213, 30, 5),
(198, 13, 9),
(132, 13, 8),
(238, 88, 15),
(237, 79, 15),
(162, 79, 14),
(163, 88, 14),
(164, 91, 8),
(165, 92, 8),
(166, 97, 8),
(192, 30, 6),
(191, 13, 6);

-- --------------------------------------------------------

--
-- Table structure for table `core_relation_menu_profile`
--

CREATE TABLE IF NOT EXISTS `core_relation_menu_profile` (
  `relation_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=574 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `core_relation_menu_profile`
--

INSERT INTO `core_relation_menu_profile` (`relation_id`, `menu_id`, `profile_id`) VALUES
(9, 4, 351),
(10, 21, 351),
(16, 5, 352),
(17, 11, 352),
(18, 12, 352),
(19, 16, 352),
(20, 20, 352),
(561, 20, 360),
(107, 7, 357),
(560, 16, 360),
(114, 5, 353),
(115, 11, 353),
(116, 12, 353),
(117, 16, 353),
(118, 20, 353),
(120, 4, 353),
(121, 21, 353),
(122, 31, 353),
(124, 7, 353),
(559, 12, 360),
(558, 11, 360),
(572, 33, 360),
(557, 5, 360),
(129, 8, 353),
(130, 9, 353),
(131, 10, 353),
(132, 17, 353),
(133, 32, 353),
(134, 29, 353),
(556, 1, 360),
(148, 6, 353),
(149, 13, 353),
(571, 28, 360),
(570, 27, 360),
(569, 26, 360),
(547, 110, 360),
(546, 114, 360),
(545, 103, 360),
(544, 102, 360),
(543, 140, 360),
(542, 139, 360),
(541, 138, 360),
(573, 137, 360),
(539, 105, 360),
(538, 101, 360),
(537, 100, 360),
(551, 115, 360),
(555, 75, 360),
(536, 109, 360),
(550, 104, 360),
(554, 116, 360),
(535, 99, 360),
(534, 98, 360),
(533, 25, 360),
(532, 57, 360),
(553, 113, 360),
(531, 18, 360),
(530, 19, 360),
(529, 2, 360),
(528, 51, 360),
(549, 117, 360),
(192, 72, 364),
(193, 79, 364),
(568, 7, 360),
(567, 35, 360),
(566, 31, 360),
(565, 21, 360),
(564, 4, 360),
(563, 6, 360),
(552, 112, 360),
(527, 52, 360),
(281, 97, 361),
(562, 34, 360),
(205, 91, 364),
(526, 50, 360),
(525, 24, 360),
(280, 92, 361),
(524, 22, 360),
(210, 92, 364),
(490, 13, 359),
(523, 23, 360),
(279, 91, 361),
(489, 13, 362),
(215, 97, 364),
(315, 63, 365),
(548, 111, 360),
(316, 69, 365),
(522, 3, 360),
(274, 13, 365),
(521, 53, 360),
(520, 13, 360);

-- --------------------------------------------------------

--
-- Table structure for table `core_relation_user_group`
--

CREATE TABLE IF NOT EXISTS `core_relation_user_group` (
  `relation_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=183 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `core_relation_user_group`
--

INSERT INTO `core_relation_user_group` (`relation_id`, `user_id`, `group_id`) VALUES
(5, 39, 4),
(13, 43, 4),
(21, 48, 4),
(27, 55, 4),
(175, 97, 17),
(171, 96, 18),
(35, 64, 4),
(167, 95, 15),
(160, 91, 6),
(159, 80, 11),
(161, 91, 11),
(170, 96, 15),
(182, 97, 13),
(168, 95, 17),
(153, 88, 7),
(152, 87, 5),
(144, 88, 6),
(149, 8, 11),
(181, 95, 13),
(180, 94, 13);

-- --------------------------------------------------------

--
-- Table structure for table `core_relation_user_menu`
--

CREATE TABLE IF NOT EXISTS `core_relation_user_menu` (
  `relation_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=588 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `core_relation_user_menu`
--

INSERT INTO `core_relation_user_menu` (`relation_id`, `menu_id`, `user_id`) VALUES
(399, 19, 66),
(400, 18, 66),
(401, 25, 66),
(408, 1, 81),
(409, 5, 81),
(410, 11, 81),
(411, 12, 81),
(412, 16, 81),
(413, 20, 81),
(556, 53, 8),
(555, 2, 8),
(554, 19, 8),
(553, 18, 8),
(552, 54, 8),
(551, 55, 8),
(550, 58, 8),
(549, 60, 8),
(548, 59, 8),
(423, 13, 86),
(424, 83, 86),
(425, 84, 86),
(426, 85, 86),
(427, 86, 86),
(428, 87, 86),
(429, 69, 86),
(450, 13, 44),
(451, 69, 44),
(560, 13, 91),
(538, 53, 87),
(537, 71, 87),
(536, 72, 87),
(535, 79, 87),
(534, 88, 87),
(559, 30, 83),
(558, 13, 83),
(533, 47, 89),
(532, 48, 89),
(509, 62, 88),
(508, 61, 88),
(561, 1, 91),
(562, 5, 91),
(563, 11, 91),
(564, 12, 91),
(565, 16, 91),
(566, 20, 91),
(567, 34, 91),
(568, 70, 92),
(569, 106, 92),
(570, 30, 92),
(580, 124, 93),
(579, 122, 93),
(578, 123, 93),
(577, 121, 93),
(576, 53, 93),
(581, 127, 93),
(582, 102, 93),
(583, 104, 93),
(584, 115, 93),
(585, 112, 93),
(586, 116, 93),
(587, 75, 93);

-- --------------------------------------------------------

--
-- Table structure for table `core_user`
--

CREATE TABLE IF NOT EXISTS `core_user` (
  `user_id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `user` varchar(255) CHARACTER SET latin1 NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 NOT NULL,
  `first_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `last_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `email` varchar(255) CHARACTER SET latin1 NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `profile_id` int(11) NOT NULL,
  `img` varchar(255) CHARACTER SET latin1 NOT NULL,
  `status` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'A',
  `tries` int(11) NOT NULL,
  `last_access` datetime NOT NULL,
  `creation_date` datetime NOT NULL,
  `creator_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=98 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `core_user`
--

INSERT INTO `core_user` (`user_id`, `organization_id`, `user`, `password`, `first_name`, `last_name`, `email`, `phone`, `profile_id`, `img`, `status`, `tries`, `last_access`, `creation_date`, `creator_id`) VALUES
(1, 1, 'mmattolini', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Miguel A.', 'Mattolini', '', '061-978058/066636', 361, '', 'I', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(2, 1, 'jlborgonovo', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'José Luis', 'Borgonovo', '', '4557-2764', 361, '', 'I', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(8, 1, 'cheketo', '49e09dc76bf5ba6fdcbfb710a7d8842d867bad54', 'Alejandro', 'Romero', 'romero.m.alejandro@gmail.com', '', 333, '../../../../skin/images/users/default/default21.png', 'A', 0, '2018-09-25 17:20:35', '0000-00-00 00:00:00', 0),
(80, 1, 'hernan', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Hernan', 'Balboa', 'hernanbalboa@gmail.com', '', 333, '../../../../skin/images/users/80/img251180822__8.png', 'I', 0, '2018-03-22 10:54:34', '2016-11-17 20:52:43', 8),
(81, 1, 'pablo', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Pablo', 'Balboa', 'pablo.balboa@rollerservice.com.ar', '', 360, '../../../skin/images/users/default/default11.png', 'I', 0, '2016-12-02 14:19:22', '2016-11-24 14:43:55', 8),
(82, 1, 'gonza', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Gonzalo', 'Balboa', 'gonzalobalboa@gmail.com', '', 360, '../../../skin/images/users/default/default13.png', 'I', 0, '2016-11-30 01:11:49', '2016-11-24 14:50:14', 8),
(90, 2, 'cheketo', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Alejandro', 'Romero', 'romero.m.alejandro@gmail.com', '', 333, '', 'A', 0, '2018-09-25 17:20:35', '2017-07-14 11:29:34', 0),
(93, 1, 'pbalboa', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Pedro', 'Balboa', 'pedro.balboa@rollerservice.com.ar', '', 360, '../../../../skin/images/users/93/img251180822__8.png', 'I', 0, '2018-01-06 20:45:03', '2017-10-31 20:39:57', 8),
(3, 1, 'ldominguez', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Lidia', 'Dominguez', '', '4492-5541', 361, '', 'I', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(13, 0, 'jazzato', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Jorge', 'Azzato', '', '4585-2350', 361, '', 'A', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(94, 1, 'ana', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Ana', 'Rodriguez', 'cobranzas@rolpel.com.ar', '', 360, '../../../../skin/images/users/default/default06.png', 'A', 0, '2018-06-22 09:20:18', '2018-04-27 14:18:36', 8),
(95, 1, 'sergio', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Sergio', 'Rodriguez', 'carlos@rolpel.com.ar', '', 360, '../../../../skin/images/users/default/default11.png', 'A', 0, '2018-07-18 19:39:01', '2018-06-18 01:22:39', 8),
(96, 1, 'rgutierrez', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Rodolfo', 'Gutierrez', 'rodo@mail.com', '', 362, '../../../../skin/images/users/default/default12.png', 'A', 0, '0000-00-00 00:00:00', '2018-06-18 02:53:03', 8),
(97, 1, 'smartinez', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Sergio', 'Martinez', 'sac@rolpel.com.ar', '', 360, '../../../../skin/images/users/default/default22.png', 'A', 0, '0000-00-00 00:00:00', '2018-06-25 17:09:54', 95);

-- --------------------------------------------------------

--
-- Stand-in structure for view `core_view_group_list`
--
CREATE TABLE IF NOT EXISTS `core_view_group_list` (
`group_id` int(11)
,`title` varchar(255)
,`organization_id` int(11)
,`image` varchar(255)
,`status` char(1)
,`created_by` int(11)
,`creation_date` datetime
,`profile_id` int(11)
,`profile` varchar(255)
,`last_modification` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `core_view_menu_list`
--
CREATE TABLE IF NOT EXISTS `core_view_menu_list` (
`menu_id` int(11)
,`parent_id` int(11)
,`icon` varchar(255)
,`title` varchar(255)
,`link` varchar(255)
,`link_text` varchar(246)
,`position` int(11)
,`public` char(1)
,`public_text` varchar(7)
,`view_status` char(1)
,`view_status_text` varchar(7)
,`status` char(1)
,`organization_id` int(11)
,`profile` varchar(255)
,`group_title` varchar(255)
,`profile_id` int(11)
,`group_id` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `core_view_profile_list`
--
CREATE TABLE IF NOT EXISTS `core_view_profile_list` (
`profile_id` int(11)
,`organization_id` int(11)
,`title` varchar(255)
,`status` char(1)
,`image` varchar(255)
,`creation_date` datetime
,`created_by` int(11)
,`last_modification` timestamp
,`group_id` int(11)
,`group_title` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `core_view_user_list`
--
CREATE TABLE IF NOT EXISTS `core_view_user_list` (
`user_id` int(11)
,`organization_id` int(11)
,`user` varchar(255)
,`password` varchar(255)
,`first_name` varchar(255)
,`last_name` varchar(255)
,`full_name` varchar(511)
,`full_user_name` text
,`email` varchar(255)
,`profile_id` int(11)
,`img` varchar(255)
,`status` char(1)
,`tries` int(11)
,`last_access` datetime
,`creation_date` datetime
,`creator_id` int(11)
,`profile` varchar(255)
,`group_title` varchar(255)
,`group_id` bigint(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `core_zone`
--

CREATE TABLE IF NOT EXISTS `core_zone` (
  `zone_id` int(11) NOT NULL,
  `region_id` int(11) NOT NULL,
  `province_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `short_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `core_zone`
--

INSERT INTO `core_zone` (`zone_id`, `region_id`, `province_id`, `country_id`, `name`, `short_name`) VALUES
(1, 1, 1, 1, 'Parque Patricios', 'Parque Patricios'),
(2, 2, 2, 1, 'Quilmes', 'Quilmes'),
(3, 3, 7, 1, 'Rosario', 'Rosario'),
(4, 4, 4, 1, 'La Falda', 'La Falda'),
(5, 5, 6, 1, 'Federación', 'Federación'),
(6, 6, 5, 1, 'Corrientes', 'Corrientes'),
(7, 7, 13, 1, 'Posadas', 'Posadas'),
(8, 8, 6, 1, 'San Miguel de Tucumán', 'San Miguel de Tucumán'),
(9, 9, 15, 1, 'San Salvador de Jujuy', 'San Salvador de Jujuy'),
(10, 10, 15, 1, 'Salta', 'Salta'),
(11, 11, 9, 1, 'Formosa', 'Formosa'),
(12, 12, 3, 1, 'San Fernando del Valle de Catamarca', 'San Fernando del Valle de Catamarca'),
(13, 13, 12, 1, 'La Rioja', 'La Rioja'),
(14, 15, 11, 1, 'San Luis', 'San Luis'),
(15, 16, 20, 1, 'San Juan', 'San Juan'),
(16, 17, 15, 1, 'Neuquén', 'Neuquén'),
(17, 18, 20, 1, 'Santiago del Estero', 'Santiago del Estero'),
(18, 19, 11, 1, 'Santa Rosa', 'Santa Rosa'),
(19, 20, 16, 1, 'Viedma', 'Viedma'),
(20, 21, 7, 1, 'Rawson', 'Rawson'),
(21, 22, 20, 1, 'Río Gallegos', 'Río Gallegos'),
(22, 23, 23, 1, 'Ushuaia', 'Ushuaia'),
(23, 24, 6, 1, 'Resistencia', 'Resistencia'),
(24, 25, 19, 1, 'Parque Patricios', 'Parque Patricios'),
(25, 0, 241, 2, 'Los Cactus', 'Los Cactus'),
(26, 0, 0, 3, 'Singapore', 'Singapore'),
(27, 0, 242, 4, 'Fukuroi-shi', 'Fukuroi-shi'),
(28, 26, 1, 1, 'Flores', 'Flores'),
(29, 27, 243, 5, 'Thornton', 'Thornton'),
(30, 0, 244, 6, 'Queenstown', 'Queenstown'),
(31, 1, 1, 1, 'Barracas', 'Barracas');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int(11) NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `width` decimal(6,2) NOT NULL,
  `height` decimal(6,2) NOT NULL,
  `depth` decimal(6,2) NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A',
  `modification_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creation_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=50494 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `code`, `price`, `organization_id`, `category_id`, `brand_id`, `title`, `width`, `height`, `depth`, `description`, `status`, `modification_date`, `creation_date`, `created_by`, `updated_by`) VALUES
(50489, '', 1.23, 1, 164, 1000, 'Caja2', 20.00, 10.00, 0.00, 'Caja de cartón cuadrada o rectangular', 'A', '2018-06-22 02:14:48', '2018-06-21 23:14:48', 8, 95),
(50490, '', 0.00, 1, 164, 1000, 'Rollo', 0.00, 0.00, 0.00, '', 'A', '2018-06-22 05:45:01', '2018-06-22 02:45:01', 95, 0),
(50491, '', 0.00, 1, 165, 1000, 'Rollo2', 0.00, 0.00, 0.00, '', 'A', '2018-06-25 20:18:03', '2018-06-25 17:18:03', 95, 0),
(50492, '', 0.00, 1, 165, 1000, 'Pruebón', 0.00, 0.00, 0.00, '', 'A', '2018-08-27 05:20:32', '2018-08-27 02:20:32', 8, 0),
(50493, '', 12.45, 1, 166, 1000, 'Pruebín', 1.50, 0.00, 1.50, '', 'A', '2018-08-27 05:22:07', '2018-08-27 02:22:07', 8, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_abstract`
--

CREATE TABLE IF NOT EXISTS `product_abstract` (
  `abstract_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order_number` int(11) NOT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A' COMMENT 'A=ACTIVO / I=INACTIVO',
  `relation_status` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A' COMMENT 'A=En Proceso, F=Todas las relaciones establecidas',
  `creation_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modification_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=12188 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_brand`
--

CREATE TABLE IF NOT EXISTS `product_brand` (
  `brand_id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_short` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `country_id` int(11) NOT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A',
  `creation_date` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_brand`
--

INSERT INTO `product_brand` (`brand_id`, `organization_id`, `name`, `name_short`, `country_id`, `status`, `creation_date`) VALUES
(1000, 1, 'RolPel', '', 0, 'A', '2018-06-21 21:54:14');

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE IF NOT EXISTS `product_category` (
  `category_id` int(5) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `parent_id` int(5) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `short_title` varchar(25) CHARACTER SET latin1 NOT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A',
  `creation_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `last_modification` datetime NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=167 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`category_id`, `organization_id`, `parent_id`, `title`, `short_title`, `status`, `creation_date`, `created_by`, `last_modification`, `updated_by`) VALUES
(164, 1, 0, 'Cartones', 'Cartones', 'A', '2018-06-21 21:53:06', 8, '0000-00-00 00:00:00', 0),
(165, 1, 0, 'Estandar', 'Estandar', 'A', '2018-06-25 17:16:59', 95, '0000-00-00 00:00:00', 0),
(166, 1, 0, 'No estandar', 'No estandar', 'A', '2018-06-25 17:17:15', 95, '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_comparation`
--

CREATE TABLE IF NOT EXISTS `product_comparation` (
  `comparation_id` int(11) NOT NULL,
  `stock_min` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A',
  `creation_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contiene las comparaciones de listados de precios de los proveedores.';

-- --------------------------------------------------------

--
-- Table structure for table `product_comparation_item`
--

CREATE TABLE IF NOT EXISTS `product_comparation_item` (
  `item_id` int(11) NOT NULL,
  `comparation_id` int(11) NOT NULL,
  `relation_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `abstract_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `position` int(5) NOT NULL COMMENT 'Posicion dentro de la ponderacion de opciones para un articulo',
  `order_quantity` int(11) NOT NULL COMMENT 'Cantidad de stock que se planea pedir de ese articulo a ese proveedor',
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A',
  `price` decimal(10,2) NOT NULL COMMENT 'Supuesto precio al que el proveedor vende ese articulo',
  `stock` int(11) NOT NULL COMMENT 'Supuesto stock disponible del proveedor',
  `currency_id` int(11) NOT NULL,
  `dollar_exchange_rate` decimal(10,2) NOT NULL COMMENT 'Tasa cambiaria que se aplico para obtener el precio de venta en dolares',
  `list_date` date NOT NULL COMMENT 'Fecha de la lista de precios del proveedor, de la cual se obtuvo el precio y el stock',
  `actual_stock` int(11) NOT NULL COMMENT 'Stock de roller para ese articulo',
  `abstract_stock` int(11) NOT NULL COMMENT 'Sumatoria del stock de roller para los articulos pertenecientes a las marcas seleccionadas',
  `actual_stock_diff` int(11) NOT NULL COMMENT 'Diferencia entre el stock del articulo y su stock minimo',
  `abstract_stock_diff` int(11) NOT NULL COMMENT 'Diferencia entre la sumatoria de stocks de los articulos para las marcas seleccionadas  y la sumatoria de stock minimos de los mismos articulos',
  `single_comparation` tinyint(1) NOT NULL COMMENT 'Este campo indica si es el único artículo en comparación de un abstract_id',
  `creation_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=580 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_image`
--

CREATE TABLE IF NOT EXISTS `product_image` (
  `image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `src` varchar(255) CHARACTER SET latin1 NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_relation`
--

CREATE TABLE IF NOT EXISTS `product_relation` (
  `relation_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `abstract_id` int(11) NOT NULL,
  `import_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `provider_brand_id` int(11) NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(20,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A',
  `list_date` date NOT NULL,
  `creation_date` datetime NOT NULL,
  `modification_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=5055 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_relation_brand`
--

CREATE TABLE IF NOT EXISTS `product_relation_brand` (
  `brand_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `product_brand_id` int(11) NOT NULL,
  `import_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A',
  `creation_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modification_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=6226 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_relation_import`
--

CREATE TABLE IF NOT EXISTS `product_relation_import` (
  `import_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `list_date` date NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A',
  `creation_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_relation_import_item`
--

CREATE TABLE IF NOT EXISTS `product_relation_import_item` (
  `item_id` int(11) NOT NULL,
  `import_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `abstract_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `provider_brand_id` int(11) NOT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A',
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `brand` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `original_brand_id` int(11) NOT NULL,
  `original_abstract_id` int(11) NOT NULL,
  `original_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `original_price` decimal(10,2) NOT NULL,
  `original_stock` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=78429 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE IF NOT EXISTS `purchase` (
  `purchase_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `agent_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `total` decimal(20,2) NOT NULL,
  `quotation_id` int(11) NOT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'P',
  `quotation_date` date NOT NULL,
  `delivery_date` datetime NOT NULL,
  `expire_date` datetime NOT NULL,
  `expire_days` int(11) NOT NULL,
  `extra` text COLLATE utf8_unicode_ci NOT NULL,
  `additional_information` text COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modification_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_email`
--

CREATE TABLE IF NOT EXISTS `purchase_email` (
  `email_id` int(11) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `email_from` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_to` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bcc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'P',
  `creation_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_file`
--

CREATE TABLE IF NOT EXISTS `purchase_file` (
  `file_id` int(11) NOT NULL,
  `new_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  `modification_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `organization_id` int(11) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_file_new`
--

CREATE TABLE IF NOT EXISTS `purchase_file_new` (
  `file_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  `modification_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `organization_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `purchase_file_new`
--

INSERT INTO `purchase_file_new` (`file_id`, `product_id`, `name`, `url`, `status`, `created_by`, `updated_by`, `creation_date`, `modification_date`, `organization_id`) VALUES
(1, 0, 'roadtrip', '../../../../skin/files/purchase/new/roadtrip.jpg', 'I', 8, 8, '2018-08-12 01:08:57', '2018-08-12 04:09:50', 1),
(2, 0, 'roadtrip', '../../../../skin/files/purchase/new/roadtrip.jpg', 'I', 8, 8, '2018-08-12 01:09:30', '2018-08-12 04:09:56', 1),
(3, 0, 'johnparrisrobertson', '../../../../skin/files/purchase/new/johnparrisrobertson.jpg', 'A', 8, 0, '2018-09-25 17:20:54', '2018-09-25 20:20:54', 1);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_item`
--

CREATE TABLE IF NOT EXISTS `purchase_item` (
  `item_id` int(11) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `width` decimal(6,2) NOT NULL,
  `height` decimal(6,2) NOT NULL,
  `depth` decimal(6,2) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total` decimal(12,2) NOT NULL,
  `delivery_date` datetime NOT NULL,
  `days` int(7) NOT NULL,
  `created_by` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  `modification_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `purchase_item`
--

INSERT INTO `purchase_item` (`item_id`, `purchase_id`, `company_id`, `branch_id`, `product_id`, `currency_id`, `width`, `height`, `depth`, `price`, `quantity`, `total`, `delivery_date`, `days`, `created_by`, `creation_date`, `modification_date`, `updated_by`, `organization_id`) VALUES
(1, 157705, 11694, 5082, 50491, 0, 1.00, 5.00, 1.00, 1200.00, 5, 6000.00, '2018-09-30 00:00:00', 5, 8, '2018-09-25 17:40:49', '2018-09-25 20:40:49', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `quotation`
--

CREATE TABLE IF NOT EXISTS `quotation` (
  `quotation_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `agent_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `total` decimal(20,2) NOT NULL,
  `type_id` int(11) NOT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'P',
  `quotation_date` date NOT NULL,
  `delivery_date` datetime NOT NULL,
  `expire_date` datetime NOT NULL,
  `expire_days` int(11) NOT NULL,
  `extra` text COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modification_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `quotation`
--

INSERT INTO `quotation` (`quotation_id`, `company_id`, `branch_id`, `sender_id`, `receiver_id`, `agent_id`, `currency_id`, `total`, `type_id`, `status`, `quotation_date`, `delivery_date`, `expire_date`, `expire_days`, `extra`, `creation_date`, `created_by`, `modification_date`, `updated_by`, `organization_id`) VALUES
(69, 11694, 5075, 0, 11694, 1323, 0, 1550.00, 0, 'A', '0000-00-00', '2018-07-02 00:00:00', '0000-00-00 00:00:00', 0, 'Cotización de Prueba', '2018-06-22 03:11:28', 95, '2018-06-22 06:11:28', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `quotation_email`
--

CREATE TABLE IF NOT EXISTS `quotation_email` (
  `email_id` int(11) NOT NULL,
  `quotation_id` int(11) NOT NULL,
  `email_from` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_to` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bcc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'P',
  `creation_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotation_file`
--

CREATE TABLE IF NOT EXISTS `quotation_file` (
  `file_id` int(11) NOT NULL,
  `new_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  `modification_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `organization_id` int(11) NOT NULL,
  `quotation_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotation_file_new`
--

CREATE TABLE IF NOT EXISTS `quotation_file_new` (
  `file_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  `modification_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `organization_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=154 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `quotation_file_new`
--

INSERT INTO `quotation_file_new` (`file_id`, `product_id`, `name`, `url`, `status`, `created_by`, `updated_by`, `creation_date`, `modification_date`, `organization_id`) VALUES
(151, 0, 'roadtrip', '../../../../skin/files/quotation/new/roadtrip.jpg', 'I', 8, 8, '2018-08-12 01:07:07', '2018-08-12 04:07:20', 1),
(152, 0, 'roadtrip', '../../../../skin/files/quotation/new/roadtrip.jpg', 'I', 8, 8, '2018-08-12 01:07:25', '2018-08-12 04:07:36', 1),
(153, 0, 'roadtrip', '../../../../skin/files/quotation/new/roadtrip.jpg', 'I', 8, 8, '2018-08-12 01:07:30', '2018-08-12 04:07:39', 1);

-- --------------------------------------------------------

--
-- Table structure for table `quotation_item`
--

CREATE TABLE IF NOT EXISTS `quotation_item` (
  `item_id` int(11) NOT NULL,
  `quotation_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total` decimal(12,2) NOT NULL,
  `delivery_date` datetime NOT NULL,
  `days` int(7) NOT NULL,
  `created_by` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  `modification_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=1183 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `quotation_item`
--

INSERT INTO `quotation_item` (`item_id`, `quotation_id`, `company_id`, `branch_id`, `product_id`, `currency_id`, `price`, `quantity`, `total`, `delivery_date`, `days`, `created_by`, `creation_date`, `modification_date`, `updated_by`, `organization_id`) VALUES
(1181, 69, 11694, 5075, 50489, 0, 5.00, 70, 350.00, '2018-07-02 00:00:00', 10, 95, '2018-06-22 03:11:28', '2018-06-22 06:11:28', 0, 1),
(1182, 69, 11694, 5075, 50490, 0, 20.00, 60, 1200.00, '2018-07-02 00:00:00', 10, 95, '2018-06-22 03:11:28', '2018-06-22 06:11:28', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `relation_company_broker`
--

CREATE TABLE IF NOT EXISTS `relation_company_broker` (
  `relation_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `broker_id` int(11) NOT NULL,
  `percentage_commission` decimal(4,2) NOT NULL,
  `organization_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=415 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tax_iva_type`
--

CREATE TABLE IF NOT EXISTS `tax_iva_type` (
  `type_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A',
  `percentage` decimal(5,3) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=141 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tax_iva_type`
--

INSERT INTO `tax_iva_type` (`type_id`, `name`, `status`, `percentage`) VALUES
(1, 'IVA Responsable Inscripto', 'A', 21.000),
(2, 'IVA Responsable No Inscripto', 'A', 21.000),
(4, 'IVA Sujeto Excento', 'A', 0.000),
(5, 'Consumidor Final', 'A', 21.000),
(6, 'Sujeto No Categorizado', 'A', 21.000),
(7, 'Proveedor de Exterior', 'A', 0.000),
(8, 'Cliente del Exterior', 'A', 21.000),
(9, 'IVA Liberado – Ley Nº 19.640', 'A', 0.000),
(10, 'IVA Responsable Inscripto – Agente de Percepción', 'A', 21.000),
(11, 'Pequeño Contribuyente Eventual', 'A', 10.500),
(12, 'Responsable Monotributo', 'A', 0.000),
(13, 'Monotributista Social', 'A', 0.000),
(14, 'Pequeño Contribuyente Eventual Social', 'A', 0.000),
(3, 'IVA No Responsable', 'A', 0.000);

-- --------------------------------------------------------

--
-- Table structure for table `truck`
--

CREATE TABLE IF NOT EXISTS `truck` (
  `truck_id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `plate` varchar(10) NOT NULL,
  `code` varchar(50) NOT NULL,
  `capacity` int(6) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'A',
  `creation_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `last_update` timestamp NOT NULL,
  `updated_by` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `truck`
--

INSERT INTO `truck` (`truck_id`, `driver_id`, `brand`, `model`, `year`, `plate`, `code`, `capacity`, `status`, `creation_date`, `created_by`, `last_update`, `updated_by`, `organization_id`) VALUES
(1, 96, 'Mercedes-Benz', 'Axor 1933 LS/36', 2017, 'AB-123-CD', 'Camión Rojo', 12009, 'A', '2018-06-18 03:10:10', 8, '0000-00-00 00:00:00', 8, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_brand_list`
--
CREATE TABLE IF NOT EXISTS `view_brand_list` (
`brand_id` int(11)
,`product_id` int(11)
,`category_id` int(5)
,`organization_id` int(11)
,`name` varchar(255)
,`code` varchar(255)
,`status` char(1)
,`creation_date` datetime
,`category` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_category_list`
--
CREATE TABLE IF NOT EXISTS `view_category_list` (
`category_id` int(5)
,`organization_id` int(11)
,`parent_id` int(5)
,`title` varchar(255)
,`short_title` varchar(25)
,`status` char(1)
,`creation_date` datetime
,`created_by` int(11)
,`updated_by` int(11)
,`last_modification` datetime
,`parent` varchar(255)
,`parent_short` varchar(25)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_company_list`
--
CREATE TABLE IF NOT EXISTS `view_company_list` (
`company_id` int(11)
,`old_id` int(11)
,`branch_id` int(11)
,`broker_id` int(11)
,`type_id` int(11)
,`organization_id` int(11)
,`name` varchar(255)
,`type` varchar(255)
,`cuit` bigint(15)
,`iva_id` int(5)
,`iva` varchar(255)
,`iibb` varchar(255)
,`international` char(1)
,`international_text` varchar(10)
,`vat` varchar(255)
,`customer` char(1)
,`provider` char(1)
,`relation_text` varchar(19)
,`logo` varchar(255)
,`status` char(1)
,`balance` decimal(30,2)
,`branch` varchar(150)
,`address` varchar(255)
,`postal_code` varchar(150)
,`phone` varchar(150)
,`email` varchar(255)
,`website` varchar(255)
,`fax` varchar(150)
,`main_branch` char(1)
,`country_id` int(11)
,`country` varchar(255)
,`country_short` varchar(50)
,`province_id` int(11)
,`province` varchar(255)
,`province_short` varchar(50)
,`region_id` int(11)
,`region` varchar(255)
,`region_short` varchar(50)
,`zone_id` int(11)
,`zone` varchar(255)
,`zone_short` varchar(50)
,`lat` decimal(18,16)
,`lng` decimal(18,16)
,`broker` varchar(511)
,`broker_email` varchar(255)
,`broker_img` varchar(255)
,`creation_date` datetime
,`last_update` timestamp
,`created_by` int(11)
,`updated_by` int(11)
,`monday_from` char(5)
,`monday_to` char(5)
,`tuesday_from` char(5)
,`tuesday_to` char(5)
,`wensday_from` char(5)
,`wensday_to` char(5)
,`thursday_from` char(5)
,`thursday_to` char(5)
,`friday_from` char(5)
,`friday_to` char(5)
,`saturday_from` char(5)
,`saturday_to` char(5)
,`sunday_from` char(5)
,`sunday_to` char(5)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_product_list`
--
CREATE TABLE IF NOT EXISTS `view_product_list` (
`product_id` int(11)
,`title` varchar(255)
,`organization_id` int(11)
,`category_id` int(11)
,`brand_id` int(11)
,`price` decimal(10,2)
,`width` decimal(6,2)
,`height` decimal(6,2)
,`depth` decimal(6,2)
,`description` text
,`status` char(1)
,`creation_date` datetime
,`modification_date` timestamp
,`created_by` int(11)
,`updated_by` int(11)
,`category` varchar(255)
,`brand` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_purchase_list`
--
CREATE TABLE IF NOT EXISTS `view_purchase_list` (
`purchase_id` int(11)
,`quotation_id` int(11)
,`company_id` int(11)
,`sender_id` int(11)
,`receiver_id` int(11)
,`agent_id` int(11)
,`status` char(1)
,`extra` text
,`creation_date` datetime
,`expire_days` int(11)
,`expire_date` datetime
,`quotation_date` datetime
,`creation_date_item` datetime
,`days` int(7)
,`organization_id` int(11)
,`item_id` int(11)
,`product_id` int(11)
,`price` decimal(10,2)
,`quantity` int(11)
,`delivery_date` datetime
,`title` varchar(255)
,`brand_id` int(11)
,`category_id` int(11)
,`company` varchar(255)
,`cuit` bigint(15)
,`iva_id` int(5)
,`agent` varchar(150)
,`email` varchar(150)
,`category` varchar(255)
,`brand` varchar(255)
,`total_quantity` decimal(32,0)
,`total_item` decimal(12,2)
,`total_quotation` decimal(20,2)
,`role` varchar(9)
,`provider` varchar(1)
,`customer` varchar(1)
,`international` char(1)
,`additional_information` text
,`width` decimal(6,2)
,`height` decimal(6,2)
,`depth` decimal(6,2)
,`product_width` decimal(6,2)
,`product_height` decimal(6,2)
,`product_depth` decimal(6,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_quotation_list`
--
CREATE TABLE IF NOT EXISTS `view_quotation_list` (
`quotation_id` int(11)
,`company_id` int(11)
,`branch_id` int(11)
,`sender_id` int(11)
,`receiver_id` int(11)
,`agent_id` int(11)
,`status` char(1)
,`extra` text
,`creation_date` datetime
,`expire_days` int(11)
,`expire_date` datetime
,`quotation_date` datetime
,`creation_date_item` datetime
,`days` int(7)
,`organization_id` int(11)
,`item_id` int(11)
,`product_id` int(11)
,`price` decimal(10,2)
,`quantity` int(11)
,`delivery_date` datetime
,`title` varchar(255)
,`brand_id` int(11)
,`category_id` int(11)
,`company` varchar(255)
,`cuit` bigint(15)
,`iva_id` int(5)
,`agent` varchar(150)
,`email` varchar(150)
,`category` varchar(255)
,`brand` varchar(255)
,`total_quantity` decimal(32,0)
,`total_item` decimal(12,2)
,`total_quotation` decimal(20,2)
,`role` varchar(9)
,`provider` varchar(1)
,`customer` varchar(1)
,`international` char(1)
,`purchase_id` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_truck_list`
--
CREATE TABLE IF NOT EXISTS `view_truck_list` (
`truck_id` int(11)
,`driver_id` int(11)
,`brand` varchar(50)
,`model` varchar(50)
,`year` int(11)
,`plate` varchar(10)
,`code` varchar(50)
,`capacity` int(6)
,`status` char(1)
,`creation_date` datetime
,`created_by` int(11)
,`last_update` timestamp
,`updated_by` int(11)
,`organization_id` int(11)
,`driver` varchar(511)
);

-- --------------------------------------------------------

--
-- Structure for view `core_view_group_list`
--
DROP TABLE IF EXISTS `core_view_group_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`roller`@`%` SQL SECURITY DEFINER VIEW `core_view_group_list` AS select `a`.`group_id` AS `group_id`,`a`.`title` AS `title`,`a`.`organization_id` AS `organization_id`,`a`.`image` AS `image`,`a`.`status` AS `status`,`a`.`created_by` AS `created_by`,`a`.`creation_date` AS `creation_date`,`b`.`profile_id` AS `profile_id`,`c`.`title` AS `profile`,`a`.`last_modification` AS `last_modification` from ((`core_group` `a` join `core_relation_group_profile` `b` on((`a`.`group_id` = `b`.`group_id`))) join `core_profile` `c` on((`b`.`profile_id` = `c`.`profile_id`))) group by `a`.`group_id` order by `a`.`title`;

-- --------------------------------------------------------

--
-- Structure for view `core_view_menu_list`
--
DROP TABLE IF EXISTS `core_view_menu_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`roller`@`%` SQL SECURITY DEFINER VIEW `core_view_menu_list` AS select `a`.`menu_id` AS `menu_id`,`a`.`parent_id` AS `parent_id`,`a`.`icon` AS `icon`,`a`.`title` AS `title`,`a`.`link` AS `link`,if((`a`.`link` = '#'),'Sin link',substr(`a`.`link`,10)) AS `link_text`,`a`.`position` AS `position`,`a`.`public` AS `public`,if((`a`.`public` = 'Y'),'Público','Privado') AS `public_text`,`a`.`view_status` AS `view_status`,if((`a`.`view_status` = 'O'),'Oculto','Visible') AS `view_status_text`,`a`.`status` AS `status`,`a`.`organization_id` AS `organization_id`,`d`.`title` AS `profile`,`e`.`title` AS `group_title`,`b`.`profile_id` AS `profile_id`,`c`.`group_id` AS `group_id` from ((((`core_menu` `a` left join `core_relation_menu_profile` `b` on((`a`.`menu_id` = `b`.`menu_id`))) left join `core_relation_menu_group` `c` on((`a`.`menu_id` = `c`.`menu_id`))) left join `core_profile` `d` on((`d`.`profile_id` = `b`.`profile_id`))) left join `core_group` `e` on((`e`.`group_id` = `c`.`group_id`))) where (1 = 1) group by `a`.`menu_id` order by `a`.`title`;

-- --------------------------------------------------------

--
-- Structure for view `core_view_profile_list`
--
DROP TABLE IF EXISTS `core_view_profile_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`roller`@`%` SQL SECURITY DEFINER VIEW `core_view_profile_list` AS select `a`.`profile_id` AS `profile_id`,`a`.`organization_id` AS `organization_id`,`a`.`title` AS `title`,`a`.`status` AS `status`,`a`.`image` AS `image`,`a`.`creation_date` AS `creation_date`,`a`.`created_by` AS `created_by`,`a`.`last_modification` AS `last_modification`,`b`.`group_id` AS `group_id`,`c`.`title` AS `group_title` from ((`core_profile` `a` join `core_relation_group_profile` `b` on((`a`.`profile_id` = `b`.`profile_id`))) join `core_group` `c` on((`b`.`group_id` = `c`.`group_id`))) group by `a`.`profile_id` order by `a`.`title`;

-- --------------------------------------------------------

--
-- Structure for view `core_view_user_list`
--
DROP TABLE IF EXISTS `core_view_user_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`roller`@`%` SQL SECURITY DEFINER VIEW `core_view_user_list` AS select `a`.`user_id` AS `user_id`,`a`.`organization_id` AS `organization_id`,`a`.`user` AS `user`,`a`.`password` AS `password`,`a`.`first_name` AS `first_name`,`a`.`last_name` AS `last_name`,concat(`a`.`first_name`,' ',`a`.`last_name`) AS `full_name`,concat(`a`.`first_name`,' ',`a`.`last_name`,' (',`a`.`user`,')') AS `full_user_name`,`a`.`email` AS `email`,`a`.`profile_id` AS `profile_id`,`a`.`img` AS `img`,`a`.`status` AS `status`,`a`.`tries` AS `tries`,`a`.`last_access` AS `last_access`,`a`.`creation_date` AS `creation_date`,`a`.`creator_id` AS `creator_id`,`p`.`title` AS `profile`,coalesce(`g`.`title`,'') AS `group_title`,coalesce(`g`.`group_id`,0) AS `group_id` from (((`core_user` `a` left join `core_relation_user_group` `r` on((`r`.`user_id` = `a`.`user_id`))) left join `core_group` `g` on((`r`.`group_id` = `g`.`group_id`))) left join `core_profile` `p` on((`p`.`profile_id` = `a`.`profile_id`))) where (1 = 1) group by `a`.`user_id` order by `a`.`first_name`;

-- --------------------------------------------------------

--
-- Structure for view `view_brand_list`
--
DROP TABLE IF EXISTS `view_brand_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_brand_list` AS select `a`.`brand_id` AS `brand_id`,`b`.`product_id` AS `product_id`,`c`.`category_id` AS `category_id`,`a`.`organization_id` AS `organization_id`,`a`.`name` AS `name`,`b`.`code` AS `code`,`a`.`status` AS `status`,`a`.`creation_date` AS `creation_date`,`c`.`title` AS `category` from ((`product_brand` `a` left join `product` `b` on((`b`.`brand_id` = `a`.`brand_id`))) left join `product_category` `c` on((`c`.`category_id` = `b`.`category_id`))) order by `a`.`name`;

-- --------------------------------------------------------

--
-- Structure for view `view_category_list`
--
DROP TABLE IF EXISTS `view_category_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_category_list` AS select `a`.`category_id` AS `category_id`,`a`.`organization_id` AS `organization_id`,`a`.`parent_id` AS `parent_id`,`a`.`title` AS `title`,`a`.`short_title` AS `short_title`,`a`.`status` AS `status`,`a`.`creation_date` AS `creation_date`,`a`.`created_by` AS `created_by`,`a`.`updated_by` AS `updated_by`,`a`.`last_modification` AS `last_modification`,coalesce(`b`.`title`,'Sin Padre') AS `parent`,coalesce(`b`.`short_title`,'Sin Padre') AS `parent_short` from (`product_category` `a` left join `product_category` `b` on((`a`.`parent_id` = `b`.`category_id`)));

-- --------------------------------------------------------

--
-- Structure for view `view_company_list`
--
DROP TABLE IF EXISTS `view_company_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_company_list` AS select `a`.`company_id` AS `company_id`,`a`.`old_id` AS `old_id`,`b`.`branch_id` AS `branch_id`,`e`.`broker_id` AS `broker_id`,`a`.`type_id` AS `type_id`,`a`.`organization_id` AS `organization_id`,`a`.`name` AS `name`,`d`.`name` AS `type`,`a`.`cuit` AS `cuit`,`a`.`iva_id` AS `iva_id`,`t`.`name` AS `iva`,`a`.`iibb` AS `iibb`,`a`.`international` AS `international`,if((`a`.`international` = 'N'),'Nacional','Extranjero') AS `international_text`,`a`.`vat` AS `vat`,`a`.`customer` AS `customer`,`a`.`provider` AS `provider`,if(((`a`.`customer` = 'Y') and (`a`.`provider` = 'Y')),'Cliente y Proveedor',if((`a`.`customer` = 'Y'),'Cliente','Proveedor')) AS `relation_text`,`a`.`logo` AS `logo`,`a`.`status` AS `status`,`a`.`balance` AS `balance`,`b`.`name` AS `branch`,`b`.`address` AS `address`,`b`.`postal_code` AS `postal_code`,`b`.`phone` AS `phone`,`b`.`email` AS `email`,`b`.`website` AS `website`,`b`.`fax` AS `fax`,`b`.`main_branch` AS `main_branch`,`b`.`country_id` AS `country_id`,`g`.`name` AS `country`,`g`.`short_name` AS `country_short`,`b`.`province_id` AS `province_id`,`h`.`name` AS `province`,`h`.`short_name` AS `province_short`,`b`.`region_id` AS `region_id`,`i`.`name` AS `region`,`i`.`short_name` AS `region_short`,`b`.`zone_id` AS `zone_id`,`j`.`name` AS `zone`,`j`.`short_name` AS `zone_short`,`b`.`lat` AS `lat`,`b`.`lng` AS `lng`,coalesce(`f`.`full_name`,'Sin Corredor') AS `broker`,coalesce(`f`.`email`,'') AS `broker_email`,coalesce(`f`.`img`,'') AS `broker_img`,`a`.`creation_date` AS `creation_date`,`a`.`last_update` AS `last_update`,`a`.`created_by` AS `created_by`,`a`.`updated_by` AS `updated_by`,`b`.`monday_from` AS `monday_from`,`b`.`monday_to` AS `monday_to`,`b`.`tuesday_from` AS `tuesday_from`,`b`.`tuesday_to` AS `tuesday_to`,`b`.`wensday_from` AS `wensday_from`,`b`.`wensday_to` AS `wensday_to`,`b`.`thursday_from` AS `thursday_from`,`b`.`thursday_to` AS `thursday_to`,`b`.`friday_from` AS `friday_from`,`b`.`friday_to` AS `friday_to`,`b`.`saturday_from` AS `saturday_from`,`b`.`saturday_to` AS `saturday_to`,`b`.`sunday_from` AS `sunday_from`,`b`.`sunday_to` AS `sunday_to` from (((((((((`company` `a` left join `tax_iva_type` `t` on((`t`.`type_id` = `a`.`iva_id`))) join `company_type` `d` on((`d`.`type_id` = `a`.`type_id`))) join `company_branch` `b` on((`a`.`company_id` = `b`.`company_id`))) left join `relation_company_broker` `e` on((`e`.`branch_id` = `b`.`branch_id`))) left join `core_view_user_list` `f` on((`f`.`user_id` = `e`.`broker_id`))) left join `core_country` `g` on((`g`.`country_id` = `b`.`country_id`))) left join `core_province` `h` on((`h`.`province_id` = `b`.`province_id`))) left join `core_region` `i` on((`i`.`region_id` = `b`.`region_id`))) left join `core_zone` `j` on((`j`.`zone_id` = `b`.`zone_id`)));

-- --------------------------------------------------------

--
-- Structure for view `view_product_list`
--
DROP TABLE IF EXISTS `view_product_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_product_list` AS select `a`.`product_id` AS `product_id`,`a`.`title` AS `title`,`a`.`organization_id` AS `organization_id`,`a`.`category_id` AS `category_id`,`a`.`brand_id` AS `brand_id`,`a`.`price` AS `price`,`a`.`width` AS `width`,`a`.`height` AS `height`,`a`.`depth` AS `depth`,`a`.`description` AS `description`,`a`.`status` AS `status`,`a`.`creation_date` AS `creation_date`,`a`.`modification_date` AS `modification_date`,`a`.`created_by` AS `created_by`,`a`.`updated_by` AS `updated_by`,`b`.`title` AS `category`,`c`.`name` AS `brand` from ((`product` `a` join `product_category` `b` on((`a`.`category_id` = `b`.`category_id`))) join `product_brand` `c` on((`a`.`brand_id` = `c`.`brand_id`))) order by `a`.`title`;

-- --------------------------------------------------------

--
-- Structure for view `view_purchase_list`
--
DROP TABLE IF EXISTS `view_purchase_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_purchase_list` AS select `a`.`purchase_id` AS `purchase_id`,`a`.`quotation_id` AS `quotation_id`,`a`.`company_id` AS `company_id`,`a`.`sender_id` AS `sender_id`,`a`.`receiver_id` AS `receiver_id`,`a`.`agent_id` AS `agent_id`,`a`.`status` AS `status`,`a`.`extra` AS `extra`,`a`.`creation_date` AS `creation_date`,`a`.`expire_days` AS `expire_days`,`a`.`expire_date` AS `expire_date`,if((`a`.`quotation_date` = '0000-00-00'),`a`.`creation_date`,`a`.`quotation_date`) AS `quotation_date`,`b`.`creation_date` AS `creation_date_item`,`b`.`days` AS `days`,`a`.`organization_id` AS `organization_id`,`b`.`item_id` AS `item_id`,`b`.`product_id` AS `product_id`,`b`.`price` AS `price`,`b`.`quantity` AS `quantity`,`b`.`delivery_date` AS `delivery_date`,`c`.`title` AS `title`,`c`.`brand_id` AS `brand_id`,`c`.`category_id` AS `category_id`,`e`.`name` AS `company`,`e`.`cuit` AS `cuit`,`e`.`iva_id` AS `iva_id`,`o`.`name` AS `agent`,`o`.`email` AS `email`,`f`.`title` AS `category`,`g`.`name` AS `brand`,sum(`b`.`quantity`) AS `total_quantity`,`b`.`total` AS `total_item`,`a`.`total` AS `total_quotation`,if((`a`.`company_id` = `a`.`sender_id`),'Proveedor','Cliente') AS `role`,if((`a`.`company_id` = `a`.`sender_id`),'Y','N') AS `provider`,if((`a`.`company_id` = `a`.`receiver_id`),'Y','N') AS `customer`,`e`.`international` AS `international`,`a`.`additional_information` AS `additional_information`,`b`.`width` AS `width`,`b`.`height` AS `height`,`b`.`depth` AS `depth`,`c`.`width` AS `product_width`,`c`.`height` AS `product_height`,`c`.`depth` AS `product_depth` from ((((((`purchase` `a` join `purchase_item` `b` on((`b`.`purchase_id` = `a`.`purchase_id`))) join `product` `c` on((`b`.`product_id` = `c`.`product_id`))) join `company` `e` on((`a`.`company_id` = `e`.`company_id`))) join `product_category` `f` on((`f`.`category_id` = `c`.`category_id`))) join `product_brand` `g` on((`g`.`brand_id` = `c`.`brand_id`))) left join `company_agent` `o` on((`a`.`agent_id` = `o`.`agent_id`))) group by `b`.`item_id`;

-- --------------------------------------------------------

--
-- Structure for view `view_quotation_list`
--
DROP TABLE IF EXISTS `view_quotation_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_quotation_list` AS select `a`.`quotation_id` AS `quotation_id`,`a`.`company_id` AS `company_id`,`a`.`branch_id` AS `branch_id`,`a`.`sender_id` AS `sender_id`,`a`.`receiver_id` AS `receiver_id`,`a`.`agent_id` AS `agent_id`,`a`.`status` AS `status`,`a`.`extra` AS `extra`,`a`.`creation_date` AS `creation_date`,`a`.`expire_days` AS `expire_days`,`a`.`expire_date` AS `expire_date`,if((`a`.`quotation_date` = '0000-00-00'),`a`.`creation_date`,`a`.`quotation_date`) AS `quotation_date`,`b`.`creation_date` AS `creation_date_item`,`b`.`days` AS `days`,`a`.`organization_id` AS `organization_id`,`b`.`item_id` AS `item_id`,`b`.`product_id` AS `product_id`,`b`.`price` AS `price`,`b`.`quantity` AS `quantity`,`b`.`delivery_date` AS `delivery_date`,`c`.`title` AS `title`,`c`.`brand_id` AS `brand_id`,`c`.`category_id` AS `category_id`,`e`.`name` AS `company`,`e`.`cuit` AS `cuit`,`e`.`iva_id` AS `iva_id`,`o`.`name` AS `agent`,`o`.`email` AS `email`,`f`.`title` AS `category`,`g`.`name` AS `brand`,sum(`b`.`quantity`) AS `total_quantity`,`b`.`total` AS `total_item`,`a`.`total` AS `total_quotation`,if((`a`.`company_id` = `a`.`sender_id`),'Proveedor','Cliente') AS `role`,if((`a`.`company_id` = `a`.`sender_id`),'Y','N') AS `provider`,if((`a`.`company_id` = `a`.`receiver_id`),'Y','N') AS `customer`,`e`.`international` AS `international`,`p`.`purchase_id` AS `purchase_id` from (((((((`quotation` `a` join `quotation_item` `b` on((`b`.`quotation_id` = `a`.`quotation_id`))) join `product` `c` on((`b`.`product_id` = `c`.`product_id`))) join `company` `e` on((`a`.`company_id` = `e`.`company_id`))) join `product_category` `f` on((`f`.`category_id` = `c`.`category_id`))) join `product_brand` `g` on((`g`.`brand_id` = `c`.`brand_id`))) left join `company_agent` `o` on((`a`.`agent_id` = `o`.`agent_id`))) left join `purchase` `p` on((`p`.`quotation_id` = `a`.`quotation_id`))) group by `b`.`item_id`;

-- --------------------------------------------------------

--
-- Structure for view `view_truck_list`
--
DROP TABLE IF EXISTS `view_truck_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_truck_list` AS select `a`.`truck_id` AS `truck_id`,`a`.`driver_id` AS `driver_id`,`a`.`brand` AS `brand`,`a`.`model` AS `model`,`a`.`year` AS `year`,`a`.`plate` AS `plate`,`a`.`code` AS `code`,`a`.`capacity` AS `capacity`,`a`.`status` AS `status`,`a`.`creation_date` AS `creation_date`,`a`.`created_by` AS `created_by`,`a`.`last_update` AS `last_update`,`a`.`updated_by` AS `updated_by`,`a`.`organization_id` AS `organization_id`,concat(`b`.`last_name`,' ',`b`.`first_name`) AS `driver` from (`truck` `a` join `core_user` `b` on((`b`.`user_id` = `a`.`driver_id`)));

--
-- Indexes for dumped tables
--

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id`),
  ADD KEY `name` (`name`),
  ADD KEY `cuit` (`cuit`);

--
-- Indexes for table `company_agent`
--
ALTER TABLE `company_agent`
  ADD PRIMARY KEY (`agent_id`);

--
-- Indexes for table `company_branch`
--
ALTER TABLE `company_branch`
  ADD PRIMARY KEY (`branch_id`);

--
-- Indexes for table `company_type`
--
ALTER TABLE `company_type`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `core_country`
--
ALTER TABLE `core_country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `core_group`
--
ALTER TABLE `core_group`
  ADD PRIMARY KEY (`group_id`);

--
-- Indexes for table `core_log_email`
--
ALTER TABLE `core_log_email`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `core_log_error`
--
ALTER TABLE `core_log_error`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `core_log_login`
--
ALTER TABLE `core_log_login`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `core_menu`
--
ALTER TABLE `core_menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `core_organization`
--
ALTER TABLE `core_organization`
  ADD PRIMARY KEY (`organization_id`);

--
-- Indexes for table `core_profile`
--
ALTER TABLE `core_profile`
  ADD PRIMARY KEY (`profile_id`);

--
-- Indexes for table `core_province`
--
ALTER TABLE `core_province`
  ADD PRIMARY KEY (`province_id`);

--
-- Indexes for table `core_region`
--
ALTER TABLE `core_region`
  ADD PRIMARY KEY (`region_id`);

--
-- Indexes for table `core_relation_group_profile`
--
ALTER TABLE `core_relation_group_profile`
  ADD PRIMARY KEY (`relation_id`);

--
-- Indexes for table `core_relation_menu_group`
--
ALTER TABLE `core_relation_menu_group`
  ADD PRIMARY KEY (`relation_id`);

--
-- Indexes for table `core_relation_menu_profile`
--
ALTER TABLE `core_relation_menu_profile`
  ADD PRIMARY KEY (`relation_id`);

--
-- Indexes for table `core_relation_user_group`
--
ALTER TABLE `core_relation_user_group`
  ADD PRIMARY KEY (`relation_id`),
  ADD KEY `admin_id` (`user_id`,`group_id`);

--
-- Indexes for table `core_relation_user_menu`
--
ALTER TABLE `core_relation_user_menu`
  ADD PRIMARY KEY (`relation_id`);

--
-- Indexes for table `core_user`
--
ALTER TABLE `core_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `core_zone`
--
ALTER TABLE `core_zone`
  ADD PRIMARY KEY (`zone_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `code` (`title`);

--
-- Indexes for table `product_abstract`
--
ALTER TABLE `product_abstract`
  ADD PRIMARY KEY (`abstract_id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `order_number` (`order_number`);

--
-- Indexes for table `product_brand`
--
ALTER TABLE `product_brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `product_comparation`
--
ALTER TABLE `product_comparation`
  ADD PRIMARY KEY (`comparation_id`);

--
-- Indexes for table `product_comparation_item`
--
ALTER TABLE `product_comparation_item`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `product_image`
--
ALTER TABLE `product_image`
  ADD PRIMARY KEY (`image_id`);

--
-- Indexes for table `product_relation`
--
ALTER TABLE `product_relation`
  ADD PRIMARY KEY (`relation_id`),
  ADD KEY `company_id` (`company_id`,`item_id`),
  ADD KEY `code` (`code`),
  ADD KEY `abstract_id` (`abstract_id`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `status` (`status`),
  ADD KEY `import_id` (`import_id`);

--
-- Indexes for table `product_relation_brand`
--
ALTER TABLE `product_relation_brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `product_relation_import`
--
ALTER TABLE `product_relation_import`
  ADD PRIMARY KEY (`import_id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `product_relation_import_item`
--
ALTER TABLE `product_relation_import_item`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `import_id` (`import_id`),
  ADD KEY `abstract_id` (`abstract_id`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `code` (`code`),
  ADD KEY `price` (`price`),
  ADD KEY `stock` (`stock`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`purchase_id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `receiver_id` (`receiver_id`);

--
-- Indexes for table `purchase_email`
--
ALTER TABLE `purchase_email`
  ADD PRIMARY KEY (`email_id`);

--
-- Indexes for table `purchase_file`
--
ALTER TABLE `purchase_file`
  ADD PRIMARY KEY (`file_id`);

--
-- Indexes for table `purchase_file_new`
--
ALTER TABLE `purchase_file_new`
  ADD PRIMARY KEY (`file_id`);

--
-- Indexes for table `purchase_item`
--
ALTER TABLE `purchase_item`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `quotation_id` (`purchase_id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `delivery_date` (`delivery_date`);

--
-- Indexes for table `quotation`
--
ALTER TABLE `quotation`
  ADD PRIMARY KEY (`quotation_id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `receiver_id` (`receiver_id`);

--
-- Indexes for table `quotation_email`
--
ALTER TABLE `quotation_email`
  ADD PRIMARY KEY (`email_id`);

--
-- Indexes for table `quotation_file`
--
ALTER TABLE `quotation_file`
  ADD PRIMARY KEY (`file_id`);

--
-- Indexes for table `quotation_file_new`
--
ALTER TABLE `quotation_file_new`
  ADD PRIMARY KEY (`file_id`);

--
-- Indexes for table `quotation_item`
--
ALTER TABLE `quotation_item`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `quotation_id` (`quotation_id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `delivery_date` (`delivery_date`);

--
-- Indexes for table `relation_company_broker`
--
ALTER TABLE `relation_company_broker`
  ADD PRIMARY KEY (`relation_id`);

--
-- Indexes for table `tax_iva_type`
--
ALTER TABLE `tax_iva_type`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `truck`
--
ALTER TABLE `truck`
  ADD PRIMARY KEY (`truck_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11697;
--
-- AUTO_INCREMENT for table `company_agent`
--
ALTER TABLE `company_agent`
  MODIFY `agent_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1342;
--
-- AUTO_INCREMENT for table `company_branch`
--
ALTER TABLE `company_branch`
  MODIFY `branch_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5083;
--
-- AUTO_INCREMENT for table `company_type`
--
ALTER TABLE `company_type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `core_country`
--
ALTER TABLE `core_country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `core_group`
--
ALTER TABLE `core_group`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `core_log_email`
--
ALTER TABLE `core_log_email`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `core_log_error`
--
ALTER TABLE `core_log_error`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=157706;
--
-- AUTO_INCREMENT for table `core_log_login`
--
ALTER TABLE `core_log_login`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=135;
--
-- AUTO_INCREMENT for table `core_menu`
--
ALTER TABLE `core_menu`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=143;
--
-- AUTO_INCREMENT for table `core_organization`
--
ALTER TABLE `core_organization`
  MODIFY `organization_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `core_profile`
--
ALTER TABLE `core_profile`
  MODIFY `profile_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=366;
--
-- AUTO_INCREMENT for table `core_province`
--
ALTER TABLE `core_province`
  MODIFY `province_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=245;
--
-- AUTO_INCREMENT for table `core_region`
--
ALTER TABLE `core_region`
  MODIFY `region_id` int(11) NOT NULL AUTO_INCREMENT COMMENT ' ',AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `core_relation_group_profile`
--
ALTER TABLE `core_relation_group_profile`
  MODIFY `relation_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=195;
--
-- AUTO_INCREMENT for table `core_relation_menu_group`
--
ALTER TABLE `core_relation_menu_group`
  MODIFY `relation_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=242;
--
-- AUTO_INCREMENT for table `core_relation_menu_profile`
--
ALTER TABLE `core_relation_menu_profile`
  MODIFY `relation_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=574;
--
-- AUTO_INCREMENT for table `core_relation_user_group`
--
ALTER TABLE `core_relation_user_group`
  MODIFY `relation_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=183;
--
-- AUTO_INCREMENT for table `core_relation_user_menu`
--
ALTER TABLE `core_relation_user_menu`
  MODIFY `relation_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=588;
--
-- AUTO_INCREMENT for table `core_user`
--
ALTER TABLE `core_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=98;
--
-- AUTO_INCREMENT for table `core_zone`
--
ALTER TABLE `core_zone`
  MODIFY `zone_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=50494;
--
-- AUTO_INCREMENT for table `product_abstract`
--
ALTER TABLE `product_abstract`
  MODIFY `abstract_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12188;
--
-- AUTO_INCREMENT for table `product_brand`
--
ALTER TABLE `product_brand`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1001;
--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `category_id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=167;
--
-- AUTO_INCREMENT for table `product_comparation`
--
ALTER TABLE `product_comparation`
  MODIFY `comparation_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `product_comparation_item`
--
ALTER TABLE `product_comparation_item`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=580;
--
-- AUTO_INCREMENT for table `product_image`
--
ALTER TABLE `product_image`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `product_relation`
--
ALTER TABLE `product_relation`
  MODIFY `relation_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5055;
--
-- AUTO_INCREMENT for table `product_relation_brand`
--
ALTER TABLE `product_relation_brand`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6226;
--
-- AUTO_INCREMENT for table `product_relation_import`
--
ALTER TABLE `product_relation_import`
  MODIFY `import_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT for table `product_relation_import_item`
--
ALTER TABLE `product_relation_import_item`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=78429;
--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `purchase_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `purchase_email`
--
ALTER TABLE `purchase_email`
  MODIFY `email_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `purchase_file`
--
ALTER TABLE `purchase_file`
  MODIFY `file_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `purchase_file_new`
--
ALTER TABLE `purchase_file_new`
  MODIFY `file_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `purchase_item`
--
ALTER TABLE `purchase_item`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `quotation`
--
ALTER TABLE `quotation`
  MODIFY `quotation_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=70;
--
-- AUTO_INCREMENT for table `quotation_email`
--
ALTER TABLE `quotation_email`
  MODIFY `email_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `quotation_file`
--
ALTER TABLE `quotation_file`
  MODIFY `file_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `quotation_file_new`
--
ALTER TABLE `quotation_file_new`
  MODIFY `file_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=154;
--
-- AUTO_INCREMENT for table `quotation_item`
--
ALTER TABLE `quotation_item`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1183;
--
-- AUTO_INCREMENT for table `relation_company_broker`
--
ALTER TABLE `relation_company_broker`
  MODIFY `relation_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=415;
--
-- AUTO_INCREMENT for table `tax_iva_type`
--
ALTER TABLE `tax_iva_type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=141;
--
-- AUTO_INCREMENT for table `truck`
--
ALTER TABLE `truck`
  MODIFY `truck_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
