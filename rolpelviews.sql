-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-04-2018 a las 13:30:25
-- Versión del servidor: 5.5.54-0ubuntu0.14.04.1
-- Versión de PHP: 5.5.9-1ubuntu4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `rolpel`
--

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
,`code` varchar(255)
,`brand_id` int(11)
,`brand` varchar(255)
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
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `view_product_abstract_list`
--
CREATE TABLE IF NOT EXISTS `view_product_abstract_list` (
`abstract_id` int(11)
,`category_id` int(11)
,`code` varchar(255)
,`order_number` int(11)
,`status` char(1)
,`relation_status` char(1)
,`creation_date` datetime
,`created_by` int(11)
,`modification_date` timestamp
,`updated_by` int(11)
,`organization_id` int(11)
,`category` varchar(255)
,`product_id` int(11)
,`product_code` varchar(255)
,`product_stock` int(11)
,`product_price` decimal(10,2)
,`product_category_id` int(11)
,`product_brand_id` int(11)
,`product_category` varchar(255)
,`product_brand` varchar(255)
);
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `view_product_company_list`
--

-- CREATE ALGORITHM=UNDEFINED DEFINER=`rolpel`@`%` SQL SECURITY DEFINER VIEW `rolpel`.`view_product_company_list` AS select `a`.`relation_id` AS `relation_id`,`a`.`price` AS `price`,`a`.`code` AS `code`,`b`.`code` AS `local_code`,`b`.`price` AS `local_price`,ifnull(`c`.`name`,'Rolpel') AS `company`,`d`.`title` AS `category`,`e`.`name` AS `brand`,`a`.`product_id` AS `product_id`,`a`.`company_id` AS `company_id`,`b`.`brand_id` AS `brand_id`,`b`.`category_id` AS `category_id`,`c`.`international` AS `international`,`a`.`creation_date` AS `creation_date`,`a`.`created_by` AS `created_by`,`a`.`modification_date` AS `modification_date`,`a`.`updated_by` AS `updated_by`,`a`.`organization_id` AS `organization_id` from ((((`rolpel`.`product_company` `a` join `rolpel`.`product` `b` on((`a`.`product_id` = `b`.`product_id`))) left join `rolpel`.`company` `c` on((`a`.`company_id` = `c`.`company_id`))) join `rolpel`.`product_category` `d` on((`b`.`category_id` = `d`.`category_id`))) join `rolpel`.`product_brand` `e` on((`b`.`brand_id` = `e`.`brand_id`)));

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `view_product_comparation_list`
--
CREATE TABLE IF NOT EXISTS `view_product_comparation_list` (
`comparation_id` int(11)
,`stock_min` char(1)
,`status` char(1)
,`creation_date` datetime
,`created_by` int(11)
,`organization_id` int(11)
,`item_id` int(11)
,`relation_id` int(11)
,`company_id` int(11)
,`brand_id` int(11)
,`provider_brand_id` int(11)
,`product_id` int(11)
,`abstract_id` int(11)
,`code` varchar(255)
,`stock` int(11)
,`actual_stock` int(11)
,`abstract_stock` int(11)
,`actual_stock_diff` int(11)
,`abstract_stock_diff` int(11)
,`price` decimal(10,2)
,`currency_id` int(11)
,`currency` varchar(10)
,`dollar_exchange_rate` decimal(10,2)
,`position` int(5)
,`single_comparation` tinyint(1)
,`order_quantity` int(11)
,`item_status` char(1)
,`list_date` date
,`abstract_code` varchar(255)
,`product_code` varchar(255)
,`brand` varchar(255)
,`provider_brand` varchar(255)
,`company` varchar(255)
,`order_number` int(11)
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `view_product_list`
--
CREATE TABLE IF NOT EXISTS `view_product_list` (
`product_id` int(11)
,`organization_id` int(11)
,`category_id` int(11)
,`brand_id` int(11)
,`rack` varchar(255)
,`code` varchar(255)
,`order_number` int(11)
,`stock` int(11)
,`stock_pending` int(11)
,`stock_total` bigint(12)
,`stock_min` int(11)
,`stock_max` int(11)
,`size` varchar(255)
,`price` decimal(10,2)
,`price_fob` decimal(10,2)
,`price_dispatch` decimal(10,2)
,`dispatch` varchar(255)
,`description` text
,`status` char(1)
,`discontinued` char(1)
,`creation_date` datetime
,`modification_date` timestamp
,`created_by` int(11)
,`updated_by` int(11)
,`category` varchar(255)
,`brand` varchar(255)
,`abstract_id` int(11)
,`abstract_code` varchar(255)
,`abstract_order_number` int(11)
,`abstract_category` varchar(255)
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `view_product_relation_import_list`
--
CREATE TABLE IF NOT EXISTS `view_product_relation_import_list` (
`import_id` int(11)
,`company_id` int(11)
,`brand_id` int(11)
,`currency_id` int(11)
,`list_date` date
,`file` varchar(255)
,`name` varchar(255)
,`description` text
,`status` char(1)
,`creation_date` datetime
,`created_by` int(11)
,`organization_id` int(11)
,`item_status` char(1)
,`item_id` int(11)
,`abstract_id` int(11)
,`item_brand_id` int(11)
,`code` varchar(255)
,`price` decimal(10,2)
,`stock` int(11)
,`brand` varchar(255)
,`original_brand_id` int(11)
,`original_abstract_id` int(11)
,`original_code` varchar(255)
,`original_price` decimal(10,2)
,`original_stock` int(11)
,`abstract_code` varchar(255)
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `view_product_relation_list`
--
CREATE TABLE IF NOT EXISTS `view_product_relation_list` (
`relation_id` int(11)
,`company_id` int(11)
,`product_id` int(11)
,`item_id` int(11)
,`abstract_id` int(11)
,`import_id` int(11)
,`currency_id` int(11)
,`brand_id` int(11)
,`provider_brand_id` int(11)
,`code` varchar(255)
,`price` decimal(20,2)
,`stock` int(11)
,`status` char(1)
,`list_date` date
,`creation_date` datetime
,`modification_date` timestamp
,`created_by` int(11)
,`updated_by` int(11)
,`organization_id` int(11)
,`brand` varchar(255)
,`currency` varchar(255)
,`currency_prefix` varchar(10)
,`company` varchar(255)
,`abstract_code` varchar(255)
,`category_id` int(11)
,`product_code` varchar(255)
,`product_stock` int(11)
,`product_price` decimal(10,2)
,`order_number` int(11)
,`provider_brand` varchar(255)
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `view_quotation_list`
--
CREATE TABLE IF NOT EXISTS `view_quotation_list` (
`quotation_id` int(11)
,`company_id` int(11)
,`sender_id` int(11)
,`receiver_id` int(11)
,`agent_id` int(11)
,`currency_id` int(11)
,`type_id` int(11)
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
,`code` varchar(255)
,`order_number` int(11)
,`stock` int(11)
,`brand_id` int(11)
,`category_id` int(11)
,`stock_min` int(11)
,`company` varchar(255)
,`cuit` bigint(15)
,`iva_id` int(5)
,`agent` varchar(150)
,`email` varchar(150)
,`category` varchar(25)
,`brand` varchar(255)
,`currency` varchar(10)
,`currency_name` varchar(255)
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
-- Estructura para la vista `core_view_group_list`
--
DROP TABLE IF EXISTS `core_view_group_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`rolpel`@`%` SQL SECURITY DEFINER VIEW `core_view_group_list` AS select `a`.`group_id` AS `group_id`,`a`.`title` AS `title`,`a`.`organization_id` AS `organization_id`,`a`.`image` AS `image`,`a`.`status` AS `status`,`a`.`created_by` AS `created_by`,`a`.`creation_date` AS `creation_date`,`b`.`profile_id` AS `profile_id`,`c`.`title` AS `profile`,`a`.`last_modification` AS `last_modification` from ((`core_group` `a` join `core_relation_group_profile` `b` on((`a`.`group_id` = `b`.`group_id`))) join `core_profile` `c` on((`b`.`profile_id` = `c`.`profile_id`))) group by `a`.`group_id` order by `a`.`title`;

-- --------------------------------------------------------

--
-- Estructura para la vista `core_view_menu_list`
--
DROP TABLE IF EXISTS `core_view_menu_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`rolpel`@`%` SQL SECURITY DEFINER VIEW `core_view_menu_list` AS select `a`.`menu_id` AS `menu_id`,`a`.`parent_id` AS `parent_id`,`a`.`icon` AS `icon`,`a`.`title` AS `title`,`a`.`link` AS `link`,if((`a`.`link` = '#'),'Sin link',substr(`a`.`link`,10)) AS `link_text`,`a`.`position` AS `position`,`a`.`public` AS `public`,if((`a`.`public` = 'Y'),'Público','Privado') AS `public_text`,`a`.`view_status` AS `view_status`,if((`a`.`view_status` = 'O'),'Oculto','Visible') AS `view_status_text`,`a`.`status` AS `status`,`a`.`organization_id` AS `organization_id`,`d`.`title` AS `profile`,`e`.`title` AS `group_title`,`b`.`profile_id` AS `profile_id`,`c`.`group_id` AS `group_id` from ((((`core_menu` `a` left join `core_relation_menu_profile` `b` on((`a`.`menu_id` = `b`.`menu_id`))) left join `core_relation_menu_group` `c` on((`a`.`menu_id` = `c`.`menu_id`))) left join `core_profile` `d` on((`d`.`profile_id` = `b`.`profile_id`))) left join `core_group` `e` on((`e`.`group_id` = `c`.`group_id`))) where (1 = 1) group by `a`.`menu_id` order by `a`.`title`;

-- --------------------------------------------------------

--
-- Estructura para la vista `core_view_profile_list`
--
DROP TABLE IF EXISTS `core_view_profile_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`rolpel`@`%` SQL SECURITY DEFINER VIEW `core_view_profile_list` AS select `a`.`profile_id` AS `profile_id`,`a`.`organization_id` AS `organization_id`,`a`.`title` AS `title`,`a`.`status` AS `status`,`a`.`image` AS `image`,`a`.`creation_date` AS `creation_date`,`a`.`created_by` AS `created_by`,`a`.`last_modification` AS `last_modification`,`b`.`group_id` AS `group_id`,`c`.`title` AS `group_title` from ((`core_profile` `a` join `core_relation_group_profile` `b` on((`a`.`profile_id` = `b`.`profile_id`))) join `core_group` `c` on((`b`.`group_id` = `c`.`group_id`))) group by `a`.`profile_id` order by `a`.`title`;

-- --------------------------------------------------------

--
-- Estructura para la vista `core_view_user_list`
--
DROP TABLE IF EXISTS `core_view_user_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`rolpel`@`%` SQL SECURITY DEFINER VIEW `core_view_user_list` AS select `a`.`user_id` AS `user_id`,`a`.`organization_id` AS `organization_id`,`a`.`user` AS `user`,`a`.`password` AS `password`,`a`.`first_name` AS `first_name`,`a`.`last_name` AS `last_name`,concat(`a`.`first_name`,' ',`a`.`last_name`) AS `full_name`,concat(`a`.`first_name`,' ',`a`.`last_name`,' (',`a`.`user`,')') AS `full_user_name`,`a`.`email` AS `email`,`a`.`profile_id` AS `profile_id`,`a`.`img` AS `img`,`a`.`status` AS `status`,`a`.`tries` AS `tries`,`a`.`last_access` AS `last_access`,`a`.`creation_date` AS `creation_date`,`a`.`creator_id` AS `creator_id`,`p`.`title` AS `profile`,coalesce(`g`.`title`,'') AS `group_title`,coalesce(`g`.`group_id`,0) AS `group_id` from (((`core_user` `a` left join `core_relation_user_group` `r` on((`r`.`user_id` = `a`.`user_id`))) left join `core_group` `g` on((`r`.`group_id` = `g`.`group_id`))) left join `core_profile` `p` on((`p`.`profile_id` = `a`.`profile_id`))) where (1 = 1) group by `a`.`user_id` order by `a`.`first_name`;

-- --------------------------------------------------------

--
-- Estructura para la vista `view_brand_list`
--
DROP TABLE IF EXISTS `view_brand_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`rolpel`@`%` SQL SECURITY DEFINER VIEW `view_brand_list` AS select `a`.`brand_id` AS `brand_id`,`b`.`product_id` AS `product_id`,`c`.`category_id` AS `category_id`,`a`.`organization_id` AS `organization_id`,`a`.`name` AS `name`,`b`.`code` AS `code`,`a`.`status` AS `status`,`a`.`creation_date` AS `creation_date`,`c`.`title` AS `category` from ((`product_brand` `a` left join `product` `b` on((`b`.`brand_id` = `a`.`brand_id`))) left join `product_category` `c` on((`c`.`category_id` = `b`.`category_id`))) order by `a`.`name`;

-- --------------------------------------------------------

--
-- Estructura para la vista `view_category_list`
--
DROP TABLE IF EXISTS `view_category_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`rolpel`@`%` SQL SECURITY DEFINER VIEW `view_category_list` AS select `a`.`category_id` AS `category_id`,`a`.`organization_id` AS `organization_id`,`a`.`parent_id` AS `parent_id`,`a`.`title` AS `title`,`a`.`short_title` AS `short_title`,`a`.`status` AS `status`,`a`.`creation_date` AS `creation_date`,`a`.`created_by` AS `created_by`,`a`.`updated_by` AS `updated_by`,`a`.`last_modification` AS `last_modification`,coalesce(`b`.`title`,'Sin Padre') AS `parent`,coalesce(`b`.`short_title`,'Sin Padre') AS `parent_short`,`c`.`code` AS `code`,`c`.`brand_id` AS `brand_id`,`d`.`name` AS `brand` from (((`product_category` `a` left join `product_category` `b` on((`a`.`parent_id` = `b`.`category_id`))) left join `product` `c` on((`c`.`category_id` = `a`.`category_id`))) left join `product_brand` `d` on((`c`.`brand_id` = `d`.`brand_id`)));

-- --------------------------------------------------------

--
-- Estructura para la vista `view_company_list`
--
DROP TABLE IF EXISTS `view_company_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`rolpel`@`%` SQL SECURITY DEFINER VIEW `view_company_list` AS select `a`.`company_id` AS `company_id`,`a`.`old_id` AS `old_id`,`b`.`branch_id` AS `branch_id`,`e`.`broker_id` AS `broker_id`,`a`.`type_id` AS `type_id`,`a`.`organization_id` AS `organization_id`,`a`.`name` AS `name`,`d`.`name` AS `type`,`a`.`cuit` AS `cuit`,`a`.`iva_id` AS `iva_id`,`t`.`name` AS `iva`,`a`.`iibb` AS `iibb`,`a`.`international` AS `international`,if((`a`.`international` = 'N'),'Nacional','Extranjero') AS `international_text`,`a`.`vat` AS `vat`,`a`.`customer` AS `customer`,`a`.`provider` AS `provider`,if(((`a`.`customer` = 'Y') and (`a`.`provider` = 'Y')),'Cliente y Proveedor',if((`a`.`customer` = 'Y'),'Cliente','Proveedor')) AS `relation_text`,`a`.`logo` AS `logo`,`a`.`status` AS `status`,`a`.`balance` AS `balance`,`b`.`name` AS `branch`,`b`.`address` AS `address`,`b`.`postal_code` AS `postal_code`,`b`.`phone` AS `phone`,`b`.`email` AS `email`,`b`.`website` AS `website`,`b`.`fax` AS `fax`,`b`.`main_branch` AS `main_branch`,`b`.`country_id` AS `country_id`,`g`.`name` AS `country`,`g`.`short_name` AS `country_short`,`b`.`province_id` AS `province_id`,`h`.`name` AS `province`,`h`.`short_name` AS `province_short`,`b`.`region_id` AS `region_id`,`i`.`name` AS `region`,`i`.`short_name` AS `region_short`,`b`.`zone_id` AS `zone_id`,`j`.`name` AS `zone`,`j`.`short_name` AS `zone_short`,`b`.`lat` AS `lat`,`b`.`lng` AS `lng`,coalesce(`f`.`full_name`,'Sin Corredor') AS `broker`,coalesce(`f`.`email`,'') AS `broker_email`,coalesce(`f`.`img`,'') AS `broker_img`,`a`.`creation_date` AS `creation_date`,`a`.`last_update` AS `last_update`,`a`.`created_by` AS `created_by`,`a`.`updated_by` AS `updated_by` from (((((((((`company` `a`) join `company_type` `d` on((`d`.`type_id` = `a`.`type_id`))) join `company_branch` `b` on((`a`.`company_id` = `b`.`company_id`))) left join `relation_company_broker` `e` on((`e`.`branch_id` = `b`.`branch_id`))) left join `core_view_user_list` `f` on((`f`.`user_id` = `e`.`broker_id`))) left join `core_country` `g` on((`g`.`country_id` = `b`.`country_id`))) left join `core_province` `h` on((`h`.`province_id` = `b`.`province_id`))) left join `core_region` `i` on((`i`.`region_id` = `b`.`region_id`))) left join `core_zone` `j` on((`j`.`zone_id` = `b`.`zone_id`))) where (1 = 1) order by `a`.`name`;

-- --------------------------------------------------------

--
-- Estructura para la vista `view_product_abstract_list`
--
DROP TABLE IF EXISTS `view_product_abstract_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`rolpel`@`%` SQL SECURITY DEFINER VIEW `view_product_abstract_list` AS select `a`.`abstract_id` AS `abstract_id`,`a`.`category_id` AS `category_id`,`a`.`code` AS `code`,`a`.`order_number` AS `order_number`,`a`.`status` AS `status`,`a`.`relation_status` AS `relation_status`,`a`.`creation_date` AS `creation_date`,`a`.`created_by` AS `created_by`,`a`.`modification_date` AS `modification_date`,`a`.`updated_by` AS `updated_by`,`a`.`organization_id` AS `organization_id`,`b`.`title` AS `category`,`c`.`product_id` AS `product_id`,`c`.`code` AS `product_code`,`c`.`stock` AS `product_stock`,`c`.`price` AS `product_price`,`c`.`category_id` AS `product_category_id`,`c`.`brand_id` AS `product_brand_id`,`d`.`title` AS `product_category`,`e`.`name` AS `product_brand` from ((((`product_abstract` `a` FORCE INDEX (PRIMARY) left join `product` `c` FORCE INDEX (`abstract_id`) on((`c`.`abstract_id` = `a`.`abstract_id`))) left join `product_category` `b` on((`b`.`category_id` = `a`.`category_id`))) left join `product_category` `d` on((`d`.`category_id` = `c`.`category_id`))) left join `product_brand` `e` on((`e`.`brand_id` = `c`.`brand_id`))) order by `a`.`code`,`c`.`code`;

-- --------------------------------------------------------

--
-- Estructura para la vista `view_product_comparation_list`
--
DROP TABLE IF EXISTS `view_product_comparation_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`rolpel`@`%` SQL SECURITY DEFINER VIEW `view_product_comparation_list` AS select `a`.`comparation_id` AS `comparation_id`,`a`.`stock_min` AS `stock_min`,`a`.`status` AS `status`,`a`.`creation_date` AS `creation_date`,`a`.`created_by` AS `created_by`,`a`.`organization_id` AS `organization_id`,`b`.`item_id` AS `item_id`,`c`.`relation_id` AS `relation_id`,`c`.`company_id` AS `company_id`,`c`.`brand_id` AS `brand_id`,`c`.`provider_brand_id` AS `provider_brand_id`,`c`.`product_id` AS `product_id`,`c`.`abstract_id` AS `abstract_id`,`c`.`code` AS `code`,`b`.`stock` AS `stock`,`b`.`actual_stock` AS `actual_stock`,`b`.`abstract_stock` AS `abstract_stock`,`b`.`actual_stock_diff` AS `actual_stock_diff`,`b`.`abstract_stock_diff` AS `abstract_stock_diff`,`b`.`price` AS `price`,`d`.`currency_id` AS `currency_id`,`d`.`prefix` AS `currency`,`b`.`dollar_exchange_rate` AS `dollar_exchange_rate`,`b`.`position` AS `position`,`b`.`single_comparation` AS `single_comparation`,`b`.`order_quantity` AS `order_quantity`,`b`.`status` AS `item_status`,`b`.`list_date` AS `list_date`,`c`.`abstract_code` AS `abstract_code`,`c`.`product_code` AS `product_code`,`c`.`brand` AS `brand`,`c`.`provider_brand` AS `provider_brand`,`c`.`company` AS `company`,`c`.`order_number` AS `order_number` from (((`product_comparation` `a` left join `product_comparation_item` `b` on((`b`.`comparation_id` = `a`.`comparation_id`))) join `currency` `d` on((`d`.`currency_id` = `b`.`currency_id`))) left join `view_product_relation_list` `c` on((`c`.`relation_id` = `b`.`relation_id`))) group by `b`.`item_id`,`a`.`comparation_id` order by `a`.`comparation_id`,`b`.`item_id`;

-- --------------------------------------------------------

--
-- Estructura para la vista `view_product_list`
--
DROP TABLE IF EXISTS `view_product_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`rolpel`@`%` SQL SECURITY DEFINER VIEW `view_product_list` AS select `a`.`product_id` AS `product_id`,`a`.`organization_id` AS `organization_id`,`a`.`category_id` AS `category_id`,`a`.`brand_id` AS `brand_id`,`a`.`rack` AS `rack`,`a`.`code` AS `code`,`a`.`order_number` AS `order_number`,`a`.`stock` AS `stock`,`a`.`stock_pending` AS `stock_pending`,(`a`.`stock` + `a`.`stock_pending`) AS `stock_total`,`a`.`stock_min` AS `stock_min`,`a`.`stock_max` AS `stock_max`,`a`.`size` AS `size`,`a`.`price` AS `price`,`a`.`price_fob` AS `price_fob`,`a`.`price_dispatch` AS `price_dispatch`,`a`.`dispatch` AS `dispatch`,`a`.`description` AS `description`,`a`.`status` AS `status`,`a`.`discontinued` AS `discontinued`,`a`.`creation_date` AS `creation_date`,`a`.`modification_date` AS `modification_date`,`a`.`created_by` AS `created_by`,`a`.`updated_by` AS `updated_by`,`b`.`title` AS `category`,`c`.`name` AS `brand`,`a`.`abstract_id` AS `abstract_id`,`d`.`code` AS `abstract_code`,`d`.`order_number` AS `abstract_order_number`,`e`.`title` AS `abstract_category` from ((((`product` `a` join `product_category` `b` on((`a`.`category_id` = `b`.`category_id`))) join `product_brand` `c` on((`a`.`brand_id` = `c`.`brand_id`))) left join `product_abstract` `d` on((`d`.`abstract_id` = `a`.`abstract_id`))) left join `product_category` `e` on((`e`.`category_id` = `d`.`category_id`))) order by `a`.`code`;

-- --------------------------------------------------------

--
-- Estructura para la vista `view_product_relation_import_list`
--
DROP TABLE IF EXISTS `view_product_relation_import_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`rolpel`@`%` SQL SECURITY DEFINER VIEW `view_product_relation_import_list` AS select `a`.`import_id` AS `import_id`,`a`.`company_id` AS `company_id`,`a`.`brand_id` AS `brand_id`,`a`.`currency_id` AS `currency_id`,`a`.`list_date` AS `list_date`,`a`.`file` AS `file`,`a`.`name` AS `name`,`a`.`description` AS `description`,`a`.`status` AS `status`,`a`.`creation_date` AS `creation_date`,`a`.`created_by` AS `created_by`,`a`.`organization_id` AS `organization_id`,`b`.`status` AS `item_status`,`b`.`item_id` AS `item_id`,`b`.`abstract_id` AS `abstract_id`,`b`.`brand_id` AS `item_brand_id`,`b`.`code` AS `code`,`b`.`price` AS `price`,`b`.`stock` AS `stock`,`b`.`brand` AS `brand`,`b`.`original_brand_id` AS `original_brand_id`,`b`.`original_abstract_id` AS `original_abstract_id`,`b`.`original_code` AS `original_code`,`b`.`original_price` AS `original_price`,`b`.`original_stock` AS `original_stock`,ifnull(`c`.`code`,'') AS `abstract_code` from ((`product_relation_import` `a` join `product_relation_import_item` `b` on((`b`.`import_id` = `a`.`import_id`))) left join `product_abstract` `c` on((`c`.`abstract_id` = `b`.`abstract_id`)));

-- --------------------------------------------------------

--
-- Estructura para la vista `view_product_relation_list`
--
DROP TABLE IF EXISTS `view_product_relation_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`rolpel`@`%` SQL SECURITY DEFINER VIEW `view_product_relation_list` AS select `a`.`relation_id` AS `relation_id`,`a`.`company_id` AS `company_id`,`a`.`product_id` AS `product_id`,`a`.`item_id` AS `item_id`,`a`.`abstract_id` AS `abstract_id`,`a`.`import_id` AS `import_id`,`a`.`currency_id` AS `currency_id`,`a`.`brand_id` AS `brand_id`,`a`.`provider_brand_id` AS `provider_brand_id`,`a`.`code` AS `code`,`a`.`price` AS `price`,`a`.`stock` AS `stock`,`a`.`status` AS `status`,`a`.`list_date` AS `list_date`,`a`.`creation_date` AS `creation_date`,`a`.`modification_date` AS `modification_date`,`a`.`created_by` AS `created_by`,`a`.`updated_by` AS `updated_by`,`a`.`organization_id` AS `organization_id`,`b`.`name` AS `brand`,`c`.`title` AS `currency`,`c`.`prefix` AS `currency_prefix`,`d`.`name` AS `company`,`e`.`code` AS `abstract_code`,`e`.`category_id` AS `category_id`,`f`.`code` AS `product_code`,`f`.`stock` AS `product_stock`,`f`.`price` AS `product_price`,`f`.`order_number` AS `order_number`,`g`.`name` AS `provider_brand` from ((((((`product_relation` `a` FORCE INDEX (PRIMARY) join `product_brand` `b` on((`b`.`brand_id` = `a`.`brand_id`))) join `currency` `c` on((`c`.`currency_id` = `a`.`currency_id`))) join `company` `d` on((`d`.`company_id` = `a`.`company_id`))) left join `product_abstract` `e` on((`e`.`abstract_id` = `a`.`abstract_id`))) left join `product` `f` on((`f`.`product_id` = `a`.`product_id`))) left join `product_relation_brand` `g` on((`g`.`brand_id` = `a`.`provider_brand_id`))) order by `a`.`company_id`,`a`.`code`,`b`.`name`;

-- --------------------------------------------------------

--
-- Estructura para la vista `view_quotation_list`
--
DROP TABLE IF EXISTS `view_quotation_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`rolpel`@`%` SQL SECURITY DEFINER VIEW `view_quotation_list` AS select `a`.`quotation_id` AS `quotation_id`,`a`.`company_id` AS `company_id`,`a`.`sender_id` AS `sender_id`,`a`.`receiver_id` AS `receiver_id`,`a`.`agent_id` AS `agent_id`,`a`.`currency_id` AS `currency_id`,`a`.`type_id` AS `type_id`,`a`.`status` AS `status`,`a`.`extra` AS `extra`,`a`.`creation_date` AS `creation_date`,`a`.`expire_days` AS `expire_days`,`a`.`expire_date` AS `expire_date`,if((`a`.`quotation_date` = '0000-00-00'),`a`.`creation_date`,`a`.`quotation_date`) AS `quotation_date`,`b`.`creation_date` AS `creation_date_item`,`b`.`days` AS `days`,`a`.`organization_id` AS `organization_id`,`b`.`item_id` AS `item_id`,`b`.`product_id` AS `product_id`,`b`.`price` AS `price`,`b`.`quantity` AS `quantity`,`b`.`delivery_date` AS `delivery_date`,`c`.`code` AS `code`,`c`.`order_number` AS `order_number`,`c`.`stock` AS `stock`,`c`.`brand_id` AS `brand_id`,`c`.`category_id` AS `category_id`,`c`.`stock_min` AS `stock_min`,`e`.`name` AS `company`,`e`.`cuit` AS `cuit`,`e`.`iva_id` AS `iva_id`,`o`.`name` AS `agent`,`o`.`email` AS `email`,`f`.`short_title` AS `category`,`g`.`name` AS `brand`,`h`.`prefix` AS `currency`,`h`.`title` AS `currency_name`,sum(`b`.`quantity`) AS `total_quantity`,`b`.`total` AS `total_item`,`a`.`total` AS `total_quotation`,if((`a`.`company_id` = `a`.`sender_id`),'Proveedor','Cliente') AS `role`,if((`a`.`company_id` = `a`.`sender_id`),'Y','N') AS `provider`,if((`a`.`company_id` = `a`.`receiver_id`),'Y','N') AS `customer`,`e`.`international` AS `international`,`p`.`purchase_id` AS `purchase_id` from ((((((((`quotation` `a` join `quotation_item` `b` on((`b`.`quotation_id` = `a`.`quotation_id`))) join `product` `c` on((`b`.`product_id` = `c`.`product_id`))) join `company` `e` on((`a`.`company_id` = `e`.`company_id`))) join `product_category` `f` on((`f`.`category_id` = `c`.`category_id`))) join `product_brand` `g` on((`g`.`brand_id` = `c`.`brand_id`))) join `currency` `h` on((`h`.`currency_id` = `a`.`currency_id`))) left join `company_agent` `o` on((`a`.`agent_id` = `o`.`agent_id`))) left join `purchase` `p` on((`p`.`quotation_id` = `a`.`quotation_id`))) group by `b`.`item_id`;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
