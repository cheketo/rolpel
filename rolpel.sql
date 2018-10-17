-- phpMyAdmin SQL Dump
-- version 4.4.15.9
-- https://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 17-10-2018 a las 07:19:15
-- Versión del servidor: 5.6.37
-- Versión de PHP: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `rolpel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `company`
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `company_agent`
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `company_branch`
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `company_type`
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
-- Volcado de datos para la tabla `company_type`
--

INSERT INTO `company_type` (`type_id`, `name`, `status`, `creation_date`, `created_by`, `last_update`, `updated_by`, `organization_id`) VALUES
(2, 'PyME', 'A', '0000-00-00 00:00:00', 0, '2018-06-18 03:09:38', 0, 1),
(3, 'Multinacional', 'A', '0000-00-00 00:00:00', 0, '2018-06-18 03:09:41', 0, 1),
(1, 'Persona', 'A', '0000-00-00 00:00:00', 0, '2018-06-18 03:09:30', 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_country`
--

CREATE TABLE IF NOT EXISTS `core_country` (
  `country_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `short_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lat` float NOT NULL,
  `lng` float NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `core_country`
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
-- Estructura de tabla para la tabla `core_group`
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
-- Volcado de datos para la tabla `core_group`
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
-- Estructura de tabla para la tabla `core_log_email`
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
-- Estructura de tabla para la tabla `core_log_error`
--

CREATE TABLE IF NOT EXISTS `core_log_error` (
  `log_id` int(11) NOT NULL,
  `error` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `creation_date` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=157837 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `core_log_error`
--

INSERT INTO `core_log_error` (`log_id`, `error`, `type`, `description`, `created_by`, `creation_date`) VALUES
(157706, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 10:42:04'),
(157707, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 10:45:37'),
(157708, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 10:52:40'),
(157709, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 10:55:54'),
(157710, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 10:57:39'),
(157711, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 10:58:46'),
(157712, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 11:00:04'),
(157713, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 11:01:07'),
(157714, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 11:08:08'),
(157715, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 11:13:57'),
(157716, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 11:35:14'),
(157717, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 11:36:31'),
(157718, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 11:36:56'),
(157719, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 11:40:37'),
(157720, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 11:50:23'),
(157721, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 11:51:11'),
(157722, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 11:57:50'),
(157723, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 19:12:56'),
(157724, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 19:21:45'),
(157725, 'Unknown column ''monday_from'' in ''field list''', 'MySQL', 'INSERT INTO purchase (company_id,receiver_id,branch_id,agent_id,total,extra,expire_date,monday_from,monday_to,tuesday_from,tuesday_to,wensday_from,wensday_to,thursday_from,thursday_to,friday_from,friday_to,saturday_from,saturday_to,sunday_from,sunday_to,status,creation_date,created_by,organization_id)VALUES(11694,11694,5082,1342,186.1,''Informaci?n extra para el cliente'',''2018-10-17'',''10:00'',''17:00'',''10:00'',''17:00'','''','''',''10:00'',''17:00'','''','''',''12:00'',''14:00'','''','''',''A'',NOW(),8,1)', 8, '2018-10-15 19:23:31'),
(157726, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''70,86.1,''2018-10-17'',2,NOW(),8,1),(157725,11694,5082,3,5,,,,20,100,''2018-10-15'','' at line 1', 'MySQL', 'INSERT INTO purchase_item (purchase_id,company_id,branch_id,product_id,price,width,height,depth,quantity,total,delivery_date,days,creation_date,created_by,organization_id)VALUES(157725,11694,5082,1,1.23,20.00,10.00,,70,86.1,''2018-10-17'',2,NOW(),8,1),(157725,11694,5082,3,5,,,,20,100,''2018-10-15'',0,NOW(),8,1)', 8, '2018-10-15 19:23:31'),
(157727, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''70,86.1,''2018-10-17'',2,NOW(),8,1),(1,11694,5082,3,5,,,,20,100,''2018-10-15'',0,NOW'' at line 1', 'MySQL', 'INSERT INTO purchase_item (purchase_id,company_id,branch_id,product_id,price,width,height,depth,quantity,total,delivery_date,days,creation_date,created_by,organization_id)VALUES(1,11694,5082,1,1.23,20.00,10.00,,70,86.1,''2018-10-17'',2,NOW(),8,1),(1,11694,5082,3,5,,,,20,100,''2018-10-15'',0,NOW(),8,1)', 8, '2018-10-15 19:41:13'),
(157728, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 19:46:38'),
(157729, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 20:41:15'),
(157730, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 20:42:32'),
(157731, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 20:43:17'),
(157732, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 20:47:03'),
(157733, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 20:48:30'),
(157734, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 20:48:33'),
(157735, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 20:50:04'),
(157736, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 20:50:30'),
(157737, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 20:54:15'),
(157738, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 20:54:29'),
(157739, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 20:55:09'),
(157740, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 20:56:49'),
(157741, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 20:59:51'),
(157742, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 21:00:25'),
(157743, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 21:04:18'),
(157744, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 21:07:38'),
(157745, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 21:09:10'),
(157746, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 21:11:45'),
(157747, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 21:13:32'),
(157748, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 21:15:46'),
(157749, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 21:35:32'),
(157750, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 21:37:34'),
(157751, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 21:39:55'),
(157752, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 21:47:07'),
(157753, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 21:47:08'),
(157754, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 21:48:59'),
(157755, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 21:48:59'),
(157756, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 21:50:27'),
(157757, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 21:50:28'),
(157758, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 21:51:17'),
(157759, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 21:52:47'),
(157760, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 21:54:09'),
(157761, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 21:54:10'),
(157762, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 22:38:18'),
(157763, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 22:41:07'),
(157764, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 22:42:50'),
(157765, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 22:54:44'),
(157766, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 23:05:58'),
(157767, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 23:06:26'),
(157768, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 23:07:31'),
(157769, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 23:09:04'),
(157770, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 23:09:06'),
(157771, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 23:10:53'),
(157772, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 23:18:48'),
(157773, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 23:23:16'),
(157774, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 23:23:17'),
(157775, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 23:23:46'),
(157776, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 23:28:04'),
(157777, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 23:29:20'),
(157778, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 23:29:22'),
(157779, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-15 23:34:48'),
(157780, 'Unknown column ''$1.23'' in ''field list''', 'MySQL', 'INSERT INTO quotation_item (quotation_id,company_id,branch_id,product_id,price,width,height,depth,quantity,total,delivery_date,days,creation_date,created_by,organization_id)VALUES(70,11694,5082,1,1.23,20.00,10.00,1.7,3,3.69,''2018-10-28'',2,NOW(),8,1),(70,11694,5082,1,$1.23,20.00,12.00,2.33,50,0,''2018-10-28'',2,NOW(),8,1)', 8, '2018-10-15 23:59:48'),
(157781, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-16 00:17:01'),
(157782, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-16 00:17:48'),
(157783, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-16 00:18:15'),
(157784, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-16 00:18:55'),
(157785, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-16 00:19:35'),
(157786, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-16 00:20:29'),
(157787, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-16 00:20:30'),
(157788, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-16 00:20:43'),
(157789, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''''.receiver_id.''=''.11694.'',branch_id=5082,agent_id=1342,delivery_date=''2018-10-25'' at line 1', 'MySQL', 'UPDATE quotation SET company_id=11694,''.receiver_id.''=''.11694.'',branch_id=5082,agent_id=1342,delivery_date=''2018-10-25'',extra=''Informaci?n extra'',additional_information='''',total=12.65,updated_by=8 WHERE quotation_id=73', 8, '2018-10-16 00:56:04'),
(157790, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''8,1),(73,11694,5082,1,.23,20.00,12.00,2.33,51,11.73,''2018-10-17'',1,,8,1)'' at line 1', 'MySQL', 'INSERT INTO quotation_item (quotation_id,company_id,branch_id,product_id,price,width,height,depth,quantity,total,delivery_date,days,creation_date,created_by,organization_id)VALUES(73,11694,5082,1,.23,20.00,10.00,1.70,4,0.92,''2018-10-25'',9,,8,1),(73,11694,5082,1,.23,20.00,12.00,2.33,51,11.73,''2018-10-17'',1,,8,1)', 8, '2018-10-16 00:56:04'),
(157791, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''''receiver_id=11694'',branch_id=5082,agent_id=1342,delivery_date=''2018-10-25'',extr'' at line 1', 'MySQL', 'UPDATE quotation SET company_id=11694,''receiver_id=11694'',branch_id=5082,agent_id=1342,delivery_date=''2018-10-25'',extra=''Informaci?n extra'',additional_information='''',total=12.65,updated_by=8 WHERE quotation_id=73', 8, '2018-10-16 01:00:36'),
(157792, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-16 01:01:28'),
(157793, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-16 12:46:51'),
(157794, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-16 12:47:14'),
(157795, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-16 15:24:27'),
(157796, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-16 15:24:40'),
(157797, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-16 15:29:12'),
(157798, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-16 15:31:09'),
(157799, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-16 15:31:25'),
(157800, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-16 15:34:46'),
(157801, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-16 15:56:41'),
(157802, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-16 15:57:33'),
(157803, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-16 15:58:39'),
(157804, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-16 15:59:06'),
(157805, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-16 15:59:28'),
(157806, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-17 00:11:14'),
(157807, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-17 00:34:01'),
(157808, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-17 01:12:58'),
(157809, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '',''Info extra para el cliente'',''Uso interno'',''2018-10-10 00:00:00'',''2018-11-13 00'' at line 1', 'MySQL', 'INSERT INTO purchase (quotation_id,company_id,branch_id,sender_id,receiver_id,agent_id,currency_id,total,extra,additional_information,purchase_date,delivery_date,status,creation_date,created_by,organization_id)VALUES(74,11696,5080,0,11696,1335,,,''Info extra para el cliente'',''Uso interno'',''2018-10-10 00:00:00'',''2018-11-13 00:00:00'',''''P'',NOW(),8,1)', 8, '2018-10-17 01:16:06'),
(157810, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''''2018-11-13 00:00:00'',34,NOW(),8,1),(157809,11696,5080,2,25.00,5.00,3.00,0.00,50'' at line 1', 'MySQL', 'INSERT INTO purchase_item (purchase_id,company_id,branch_id,product_id,price,width,height,depth,quantity,total,delivery_date,days,creation_date,created_by,organization_id)VALUES(157809,11696,5080,1,10.23,20.00,10.00,0.00,200,,''2018-11-13 00:00:00'',34,NOW(),8,1),(157809,11696,5080,2,25.00,5.00,3.00,0.00,50,,''2018-10-30 00:00:00'',20,NOW(),8,1)', 8, '2018-10-17 01:16:06'),
(157811, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '',''Info extra para el cliente'',''Uso interno'',''2018-10-10 00:00:00'',''2018-11-13 00'' at line 1', 'MySQL', 'INSERT INTO purchase (quotation_id,company_id,branch_id,sender_id,receiver_id,agent_id,currency_id,total,extra,additional_information,purchase_date,delivery_date,status,creation_date,created_by,organization_id)VALUES(74,11696,5080,0,11696,1335,,,''Info extra para el cliente'',''Uso interno'',''2018-10-10 00:00:00'',''2018-11-13 00:00:00'',''P'',NOW(),8,1)', 8, '2018-10-17 01:19:55'),
(157812, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''3296.00,''Info extra para el cliente'',''Uso interno'',''2018-10-10 00:00:00'',''2018-1'' at line 1', 'MySQL', 'INSERT INTO purchase (quotation_id,company_id,branch_id,sender_id,receiver_id,agent_id,currency_id,total,extra,additional_information,purchase_date,delivery_date,status,creation_date,created_by,organization_id)VALUES(74,11696,5080,0,11696,1335,,3296.00,''Info extra para el cliente'',''Uso interno'',''2018-10-10 00:00:00'',''2018-11-13 00:00:00'',''P'',NOW(),8,1)', 8, '2018-10-17 01:25:20'),
(157813, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-17 01:36:38'),
(157814, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-17 01:36:41'),
(157815, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-17 01:39:48'),
(157816, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-17 01:44:58'),
(157817, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-17 01:55:29'),
(157818, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '''' at line 1', 'MySQL', 'SELECT agent_id,name FROM company_agent WHERE branch_id=', 8, '2018-10-17 02:23:03'),
(157819, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '''' at line 1', 'MySQL', 'SELECT agent_id,name FROM company_agent WHERE branch_id=', 8, '2018-10-17 02:26:24'),
(157820, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-17 02:26:25'),
(157821, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-17 02:29:43'),
(157822, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-17 02:33:39'),
(157823, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-17 02:34:41'),
(157824, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-17 02:36:40'),
(157825, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-17 02:36:51'),
(157826, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-17 02:40:46'),
(157827, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-17 02:45:31'),
(157828, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-17 02:45:52'),
(157829, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-17 02:47:13'),
(157830, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-17 02:48:06'),
(157831, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-17 02:51:48'),
(157832, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-17 02:53:25'),
(157833, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-17 02:53:49'),
(157834, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''''.receiver_id.''=''.11696.'',branch_id=5081,agent_id=1336,delivery_date=''2019-09-25'' at line 1', 'MySQL', 'UPDATE purchase SET company_id=11696,''.receiver_id.''=''.11696.'',branch_id=5081,agent_id=1336,delivery_date=''2019-09-25'',extra=''Cotizaci?n de Prueba Cliente34567890'',additional_information=''Cotizaci?n de Prueba Uso interno1234567'',total=314.22,monday_from=''01:12'',monday_to=''09:20'',tuesday_from=''08:05'',tuesday_to=''14:10'',wensday_from='''',wensday_to='''',thursday_from=''10:30'',thursday_to=''20:50'',friday_from=''09:20''friday_to=''11:09'',saturday_from=''08:10'',saturday_to=''10:30'',sunday_from='''',sunday_to='''',updated_by=8 WHERE purchase_id=1', 8, '2018-10-17 03:16:29'),
(157835, 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''friday_to=''11:09'',saturday_from=''08:10'',saturday_to=''10:30'',sunday_from='''',sunda'' at line 1', 'MySQL', 'UPDATE purchase SET company_id=11696,receiver_id=11696,branch_id=5081,agent_id=1336,delivery_date=''2019-09-25'',extra=''Cotizaci?n de Prueba Cliente34567890'',additional_information=''Cotizaci?n de Prueba Uso interno1234567'',total=314.22,monday_from=''01:12'',monday_to=''09:20'',tuesday_from=''08:05'',tuesday_to=''14:10'',wensday_from='''',wensday_to='''',thursday_from=''10:30'',thursday_to=''20:50'',friday_from=''09:20''friday_to=''11:09'',saturday_from=''08:10'',saturday_to=''10:30'',sunday_from='''',sunday_to='''',updated_by=8 WHERE purchase_id=1', 8, '2018-10-17 03:17:33'),
(157836, 'Table ''rolpel.currency'' doesn''t exist', 'MySQL', 'SELECT currency_id,title FROM currency ORDER BY title DESC', 8, '2018-10-17 03:57:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_log_login`
--

CREATE TABLE IF NOT EXISTS `core_log_login` (
  `log_id` int(11) NOT NULL,
  `user` varchar(255) CHARACTER SET latin1 NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 NOT NULL,
  `ip` varchar(255) CHARACTER SET latin1 NOT NULL,
  `tries` int(11) NOT NULL,
  `event` varchar(255) CHARACTER SET latin1 NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM AUTO_INCREMENT=141 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `core_log_login`
--

INSERT INTO `core_log_login` (`log_id`, `user`, `password`, `ip`, `tries`, `event`, `date`) VALUES
(135, 'cheketo', '', '127.0.0.1', 0, 'OK', '2018-10-15 13:40:57'),
(136, 'cheketo', '', '127.0.0.1', 0, 'OK', '2018-10-15 22:12:50'),
(137, 'cheketo', '', '127.0.0.1', 0, 'OK', '2018-10-16 15:46:42'),
(138, 'cheketo', '', '127.0.0.1', 0, 'OK', '2018-10-16 18:24:31'),
(139, 'cheketo', '', '127.0.0.1', 0, 'OK', '2018-10-17 02:44:37'),
(140, 'sergio', '', '127.0.0.1', 0, 'OK', '2018-10-17 07:05:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_menu`
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
) ENGINE=MyISAM AUTO_INCREMENT=145 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `core_menu`
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
(31, 6, 'Perfiles Eliminados', '../profile/list.php?status=I', 'fa-trash', 3, 'N', 'A', 'A', 0),
(32, 8, 'Menúes Eliminados', '../menu/list.php?status=I', 'fa-trash', 3, 'N', 'A', 'A', 0),
(33, 7, 'Grupos Eliminados', '../../../core/modules/group/list.php?status=I', 'fa-trash', 3, 'N', 'A', 'A', 0),
(34, 5, 'Mi Perfil', '../../../core/modules/user/profile.php', 'fa-child', 4, 'Y', 'A', 'O', 0),
(35, 6, 'Editar Perfil', '../../../core/modules/profile/edit.php', 'fa-pencil', 3, 'N', 'A', 'O', 0),
(40, 1, 'Geolocalización', '#', 'fa-globe', 5, 'N', 'A', 'O', 1),
(41, 40, 'Países', '#', 'fa-flag', 1, 'N', 'A', 'A', 1),
(42, 40, 'Provincias', '#', 'fa-flag-checkered', 2, 'N', 'A', 'A', 1),
(43, 40, 'Zonas', '#', 'fa-flag-o', 3, 'N', 'A', 'A', 1),
(44, 41, 'Listado de Países', '../geolocation_country/list.php', 'fa-list-ul', 1, 'N', 'A', 'A', 1),
(45, 41, 'Nuevo País', '../geolocation_country/new.php', 'fa-plus-square', 0, 'N', 'A', 'A', 1),
(46, 36, 'Nueva Cuenta Corriente', '../customer_test/new-account.php', 'fa-calculator', 3, 'N', 'A', 'A', 1),
(47, 0, 'Empresas', '#', 'fa-building', 3, 'N', 'A', 'O', 1),
(48, 47, 'Nueva Empresa', '../company/new.php', 'fa-plus-square', 1, 'N', 'A', 'A', 1),
(50, 53, 'Marcas', '#', 'fa-trademark', 4, 'N', 'A', 'A', 1),
(51, 50, 'Listado de Marcas', '../../../project/modules/brand/list.php', 'fa-list-ul', 2, 'N', 'A', 'A', 1),
(52, 50, 'Nueva Marca', '../../../project/modules/brand/new.php', 'fa-plus-square', 1, 'N', 'A', 'A', 1),
(53, 0, 'Productos', '#', 'fa-cubes', 4, 'N', 'A', 'A', 1),
(55, 54, 'Nacionales', '#', 'fa-flag', 1, 'N', 'A', 'A', 1),
(57, 2, 'Editar Producto', '../../../project/modules/product/edit.php', 'fa-pencil', 3, 'N', 'A', 'O', 1),
(73, 107, 'Nueva Orden', '../../../project/modules/purchase/new.php?provider=Y', 'fa-ambulance', 1, 'N', 'A', 'A', 1),
(74, 76, 'Ordenes Sin Confirmar', '../provider_national_order/list.php?status=P', 'fa-shopping-cart', 2, 'N', 'I', 'A', 1),
(75, 102, 'Editar Cotización', '../../../project/modules/quotation/edit.php', 'fa-clipboard', 12, 'N', 'A', 'O', 1),
(76, 0, 'Ordenes de Compra', '#', 'fa-shopping-cart', 10, 'N', 'A', 'A', 1),
(77, 107, 'Ordenes Pedidas', '../../../er_national_order/list.php?status=A', 'fa-truck', 3, 'N', 'A', 'A', 1),
(78, 76, 'Historial de Ordenes', '../../../project/modules/purchase/list.php?status=F&customer=Y', 'fa-hourglass-half', 99, 'N', 'A', 'A', 1),
(98, 0, 'Empresas', '#', 'fa-building', 3, 'N', 'A', 'A', 1),
(99, 98, 'Todas las Empresas', '../../../project/modules/company/list.php', 'fa-book', 0, 'N', 'A', 'A', 1),
(100, 98, 'Proveedores', '../../../project/modules/company/list.php?provider=Y', 'fa-shopping-cart', 2, 'N', 'A', 'A', 1),
(101, 98, 'Clientes', '../../../project/modules/company/list.php?customer=Y', 'fa-group', 3, 'N', 'A', 'A', 1),
(102, 0, 'Cotizaciones', '#', 'fa-clipboard', 6, 'N', 'A', 'A', 1),
(105, 98, 'Nueva Empresa', '../../../project/modules/company/new.php', 'fa-plus-square', 9, 'N', 'A', 'A', 1),
(109, 98, 'Editar Empresa', '../../../project/modules/company/edit.php', 'fa-building', 0, 'N', 'A', 'O', 1),
(112, 102, 'Cotizaciones Activas', '../../../project/modules/quotation/list.php?customer=Y&international=N', 'fa-clipboard', 1, 'N', 'A', 'A', 1),
(115, 102, 'Nueva Cotización', '../../../project/modules/quotation/new.php?customer=Y', 'fa-plus-square', 0, 'N', 'A', 'A', 1),
(116, 102, 'Historial', '../../../project/modules/quotation/list.php?status=F&customer=Y', 'fa-hourglass-2', 99, 'N', 'A', 'A', 1),
(137, 0, 'Camiones', '#', 'fa-bus', 30, 'N', 'A', 'A', 1),
(138, 137, 'Nuevo Camión', '../../../project/modules/truck/new.php', 'fa-plus-circle', 1, 'N', 'A', 'A', 1),
(139, 137, 'Editar Camión', '../../../project/modules/truck/edit.php', 'fa-bus', 2, 'N', 'A', 'O', 1),
(140, 137, 'Listar Camiones', '../../../project/modules/truck/list.php', 'fa-bus', 3, 'N', 'A', 'A', 1),
(141, 76, 'Nueva Orden', '../../../project/modules/purchase/new.php?customer=Y', 'fa-cart-plus', 1, 'N', 'A', 'A', 1),
(142, 76, 'Ordenes Pendientes', '../../../project/modules/purchase/list.php?status=P', 'fa-exclamation-circle', 2, 'N', 'A', 'A', 1),
(143, 76, 'Ordenes Activas', '../../../project/modules/purchase/list.php?status=A', 'fa-shopping-cart', 5, 'N', 'A', 'A', 1),
(144, 76, 'Editar Orden de Compra', '../../../project/modules/purchase/edit.php', 'fa-shopping-cart', 5, 'N', 'A', 'O', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_organization`
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
-- Volcado de datos para la tabla `core_organization`
--

INSERT INTO `core_organization` (`organization_id`, `name`, `corporate_name`, `logo`, `icon`, `address`, `postal_code`, `zone_id`, `region_id`, `province_id`, `country_id`, `lat`, `lng`, `cuit`, `gross_income_tax`, `iva`, `email`, `phone`, `fax`, `website`, `loader_text`) VALUES
(1, 'RolPel', '', '../../../../skin/images/configuration/company/rolpel.png', 'dropbox', 'Río Cuarto 2698', 'C1292', 10, 10, 6, 1, '-34.6376643999999900000000000000', '-58.4095608999999740000000000000', 33647656779, '33647656779', 1, 'administracion@rolpel.com.ar', '4303-2464/5', '4303-2464/5', 'www.rolpel.com.ar', '<i class="fa fa-dropbox animated faa-tada faa-fast"></i> RolPel'),
(2, 'Pepe Autos', '', '', 'car', '', '', 0, 0, 0, 0, '0.0000000000000000000000000000', '0.0000000000000000000000000000', 0, '', 0, '', '', '', '', 'Pepe <i class="fa fa-car faa-tada animated"></i> Autos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_profile`
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
-- Volcado de datos para la tabla `core_profile`
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
-- Estructura de tabla para la tabla `core_province`
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
-- Volcado de datos para la tabla `core_province`
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
-- Estructura de tabla para la tabla `core_region`
--

CREATE TABLE IF NOT EXISTS `core_region` (
  `region_id` int(11) NOT NULL COMMENT ' ',
  `province_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `short_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `core_region`
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
-- Estructura de tabla para la tabla `core_relation_group_profile`
--

CREATE TABLE IF NOT EXISTS `core_relation_group_profile` (
  `relation_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=199 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `core_relation_group_profile`
--

INSERT INTO `core_relation_group_profile` (`relation_id`, `group_id`, `profile_id`) VALUES
(150, 12, 365),
(149, 11, 365),
(27, 10, 355),
(148, 7, 365),
(198, 18, 360),
(129, 5, 364),
(119, 6, 364),
(131, 7, 364),
(181, 17, 362),
(180, 17, 361),
(197, 17, 360),
(196, 15, 360),
(177, 15, 362),
(178, 17, 359),
(147, 6, 365),
(183, 18, 362),
(195, 13, 360);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_relation_menu_group`
--

CREATE TABLE IF NOT EXISTS `core_relation_menu_group` (
  `relation_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=242 DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Volcado de datos para la tabla `core_relation_menu_group`
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
-- Estructura de tabla para la tabla `core_relation_menu_profile`
--

CREATE TABLE IF NOT EXISTS `core_relation_menu_profile` (
  `relation_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=639 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `core_relation_menu_profile`
--

INSERT INTO `core_relation_menu_profile` (`relation_id`, `menu_id`, `profile_id`) VALUES
(9, 4, 351),
(10, 21, 351),
(16, 5, 352),
(17, 11, 352),
(18, 12, 352),
(19, 16, 352),
(20, 20, 352),
(107, 7, 357),
(638, 33, 360),
(114, 5, 353),
(115, 11, 353),
(116, 12, 353),
(117, 16, 353),
(118, 20, 353),
(120, 4, 353),
(121, 21, 353),
(122, 31, 353),
(124, 7, 353),
(637, 28, 360),
(636, 27, 360),
(635, 26, 360),
(634, 7, 360),
(129, 8, 353),
(130, 9, 353),
(131, 10, 353),
(132, 17, 353),
(133, 32, 353),
(134, 29, 353),
(633, 35, 360),
(148, 6, 353),
(149, 13, 353),
(632, 31, 360),
(631, 21, 360),
(630, 4, 360),
(629, 6, 360),
(628, 34, 360),
(627, 20, 360),
(626, 16, 360),
(625, 12, 360),
(624, 11, 360),
(623, 5, 360),
(622, 1, 360),
(621, 140, 360),
(620, 139, 360),
(619, 138, 360),
(618, 137, 360),
(617, 93, 360),
(616, 78, 360),
(615, 144, 360),
(614, 143, 360),
(613, 142, 360),
(612, 141, 360),
(611, 76, 360),
(610, 116, 360),
(609, 75, 360),
(608, 112, 360),
(607, 115, 360),
(606, 102, 360),
(605, 25, 360),
(604, 57, 360),
(192, 72, 364),
(193, 79, 364),
(603, 18, 360),
(602, 19, 360),
(601, 2, 360),
(600, 51, 360),
(599, 52, 360),
(598, 50, 360),
(597, 24, 360),
(596, 22, 360),
(281, 97, 361),
(595, 23, 360),
(205, 91, 364),
(594, 3, 360),
(593, 53, 360),
(280, 92, 361),
(592, 105, 360),
(210, 92, 364),
(490, 13, 359),
(591, 101, 360),
(279, 91, 361),
(489, 13, 362),
(215, 97, 364),
(315, 63, 365),
(590, 100, 360),
(316, 69, 365),
(589, 109, 360),
(274, 13, 365),
(588, 99, 360),
(587, 98, 360),
(586, 13, 360);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_relation_user_group`
--

CREATE TABLE IF NOT EXISTS `core_relation_user_group` (
  `relation_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=185 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `core_relation_user_group`
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
(180, 94, 13),
(184, 1, 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_relation_user_menu`
--

CREATE TABLE IF NOT EXISTS `core_relation_user_menu` (
  `relation_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=588 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `core_relation_user_menu`
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
-- Estructura de tabla para la tabla `core_user`
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
-- Volcado de datos para la tabla `core_user`
--

INSERT INTO `core_user` (`user_id`, `organization_id`, `user`, `password`, `first_name`, `last_name`, `email`, `phone`, `profile_id`, `img`, `status`, `tries`, `last_access`, `creation_date`, `creator_id`) VALUES
(1, 1, 'sergio', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Sergio', 'Rodriguez', 'carlos@rolpel.com.ar', '', 360, '../../../../skin/images/users/default/default11.png', 'A', 0, '2018-10-17 04:05:11', '2018-06-18 01:22:39', 8),
(2, 1, 'ana', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Ana', 'Rodriguez', 'cobranzas@rolpel.com.ar', '', 360, '../../../../skin/images/users/default/default06.png', 'A', 0, '2018-06-22 09:20:18', '2018-04-27 14:18:36', 8),
(8, 1, 'cheketo', '49e09dc76bf5ba6fdcbfb710a7d8842d867bad54', 'Alejandro', 'Romero', 'romero.m.alejandro@gmail.com', '', 333, '../../../../skin/images/users/default/default21.png', 'A', 0, '2018-10-16 23:44:37', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `core_view_group_list`
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
-- Estructura Stand-in para la vista `core_view_menu_list`
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
-- Estructura Stand-in para la vista `core_view_profile_list`
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
-- Estructura Stand-in para la vista `core_view_user_list`
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
-- Estructura de tabla para la tabla `core_zone`
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
-- Volcado de datos para la tabla `core_zone`
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
-- Estructura de tabla para la tabla `product`
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_brand`
--

CREATE TABLE IF NOT EXISTS `product_brand` (
  `brand_id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_short` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `country_id` int(11) NOT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A',
  `creation_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_category`
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_image`
--

CREATE TABLE IF NOT EXISTS `product_image` (
  `image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `src` varchar(255) CHARACTER SET latin1 NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `purchase`
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
  `purchase_date` date NOT NULL,
  `delivery_date` datetime NOT NULL,
  `extra` text COLLATE utf8_unicode_ci NOT NULL,
  `additional_information` text COLLATE utf8_unicode_ci NOT NULL,
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
  `modification_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `purchase_email`
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
-- Estructura de tabla para la tabla `purchase_file`
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
-- Estructura de tabla para la tabla `purchase_file_new`
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `purchase_item`
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `quotation`
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
  `additional_information` text CHARACTER SET utf8 NOT NULL,
  `creation_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modification_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `quotation_email`
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `quotation_file`
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `quotation_file_new`
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `quotation_item`
--

CREATE TABLE IF NOT EXISTS `quotation_item` (
  `item_id` int(11) NOT NULL,
  `quotation_id` int(11) NOT NULL,
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `relation_company_broker`
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
-- Estructura de tabla para la tabla `tax_iva_type`
--

CREATE TABLE IF NOT EXISTS `tax_iva_type` (
  `type_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A',
  `percentage` decimal(5,3) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=141 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tax_iva_type`
--

INSERT INTO `tax_iva_type` (`type_id`, `name`, `status`, `percentage`) VALUES
(1, 'IVA Responsable Inscripto', 'A', '21.000'),
(2, 'IVA Responsable No Inscripto', 'A', '21.000'),
(4, 'IVA Sujeto Excento', 'A', '0.000'),
(5, 'Consumidor Final', 'A', '21.000'),
(6, 'Sujeto No Categorizado', 'A', '21.000'),
(7, 'Proveedor de Exterior', 'A', '0.000'),
(8, 'Cliente del Exterior', 'A', '21.000'),
(9, 'IVA Liberado – Ley Nº 19.640', 'A', '0.000'),
(10, 'IVA Responsable Inscripto – Agente de Percepción', 'A', '21.000'),
(11, 'Pequeño Contribuyente Eventual', 'A', '10.500'),
(12, 'Responsable Monotributo', 'A', '0.000'),
(13, 'Monotributista Social', 'A', '0.000'),
(14, 'Pequeño Contribuyente Eventual Social', 'A', '0.000'),
(3, 'IVA No Responsable', 'A', '0.000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `truck`
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
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `view_brand_list`
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
-- Estructura Stand-in para la vista `view_category_list`
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
-- Estructura Stand-in para la vista `view_company_list`
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
-- Estructura Stand-in para la vista `view_product_list`
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
-- Estructura Stand-in para la vista `view_purchase_list`
--
CREATE TABLE IF NOT EXISTS `view_purchase_list` (
`purchase_id` int(11)
,`quotation_id` int(11)
,`company_id` int(11)
,`branch_id` int(11)
,`sender_id` int(11)
,`receiver_id` int(11)
,`agent_id` int(11)
,`status` char(1)
,`extra` text
,`creation_date` datetime
,`purchase_delivery_date` datetime
,`purchase_date` datetime
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
,`total_purchase` decimal(20,2)
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
-- Estructura Stand-in para la vista `view_quotation_list`
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
,`additional_information` text
,`creation_date` datetime
,`expire_days` int(11)
,`expire_date` datetime
,`quotation_date` datetime
,`creation_date_item` datetime
,`days` int(7)
,`organization_id` int(11)
,`item_id` int(11)
,`product_id` int(11)
,`width` decimal(6,2)
,`height` decimal(6,2)
,`depth` decimal(6,2)
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
-- Estructura Stand-in para la vista `view_truck_list`
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
-- Estructura para la vista `core_view_group_list`
--
DROP TABLE IF EXISTS `core_view_group_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `core_view_group_list` AS select `a`.`group_id` AS `group_id`,`a`.`title` AS `title`,`a`.`organization_id` AS `organization_id`,`a`.`image` AS `image`,`a`.`status` AS `status`,`a`.`created_by` AS `created_by`,`a`.`creation_date` AS `creation_date`,`b`.`profile_id` AS `profile_id`,`c`.`title` AS `profile`,`a`.`last_modification` AS `last_modification` from ((`core_group` `a` join `core_relation_group_profile` `b` on((`a`.`group_id` = `b`.`group_id`))) join `core_profile` `c` on((`b`.`profile_id` = `c`.`profile_id`))) group by `a`.`group_id` order by `a`.`title`;

-- --------------------------------------------------------

--
-- Estructura para la vista `core_view_menu_list`
--
DROP TABLE IF EXISTS `core_view_menu_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `core_view_menu_list` AS select `a`.`menu_id` AS `menu_id`,`a`.`parent_id` AS `parent_id`,`a`.`icon` AS `icon`,`a`.`title` AS `title`,`a`.`link` AS `link`,if((`a`.`link` = '#'),'Sin link',substr(`a`.`link`,10)) AS `link_text`,`a`.`position` AS `position`,`a`.`public` AS `public`,if((`a`.`public` = 'Y'),'Público','Privado') AS `public_text`,`a`.`view_status` AS `view_status`,if((`a`.`view_status` = 'O'),'Oculto','Visible') AS `view_status_text`,`a`.`status` AS `status`,`a`.`organization_id` AS `organization_id`,`d`.`title` AS `profile`,`e`.`title` AS `group_title`,`b`.`profile_id` AS `profile_id`,`c`.`group_id` AS `group_id` from ((((`core_menu` `a` left join `core_relation_menu_profile` `b` on((`a`.`menu_id` = `b`.`menu_id`))) left join `core_relation_menu_group` `c` on((`a`.`menu_id` = `c`.`menu_id`))) left join `core_profile` `d` on((`d`.`profile_id` = `b`.`profile_id`))) left join `core_group` `e` on((`e`.`group_id` = `c`.`group_id`))) where (1 = 1) group by `a`.`menu_id` order by `a`.`title`;

-- --------------------------------------------------------

--
-- Estructura para la vista `core_view_profile_list`
--
DROP TABLE IF EXISTS `core_view_profile_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `core_view_profile_list` AS select `a`.`profile_id` AS `profile_id`,`a`.`organization_id` AS `organization_id`,`a`.`title` AS `title`,`a`.`status` AS `status`,`a`.`image` AS `image`,`a`.`creation_date` AS `creation_date`,`a`.`created_by` AS `created_by`,`a`.`last_modification` AS `last_modification`,`b`.`group_id` AS `group_id`,`c`.`title` AS `group_title` from ((`core_profile` `a` join `core_relation_group_profile` `b` on((`a`.`profile_id` = `b`.`profile_id`))) join `core_group` `c` on((`b`.`group_id` = `c`.`group_id`))) group by `a`.`profile_id` order by `a`.`title`;

-- --------------------------------------------------------

--
-- Estructura para la vista `core_view_user_list`
--
DROP TABLE IF EXISTS `core_view_user_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `core_view_user_list` AS select `a`.`user_id` AS `user_id`,`a`.`organization_id` AS `organization_id`,`a`.`user` AS `user`,`a`.`password` AS `password`,`a`.`first_name` AS `first_name`,`a`.`last_name` AS `last_name`,concat(`a`.`first_name`,' ',`a`.`last_name`) AS `full_name`,concat(`a`.`first_name`,' ',`a`.`last_name`,' (',`a`.`user`,')') AS `full_user_name`,`a`.`email` AS `email`,`a`.`profile_id` AS `profile_id`,`a`.`img` AS `img`,`a`.`status` AS `status`,`a`.`tries` AS `tries`,`a`.`last_access` AS `last_access`,`a`.`creation_date` AS `creation_date`,`a`.`creator_id` AS `creator_id`,`p`.`title` AS `profile`,coalesce(`g`.`title`,'') AS `group_title`,coalesce(`g`.`group_id`,0) AS `group_id` from (((`core_user` `a` left join `core_relation_user_group` `r` on((`r`.`user_id` = `a`.`user_id`))) left join `core_group` `g` on((`r`.`group_id` = `g`.`group_id`))) left join `core_profile` `p` on((`p`.`profile_id` = `a`.`profile_id`))) where (1 = 1) group by `a`.`user_id` order by `a`.`first_name`;

-- --------------------------------------------------------

--
-- Estructura para la vista `view_brand_list`
--
DROP TABLE IF EXISTS `view_brand_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_brand_list` AS select `a`.`brand_id` AS `brand_id`,`b`.`product_id` AS `product_id`,`c`.`category_id` AS `category_id`,`a`.`organization_id` AS `organization_id`,`a`.`name` AS `name`,`b`.`code` AS `code`,`a`.`status` AS `status`,`a`.`creation_date` AS `creation_date`,`c`.`title` AS `category` from ((`product_brand` `a` left join `product` `b` on((`b`.`brand_id` = `a`.`brand_id`))) left join `product_category` `c` on((`c`.`category_id` = `b`.`category_id`))) order by `a`.`name`;

-- --------------------------------------------------------

--
-- Estructura para la vista `view_category_list`
--
DROP TABLE IF EXISTS `view_category_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_category_list` AS select `a`.`category_id` AS `category_id`,`a`.`organization_id` AS `organization_id`,`a`.`parent_id` AS `parent_id`,`a`.`title` AS `title`,`a`.`short_title` AS `short_title`,`a`.`status` AS `status`,`a`.`creation_date` AS `creation_date`,`a`.`created_by` AS `created_by`,`a`.`updated_by` AS `updated_by`,`a`.`last_modification` AS `last_modification`,coalesce(`b`.`title`,'Sin Padre') AS `parent`,coalesce(`b`.`short_title`,'Sin Padre') AS `parent_short` from (`product_category` `a` left join `product_category` `b` on((`a`.`parent_id` = `b`.`category_id`)));

-- --------------------------------------------------------

--
-- Estructura para la vista `view_company_list`
--
DROP TABLE IF EXISTS `view_company_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_company_list` AS select `a`.`company_id` AS `company_id`,`a`.`old_id` AS `old_id`,`b`.`branch_id` AS `branch_id`,`e`.`broker_id` AS `broker_id`,`a`.`type_id` AS `type_id`,`a`.`organization_id` AS `organization_id`,`a`.`name` AS `name`,`d`.`name` AS `type`,`a`.`cuit` AS `cuit`,`a`.`iva_id` AS `iva_id`,`t`.`name` AS `iva`,`a`.`iibb` AS `iibb`,`a`.`international` AS `international`,if((`a`.`international` = 'N'),'Nacional','Extranjero') AS `international_text`,`a`.`vat` AS `vat`,`a`.`customer` AS `customer`,`a`.`provider` AS `provider`,if(((`a`.`customer` = 'Y') and (`a`.`provider` = 'Y')),'Cliente y Proveedor',if((`a`.`customer` = 'Y'),'Cliente','Proveedor')) AS `relation_text`,`a`.`logo` AS `logo`,`a`.`status` AS `status`,`a`.`balance` AS `balance`,`b`.`name` AS `branch`,`b`.`address` AS `address`,`b`.`postal_code` AS `postal_code`,`b`.`phone` AS `phone`,`b`.`email` AS `email`,`b`.`website` AS `website`,`b`.`fax` AS `fax`,`b`.`main_branch` AS `main_branch`,`b`.`country_id` AS `country_id`,`g`.`name` AS `country`,`g`.`short_name` AS `country_short`,`b`.`province_id` AS `province_id`,`h`.`name` AS `province`,`h`.`short_name` AS `province_short`,`b`.`region_id` AS `region_id`,`i`.`name` AS `region`,`i`.`short_name` AS `region_short`,`b`.`zone_id` AS `zone_id`,`j`.`name` AS `zone`,`j`.`short_name` AS `zone_short`,`b`.`lat` AS `lat`,`b`.`lng` AS `lng`,coalesce(`f`.`full_name`,'Sin Corredor') AS `broker`,coalesce(`f`.`email`,'') AS `broker_email`,coalesce(`f`.`img`,'') AS `broker_img`,`a`.`creation_date` AS `creation_date`,`a`.`last_update` AS `last_update`,`a`.`created_by` AS `created_by`,`a`.`updated_by` AS `updated_by`,`b`.`monday_from` AS `monday_from`,`b`.`monday_to` AS `monday_to`,`b`.`tuesday_from` AS `tuesday_from`,`b`.`tuesday_to` AS `tuesday_to`,`b`.`wensday_from` AS `wensday_from`,`b`.`wensday_to` AS `wensday_to`,`b`.`thursday_from` AS `thursday_from`,`b`.`thursday_to` AS `thursday_to`,`b`.`friday_from` AS `friday_from`,`b`.`friday_to` AS `friday_to`,`b`.`saturday_from` AS `saturday_from`,`b`.`saturday_to` AS `saturday_to`,`b`.`sunday_from` AS `sunday_from`,`b`.`sunday_to` AS `sunday_to` from (((((((((`company` `a` left join `tax_iva_type` `t` on((`t`.`type_id` = `a`.`iva_id`))) join `company_type` `d` on((`d`.`type_id` = `a`.`type_id`))) join `company_branch` `b` on((`a`.`company_id` = `b`.`company_id`))) left join `relation_company_broker` `e` on((`e`.`branch_id` = `b`.`branch_id`))) left join `core_view_user_list` `f` on((`f`.`user_id` = `e`.`broker_id`))) left join `core_country` `g` on((`g`.`country_id` = `b`.`country_id`))) left join `core_province` `h` on((`h`.`province_id` = `b`.`province_id`))) left join `core_region` `i` on((`i`.`region_id` = `b`.`region_id`))) left join `core_zone` `j` on((`j`.`zone_id` = `b`.`zone_id`)));

-- --------------------------------------------------------

--
-- Estructura para la vista `view_product_list`
--
DROP TABLE IF EXISTS `view_product_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_product_list` AS select `a`.`product_id` AS `product_id`,`a`.`title` AS `title`,`a`.`organization_id` AS `organization_id`,`a`.`category_id` AS `category_id`,`a`.`brand_id` AS `brand_id`,`a`.`price` AS `price`,`a`.`width` AS `width`,`a`.`height` AS `height`,`a`.`depth` AS `depth`,`a`.`description` AS `description`,`a`.`status` AS `status`,`a`.`creation_date` AS `creation_date`,`a`.`modification_date` AS `modification_date`,`a`.`created_by` AS `created_by`,`a`.`updated_by` AS `updated_by`,`b`.`title` AS `category`,`c`.`name` AS `brand` from ((`product` `a` join `product_category` `b` on((`a`.`category_id` = `b`.`category_id`))) join `product_brand` `c` on((`a`.`brand_id` = `c`.`brand_id`))) order by `a`.`title`;

-- --------------------------------------------------------

--
-- Estructura para la vista `view_purchase_list`
--
DROP TABLE IF EXISTS `view_purchase_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_purchase_list` AS select `a`.`purchase_id` AS `purchase_id`,`a`.`quotation_id` AS `quotation_id`,`a`.`company_id` AS `company_id`,`a`.`branch_id` AS `branch_id`,`a`.`sender_id` AS `sender_id`,`a`.`receiver_id` AS `receiver_id`,`a`.`agent_id` AS `agent_id`,`a`.`status` AS `status`,`a`.`extra` AS `extra`,`a`.`creation_date` AS `creation_date`,`a`.`delivery_date` AS `purchase_delivery_date`,if((`a`.`purchase_date` = '0000-00-00'),`a`.`creation_date`,`a`.`purchase_date`) AS `purchase_date`,`a`.`monday_from` AS `monday_from`,`a`.`monday_to` AS `monday_to`,`a`.`tuesday_from` AS `tuesday_from`,`a`.`tuesday_to` AS `tuesday_to`,`a`.`wensday_from` AS `wensday_from`,`a`.`wensday_to` AS `wensday_to`,`a`.`thursday_from` AS `thursday_from`,`a`.`thursday_to` AS `thursday_to`,`a`.`friday_from` AS `friday_from`,`a`.`friday_to` AS `friday_to`,`a`.`saturday_from` AS `saturday_from`,`a`.`saturday_to` AS `saturday_to`,`a`.`sunday_from` AS `sunday_from`,`a`.`sunday_to` AS `sunday_to`,`b`.`creation_date` AS `creation_date_item`,`b`.`days` AS `days`,`a`.`organization_id` AS `organization_id`,`b`.`item_id` AS `item_id`,`b`.`product_id` AS `product_id`,`b`.`price` AS `price`,`b`.`quantity` AS `quantity`,`b`.`delivery_date` AS `delivery_date`,`c`.`title` AS `title`,`c`.`brand_id` AS `brand_id`,`c`.`category_id` AS `category_id`,`e`.`name` AS `company`,`e`.`cuit` AS `cuit`,`e`.`iva_id` AS `iva_id`,`o`.`name` AS `agent`,`o`.`email` AS `email`,`f`.`title` AS `category`,`g`.`name` AS `brand`,sum(`b`.`quantity`) AS `total_quantity`,`b`.`total` AS `total_item`,`a`.`total` AS `total_purchase`,if((`a`.`company_id` = `a`.`sender_id`),'Proveedor','Cliente') AS `role`,if((`a`.`company_id` = `a`.`sender_id`),'Y','N') AS `provider`,if((`a`.`company_id` = `a`.`receiver_id`),'Y','N') AS `customer`,`e`.`international` AS `international`,`a`.`additional_information` AS `additional_information`,`b`.`width` AS `width`,`b`.`height` AS `height`,`b`.`depth` AS `depth`,`c`.`width` AS `product_width`,`c`.`height` AS `product_height`,`c`.`depth` AS `product_depth` from ((((((`purchase` `a` join `purchase_item` `b` on((`b`.`purchase_id` = `a`.`purchase_id`))) join `product` `c` on((`b`.`product_id` = `c`.`product_id`))) join `company` `e` on((`a`.`company_id` = `e`.`company_id`))) join `product_category` `f` on((`f`.`category_id` = `c`.`category_id`))) join `product_brand` `g` on((`g`.`brand_id` = `c`.`brand_id`))) left join `company_agent` `o` on((`a`.`agent_id` = `o`.`agent_id`))) group by `b`.`item_id`;

-- --------------------------------------------------------

--
-- Estructura para la vista `view_quotation_list`
--
DROP TABLE IF EXISTS `view_quotation_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_quotation_list` AS select `a`.`quotation_id` AS `quotation_id`,`a`.`company_id` AS `company_id`,`a`.`branch_id` AS `branch_id`,`a`.`sender_id` AS `sender_id`,`a`.`receiver_id` AS `receiver_id`,`a`.`agent_id` AS `agent_id`,`a`.`status` AS `status`,`a`.`extra` AS `extra`,`a`.`additional_information` AS `additional_information`,`a`.`creation_date` AS `creation_date`,`a`.`expire_days` AS `expire_days`,`a`.`expire_date` AS `expire_date`,if((`a`.`quotation_date` = '0000-00-00'),`a`.`creation_date`,`a`.`quotation_date`) AS `quotation_date`,`b`.`creation_date` AS `creation_date_item`,`b`.`days` AS `days`,`a`.`organization_id` AS `organization_id`,`b`.`item_id` AS `item_id`,`b`.`product_id` AS `product_id`,`b`.`width` AS `width`,`b`.`height` AS `height`,`b`.`depth` AS `depth`,`b`.`price` AS `price`,`b`.`quantity` AS `quantity`,`b`.`delivery_date` AS `delivery_date`,`c`.`title` AS `title`,`c`.`brand_id` AS `brand_id`,`c`.`category_id` AS `category_id`,`e`.`name` AS `company`,`e`.`cuit` AS `cuit`,`e`.`iva_id` AS `iva_id`,`o`.`name` AS `agent`,`o`.`email` AS `email`,`f`.`title` AS `category`,`g`.`name` AS `brand`,sum(`b`.`quantity`) AS `total_quantity`,`b`.`total` AS `total_item`,`a`.`total` AS `total_quotation`,if((`a`.`company_id` = `a`.`sender_id`),'Proveedor','Cliente') AS `role`,if((`a`.`company_id` = `a`.`sender_id`),'Y','N') AS `provider`,if((`a`.`company_id` = `a`.`receiver_id`),'Y','N') AS `customer`,`e`.`international` AS `international`,`p`.`purchase_id` AS `purchase_id` from (((((((`quotation` `a` join `quotation_item` `b` on((`b`.`quotation_id` = `a`.`quotation_id`))) join `product` `c` on((`b`.`product_id` = `c`.`product_id`))) join `company` `e` on((`a`.`company_id` = `e`.`company_id`))) join `product_category` `f` on((`f`.`category_id` = `c`.`category_id`))) join `product_brand` `g` on((`g`.`brand_id` = `c`.`brand_id`))) left join `company_agent` `o` on((`a`.`agent_id` = `o`.`agent_id`))) left join `purchase` `p` on((`p`.`quotation_id` = `a`.`quotation_id`))) group by `b`.`item_id`;

-- --------------------------------------------------------

--
-- Estructura para la vista `view_truck_list`
--
DROP TABLE IF EXISTS `view_truck_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_truck_list` AS select `a`.`truck_id` AS `truck_id`,`a`.`driver_id` AS `driver_id`,`a`.`brand` AS `brand`,`a`.`model` AS `model`,`a`.`year` AS `year`,`a`.`plate` AS `plate`,`a`.`code` AS `code`,`a`.`capacity` AS `capacity`,`a`.`status` AS `status`,`a`.`creation_date` AS `creation_date`,`a`.`created_by` AS `created_by`,`a`.`last_update` AS `last_update`,`a`.`updated_by` AS `updated_by`,`a`.`organization_id` AS `organization_id`,concat(`b`.`last_name`,' ',`b`.`first_name`) AS `driver` from (`truck` `a` join `core_user` `b` on((`b`.`user_id` = `a`.`driver_id`)));

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id`),
  ADD KEY `name` (`name`),
  ADD KEY `cuit` (`cuit`);

--
-- Indices de la tabla `company_agent`
--
ALTER TABLE `company_agent`
  ADD PRIMARY KEY (`agent_id`);

--
-- Indices de la tabla `company_branch`
--
ALTER TABLE `company_branch`
  ADD PRIMARY KEY (`branch_id`);

--
-- Indices de la tabla `company_type`
--
ALTER TABLE `company_type`
  ADD PRIMARY KEY (`type_id`);

--
-- Indices de la tabla `core_country`
--
ALTER TABLE `core_country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indices de la tabla `core_group`
--
ALTER TABLE `core_group`
  ADD PRIMARY KEY (`group_id`);

--
-- Indices de la tabla `core_log_email`
--
ALTER TABLE `core_log_email`
  ADD PRIMARY KEY (`log_id`);

--
-- Indices de la tabla `core_log_error`
--
ALTER TABLE `core_log_error`
  ADD PRIMARY KEY (`log_id`);

--
-- Indices de la tabla `core_log_login`
--
ALTER TABLE `core_log_login`
  ADD PRIMARY KEY (`log_id`);

--
-- Indices de la tabla `core_menu`
--
ALTER TABLE `core_menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indices de la tabla `core_organization`
--
ALTER TABLE `core_organization`
  ADD PRIMARY KEY (`organization_id`);

--
-- Indices de la tabla `core_profile`
--
ALTER TABLE `core_profile`
  ADD PRIMARY KEY (`profile_id`);

--
-- Indices de la tabla `core_province`
--
ALTER TABLE `core_province`
  ADD PRIMARY KEY (`province_id`);

--
-- Indices de la tabla `core_region`
--
ALTER TABLE `core_region`
  ADD PRIMARY KEY (`region_id`);

--
-- Indices de la tabla `core_relation_group_profile`
--
ALTER TABLE `core_relation_group_profile`
  ADD PRIMARY KEY (`relation_id`);

--
-- Indices de la tabla `core_relation_menu_group`
--
ALTER TABLE `core_relation_menu_group`
  ADD PRIMARY KEY (`relation_id`);

--
-- Indices de la tabla `core_relation_menu_profile`
--
ALTER TABLE `core_relation_menu_profile`
  ADD PRIMARY KEY (`relation_id`);

--
-- Indices de la tabla `core_relation_user_group`
--
ALTER TABLE `core_relation_user_group`
  ADD PRIMARY KEY (`relation_id`),
  ADD KEY `admin_id` (`user_id`,`group_id`);

--
-- Indices de la tabla `core_relation_user_menu`
--
ALTER TABLE `core_relation_user_menu`
  ADD PRIMARY KEY (`relation_id`);

--
-- Indices de la tabla `core_user`
--
ALTER TABLE `core_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indices de la tabla `core_zone`
--
ALTER TABLE `core_zone`
  ADD PRIMARY KEY (`zone_id`);

--
-- Indices de la tabla `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `code` (`title`);

--
-- Indices de la tabla `product_brand`
--
ALTER TABLE `product_brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indices de la tabla `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indices de la tabla `product_image`
--
ALTER TABLE `product_image`
  ADD PRIMARY KEY (`image_id`);

--
-- Indices de la tabla `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`purchase_id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `receiver_id` (`receiver_id`),
  ADD KEY `purchase_id` (`purchase_id`);

--
-- Indices de la tabla `purchase_email`
--
ALTER TABLE `purchase_email`
  ADD PRIMARY KEY (`email_id`);

--
-- Indices de la tabla `purchase_file`
--
ALTER TABLE `purchase_file`
  ADD PRIMARY KEY (`file_id`);

--
-- Indices de la tabla `purchase_file_new`
--
ALTER TABLE `purchase_file_new`
  ADD PRIMARY KEY (`file_id`);

--
-- Indices de la tabla `purchase_item`
--
ALTER TABLE `purchase_item`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `quotation_id` (`purchase_id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `delivery_date` (`delivery_date`);

--
-- Indices de la tabla `quotation`
--
ALTER TABLE `quotation`
  ADD PRIMARY KEY (`quotation_id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `receiver_id` (`receiver_id`);

--
-- Indices de la tabla `quotation_email`
--
ALTER TABLE `quotation_email`
  ADD PRIMARY KEY (`email_id`);

--
-- Indices de la tabla `quotation_file`
--
ALTER TABLE `quotation_file`
  ADD PRIMARY KEY (`file_id`);

--
-- Indices de la tabla `quotation_file_new`
--
ALTER TABLE `quotation_file_new`
  ADD PRIMARY KEY (`file_id`);

--
-- Indices de la tabla `quotation_item`
--
ALTER TABLE `quotation_item`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `quotation_id` (`quotation_id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `delivery_date` (`delivery_date`);

--
-- Indices de la tabla `relation_company_broker`
--
ALTER TABLE `relation_company_broker`
  ADD PRIMARY KEY (`relation_id`);

--
-- Indices de la tabla `tax_iva_type`
--
ALTER TABLE `tax_iva_type`
  ADD PRIMARY KEY (`type_id`);

--
-- Indices de la tabla `truck`
--
ALTER TABLE `truck`
  ADD PRIMARY KEY (`truck_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `company`
--
ALTER TABLE `company`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `company_agent`
--
ALTER TABLE `company_agent`
  MODIFY `agent_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `company_branch`
--
ALTER TABLE `company_branch`
  MODIFY `branch_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `company_type`
--
ALTER TABLE `company_type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `core_country`
--
ALTER TABLE `core_country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `core_group`
--
ALTER TABLE `core_group`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT de la tabla `core_log_email`
--
ALTER TABLE `core_log_email`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT de la tabla `core_log_error`
--
ALTER TABLE `core_log_error`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=157837;
--
-- AUTO_INCREMENT de la tabla `core_log_login`
--
ALTER TABLE `core_log_login`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=141;
--
-- AUTO_INCREMENT de la tabla `core_menu`
--
ALTER TABLE `core_menu`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=145;
--
-- AUTO_INCREMENT de la tabla `core_organization`
--
ALTER TABLE `core_organization`
  MODIFY `organization_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `core_profile`
--
ALTER TABLE `core_profile`
  MODIFY `profile_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=366;
--
-- AUTO_INCREMENT de la tabla `core_province`
--
ALTER TABLE `core_province`
  MODIFY `province_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=245;
--
-- AUTO_INCREMENT de la tabla `core_region`
--
ALTER TABLE `core_region`
  MODIFY `region_id` int(11) NOT NULL AUTO_INCREMENT COMMENT ' ',AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT de la tabla `core_relation_group_profile`
--
ALTER TABLE `core_relation_group_profile`
  MODIFY `relation_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=199;
--
-- AUTO_INCREMENT de la tabla `core_relation_menu_group`
--
ALTER TABLE `core_relation_menu_group`
  MODIFY `relation_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=242;
--
-- AUTO_INCREMENT de la tabla `core_relation_menu_profile`
--
ALTER TABLE `core_relation_menu_profile`
  MODIFY `relation_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=639;
--
-- AUTO_INCREMENT de la tabla `core_relation_user_group`
--
ALTER TABLE `core_relation_user_group`
  MODIFY `relation_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=185;
--
-- AUTO_INCREMENT de la tabla `core_relation_user_menu`
--
ALTER TABLE `core_relation_user_menu`
  MODIFY `relation_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=588;
--
-- AUTO_INCREMENT de la tabla `core_user`
--
ALTER TABLE `core_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=98;
--
-- AUTO_INCREMENT de la tabla `core_zone`
--
ALTER TABLE `core_zone`
  MODIFY `zone_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT de la tabla `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `product_brand`
--
ALTER TABLE `product_brand`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `product_category`
--
ALTER TABLE `product_category`
  MODIFY `category_id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `product_image`
--
ALTER TABLE `product_image`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `purchase`
--
ALTER TABLE `purchase`
  MODIFY `purchase_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `purchase_email`
--
ALTER TABLE `purchase_email`
  MODIFY `email_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `purchase_file`
--
ALTER TABLE `purchase_file`
  MODIFY `file_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `purchase_file_new`
--
ALTER TABLE `purchase_file_new`
  MODIFY `file_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `purchase_item`
--
ALTER TABLE `purchase_item`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `quotation`
--
ALTER TABLE `quotation`
  MODIFY `quotation_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `quotation_email`
--
ALTER TABLE `quotation_email`
  MODIFY `email_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `quotation_file`
--
ALTER TABLE `quotation_file`
  MODIFY `file_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `quotation_file_new`
--
ALTER TABLE `quotation_file_new`
  MODIFY `file_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `quotation_item`
--
ALTER TABLE `quotation_item`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `relation_company_broker`
--
ALTER TABLE `relation_company_broker`
  MODIFY `relation_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=415;
--
-- AUTO_INCREMENT de la tabla `tax_iva_type`
--
ALTER TABLE `tax_iva_type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=141;
--
-- AUTO_INCREMENT de la tabla `truck`
--
ALTER TABLE `truck`
  MODIFY `truck_id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
