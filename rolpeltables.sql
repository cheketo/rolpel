-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-04-2018 a las 13:28:45
-- Versión del servidor: 5.5.54-0ubuntu0.14.04.1
-- Versión de PHP: 5.5.9-1ubuntu4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `roller`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `company`
--

CREATE TABLE IF NOT EXISTS `company` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
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
  `organization_id` int(11) NOT NULL,
  PRIMARY KEY (`company_id`),
  KEY `name` (`name`),
  KEY `cuit` (`cuit`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11694 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `company_agent`
--

CREATE TABLE IF NOT EXISTS `company_agent` (
  `agent_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `charge` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `extra` text COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  PRIMARY KEY (`agent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1323 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `company_branch`
--

CREATE TABLE IF NOT EXISTS `company_branch` (
  `branch_id` int(11) NOT NULL AUTO_INCREMENT,
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
  `creation_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  PRIMARY KEY (`branch_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5075 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `company_type`
--

CREATE TABLE IF NOT EXISTS `company_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A',
  `creation_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_log_email`
--

CREATE TABLE IF NOT EXISTS `core_log_email` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
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
  `organization_id` int(11) NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=44 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_log_error`
--

CREATE TABLE IF NOT EXISTS `core_log_error` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `error` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=157375 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_log_login`
--

CREATE TABLE IF NOT EXISTS `core_log_login` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) CHARACTER SET latin1 NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 NOT NULL,
  `ip` varchar(255) CHARACTER SET latin1 NOT NULL,
  `tries` int(11) NOT NULL,
  `event` varchar(255) CHARACTER SET latin1 NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=86 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `abstract_id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `rack` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `stock2` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `stock_pending` int(11) NOT NULL,
  `stock_min` int(11) NOT NULL,
  `stock_max` int(11) NOT NULL,
  `size` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `price2` decimal(10,2) NOT NULL,
  `price_fob` decimal(10,2) NOT NULL,
  `price_dispatch` decimal(10,2) NOT NULL,
  `dispatch` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `observations` text COLLATE utf8_unicode_ci NOT NULL,
  `order_number` int(11) NOT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A',
  `discontinued` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `modification_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creation_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `code` (`code`),
  KEY `abstract_id` (`abstract_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=50489 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_abstract`
--

CREATE TABLE IF NOT EXISTS `product_abstract` (
  `abstract_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order_number` int(11) NOT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A' COMMENT 'A=ACTIVO / I=INACTIVO',
  `relation_status` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A' COMMENT 'A=En Proceso, F=Todas las relaciones establecidas',
  `creation_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modification_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  PRIMARY KEY (`abstract_id`),
  UNIQUE KEY `code` (`code`),
  KEY `order_number` (`order_number`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12188 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_brand`
--

CREATE TABLE IF NOT EXISTS `product_brand` (
  `brand_id` int(11) NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_short` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `country_id` int(11) NOT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A',
  `creation_date` datetime NOT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1000 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_category`
--

CREATE TABLE IF NOT EXISTS `product_category` (
  `category_id` int(5) NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) NOT NULL,
  `parent_id` int(5) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `short_title` varchar(25) CHARACTER SET latin1 NOT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A',
  `creation_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `last_modification` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=164 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_comparation`
--

CREATE TABLE IF NOT EXISTS `product_comparation` (
  `comparation_id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_min` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A',
  `creation_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  PRIMARY KEY (`comparation_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contiene las comparaciones de listados de precios de los proveedores.' AUTO_INCREMENT=28 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_comparation_item`
--

CREATE TABLE IF NOT EXISTS `product_comparation_item` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
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
  `organization_id` int(11) NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=580 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_image`
--

CREATE TABLE IF NOT EXISTS `product_image` (
  `image_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `src` varchar(255) CHARACTER SET latin1 NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`image_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_relation`
--

CREATE TABLE IF NOT EXISTS `product_relation` (
  `relation_id` int(11) NOT NULL AUTO_INCREMENT,
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
  `organization_id` int(11) NOT NULL,
  PRIMARY KEY (`relation_id`),
  KEY `company_id` (`company_id`,`item_id`),
  KEY `code` (`code`),
  KEY `abstract_id` (`abstract_id`),
  KEY `brand_id` (`brand_id`),
  KEY `status` (`status`),
  KEY `import_id` (`import_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5055 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_relation_brand`
--

CREATE TABLE IF NOT EXISTS `product_relation_brand` (
  `brand_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `product_brand_id` int(11) NOT NULL,
  `import_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A',
  `creation_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modification_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6226 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_relation_import`
--

CREATE TABLE IF NOT EXISTS `product_relation_import` (
  `import_id` int(11) NOT NULL AUTO_INCREMENT,
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
  `organization_id` int(11) NOT NULL,
  PRIMARY KEY (`import_id`),
  KEY `company_id` (`company_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=48 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_relation_import_item`
--

CREATE TABLE IF NOT EXISTS `product_relation_import_item` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
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
  `organization_id` int(11) NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `import_id` (`import_id`),
  KEY `abstract_id` (`abstract_id`),
  KEY `brand_id` (`brand_id`),
  KEY `code` (`code`),
  KEY `price` (`price`),
  KEY `stock` (`stock`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=78429 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `quotation`
--

CREATE TABLE IF NOT EXISTS `quotation` (
  `quotation_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
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
  `organization_id` int(11) NOT NULL,
  PRIMARY KEY (`quotation_id`),
  KEY `company_id` (`company_id`),
  KEY `sender_id` (`sender_id`),
  KEY `receiver_id` (`receiver_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=69 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `quotation_email`
--

CREATE TABLE IF NOT EXISTS `quotation_email` (
  `email_id` int(11) NOT NULL AUTO_INCREMENT,
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
  `organization_id` int(11) NOT NULL,
  PRIMARY KEY (`email_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=20 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `quotation_file`
--

CREATE TABLE IF NOT EXISTS `quotation_file` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
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
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=42 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `quotation_file_new`
--

CREATE TABLE IF NOT EXISTS `quotation_file_new` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  `modification_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `organization_id` int(11) NOT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=151 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `quotation_item`
--

CREATE TABLE IF NOT EXISTS `quotation_item` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `quotation_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
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
  `organization_id` int(11) NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `quotation_id` (`quotation_id`),
  KEY `company_id` (`company_id`),
  KEY `product_id` (`product_id`),
  KEY `delivery_date` (`delivery_date`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1181 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `relation_company_broker`
--

CREATE TABLE IF NOT EXISTS `relation_company_broker` (
  `relation_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `broker_id` int(11) NOT NULL,
  `percentage_commission` decimal(4,2) NOT NULL,
  `organization_id` int(11) NOT NULL,
  PRIMARY KEY (`relation_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=415 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
