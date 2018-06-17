-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-04-2018 a las 13:27:15
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
-- Estructura de tabla para la tabla `core_country`
--

CREATE TABLE IF NOT EXISTS `core_country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `short_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lat` float NOT NULL,
  `lng` float NOT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `core_country`
--

INSERT INTO `core_country` (`country_id`, `name`, `short_name`, `lat`, `lng`) VALUES
(1, 'Argentina', 'AR', 0, 0),
(2, 'México', 'MX', 0, 0),
(3, 'Singapur', 'SG', 0, 0),
(4, 'Japón', 'JP', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_group`
--

CREATE TABLE IF NOT EXISTS `core_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET latin1 NOT NULL,
  `image` varchar(255) CHARACTER SET latin1 NOT NULL,
  `status` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'A',
  `creation_date` datetime NOT NULL,
  `last_modification` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=18 ;

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
(13, 1, 'Familia', '../../../../skin/images/groups/13/img1858540103.jpeg', 'A', '2017-06-19 14:41:41', '2017-06-19 14:41:41', 0),
(14, 1, 'Almacén', '../../../../skin/images/groups/group1065666482.jpeg', 'A', '2017-07-07 23:21:12', '2017-07-07 23:21:12', 0),
(15, 1, 'Almacén 2', '../../../../skin/images/groups/group371665875.png', 'A', '2017-07-07 23:25:31', '2017-07-07 23:25:31', 0),
(16, 1, 'Almacenero', '../../../../skin/images/groups/group2774159538.png', 'A', '2017-07-07 23:31:50', '2017-07-07 23:31:50', 0),
(17, 1, 'Grupo2.0', '../../../../skin/images/groups/17/img1174666529.png', 'A', '2017-07-15 21:09:24', '2017-07-15 21:09:24', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_menu`
--

CREATE TABLE IF NOT EXISTS `core_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET latin1 NOT NULL,
  `link` varchar(255) CHARACTER SET latin1 NOT NULL,
  `icon` varchar(255) CHARACTER SET latin1 NOT NULL,
  `position` int(11) NOT NULL,
  `public` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'Y',
  `status` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'A',
  `view_status` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'A',
  `organization_id` int(11) NOT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=137 ;

--
-- Volcado de datos para la tabla `core_menu`
--

INSERT INTO `core_menu` (`menu_id`, `parent_id`, `title`, `link`, `icon`, `position`, `public`, `status`, `view_status`, `organization_id`) VALUES
(1, 0, 'Administración', '#', 'fa-desktop', 9999, 'N', 'A', 'A', 0),
(2, 53, 'Artículos', '#', 'fa-cube', 85, 'N', 'A', 'A', 1),
(3, 53, 'Líneas', '#', 'fa-sitemap', 3, 'N', 'A', 'A', 1),
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
(18, 2, 'Listado de Artículos', '../../../project/modules/product/list.php', 'fa-list-ul', 3, 'N', 'A', 'A', 1),
(19, 2, 'Crear Artículo', '../../../project/modules/product/new.php', 'fa-plus-square', 0, 'N', 'A', 'A', 1),
(20, 5, 'Usuarios Eliminados', '../user/list.php?status=I', 'fa-trash', 4, 'N', 'A', 'A', 0),
(21, 6, 'Nuevo Perfil', '../profile/new.php', 'fa-plus-square', 1, 'N', 'A', 'A', 0),
(22, 3, 'Listado de Líneas', '../../../project/modules/category/list.php', 'fa-list-ul', 2, 'N', 'A', 'A', 1),
(23, 3, 'Nueva Línea', '../../../project/modules/category/new.php', 'fa-plus-square', 1, 'N', 'A', 'A', 1),
(24, 3, 'Líneas Eliminadas', '../../../project/modules/category/list.php?status=I', 'fa-trash', 9, 'N', 'A', 'A', 1),
(25, 2, 'Artículos Eliminados', '../../../project/modules/product/list.php?status=I', 'fa-trash', 9, 'N', 'A', 'A', 1),
(26, 7, 'Nuevo Grupo', '../../../core/modules/group/new.php', 'fa-plus-square', 1, 'N', 'A', 'A', 0),
(27, 7, 'Listado de Grupos', '../../../core/modules/group/list.php', 'fa-list-ul', 2, 'N', 'A', 'A', 0),
(28, 7, 'Editar Grupo', '../../../core/modules/group/edit.php', 'fa-pencil', 3, 'N', 'A', 'O', 0),
(29, 8, 'Switcher', '../menu/switcher.php', '', 9, 'N', 'A', 'O', 0),
(30, 0, 'Pepepito', '../modulo/pepe2php', 'fa-magic', 678, 'Y', 'I', 'O', 1),
(31, 6, 'Perfiles Eliminados', '../profile/list.php?status=I', 'fa-trash', 3, 'N', 'A', 'A', 0),
(32, 8, 'Menúes Eliminados', '../menu/list.php?status=I', 'fa-trash', 3, 'N', 'A', 'A', 0),
(33, 7, 'Grupos Eliminados', '../../../core/modules/group/list.php?status=I', 'fa-trash', 3, 'N', 'A', 'A', 0),
(34, 5, 'Mi Perfil', '../user/profile.php', 'fa-child', 4, 'Y', 'A', 'O', 0),
(35, 6, 'Editar Perfil', '../../../core/modules/profile/edit.php', 'fa-pencil', 3, 'N', 'A', 'O', 0),
(36, 61, 'Clientes Prueba', '#', 'fa-suitcase', 90, 'N', 'A', 'A', 1),
(37, 36, 'Nuevo Cliente', '../customer_test/new.php', 'fa-plus', 1, 'N', 'I', 'A', 1),
(38, 36, 'Listado de Clientes', '../customer_test/list.php', 'fa-bars', 2, 'N', 'I', 'A', 1),
(39, 36, 'Cuenta Corriente', '../customer_test/account.php', 'fa-dollar', 3, 'N', 'A', 'A', 1),
(40, 1, 'Geolocalización', '#', 'fa-globe', 5, 'N', 'A', 'A', 1),
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
(53, 0, 'Artículos', '#', 'fa-cubes', 0, 'N', 'A', 'A', 1),
(55, 54, 'Nacionales', '#', 'fa-flag', 1, 'N', 'A', 'A', 1),
(56, 54, 'Internacionales', '#', 'fa-globe', 2, 'N', 'A', 'A', 1),
(57, 2, 'Editar Artículo', '../../../project/modules/product/edit.php', 'fa-pencil', 3, 'N', 'A', 'O', 1),
(58, 55, 'Crear Proveedor', '../provider_national/new.php', 'fa-plus-square', 1, 'N', 'I', 'A', 1),
(59, 55, 'Editar Proveedor', '../provider_national/edit.php', 'fa-pencil-square', 4, 'N', 'I', 'O', 1),
(60, 55, 'Listado de Proveedores', '../provider_national/list.php', 'fa-list-ul', 2, 'N', 'I', 'A', 1),
(61, 0, 'Pruebas', '#', 'fa-bug', 9999, 'N', 'A', 'O', 1),
(62, 61, 'Listado', '../prueba/list.php', 'fa-bed', 3, 'N', 'A', 'A', 1),
(63, 0, 'Clientes', '#', 'fa-industry', 3, 'N', 'A', 'O', 1),
(64, 67, 'Nuevo Cliente', '../customer_national/new.php', 'fa-plus-square', 1, 'N', 'I', 'A', 1),
(65, 67, 'Listado de Clientes', '../customer_national/list.php', 'fa-align-justify', 2, 'N', 'I', 'A', 1),
(66, 67, 'Editar Cliente', '../customer_national/edit.php', 'fa-pencil', 0, 'N', 'I', 'O', 1),
(67, 63, 'Nacionales', '#', 'fa-flag', 1, 'N', 'A', 'A', 1),
(68, 63, 'Internacionales', '#', 'fa-globe', 2, 'N', 'A', 'A', 1),
(69, 0, 'Ventas', '#', 'fa-dollar', 2, 'N', 'A', 'O', 1),
(70, 0, 'Estadísticas', '#', 'fa-area-chart', 15, 'N', 'A', 'A', 1),
(71, 53, 'Stock', '#', 'fa-th', 0, 'N', 'A', 'A', 1),
(72, 71, 'Modificar Stock', '#', 'fa-qrcode', 0, 'N', 'A', 'A', 1),
(73, 107, 'Nueva Orden', '../../../er_national_order/new.php?status=A', 'fa-ambulance', 1, 'N', 'A', 'A', 1),
(74, 76, 'Ordenes Sin Confirmar', '../provider_national_order/list.php?status=P', 'fa-shopping-cart', 2, 'N', 'I', 'A', 1),
(75, 102, 'Editar Cotización', '../../../project/modules/quotation/edit.php', 'fa-clipboard', 12, 'N', 'A', 'O', 1),
(76, 0, 'Ordenes de Compra', '#', 'fa-truck', 10, 'N', 'A', 'A', 1),
(77, 107, 'Ordenes Pedidas', '../../../er_national_order/list.php?status=A', 'fa-truck', 3, 'N', 'A', 'A', 1),
(78, 107, 'Historial de Ordenes', '../../../er_national_order/list.php?status=F', 'fa-hourglass-half', 6, 'N', 'A', 'A', 1),
(79, 71, 'Ingresos Pendientes', '../stock/stock_pending.php?status=A', 'fa-sign-in', 5, 'N', 'A', 'A', 1),
(80, 76, 'Generar Factura', '../../../er_national_order/invoice.php', 'fa-file-text', 99, 'N', 'A', 'O', 1),
(81, 76, 'Ordenes a Controlar', '../provider_national_order/list.php?status=S', 'fa-list-alt', 4, 'N', 'I', 'A', 1),
(82, 76, 'Ordenes Pend. Ingreso', '../provider_national_order/list.php?status=C', 'fa-sign-in', 4, 'N', 'I', 'A', 1),
(83, 0, 'Facturación', '#', 'fa-file-text', 2, 'N', 'A', 'A', 1),
(84, 83, 'A Proveedores', '#', 'fa-building', 2, 'N', 'A', 'A', 1),
(85, 84, 'Pendientes', '../provider_national_invoice/list.php?status=P&operation=2', 'fa-exclamation-circle', 1, 'N', 'A', 'A', 1),
(86, 84, 'En Proceso', '../provider_national_invoice/list.php?status=A&operation=2', 'fa-inbox', 2, 'N', 'A', 'A', 1),
(87, 84, 'Archivo', '../provider_national_invoice/list.php?status=F&operation=2', 'fa-archive', 3, 'N', 'A', 'A', 1),
(88, 71, 'Ingreso de Stock', '../stock/stock_entrance.php', 'fa-sign-in', 5, 'N', 'A', 'O', 1),
(89, 55, 'Cotizaciones (Viejo)', '#', 'fa-clipboard', 3, 'N', 'A', 'A', 1),
(90, 89, 'Nueva Cotización', '../provider_national_order/new.php?status=P', 'fa-cart-plus', 1, 'N', 'A', 'A', 1),
(91, 89, 'Cotizaciones Activas', '../provider_national_order/list.php?status=P', 'fa-shopping-cart', 2, 'N', 'A', 'A', 1),
(92, 89, 'Cotizaciones Archivadas', '../provider_national_order/list.php?status=Z', 'fa-archive', 5, 'N', 'A', 'A', 1),
(93, 76, 'Ver Detalle', '../provider_national_order/view.php', 'fa-eye', 99, 'N', 'A', 'O', 1),
(94, 1, 'Configuración', '#', 'fa-cogs', 90, 'N', 'I', 'A', 0),
(95, 94, 'Datos de la Empresa', '../configuration_company/edit.php?id=1', 'fa-home', 1, 'N', 'I', 'A', 0),
(96, 84, 'Cargar Factura', '../provider_national_invoice/fill.php', 'fa-download', 99, 'N', 'A', 'O', 1),
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
(121, 53, 'Artículos Genéricos', '#', 'fa-certificate', 80, 'N', 'A', 'A', 1),
(122, 121, 'Nuevo Artículo', '../../../project/modules/product_abstract/new.php', 'fa-plus-square', 1, 'N', 'A', 'A', 1),
(123, 121, 'Editar Artículo Genérico', '../../../project/modules/product_abstract/edit.php', 'fa-pencil-square', 0, 'N', 'A', 'O', 1),
(124, 121, 'Listado de Artículos Pen.', '../../../project/modules/product_abstract/list.php?relation_status=A', 'fa-certificate', 4, 'N', 'A', 'A', 1),
(125, 53, 'Listas de Precios', '#', 'fa-tag', 70, 'N', 'A', 'A', 1),
(126, 125, 'Importar', '../../../project/modules/product_price_list/import.php', 'fa-database', 5, 'N', 'A', 'A', 1),
(127, 121, 'Listado de Artículos Fin.', '../../../project/modules/product_abstract/list.php?relation_status=F', 'fa-check', 6, 'N', 'A', 'A', 1),
(128, 125, 'Listado de Artículos', '../../../project/modules/product_price_list/list.php', 'fa-list-ul', 1, 'N', 'A', 'A', 1),
(129, 125, 'Nueva Relación', '../../../project/modules/product_price_list/new.php', 'fa-plus-square', 1, 'N', 'A', 'A', 1),
(130, 125, 'Comparar Listas de Precio', '#', 'fa-copy', 20, 'N', 'A', 'A', 1),
(131, 130, 'Nueva Comparación', '../../../project/modules/product_comparation/new.php', 'fa-clone', 1, 'N', 'A', 'A', 1),
(132, 130, 'Ver Comparaciones', '../../../project/modules/product_comparation/list.php', 'fa-list-ul', 5, 'N', 'A', 'A', 1),
(133, 0, 'Configuración', '#', 'fa-cogs', 97, 'N', 'A', 'A', 1),
(134, 133, 'Monedas', '#', 'fa-money', 2, 'N', 'A', 'A', 1),
(135, 134, 'Nueva Moneda', '../../../project/modules/currency/new.php', 'fa-plus-square', 1, 'N', 'A', 'A', 1),
(136, 134, 'Listado de Monedas', '../../../project/modules/currency/list.php', 'fa-list-ul', 5, 'N', 'A', 'A', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_organization`
--

CREATE TABLE IF NOT EXISTS `core_organization` (
  `organization_id` int(11) NOT NULL AUTO_INCREMENT,
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
  `loader_text` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`organization_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `core_organization`
--

INSERT INTO `core_organization` (`organization_id`, `name`, `corporate_name`, `logo`, `icon`, `address`, `postal_code`, `zone_id`, `region_id`, `province_id`, `country_id`, `lat`, `lng`, `cuit`, `gross_income_tax`, `iva`, `email`, `phone`, `fax`, `website`, `loader_text`) VALUES
(1, 'Roller Service', '', '../../../../skin/images/configuration/company/company.jpeg', 'cog', 'Av. Caseros 3217', 'C1437', 10, 10, 6, 1, '-34.6376643999999900000000000000', '-58.4095608999999740000000000000', 33647656779, '33647656779', 1, 'ventas@rollerservice.com.ar', '(54 11) 4912-1100 (L. Rotativas)', '(54 11) 4912-1100', 'www.rollerservice.com.ar', 'Roller <i class="fa fa-cog animated faa-spin faa-fast"></i> Service'),
(2, 'Pepe Autos', '', '', 'car', '', '', 0, 0, 0, 0, '0.0000000000000000000000000000', '0.0000000000000000000000000000', 0, '', 0, '', '', '', '', 'Pepe <i class="fa fa-car faa-tada animated"></i> Autos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_profile`
--

CREATE TABLE IF NOT EXISTS `core_profile` (
  `profile_id` int(11) NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET latin1 NOT NULL,
  `image` varchar(255) CHARACTER SET latin1 NOT NULL,
  `status` char(1) CHARACTER SET latin1 DEFAULT 'A',
  `creation_date` datetime NOT NULL,
  `last_modification` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`profile_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=366 ;

--
-- Volcado de datos para la tabla `core_profile`
--

INSERT INTO `core_profile` (`profile_id`, `organization_id`, `title`, `image`, `status`, `creation_date`, `last_modification`, `created_by`) VALUES
(333, 1, 'Superadministrador', '../../../../skin/images/profiles/333/img2664104487.jpeg', 'A', '2013-03-03 03:03:03', '2017-07-16 19:56:37', 0),
(350, 1, 'Prueba', '../../../skin/images/profiles/default/profilegen.jpg', 'I', '2016-04-06 20:03:28', '2016-10-25 01:35:58', 0),
(351, 1, 'Pepe', '../../../skin/images/profiles/default/profilegen.jpg', 'I', '2016-04-06 20:05:21', '2016-10-25 01:35:58', 0),
(352, 1, 'Joni', '../../../skin/images/profiles/default/profilegen.jpg', 'I', '2016-04-08 00:10:19', '2016-10-25 01:35:58', 0),
(353, 1, 'Pruebas Administrador', '../../../skin/images/profiles/default/profilegen.jpg', 'I', '2016-04-11 02:56:59', '2016-11-24 14:41:21', 0),
(354, 1, 'Asd', '../../../skin/images/profiles/default/profilegen.jpg', 'I', '2016-04-11 04:29:43', '2016-10-25 01:35:58', 0),
(355, 1, 'Pruebas', '../../../skin/images/profiles/default/profilegen.jpg', 'I', '2016-10-21 09:02:22', '2016-10-25 19:38:15', 0),
(356, 1, 'Grupo de Prueba', '../../../skin/images/profiles/default/profilegen.jpg', 'I', '2016-10-24 21:38:49', '2016-10-25 01:35:58', 0),
(357, 1, 'Grupo de Prueba', '../../../skin/images/profiles/default/profilegen.jpg', 'I', '2016-10-24 21:44:29', '2016-10-25 19:34:16', 0),
(358, 1, 'Perfil de Prueba', '../../../skin/images/profiles/default/profilegen.jpg', 'I', '2016-10-25 01:34:23', '2016-10-25 19:37:53', 0),
(359, 1, 'Contador', '../../../../skin/images/profiles/359/img854718760.png', 'A', '2016-11-11 19:56:40', '2017-07-16 19:55:08', 0),
(360, 1, 'Dueño', '../../../../skin/images/profiles/360/img2753993.png', 'A', '2016-11-24 14:42:53', '2017-07-16 19:54:10', 0),
(361, 1, 'Corredor', '../../../../skin/images/profiles/361/img379997310.png', 'A', '2017-01-18 14:25:14', '2017-07-16 19:58:02', 0),
(362, 1, 'Empleado', '../../../../skin/images/profiles/362/img2068641655.jpeg', 'A', '2017-06-19 15:27:23', '2017-07-16 19:54:53', 0),
(363, 1, 'Externo', '', 'I', '2017-07-07 23:15:45', '2017-07-07 23:17:45', 0),
(364, 1, 'Externo2', '../../../skin/images/profiles/profile109244029.png', 'A', '2017-07-07 23:17:35', '2017-07-07 23:17:35', 0),
(365, 1, 'TestAle', '../../../../skin/images/profiles/365/img1023976385.png', 'A', '2017-07-15 23:04:19', '2017-07-16 19:57:11', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_province`
--

CREATE TABLE IF NOT EXISTS `core_province` (
  `province_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `short_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lat` float NOT NULL,
  `lng` float NOT NULL,
  PRIMARY KEY (`province_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=243 ;

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
(242, 4, 'Shizuoka-ken', 'Shizuoka-ken', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_region`
--

CREATE TABLE IF NOT EXISTS `core_region` (
  `region_id` int(11) NOT NULL AUTO_INCREMENT COMMENT ' ',
  `province_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `short_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`region_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=26 ;

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
(25, 19, 1, 'Comuna 4', 'Comuna 4');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_relation_group_profile`
--

CREATE TABLE IF NOT EXISTS `core_relation_group_profile` (
  `relation_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  PRIMARY KEY (`relation_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=160 ;

--
-- Volcado de datos para la tabla `core_relation_group_profile`
--

INSERT INTO `core_relation_group_profile` (`relation_id`, `group_id`, `profile_id`) VALUES
(150, 12, 365),
(149, 11, 365),
(27, 10, 355),
(148, 7, 365),
(139, 17, 362),
(159, 17, 360),
(146, 17, 333),
(129, 5, 364),
(119, 6, 364),
(131, 7, 364),
(145, 13, 333),
(138, 15, 362),
(137, 11, 362),
(144, 11, 333),
(153, 17, 359),
(158, 13, 360),
(151, 17, 361),
(136, 9, 362),
(74, 17, 364),
(147, 6, 365),
(143, 9, 333),
(142, 7, 333),
(141, 6, 333);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_relation_menu_group`
--

CREATE TABLE IF NOT EXISTS `core_relation_menu_group` (
  `relation_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`relation_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci AUTO_INCREMENT=226 ;

--
-- Volcado de datos para la tabla `core_relation_menu_group`
--

INSERT INTO `core_relation_menu_group` (`relation_id`, `menu_id`, `group_id`) VALUES
(223, 134, 13),
(222, 133, 13),
(216, 13, 5),
(219, 19, 5),
(87, 7, 10),
(225, 136, 13),
(208, 7, 12),
(207, 29, 11),
(206, 17, 11),
(205, 10, 11),
(204, 9, 11),
(203, 8, 11),
(224, 135, 13),
(199, 7, 11),
(218, 18, 5),
(213, 30, 5),
(198, 13, 9),
(217, 25, 5),
(132, 13, 8),
(197, 65, 13),
(196, 64, 13),
(195, 66, 13),
(194, 67, 13),
(221, 63, 13),
(220, 53, 15),
(154, 71, 15),
(155, 79, 15),
(156, 88, 15),
(161, 71, 14),
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
  `relation_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  PRIMARY KEY (`relation_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=409 ;

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
(273, 36, 333),
(306, 12, 359),
(107, 7, 357),
(307, 16, 359),
(407, 135, 360),
(406, 134, 360),
(114, 5, 353),
(115, 11, 353),
(116, 12, 353),
(117, 16, 353),
(118, 20, 353),
(120, 4, 353),
(121, 21, 353),
(122, 31, 353),
(405, 133, 360),
(124, 7, 353),
(305, 11, 359),
(308, 20, 359),
(404, 94, 360),
(304, 5, 359),
(129, 8, 353),
(130, 9, 353),
(131, 10, 353),
(132, 17, 353),
(133, 32, 353),
(134, 29, 353),
(303, 1, 359),
(148, 6, 353),
(149, 13, 353),
(403, 1, 360),
(402, 116, 360),
(401, 113, 360),
(400, 112, 360),
(399, 115, 360),
(398, 104, 360),
(397, 102, 360),
(396, 25, 360),
(395, 18, 360),
(394, 19, 360),
(393, 2, 360),
(392, 127, 360),
(391, 124, 360),
(390, 122, 360),
(272, 46, 333),
(302, 92, 359),
(389, 121, 360),
(271, 39, 333),
(301, 91, 359),
(388, 126, 360),
(270, 38, 333),
(387, 129, 360),
(269, 37, 333),
(317, 89, 359),
(386, 128, 360),
(268, 30, 333),
(385, 125, 360),
(384, 51, 360),
(191, 71, 364),
(192, 72, 364),
(193, 79, 364),
(260, 97, 362),
(259, 92, 362),
(258, 91, 362),
(257, 59, 362),
(256, 60, 362),
(255, 58, 362),
(299, 55, 359),
(383, 52, 360),
(281, 97, 361),
(254, 55, 362),
(205, 91, 364),
(382, 50, 360),
(381, 24, 360),
(280, 92, 361),
(380, 23, 360),
(210, 92, 364),
(297, 13, 359),
(379, 3, 360),
(279, 91, 361),
(252, 13, 362),
(215, 97, 364),
(315, 63, 365),
(277, 83, 365),
(316, 69, 365),
(378, 53, 360),
(274, 13, 365),
(377, 13, 360),
(408, 136, 360);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_relation_user_group`
--

CREATE TABLE IF NOT EXISTS `core_relation_user_group` (
  `relation_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`relation_id`),
  KEY `admin_id` (`user_id`,`group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=165 ;

--
-- Volcado de datos para la tabla `core_relation_user_group`
--

INSERT INTO `core_relation_user_group` (`relation_id`, `user_id`, `group_id`) VALUES
(5, 39, 4),
(13, 43, 4),
(21, 48, 4),
(27, 55, 4),
(164, 93, 13),
(162, 92, 13),
(35, 64, 4),
(155, 83, 17),
(160, 91, 6),
(159, 80, 11),
(161, 91, 11),
(148, 82, 13),
(147, 81, 13),
(158, 80, 13),
(153, 88, 7),
(152, 87, 5),
(144, 88, 6),
(149, 8, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_relation_user_menu`
--

CREATE TABLE IF NOT EXISTS `core_relation_user_menu` (
  `relation_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`relation_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=588 ;

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
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
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
  `creator_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=94 ;

--
-- Volcado de datos para la tabla `core_user`
--

INSERT INTO `core_user` (`user_id`, `organization_id`, `user`, `password`, `first_name`, `last_name`, `email`, `phone`, `profile_id`, `img`, `status`, `tries`, `last_access`, `creation_date`, `creator_id`) VALUES
(1, 1, 'mmattolini', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Miguel A.', 'Mattolini', '', '061-978058/066636', 361, '', 'A', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(2, 1, 'jlborgonovo', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'José Luis', 'Borgonovo', '', '4557-2764', 361, '', 'A', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(8, 1, 'cheketo', '49e09dc76bf5ba6fdcbfb710a7d8842d867bad54', 'Alejandro', 'Romero', 'romero.m.alejandro@gmail.com', '', 333, '../../../../skin/images/users/default/default21.png', 'A', 0, '2018-04-26 19:36:35', '0000-00-00 00:00:00', 0),
(80, 1, 'hernan', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Hernan', 'Balboa', 'hernanbalboa@gmail.com', '', 333, '../../../../skin/images/users/80/img251180822__8.png', 'A', 0, '2018-03-22 10:54:34', '2016-11-17 20:52:43', 8),
(81, 1, 'pablo', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Pablo', 'Balboa', 'pablo.balboa@rollerservice.com.ar', '', 360, '../../../skin/images/users/default/default11.png', 'A', 0, '2016-12-02 14:19:22', '2016-11-24 14:43:55', 8),
(82, 1, 'gonza', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Gonzalo', 'Balboa', 'gonzalobalboa@gmail.com', '', 360, '../../../skin/images/users/default/default13.png', 'A', 0, '2016-11-30 01:11:49', '2016-11-24 14:50:14', 8),
(90, 2, 'cheketo', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Alejandro', 'Romero', 'romero.m.alejandro@gmail.com', '', 333, '', 'A', 0, '2018-04-26 19:36:35', '2017-07-14 11:29:34', 0),
(93, 1, 'pbalboa', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Pedro', 'Balboa', 'pedro.balboa@rollerservice.com.ar', '', 360, '../../../../skin/images/users/93/img251180822__8.png', 'A', 0, '2018-01-06 20:45:03', '2017-10-31 20:39:57', 8),
(3, 1, 'ldominguez', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Lidia', 'Dominguez', '', '4492-5541', 361, '', 'A', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(13, 0, 'jazzato', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Jorge', 'Azzato', '', '4585-2350', 361, '', 'A', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_zone`
--

CREATE TABLE IF NOT EXISTS `core_zone` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `region_id` int(11) NOT NULL,
  `province_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `short_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=28 ;

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
(27, 0, 242, 4, 'Fukuroi-shi', 'Fukuroi-shi');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `currency`
--

CREATE TABLE IF NOT EXISTS `currency` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prefix` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `dollar_exchange` decimal(14,6) NOT NULL,
  `api_code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `afip_code` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A',
  `last_api_refresh` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `modification_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `organization_id` int(11) NOT NULL,
  PRIMARY KEY (`currency_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `currency`
--

INSERT INTO `currency` (`currency_id`, `title`, `prefix`, `dollar_exchange`, `api_code`, `afip_code`, `status`, `last_api_refresh`, `created_by`, `creation_date`, `updated_by`, `modification_date`, `organization_id`) VALUES
(1, 'Dolar', 'U$D', '1.000000', 'USD', '', 'A', '2018-04-27 00:00:05', 0, '0000-00-00 00:00:00', 8, '2018-04-27 03:00:05', 1),
(2, 'Peso', '$', '20.530001', 'ARS', '001', 'A', '2018-04-27 00:00:05', 0, '0000-00-00 00:00:00', 8, '2018-04-27 03:00:05', 1),
(3, 'Euro', '&euro;', '0.825401', 'EUR', '060', 'A', '2018-04-27 00:00:05', 0, '0000-00-00 00:00:00', 8, '2018-04-27 03:00:05', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `currency_exchange_history`
--

CREATE TABLE IF NOT EXISTS `currency_exchange_history` (
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `currency_id` int(11) NOT NULL,
  `dollar_exchange` decimal(14,6) NOT NULL,
  `currency_date` date NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`history_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=152 ;

--
-- Volcado de datos para la tabla `currency_exchange_history`
--

INSERT INTO `currency_exchange_history` (`history_id`, `currency_id`, `dollar_exchange`, `currency_date`, `creation_date`, `created_by`) VALUES
(1, 3, '0.813200', '0000-00-00', '2018-03-21 19:15:31', 8),
(2, 1, '1.000000', '0000-00-00', '2018-03-22 11:48:26', 80),
(3, 2, '20.259001', '0000-00-00', '2018-03-22 11:48:26', 80),
(4, 3, '0.811501', '0000-00-00', '2018-03-22 11:48:26', 80),
(5, 1, '1.000000', '0000-00-00', '2018-03-23 12:41:36', 8),
(6, 2, '20.200001', '0000-00-00', '2018-03-23 12:41:36', 8),
(7, 3, '0.809897', '0000-00-00', '2018-03-23 12:41:36', 8),
(8, 1, '1.000000', '0000-00-00', '2018-03-26 17:25:37', 8),
(9, 2, '20.169001', '0000-00-00', '2018-03-26 17:25:37', 8),
(10, 3, '0.803203', '0000-00-00', '2018-03-26 17:25:37', 8),
(11, 1, '1.000000', '0000-00-00', '2018-03-27 19:38:09', 8),
(12, 2, '20.167008', '0000-00-00', '2018-03-27 19:38:09', 8),
(13, 3, '0.806041', '0000-00-00', '2018-03-27 19:38:09', 8),
(14, 1, '1.000000', '0000-00-00', '2018-03-28 18:43:16', 8),
(15, 2, '20.129004', '0000-00-00', '2018-03-28 18:43:16', 8),
(16, 3, '0.811600', '0000-00-00', '2018-03-28 18:43:16', 8),
(17, 1, '1.000000', '0000-00-00', '2018-04-03 18:30:02', 8),
(18, 2, '20.169904', '0000-00-00', '2018-04-03 18:30:02', 8),
(19, 3, '0.814998', '0000-00-00', '2018-04-03 18:30:02', 8),
(20, 1, '1.000000', '0000-00-00', '2018-04-04 13:58:18', 8),
(21, 2, '20.200001', '0000-00-00', '2018-04-04 13:58:18', 8),
(22, 3, '0.813103', '0000-00-00', '2018-04-04 13:58:18', 8),
(23, 1, '1.000000', '0000-00-00', '2018-04-21 23:10:20', 8),
(24, 2, '20.172001', '0000-00-00', '2018-04-21 23:10:20', 8),
(25, 3, '0.813804', '0000-00-00', '2018-04-21 23:10:20', 8),
(26, 1, '1.000000', '0000-00-00', '2018-04-22 20:21:59', 8),
(27, 2, '20.172969', '0000-00-00', '2018-04-22 20:21:59', 8),
(28, 3, '0.814902', '0000-00-00', '2018-04-22 20:21:59', 8),
(29, 1, '1.000000', '0000-00-00', '2018-04-23 23:37:44', 8),
(30, 2, '20.229904', '0000-00-00', '2018-04-23 23:37:44', 8),
(31, 3, '0.818806', '0000-00-00', '2018-04-23 23:37:44', 8),
(32, 1, '1.000000', '0000-00-00', '2018-04-24 00:53:44', 8),
(33, 2, '20.229641', '0000-00-00', '2018-04-24 00:53:44', 8),
(34, 3, '0.818802', '0000-00-00', '2018-04-24 00:53:44', 8),
(35, 1, '1.000000', '0000-00-00', '2018-04-24 02:45:30', 8),
(36, 2, '20.230307', '0000-00-00', '2018-04-24 02:45:30', 8),
(37, 3, '0.818897', '0000-00-00', '2018-04-24 02:45:30', 8),
(38, 1, '1.000000', '0000-00-00', '2018-04-24 02:46:38', 8),
(39, 2, '20.230307', '0000-00-00', '2018-04-24 02:46:38', 8),
(40, 3, '0.818897', '0000-00-00', '2018-04-24 02:46:38', 8),
(41, 1, '1.000000', '0000-00-00', '2018-04-24 02:47:42', 8),
(42, 2, '20.230307', '0000-00-00', '2018-04-24 02:47:42', 8),
(43, 3, '0.818897', '0000-00-00', '2018-04-24 02:47:42', 8),
(44, 1, '1.000000', '0000-00-00', '2018-04-24 02:49:01', 8),
(45, 2, '20.230307', '0000-00-00', '2018-04-24 02:49:01', 8),
(46, 3, '0.818897', '0000-00-00', '2018-04-24 02:49:01', 8),
(47, 1, '1.000000', '0000-00-00', '2018-04-24 02:49:50', 8),
(48, 2, '20.230307', '0000-00-00', '2018-04-24 02:49:50', 8),
(49, 3, '0.818897', '0000-00-00', '2018-04-24 02:49:50', 8),
(50, 1, '1.000000', '0000-00-00', '2018-04-24 02:52:03', 8),
(51, 2, '20.230307', '0000-00-00', '2018-04-24 02:52:03', 8),
(52, 3, '0.818897', '0000-00-00', '2018-04-24 02:52:03', 8),
(53, 1, '1.000000', '0000-00-00', '2018-04-24 02:52:11', 8),
(54, 2, '20.230307', '0000-00-00', '2018-04-24 02:52:11', 8),
(55, 3, '0.818897', '0000-00-00', '2018-04-24 02:52:11', 8),
(56, 1, '1.000000', '0000-00-00', '2018-04-24 02:53:03', 8),
(57, 2, '20.230307', '0000-00-00', '2018-04-24 02:53:03', 8),
(58, 3, '0.818897', '0000-00-00', '2018-04-24 02:53:03', 8),
(59, 1, '1.000000', '0000-00-00', '2018-04-24 02:53:54', 8),
(60, 2, '20.230307', '0000-00-00', '2018-04-24 02:53:54', 8),
(61, 3, '0.818897', '0000-00-00', '2018-04-24 02:53:54', 8),
(62, 1, '1.000000', '0000-00-00', '2018-04-24 02:55:38', 8),
(63, 2, '20.230307', '0000-00-00', '2018-04-24 02:55:38', 8),
(64, 3, '0.818897', '0000-00-00', '2018-04-24 02:55:38', 8),
(65, 1, '1.000000', '0000-00-00', '2018-04-24 02:56:07', 8),
(66, 2, '20.230307', '0000-00-00', '2018-04-24 02:56:07', 8),
(67, 3, '0.818897', '0000-00-00', '2018-04-24 02:56:07', 8),
(68, 1, '1.000000', '0000-00-00', '2018-04-24 02:56:32', 8),
(69, 2, '20.230307', '0000-00-00', '2018-04-24 02:56:32', 8),
(70, 3, '0.818897', '0000-00-00', '2018-04-24 02:56:32', 8),
(71, 1, '1.000000', '0000-00-00', '2018-04-24 02:57:03', 8),
(72, 2, '20.230307', '0000-00-00', '2018-04-24 02:57:03', 8),
(73, 3, '0.818897', '0000-00-00', '2018-04-24 02:57:03', 8),
(74, 1, '1.000000', '0000-00-00', '2018-04-24 03:15:27', 8),
(75, 2, '20.230307', '0000-00-00', '2018-04-24 03:15:27', 8),
(76, 3, '0.818897', '0000-00-00', '2018-04-24 03:15:27', 8),
(77, 1, '1.000000', '0000-00-00', '2018-04-26 05:56:14', 8),
(78, 2, '20.231001', '0000-00-00', '2018-04-26 05:56:14', 8),
(79, 3, '0.820800', '0000-00-00', '2018-04-26 05:56:14', 8),
(80, 1, '1.000000', '0000-00-00', '2018-04-27 01:50:59', 8),
(81, 2, '20.530001', '0000-00-00', '2018-04-27 01:50:59', 8),
(82, 3, '0.825802', '0000-00-00', '2018-04-27 01:50:59', 8),
(83, 1, '1.000000', '0000-00-00', '2018-04-27 02:00:17', 8),
(84, 2, '20.530001', '0000-00-00', '2018-04-27 02:00:17', 8),
(85, 3, '0.825802', '0000-00-00', '2018-04-27 02:00:17', 8),
(86, 1, '1.000000', '0000-00-00', '2018-04-27 02:00:38', 8),
(87, 2, '20.530001', '0000-00-00', '2018-04-27 02:00:38', 8),
(88, 3, '0.825802', '0000-00-00', '2018-04-27 02:00:38', 8),
(89, 1, '1.000000', '0000-00-00', '2018-04-27 02:05:50', 8),
(90, 2, '20.530001', '0000-00-00', '2018-04-27 02:05:50', 8),
(91, 3, '0.825698', '0000-00-00', '2018-04-27 02:05:50', 8),
(92, 1, '1.000000', '0000-00-00', '2018-04-27 02:06:29', 8),
(93, 2, '20.530001', '0000-00-00', '2018-04-27 02:06:29', 8),
(94, 3, '0.825698', '0000-00-00', '2018-04-27 02:06:29', 8),
(95, 1, '1.000000', '0000-00-00', '2018-04-27 02:06:53', 8),
(96, 2, '20.530001', '0000-00-00', '2018-04-27 02:06:53', 8),
(97, 3, '0.825698', '0000-00-00', '2018-04-27 02:06:53', 8),
(98, 1, '1.000000', '0000-00-00', '2018-04-27 02:10:03', 8),
(99, 2, '20.530001', '0000-00-00', '2018-04-27 02:10:03', 8),
(100, 3, '0.825698', '0000-00-00', '2018-04-27 02:10:03', 8),
(101, 1, '1.000000', '0000-00-00', '2018-04-27 02:11:17', 8),
(102, 2, '20.530001', '0000-00-00', '2018-04-27 02:11:17', 8),
(103, 3, '0.825698', '0000-00-00', '2018-04-27 02:11:17', 8),
(104, 1, '1.000000', '0000-00-00', '2018-04-27 02:11:31', 8),
(105, 2, '20.530001', '0000-00-00', '2018-04-27 02:11:31', 8),
(106, 3, '0.825698', '0000-00-00', '2018-04-27 02:11:31', 8),
(107, 1, '1.000000', '0000-00-00', '2018-04-27 02:11:48', 8),
(108, 2, '20.530001', '0000-00-00', '2018-04-27 02:11:48', 8),
(109, 3, '0.825698', '0000-00-00', '2018-04-27 02:11:48', 8),
(110, 1, '1.000000', '0000-00-00', '2018-04-27 02:15:02', 8),
(111, 2, '20.530001', '0000-00-00', '2018-04-27 02:15:02', 8),
(112, 3, '0.825698', '0000-00-00', '2018-04-27 02:15:02', 8),
(113, 1, '1.000000', '0000-00-00', '2018-04-27 02:15:41', 8),
(114, 2, '20.530001', '0000-00-00', '2018-04-27 02:15:41', 8),
(115, 3, '0.825698', '0000-00-00', '2018-04-27 02:15:41', 8),
(116, 1, '1.000000', '0000-00-00', '2018-04-27 02:31:02', 8),
(117, 2, '20.530001', '0000-00-00', '2018-04-27 02:31:02', 8),
(118, 3, '0.825698', '0000-00-00', '2018-04-27 02:31:02', 8),
(119, 1, '1.000000', '0000-00-00', '2018-04-27 02:47:20', 8),
(120, 2, '20.530001', '0000-00-00', '2018-04-27 02:47:20', 8),
(121, 3, '0.825698', '0000-00-00', '2018-04-27 02:47:20', 8),
(122, 1, '1.000000', '0000-00-00', '2018-04-27 02:47:50', 8),
(123, 2, '20.530001', '0000-00-00', '2018-04-27 02:47:50', 8),
(124, 3, '0.825698', '0000-00-00', '2018-04-27 02:47:50', 8),
(125, 1, '1.000000', '0000-00-00', '2018-04-27 02:49:05', 8),
(126, 2, '20.530001', '0000-00-00', '2018-04-27 02:49:05', 8),
(127, 3, '0.825698', '0000-00-00', '2018-04-27 02:49:05', 8),
(128, 1, '1.000000', '0000-00-00', '2018-04-27 02:49:17', 8),
(129, 2, '20.530001', '0000-00-00', '2018-04-27 02:49:17', 8),
(130, 3, '0.825698', '0000-00-00', '2018-04-27 02:49:17', 8),
(131, 1, '1.000000', '0000-00-00', '2018-04-27 02:49:32', 8),
(132, 2, '20.530001', '0000-00-00', '2018-04-27 02:49:32', 8),
(133, 3, '0.825698', '0000-00-00', '2018-04-27 02:49:32', 8),
(134, 1, '1.000000', '0000-00-00', '2018-04-27 02:49:47', 8),
(135, 2, '20.530001', '0000-00-00', '2018-04-27 02:49:47', 8),
(136, 3, '0.825698', '0000-00-00', '2018-04-27 02:49:47', 8),
(137, 1, '1.000000', '0000-00-00', '2018-04-27 02:51:07', 8),
(138, 2, '20.530001', '0000-00-00', '2018-04-27 02:51:07', 8),
(139, 3, '0.825698', '0000-00-00', '2018-04-27 02:51:07', 8),
(140, 1, '1.000000', '0000-00-00', '2018-04-27 02:51:49', 8),
(141, 2, '20.530001', '0000-00-00', '2018-04-27 02:51:49', 8),
(142, 3, '0.825698', '0000-00-00', '2018-04-27 02:51:49', 8),
(143, 1, '1.000000', '0000-00-00', '2018-04-27 02:52:46', 8),
(144, 2, '20.530001', '0000-00-00', '2018-04-27 02:52:46', 8),
(145, 3, '0.825698', '0000-00-00', '2018-04-27 02:52:46', 8),
(146, 1, '1.000000', '0000-00-00', '2018-04-27 02:53:19', 8),
(147, 2, '20.530001', '0000-00-00', '2018-04-27 02:53:19', 8),
(148, 3, '0.825698', '0000-00-00', '2018-04-27 02:53:19', 8),
(149, 1, '1.000000', '0000-00-00', '2018-04-27 03:00:05', 8),
(150, 2, '20.530001', '0000-00-00', '2018-04-27 03:00:05', 8),
(151, 3, '0.825401', '0000-00-00', '2018-04-27 03:00:05', 8);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
