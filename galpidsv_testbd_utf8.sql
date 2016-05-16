-- phpMyAdmin SQL Dump
-- version 4.0.10.14
-- http://www.phpmyadmin.net
--
-- Хост: localhost:3306
-- Час створення: Трв 16 2016 р., 07:14
-- Версія сервера: 5.5.49-cll
-- Версія PHP: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База даних: `galpidsv_testbd`
--

-- --------------------------------------------------------

--
-- Структура таблиці `address`
--

CREATE TABLE IF NOT EXISTS `address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lastname` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `company` varchar(32) COLLATE utf8_bin NOT NULL,
  `address_1` varchar(128) COLLATE utf8_bin NOT NULL,
  `address_2` varchar(128) COLLATE utf8_bin NOT NULL,
  `city` varchar(128) COLLATE utf8_bin NOT NULL,
  `postcode` varchar(10) COLLATE utf8_bin NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=13 ;

--
-- Дамп даних таблиці `address`
--

INSERT INTO `address` (`address_id`, `customer_id`, `firstname`, `lastname`, `company`, `address_1`, `address_2`, `city`, `postcode`, `country_id`, `zone_id`) VALUES
(1, 1, 'Volodia', 'Secf', '', 'Lviv', '', 'lviv', '79035', 222, 3515),
(2, 2, 'Володя', 'Сур', '', 'вул. Зелена, 109', '', 'Львів', '79035', 220, 3493),
(3, 3, 'Володя', 'Сегеда', '', 'ssssss', '', 'ssssssss', '4946', 220, 3486),
(4, 4, 'Роман', 'Телесницький', '', 'Дж. Вашингтона', 'Дж. Вашингтона', 'Львів', '79032', 220, 3493),
(5, 5, 'Володя', 'Сегеда', '', 'місто Львів', '', 'Львів', '', 220, 3493),
(6, 6, 'Володя', 'Сегеда', '', 'аіавіа', '', 'івваі', '', 220, 3495),
(7, 7, 'Володя', 'Сегеда', '', 'Львів', '', 'Місто Львів', '', 220, 3496),
(12, 12, 'Володя', 'Сегеда', '', 'Львів', '', 'Львів', '     ', 220, 3496),
(9, 9, 'іпіп', 'івппві', '', '54bkji', '', '4556', '     ', 220, 3483);

-- --------------------------------------------------------

--
-- Структура таблиці `affiliate`
--

CREATE TABLE IF NOT EXISTS `affiliate` (
  `affiliate_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lastname` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `email` varchar(96) COLLATE utf8_bin NOT NULL DEFAULT '',
  `telephone` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `fax` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `password` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `company` varchar(32) COLLATE utf8_bin NOT NULL,
  `website` varchar(255) COLLATE utf8_bin NOT NULL,
  `address_1` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `address_2` varchar(128) COLLATE utf8_bin NOT NULL,
  `city` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `postcode` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '',
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `code` varchar(64) COLLATE utf8_bin NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(64) COLLATE utf8_bin NOT NULL,
  `payment` varchar(6) COLLATE utf8_bin NOT NULL,
  `cheque` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `paypal` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `bank_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `bank_branch_number` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `bank_swift_code` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `bank_account_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `bank_account_number` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ip` varchar(15) COLLATE utf8_bin NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `affiliate_transaction`
--

CREATE TABLE IF NOT EXISTS `affiliate_transaction` (
  `affiliate_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `attribute`
--

CREATE TABLE IF NOT EXISTS `attribute` (
  `attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=12 ;

--
-- Дамп даних таблиці `attribute`
--

INSERT INTO `attribute` (`attribute_id`, `attribute_group_id`, `sort_order`) VALUES
(1, 6, 1),
(2, 6, 5),
(3, 6, 3),
(4, 3, 1),
(5, 3, 2),
(6, 3, 3),
(7, 3, 4),
(8, 3, 5),
(9, 3, 6),
(10, 3, 7),
(11, 3, 8);

-- --------------------------------------------------------

--
-- Структура таблиці `attribute_description`
--

CREATE TABLE IF NOT EXISTS `attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп даних таблиці `attribute_description`
--

INSERT INTO `attribute_description` (`attribute_id`, `language_id`, `name`) VALUES
(1, 2, 'Description'),
(2, 2, 'No. of Cores'),
(4, 2, 'test 1'),
(5, 2, 'test 2'),
(6, 2, 'test 3'),
(7, 2, 'test 4'),
(8, 2, 'test 5'),
(9, 2, 'test 6'),
(10, 2, 'test 7'),
(11, 2, 'test 8'),
(3, 2, 'Clockspeed');

-- --------------------------------------------------------

--
-- Структура таблиці `attribute_group`
--

CREATE TABLE IF NOT EXISTS `attribute_group` (
  `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=7 ;

--
-- Дамп даних таблиці `attribute_group`
--

INSERT INTO `attribute_group` (`attribute_group_id`, `sort_order`) VALUES
(3, 2),
(4, 1),
(5, 3),
(6, 4);

-- --------------------------------------------------------

--
-- Структура таблиці `attribute_group_description`
--

CREATE TABLE IF NOT EXISTS `attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`attribute_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп даних таблиці `attribute_group_description`
--

INSERT INTO `attribute_group_description` (`attribute_group_id`, `language_id`, `name`) VALUES
(3, 2, 'Memory'),
(4, 2, 'Technical'),
(5, 2, 'Motherboard'),
(6, 2, 'Processor');

-- --------------------------------------------------------

--
-- Структура таблиці `banner`
--

CREATE TABLE IF NOT EXISTS `banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_bin NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=10 ;

--
-- Дамп даних таблиці `banner`
--

INSERT INTO `banner` (`banner_id`, `name`, `status`) VALUES
(9, 'Банер_на_ГОЛОВНІЙ', 1);

-- --------------------------------------------------------

--
-- Структура таблиці `banner_image`
--

CREATE TABLE IF NOT EXISTS `banner_image` (
  `banner_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) NOT NULL,
  `link` varchar(255) COLLATE utf8_bin NOT NULL,
  `image` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`banner_image_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=177 ;

--
-- Дамп даних таблиці `banner_image`
--

INSERT INTO `banner_image` (`banner_image_id`, `banner_id`, `link`, `image`) VALUES
(176, 9, '', 'data/ НОВИЙ.jpg'),
(175, 9, '', 'data/ НОВИЙ1 (2).jpg'),
(174, 9, '', 'data/2016 vechirni/wf5ONd9J8aE.jpg'),
(173, 9, '', 'data/2016 vesilni/-22CcYwhsFA.jpg'),
(172, 9, '', 'data/2016 vechirni/QrlYtNadbr8.jpg'),
(171, 9, '', 'data/2016 vechirni/AxqB_Y9R_aw.jpg');

-- --------------------------------------------------------

--
-- Структура таблиці `banner_image_description`
--

CREATE TABLE IF NOT EXISTS `banner_image_description` (
  `banner_image_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `title` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`banner_image_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп даних таблиці `banner_image_description`
--

INSERT INTO `banner_image_description` (`banner_image_id`, `language_id`, `banner_id`, `title`) VALUES
(175, 2, 9, 'Lite by Dominiss'),
(176, 2, 9, 'Lite by Dominiss'),
(172, 2, 9, 'Anna Sharm collektion 2016'),
(174, 2, 9, 'Anna Sharm collektion 2016'),
(173, 2, 9, 'Anna Sharm collektion 2016'),
(171, 2, 9, 'Anna Sharm collektion 2016');

-- --------------------------------------------------------

--
-- Структура таблиці `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=98 ;

-- --------------------------------------------------------

--
-- Структура таблиці `category_description`
--

CREATE TABLE IF NOT EXISTS `category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `description` text COLLATE utf8_bin NOT NULL,
  `meta_description` varchar(255) COLLATE utf8_bin NOT NULL,
  `meta_keyword` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблиці `category_to_layout`
--

CREATE TABLE IF NOT EXISTS `category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблиці `category_to_store`
--

CREATE TABLE IF NOT EXISTS `category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблиці `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_bin NOT NULL,
  `iso_code_2` varchar(2) COLLATE utf8_bin NOT NULL DEFAULT '',
  `iso_code_3` varchar(3) COLLATE utf8_bin NOT NULL DEFAULT '',
  `address_format` text COLLATE utf8_bin NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`country_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=240 ;

--
-- Дамп даних таблиці `country`
--

INSERT INTO `country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`) VALUES
(1, 'Afghanistan', 'AF', 'AFG', '', 0, 0),
(2, 'Albania', 'AL', 'ALB', '', 0, 0),
(3, 'Algeria', 'DZ', 'DZA', '', 0, 0),
(4, 'American Samoa', 'AS', 'ASM', '', 0, 0),
(5, 'Andorra', 'AD', 'AND', '', 0, 0),
(6, 'Angola', 'AO', 'AGO', '', 0, 0),
(7, 'Anguilla', 'AI', 'AIA', '', 0, 0),
(8, 'Antarctica', 'AQ', 'ATA', '', 0, 0),
(9, 'Antigua and Barbuda', 'AG', 'ATG', '', 0, 0),
(10, 'Argentina', 'AR', 'ARG', '', 0, 0),
(11, 'Armenia', 'AM', 'ARM', '', 0, 0),
(12, 'Aruba', 'AW', 'ABW', '', 0, 0),
(13, 'Australia', 'AU', 'AUS', '', 0, 0),
(14, 'Austria', 'AT', 'AUT', '', 0, 0),
(15, 'Azerbaijan', 'AZ', 'AZE', '', 0, 0),
(16, 'Bahamas', 'BS', 'BHS', '', 0, 0),
(17, 'Bahrain', 'BH', 'BHR', '', 0, 0),
(18, 'Bangladesh', 'BD', 'BGD', '', 0, 0),
(19, 'Barbados', 'BB', 'BRB', '', 0, 0),
(20, 'Belarus', 'BY', 'BLR', '', 0, 0),
(21, 'Belgium', 'BE', 'BEL', '', 0, 0),
(22, 'Belize', 'BZ', 'BLZ', '', 0, 0),
(23, 'Benin', 'BJ', 'BEN', '', 0, 0),
(24, 'Bermuda', 'BM', 'BMU', '', 0, 0),
(25, 'Bhutan', 'BT', 'BTN', '', 0, 0),
(26, 'Bolivia', 'BO', 'BOL', '', 0, 0),
(27, 'Bosnia and Herzegowina', 'BA', 'BIH', '', 0, 0),
(28, 'Botswana', 'BW', 'BWA', '', 0, 0),
(29, 'Bouvet Island', 'BV', 'BVT', '', 0, 0),
(30, 'Brazil', 'BR', 'BRA', '', 0, 0),
(31, 'British Indian Ocean Territory', 'IO', 'IOT', '', 0, 0),
(32, 'Brunei Darussalam', 'BN', 'BRN', '', 0, 0),
(33, 'Bulgaria', 'BG', 'BGR', '', 0, 0),
(34, 'Burkina Faso', 'BF', 'BFA', '', 0, 0),
(35, 'Burundi', 'BI', 'BDI', '', 0, 0),
(36, 'Cambodia', 'KH', 'KHM', '', 0, 0),
(37, 'Cameroon', 'CM', 'CMR', '', 0, 0),
(38, 'Canada', 'CA', 'CAN', '', 0, 0),
(39, 'Cape Verde', 'CV', 'CPV', '', 0, 0),
(40, 'Cayman Islands', 'KY', 'CYM', '', 0, 0),
(41, 'Central African Republic', 'CF', 'CAF', '', 0, 0),
(42, 'Chad', 'TD', 'TCD', '', 0, 0),
(43, 'Chile', 'CL', 'CHL', '', 0, 0),
(44, 'China', 'CN', 'CHN', '', 0, 0),
(45, 'Christmas Island', 'CX', 'CXR', '', 0, 0),
(46, 'Cocos (Keeling) Islands', 'CC', 'CCK', '', 0, 0),
(47, 'Colombia', 'CO', 'COL', '', 0, 0),
(48, 'Comoros', 'KM', 'COM', '', 0, 0),
(49, 'Congo', 'CG', 'COG', '', 0, 0),
(50, 'Cook Islands', 'CK', 'COK', '', 0, 0),
(51, 'Costa Rica', 'CR', 'CRI', '', 0, 0),
(52, 'Cote D''Ivoire', 'CI', 'CIV', '', 0, 0),
(53, 'Croatia', 'HR', 'HRV', '', 0, 0),
(54, 'Cuba', 'CU', 'CUB', '', 0, 0),
(55, 'Cyprus', 'CY', 'CYP', '', 0, 0),
(56, 'Czech Republic', 'CZ', 'CZE', '', 0, 0),
(57, 'Denmark', 'DK', 'DNK', '', 0, 0),
(58, 'Djibouti', 'DJ', 'DJI', '', 0, 0),
(59, 'Dominica', 'DM', 'DMA', '', 0, 0),
(60, 'Dominican Republic', 'DO', 'DOM', '', 0, 0),
(61, 'East Timor', 'TP', 'TMP', '', 0, 0),
(62, 'Ecuador', 'EC', 'ECU', '', 0, 0),
(63, 'Egypt', 'EG', 'EGY', '', 0, 0),
(64, 'El Salvador', 'SV', 'SLV', '', 0, 0),
(65, 'Equatorial Guinea', 'GQ', 'GNQ', '', 0, 0),
(66, 'Eritrea', 'ER', 'ERI', '', 0, 0),
(67, 'Estonia', 'EE', 'EST', '', 0, 0),
(68, 'Ethiopia', 'ET', 'ETH', '', 0, 0),
(69, 'Falkland Islands (Malvinas)', 'FK', 'FLK', '', 0, 0),
(70, 'Faroe Islands', 'FO', 'FRO', '', 0, 0),
(71, 'Fiji', 'FJ', 'FJI', '', 0, 0),
(72, 'Finland', 'FI', 'FIN', '', 0, 0),
(73, 'France', 'FR', 'FRA', '', 0, 0),
(74, 'France, Metropolitan', 'FX', 'FXX', '', 0, 0),
(75, 'French Guiana', 'GF', 'GUF', '', 0, 0),
(76, 'French Polynesia', 'PF', 'PYF', '', 0, 0),
(77, 'French Southern Territories', 'TF', 'ATF', '', 0, 0),
(78, 'Gabon', 'GA', 'GAB', '', 0, 0),
(79, 'Gambia', 'GM', 'GMB', '', 0, 0),
(80, 'Georgia', 'GE', 'GEO', '', 0, 0),
(81, 'Germany', 'DE', 'DEU', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 0, 0),
(82, 'Ghana', 'GH', 'GHA', '', 0, 0),
(83, 'Gibraltar', 'GI', 'GIB', '', 0, 0),
(84, 'Greece', 'GR', 'GRC', '', 0, 0),
(85, 'Greenland', 'GL', 'GRL', '', 0, 0),
(86, 'Grenada', 'GD', 'GRD', '', 0, 0),
(87, 'Guadeloupe', 'GP', 'GLP', '', 0, 0),
(88, 'Guam', 'GU', 'GUM', '', 0, 0),
(89, 'Guatemala', 'GT', 'GTM', '', 0, 0),
(90, 'Guinea', 'GN', 'GIN', '', 0, 0),
(91, 'Guinea-bissau', 'GW', 'GNB', '', 0, 0),
(92, 'Guyana', 'GY', 'GUY', '', 0, 0),
(93, 'Haiti', 'HT', 'HTI', '', 0, 0),
(94, 'Heard and Mc Donald Islands', 'HM', 'HMD', '', 0, 0),
(95, 'Honduras', 'HN', 'HND', '', 0, 0),
(96, 'Hong Kong', 'HK', 'HKG', '', 0, 0),
(97, 'Hungary', 'HU', 'HUN', '', 0, 0),
(98, 'Iceland', 'IS', 'ISL', '', 0, 0),
(99, 'India', 'IN', 'IND', '', 0, 0),
(100, 'Indonesia', 'ID', 'IDN', '', 0, 0),
(101, 'Iran (Islamic Republic of)', 'IR', 'IRN', '', 0, 0),
(102, 'Iraq', 'IQ', 'IRQ', '', 0, 0),
(103, 'Ireland', 'IE', 'IRL', '', 0, 0),
(104, 'Israel', 'IL', 'ISR', '', 0, 0),
(105, 'Italy', 'IT', 'ITA', '', 0, 0),
(106, 'Jamaica', 'JM', 'JAM', '', 0, 0),
(107, 'Japan', 'JP', 'JPN', '', 0, 0),
(108, 'Jordan', 'JO', 'JOR', '', 0, 0),
(109, 'Kazakhstan', 'KZ', 'KAZ', '', 0, 0),
(110, 'Kenya', 'KE', 'KEN', '', 0, 0),
(111, 'Kiribati', 'KI', 'KIR', '', 0, 0),
(112, 'North Korea', 'KP', 'PRK', '', 0, 0),
(113, 'Korea, Republic of', 'KR', 'KOR', '', 0, 0),
(114, 'Kuwait', 'KW', 'KWT', '', 0, 0),
(115, 'Kyrgyzstan', 'KG', 'KGZ', '', 0, 0),
(116, 'Lao People''s Democratic Republic', 'LA', 'LAO', '', 0, 0),
(117, 'Latvia', 'LV', 'LVA', '', 0, 0),
(118, 'Lebanon', 'LB', 'LBN', '', 0, 0),
(119, 'Lesotho', 'LS', 'LSO', '', 0, 0),
(120, 'Liberia', 'LR', 'LBR', '', 0, 0),
(121, 'Libyan Arab Jamahiriya', 'LY', 'LBY', '', 0, 0),
(122, 'Liechtenstein', 'LI', 'LIE', '', 0, 0),
(123, 'Lithuania', 'LT', 'LTU', '', 0, 0),
(124, 'Luxembourg', 'LU', 'LUX', '', 0, 0),
(125, 'Macau', 'MO', 'MAC', '', 0, 0),
(126, 'Macedonia', 'MK', 'MKD', '', 0, 0),
(127, 'Madagascar', 'MG', 'MDG', '', 0, 0),
(128, 'Malawi', 'MW', 'MWI', '', 0, 0),
(129, 'Malaysia', 'MY', 'MYS', '', 0, 0),
(130, 'Maldives', 'MV', 'MDV', '', 0, 0),
(131, 'Mali', 'ML', 'MLI', '', 0, 0),
(132, 'Malta', 'MT', 'MLT', '', 0, 0),
(133, 'Marshall Islands', 'MH', 'MHL', '', 0, 0),
(134, 'Martinique', 'MQ', 'MTQ', '', 0, 0),
(135, 'Mauritania', 'MR', 'MRT', '', 0, 0),
(136, 'Mauritius', 'MU', 'MUS', '', 0, 0),
(137, 'Mayotte', 'YT', 'MYT', '', 0, 0),
(138, 'Mexico', 'MX', 'MEX', '', 0, 0),
(139, 'Micronesia, Federated States of', 'FM', 'FSM', '', 0, 0),
(140, 'Moldova, Republic of', 'MD', 'MDA', '', 0, 0),
(141, 'Monaco', 'MC', 'MCO', '', 0, 0),
(142, 'Mongolia', 'MN', 'MNG', '', 0, 0),
(143, 'Montserrat', 'MS', 'MSR', '', 0, 0),
(144, 'Morocco', 'MA', 'MAR', '', 0, 0),
(145, 'Mozambique', 'MZ', 'MOZ', '', 0, 0),
(146, 'Myanmar', 'MM', 'MMR', '', 0, 0),
(147, 'Namibia', 'NA', 'NAM', '', 0, 0),
(148, 'Nauru', 'NR', 'NRU', '', 0, 0),
(149, 'Nepal', 'NP', 'NPL', '', 0, 0),
(150, 'Netherlands', 'NL', 'NLD', '', 0, 0),
(151, 'Netherlands Antilles', 'AN', 'ANT', '', 0, 0),
(152, 'New Caledonia', 'NC', 'NCL', '', 0, 0),
(153, 'New Zealand', 'NZ', 'NZL', '', 0, 0),
(154, 'Nicaragua', 'NI', 'NIC', '', 0, 0),
(155, 'Niger', 'NE', 'NER', '', 0, 0),
(156, 'Nigeria', 'NG', 'NGA', '', 0, 0),
(157, 'Niue', 'NU', 'NIU', '', 0, 0),
(158, 'Norfolk Island', 'NF', 'NFK', '', 0, 0),
(159, 'Northern Mariana Islands', 'MP', 'MNP', '', 0, 0),
(160, 'Norway', 'NO', 'NOR', '', 0, 0),
(161, 'Oman', 'OM', 'OMN', '', 0, 0),
(162, 'Pakistan', 'PK', 'PAK', '', 0, 0),
(163, 'Palau', 'PW', 'PLW', '', 0, 0),
(164, 'Panama', 'PA', 'PAN', '', 0, 0),
(165, 'Papua New Guinea', 'PG', 'PNG', '', 0, 0),
(166, 'Paraguay', 'PY', 'PRY', '', 0, 0),
(167, 'Peru', 'PE', 'PER', '', 0, 0),
(168, 'Philippines', 'PH', 'PHL', '', 0, 0),
(169, 'Pitcairn', 'PN', 'PCN', '', 0, 0),
(170, 'Poland', 'PL', 'POL', '', 0, 0),
(171, 'Portugal', 'PT', 'PRT', '', 0, 0),
(172, 'Puerto Rico', 'PR', 'PRI', '', 0, 0),
(173, 'Qatar', 'QA', 'QAT', '', 0, 0),
(174, 'Reunion', 'RE', 'REU', '', 0, 0),
(175, 'Romania', 'RO', 'ROM', '', 0, 0),
(176, 'Russian Federation', 'RU', 'RUS', '', 0, 0),
(177, 'Rwanda', 'RW', 'RWA', '', 0, 0),
(178, 'Saint Kitts and Nevis', 'KN', 'KNA', '', 0, 0),
(179, 'Saint Lucia', 'LC', 'LCA', '', 0, 0),
(180, 'Saint Vincent and the Grenadines', 'VC', 'VCT', '', 0, 0),
(181, 'Samoa', 'WS', 'WSM', '', 0, 0),
(182, 'San Marino', 'SM', 'SMR', '', 0, 0),
(183, 'Sao Tome and Principe', 'ST', 'STP', '', 0, 0),
(184, 'Saudi Arabia', 'SA', 'SAU', '', 0, 0),
(185, 'Senegal', 'SN', 'SEN', '', 0, 0),
(186, 'Seychelles', 'SC', 'SYC', '', 0, 0),
(187, 'Sierra Leone', 'SL', 'SLE', '', 0, 0),
(188, 'Singapore', 'SG', 'SGP', '', 0, 0),
(189, 'Slovak Republic', 'SK', 'SVK', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city} {postcode}\r\n{zone}\r\n{country}', 0, 0),
(190, 'Slovenia', 'SI', 'SVN', '', 0, 0),
(191, 'Solomon Islands', 'SB', 'SLB', '', 0, 0),
(192, 'Somalia', 'SO', 'SOM', '', 0, 0),
(193, 'South Africa', 'ZA', 'ZAF', '', 0, 0),
(194, 'South Georgia &amp; South Sandwich Islands', 'GS', 'SGS', '', 0, 0),
(195, 'Spain', 'ES', 'ESP', '', 0, 0),
(196, 'Sri Lanka', 'LK', 'LKA', '', 0, 0),
(197, 'St. Helena', 'SH', 'SHN', '', 0, 0),
(198, 'St. Pierre and Miquelon', 'PM', 'SPM', '', 0, 0),
(199, 'Sudan', 'SD', 'SDN', '', 0, 0),
(200, 'Suriname', 'SR', 'SUR', '', 0, 0),
(201, 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM', '', 0, 0),
(202, 'Swaziland', 'SZ', 'SWZ', '', 0, 0),
(203, 'Sweden', 'SE', 'SWE', '', 0, 0),
(204, 'Switzerland', 'CH', 'CHE', '', 0, 0),
(205, 'Syrian Arab Republic', 'SY', 'SYR', '', 0, 0),
(206, 'Taiwan', 'TW', 'TWN', '', 0, 0),
(207, 'Tajikistan', 'TJ', 'TJK', '', 0, 0),
(208, 'Tanzania, United Republic of', 'TZ', 'TZA', '', 0, 0),
(209, 'Thailand', 'TH', 'THA', '', 0, 0),
(210, 'Togo', 'TG', 'TGO', '', 0, 0),
(211, 'Tokelau', 'TK', 'TKL', '', 0, 0),
(212, 'Tonga', 'TO', 'TON', '', 0, 0),
(213, 'Trinidad and Tobago', 'TT', 'TTO', '', 0, 0),
(214, 'Tunisia', 'TN', 'TUN', '', 0, 0),
(215, 'Turkey', 'TR', 'TUR', '', 0, 0),
(216, 'Turkmenistan', 'TM', 'TKM', '', 0, 0),
(217, 'Turks and Caicos Islands', 'TC', 'TCA', '', 0, 0),
(218, 'Tuvalu', 'TV', 'TUV', '', 0, 0),
(219, 'Uganda', 'UG', 'UGA', '', 0, 0),
(220, 'Україна', 'UA', 'UKR', '', 0, 1),
(221, 'United Arab Emirates', 'AE', 'ARE', '', 0, 0),
(222, 'United Kingdom', 'GB', 'GBR', '', 1, 0),
(223, 'United States', 'US', 'USA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city}, {zone} {postcode}\r\n{country}', 0, 0),
(224, 'United States Minor Outlying Islands', 'UM', 'UMI', '', 0, 0),
(225, 'Uruguay', 'UY', 'URY', '', 0, 0),
(226, 'Uzbekistan', 'UZ', 'UZB', '', 0, 0),
(227, 'Vanuatu', 'VU', 'VUT', '', 0, 0),
(228, 'Vatican City State (Holy See)', 'VA', 'VAT', '', 0, 0),
(229, 'Venezuela', 'VE', 'VEN', '', 0, 0),
(230, 'Viet Nam', 'VN', 'VNM', '', 0, 0),
(231, 'Virgin Islands (British)', 'VG', 'VGB', '', 0, 0),
(232, 'Virgin Islands (U.S.)', 'VI', 'VIR', '', 0, 0),
(233, 'Wallis and Futuna Islands', 'WF', 'WLF', '', 0, 0),
(234, 'Western Sahara', 'EH', 'ESH', '', 0, 0),
(235, 'Yemen', 'YE', 'YEM', '', 0, 0),
(236, 'Yugoslavia', 'YU', 'YUG', '', 0, 0),
(237, 'Democratic Republic of Congo', 'CD', 'COD', '', 0, 0),
(238, 'Zambia', 'ZM', 'ZMB', '', 0, 0),
(239, 'Zimbabwe', 'ZW', 'ZWE', '', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблиці `coupon`
--

CREATE TABLE IF NOT EXISTS `coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_bin NOT NULL,
  `code` varchar(10) COLLATE utf8_bin NOT NULL,
  `type` char(1) COLLATE utf8_bin NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) COLLATE utf8_bin NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`coupon_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=7 ;

--
-- Дамп даних таблиці `coupon`
--

INSERT INTO `coupon` (`coupon_id`, `name`, `code`, `type`, `discount`, `logged`, `shipping`, `total`, `date_start`, `date_end`, `uses_total`, `uses_customer`, `status`, `date_added`) VALUES
(4, '-10% Discount', '2222AAAA', 'P', '10.0000', 1, 0, '0.0000', '2011-01-01', '2012-01-01', 10, '10', 0, '2009-01-27 13:55:03');

-- --------------------------------------------------------

--
-- Структура таблиці `coupon_history`
--

CREATE TABLE IF NOT EXISTS `coupon_history` (
  `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `coupon_product`
--

CREATE TABLE IF NOT EXISTS `coupon_product` (
  `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `currency`
--

CREATE TABLE IF NOT EXISTS `currency` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `code` varchar(3) COLLATE utf8_bin NOT NULL DEFAULT '',
  `symbol_left` varchar(12) COLLATE utf8_bin NOT NULL,
  `symbol_right` varchar(12) COLLATE utf8_bin NOT NULL,
  `decimal_place` char(1) COLLATE utf8_bin NOT NULL,
  `value` float(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`currency_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- Дамп даних таблиці `currency`
--

INSERT INTO `currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`) VALUES
(1, 'Pound Sterling', 'GBP', '£', '', '2', 0.63660002, 0, '2012-06-30 07:38:35'),
(2, 'US Dollar', 'USD', '$', '', '2', 1.00000000, 0, '2012-06-30 07:38:42'),
(3, 'Euro', 'EUR', '', '€', '2', 0.78969997, 0, '2012-06-30 07:38:28'),
(4, 'Українська гривня', 'GRN', '', ' грн.', '2', 1.00000000, 1, '2012-06-30 07:34:44');

-- --------------------------------------------------------

--
-- Структура таблиці `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lastname` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `email` varchar(96) COLLATE utf8_bin NOT NULL DEFAULT '',
  `telephone` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `fax` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `password` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `cart` text COLLATE utf8_bin,
  `wishlist` text COLLATE utf8_bin,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL,
  `ip` varchar(15) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `token` varchar(255) COLLATE utf8_bin NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=13 ;

--
-- Дамп даних таблиці `customer`
--

INSERT INTO `customer` (`customer_id`, `store_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `password`, `cart`, `wishlist`, `newsletter`, `address_id`, `customer_group_id`, `ip`, `status`, `approved`, `token`, `date_added`) VALUES
(2, 0, 'Володя', 'Сур', 'sehedav@yahoo.com', '097-555-47-78', '', '2cca9e62ef41efb809fe6defa74e78ba', 'a:0:{}', '', 0, 2, 8, '46.203.192.243', 1, 1, '', '2012-06-30 08:18:06'),
(3, 0, 'Володя', 'Сегеда', 'websufix@yahoo.com', '097 565466 ', '', 'e10adc3949ba59abbe56e057f20f883e', 'a:0:{}', '', 1, 3, 8, '46.202.218.252', 1, 1, '', '2012-07-02 18:25:01'),
(4, 0, 'Роман', 'Телесницький', 'telesnyckyj.r@gmail.com', '380979051345', '', '06a4f2b809f91b4334b6f3db1a7808b3', 'a:2:{s:31:"42:YToxOntpOjIyODtzOjI6IjE5Ijt9";i:8;i:51;i:1;}', 'a:0:{}', 0, 4, 8, '176.8.90.38', 1, 1, '', '2012-07-05 22:06:41'),
(12, 0, 'Володя', 'Сегеда', 'websufixlviv@ukr.net', '161616', 'інтернет', 'e53723bb2c9f756d3aa695b5601b8804', 'a:0:{}', '', 0, 12, 8, '46.202.196.148', 1, 1, '', '2012-07-11 20:00:27');

-- --------------------------------------------------------

--
-- Структура таблиці `customer_group`
--

CREATE TABLE IF NOT EXISTS `customer_group` (
  `customer_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`customer_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=9 ;

--
-- Дамп даних таблиці `customer_group`
--

INSERT INTO `customer_group` (`customer_group_id`, `name`) VALUES
(8, 'Default'),
(6, 'Wholesale');

-- --------------------------------------------------------

--
-- Структура таблиці `customer_ip`
--

CREATE TABLE IF NOT EXISTS `customer_ip` (
  `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(15) COLLATE utf8_bin NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=20 ;

--
-- Дамп даних таблиці `customer_ip`
--

INSERT INTO `customer_ip` (`customer_ip_id`, `customer_id`, `ip`, `date_added`) VALUES
(1, 1, '46.203.242.168', '2012-06-29 17:55:14'),
(2, 1, '46.202.72.240', '2012-06-29 18:30:29'),
(3, 2, '46.203.192.243', '2012-06-30 08:18:07'),
(4, 1, '46.203.192.243', '2012-06-30 10:19:05'),
(5, 1, '46.202.218.252', '2012-07-02 14:22:04'),
(6, 3, '46.202.218.252', '2012-07-02 18:25:04'),
(7, 1, '46.203.226.40', '2012-07-05 15:37:23'),
(8, 4, '95.69.255.74', '2012-07-05 22:06:42'),
(9, 1, '46.202.144.62', '2012-07-07 18:28:14'),
(10, 5, '46.202.95.200', '2012-07-09 10:12:54'),
(11, 6, '46.202.95.200', '2012-07-09 10:17:32'),
(12, 7, '46.202.95.200', '2012-07-09 10:22:05'),
(18, 12, '46.202.194.243', '2012-07-11 20:00:29'),
(14, 9, '46.202.95.200', '2012-07-09 10:56:08'),
(15, 4, '176.8.90.38', '2012-07-11 18:52:51'),
(19, 12, '46.202.196.148', '2012-07-15 07:11:54');

-- --------------------------------------------------------

--
-- Структура таблиці `customer_ip_blacklist`
--

CREATE TABLE IF NOT EXISTS `customer_ip_blacklist` (
  `customer_ip_blacklist_id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(15) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`customer_ip_blacklist_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `customer_reward`
--

CREATE TABLE IF NOT EXISTS `customer_reward` (
  `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_bin NOT NULL,
  `points` int(8) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`customer_reward_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `customer_transaction`
--

CREATE TABLE IF NOT EXISTS `customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `download`
--

CREATE TABLE IF NOT EXISTS `download` (
  `download_id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `mask` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `remaining` int(11) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`download_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Структура таблиці `download_description`
--

CREATE TABLE IF NOT EXISTS `download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`download_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблиці `extension`
--

CREATE TABLE IF NOT EXISTS `extension` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) COLLATE utf8_bin NOT NULL,
  `code` varchar(32) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`extension_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=440 ;

--
-- Дамп даних таблиці `extension`
--

INSERT INTO `extension` (`extension_id`, `type`, `code`) VALUES
(23, 'payment', 'cod'),
(22, 'total', 'shipping'),
(57, 'total', 'sub_total'),
(58, 'total', 'tax'),
(59, 'total', 'total'),
(410, 'module', 'banner'),
(426, 'module', 'carousel'),
(390, 'total', 'credit'),
(387, 'shipping', 'flat'),
(349, 'total', 'handling'),
(350, 'total', 'low_order_fee'),
(389, 'total', 'coupon'),
(393, 'total', 'reward'),
(407, 'payment', 'free_checkout'),
(428, 'shipping', 'pickup'),
(429, 'shipping', 'item'),
(432, 'module', 'information'),
(433, 'module', 'welcome'),
(439, 'module', 'mainpageseo'),
(438, 'module', 'slideshow');

-- --------------------------------------------------------

--
-- Структура таблиці `geo_zone`
--

CREATE TABLE IF NOT EXISTS `geo_zone` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- Дамп даних таблиці `geo_zone`
--

INSERT INTO `geo_zone` (`geo_zone_id`, `name`, `description`, `date_modified`, `date_added`) VALUES
(3, 'UK VAT Zone', 'UK VAT', '2010-02-26 22:33:24', '2009-01-06 23:26:25'),
(4, 'UK Shipping', 'UK Shipping Zones', '2010-12-15 15:18:13', '2009-06-23 01:14:53');

-- --------------------------------------------------------

--
-- Структура таблиці `information`
--

CREATE TABLE IF NOT EXISTS `information` (
  `information_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`information_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=46 ;

--
-- Дамп даних таблиці `information`
--

INSERT INTO `information` (`information_id`, `sort_order`, `status`) VALUES
(44, 100, 1),
(43, 800, 1),
(41, 100, 1),
(39, 400, 1),
(42, 500, 1);

-- --------------------------------------------------------

--
-- Структура таблиці `information_description`
--

CREATE TABLE IF NOT EXISTS `information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `seotitle` varchar(255) COLLATE utf8_bin NOT NULL,
  `seodescription` varchar(255) COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`information_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп даних таблиці `information_description`
--

INSERT INTO `information_description` (`information_id`, `language_id`, `title`, `seotitle`, `seodescription`, `description`) VALUES
(42, 2, 'Інформація', '', '', '&lt;div style=&quot;text-align: justify;&quot;&gt;\r\n	&lt;strong&gt;&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;color: rgb(94, 0, 94);&quot;&gt;Корисна інформація по весільних сукнях&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/div&gt;\r\n&lt;div style=&quot;text-align: justify;&quot;&gt;\r\n	&amp;nbsp;&lt;/div&gt;\r\n&lt;div style=&quot;text-align: justify;&quot;&gt;\r\n	&lt;strong&gt;&lt;em&gt;&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;color: rgb(94, 0, 94);&quot;&gt;Якого кольору вибрати весільну сукню, біла або айворі?&lt;/span&gt;&lt;/span&gt;&lt;/em&gt;&lt;/strong&gt;&lt;/div&gt;\r\n&lt;div style=&quot;text-align: justify;&quot;&gt;\r\n	&amp;nbsp;&lt;/div&gt;\r\n&lt;div style=&quot;text-align: justify;&quot;&gt;\r\n	&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(94, 0, 94);&quot;&gt;Біле плаття підходить не всім нареченим, це треба знати. Всі жінки поділяються на кольоротипи. Так от, білий колір підходить більше&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color: rgb(94, 0, 94); font-size: 16px;&quot;&gt;кольоротипу&lt;/span&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(94, 0, 94);&quot;&gt;&amp;nbsp;&amp;laquo;зима&amp;raquo; і &amp;laquo;літо&amp;raquo;. Нареченим з темним волоссям і світлою шкірою однозначно підійде білий. Але якщо Ви блондинка, носіть краще коричневий колір, ніж чорний, ми рекомендуємо вибрати весільну сукню у світлі Ivory (айворі) або слонова кістка, молочне. Цей колір теплий і підійде&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color: rgb(94, 0, 94); font-size: 16px;&quot;&gt;кольоротипу&lt;/span&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(94, 0, 94);&quot;&gt;&amp;nbsp;&amp;laquo;осінь&amp;raquo; і &amp;laquo;весна&amp;raquo;.&lt;/span&gt;&lt;/span&gt;&lt;/div&gt;\r\n&lt;div style=&quot;text-align: justify;&quot;&gt;\r\n	&amp;nbsp;&lt;/div&gt;\r\n&lt;div style=&quot;text-align: justify;&quot;&gt;\r\n	&lt;em&gt;&lt;strong&gt;&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;color: rgb(94, 0, 94);&quot;&gt;Як вибрати тканину для весільної сукні?&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/em&gt;&lt;br /&gt;\r\n	&amp;nbsp;&lt;/div&gt;\r\n&lt;div style=&quot;text-align: justify;&quot;&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;color: rgb(94, 0, 94);&quot;&gt;При виборі тканини ми радимо керуватися умовами, в яких проходитиме весілля. Якщо це пляж або спекотна погода, то переважно натуральні тканини. Вони пропускають повітря, не прилипають до тіла. Але доглядати за такого роду тканинами значно складніше, ніж за штучними. Натуральні тканини не можна прати. Можливо тільки хімічне чищення. Якщо ж Ви не хочете додаткових проблем з доглядом за тканиною, ми пропонуємо зшити весільну сукню зі штучних тканин з додаванням натуральної нитки. Ціна на такий вид тканини в два рази нижча, а за зовнішнім виглядом вони майже однакові.&lt;/span&gt;&lt;/span&gt;&lt;/div&gt;\r\n&lt;div style=&quot;text-align: justify;&quot;&gt;\r\n	&amp;nbsp;&lt;/div&gt;\r\n&lt;div style=&quot;text-align: justify;&quot;&gt;\r\n	&lt;em&gt;&lt;strong&gt;&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;color: rgb(94, 0, 94);&quot;&gt;Чи всім підійде стиль весільного плаття &amp;laquo;русалка&amp;raquo;?&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/em&gt;&lt;/div&gt;\r\n&lt;div style=&quot;text-align: justify;&quot;&gt;\r\n	&amp;nbsp;&lt;/div&gt;\r\n&lt;div style=&quot;text-align: justify;&quot;&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;color: rgb(94, 0, 94);&quot;&gt;Багатьом нареченим подобається стиль &amp;laquo;русалка&amp;raquo; або &amp;laquo;рибка&amp;raquo;, але вони сумніваються, чи підійде такий, відверто обтягуючий силует. Ми відповідаємо, так, він підходить, майже всім. Ми шиємо весільну сукню так, що недоліки вашої фігури будуть приховані. Спідницю русалка можна зробити, як від колін, так і від стегон. Не обов&amp;#39;язково робити акцент на стегнах. Зайвий живіт допоможе прибрати щільний корсет. Не позбавляйте себе задоволення блиснути на своєму весіллі сукнею в стилі &amp;laquo;русалка&amp;raquo;.&lt;/span&gt;&lt;/span&gt;&lt;/div&gt;\r\n&lt;div style=&quot;text-align: justify;&quot;&gt;\r\n	&amp;nbsp;&lt;/div&gt;\r\n&lt;div style=&quot;text-align: justify;&quot;&gt;\r\n	&lt;em&gt;&lt;strong&gt;&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;color: rgb(94, 0, 94);&quot;&gt;Скільки коштує пошити весільну сукню?&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/em&gt;&lt;br /&gt;\r\n	&amp;nbsp;&lt;/div&gt;\r\n&lt;div style=&quot;text-align: justify;&quot;&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;color: rgb(94, 0, 94);&quot;&gt;Поговоримо трохи про ціни. Ціни на весільні сукні дуже різні. Так з чого ж складається ціна? По-перше, це ручна робота кравців, по-друге, це вартість матеріалів. На сукню потрібно від трьох до п&amp;#39;ятнадцяти метрів тканини, залежно від моделі, плюс необхідні додаткові елементи, такі як кісточки, чашечки, флезілін і підкладка. Ціна ж на сам пошив залежить від багатьох факторів, таких як: кількість ручної праці в моделі, складність крою і побудова лекал.&lt;/span&gt;&lt;/span&gt;&lt;/div&gt;\r\n&lt;div style=&quot;text-align: justify;&quot;&gt;\r\n	&amp;nbsp;&lt;/div&gt;\r\n&lt;div style=&quot;text-align: justify;&quot;&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;color: rgb(94, 0, 94);&quot;&gt;Ручна праця це та робота, яку швея робить руками, без використання швейної машинки. Наприклад, вона може вручну розшивати плаття бісером або стразами, може вручну нашивати мереживо і декоративні елементи.&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color: rgb(94, 0, 94); font-size: 16px;&quot;&gt;Складність крою визначається самою моделлю.&amp;nbsp;&lt;/span&gt;&lt;/div&gt;\r\n&lt;div style=&quot;text-align: justify;&quot;&gt;\r\n	&amp;nbsp;&lt;/div&gt;\r\n&lt;div style=&quot;text-align: justify;&quot;&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;color: rgb(94, 0, 94);&quot;&gt;Побудова лекал теж має свою систему складності. Якщо це стандартна модель, то лекала беруться вже наявні, але якщо це модель з додаванням дизайнерських елементів, то кравець виміряє і будує нові лекала.&lt;/span&gt;&lt;/span&gt;&lt;/div&gt;\r\n'),
(39, 2, 'Вечірні сукні', 'Вечірні сукні, плаття на випускний Львів', 'Весільний салон Анна Шарм пронує - ексклюзивні вечірні сукні та плаття на випускний у місті Львів. Висока якість та великий асортимент товару Вас приємно здивують.', '&lt;div style=&quot;text-align: center;&quot;&gt;\r\n	&lt;span style=&quot;color:#5e005e;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;b&gt;Вечірні сукні&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/div&gt;\r\n&lt;div style=&quot;text-align: justify;&quot;&gt;\r\n	&lt;span style=&quot;color:#5e005e;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;Що як не чудова вечірня сукня робить жінку ще прекраснішою і бажанішою в очах чоловіків. Це неймовірне відчуття впевненості, комфортності, яке приходить з правильно підібраним вечірнім образом та платтям. Кожна жінка має право відчути себе неперевершеною, а як відомо, для цього обов&amp;rsquo;язковим атрибутом є сукня. Мода мінлива, тому свій вечірній гардероб потрібно постійно оновлювати. Це не враховуючи особливих подій, на які вибір сукні це &amp;laquo;пів справи&amp;raquo;. Мова йде про випускний вечір чи день народження керівника компанії. Події такого масштабу потребують ретельної підготовки, та допомоги спеціалістів. Якщо ви думаєте що для цього потрібно багато коштів то Вам варто звернутись у &amp;laquo;Анна Шарм&amp;raquo;, що у Львові, де за доступними цінами ви зможете обрати якісну сукню, яка підкреслить всі ваші переваги і сховає недоліки. У весільному салон &amp;laquo;Анна Шарм&amp;raquo; Ви знайдете ексклюзивні вечірні сукні у Львові на будь-який випадок життя та плаття на випускний. Висока якість та великий асортимент товару, за доступними цінами, Вас приємно здивують. Не потрібно обирати між якістю та ціною! Вибирайте вечірні сукні у Львові в &amp;laquo;Анна Шарм&amp;raquo;.&lt;/span&gt;&lt;/span&gt;&lt;br /&gt;\r\n	&amp;nbsp;&lt;/div&gt;\r\n&lt;div style=&quot;text-align: center;&quot;&gt;\r\n	&lt;span style=&quot;color:#5e005e;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;b&gt;Плаття на випускний від салону &amp;quot;Анна Шарм&amp;quot;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/div&gt;\r\n&lt;div style=&quot;text-align: justify;&quot;&gt;\r\n	&lt;span style=&quot;color:#5e005e;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;Закінчення шкільних років символічно називають &amp;laquo;кроком з дитинства у доросле життя&amp;raquo;. І це дійсно так. Вже не буде уроків і вчителів, ніхто не буде вмовляти виконувати домашнє завдання чи не пропускати занять. Після школи починається формування самостійної особистості, що в кінцевому результаті стане дорослою людиною. Але поки є можливість насолодитись останніми моментами безтурботних шкільних днів, варто замислитись про найважливішу подію, що чекає вас в кінці навчального року &amp;ndash; випускний вечір. Для дівчат це особливий день. Вечірнє плаття на випускний, макіяж, зачіска, нові туфлі, аксесуари, що може бути радіснішим і приємнішим. Проте як же вибрати плаття, щоб і ціна була адекватна, і щоб всі подруги заздрили. Вихід є з весільним салоном &amp;laquo;Анна Шарм&amp;raquo;. Найексклюзивніші плаття на випускний у місті Львів, при цьому високої якості та за доступну ціну. З великого асортименту товару Ви обов&amp;rsquo;язково виберете сам те, що підходить вашій фігурі. Спеціалісти салону допоможуть підібрати аксесуари та повністю довершити вечірній образ. Ви будете сяяти!&lt;/span&gt;&lt;/span&gt;&lt;/div&gt;\r\n'),
(43, 2, 'Наші клієнти', '', '', '...'),
(41, 2, 'Колекції весільних суконь', 'Весільні сукні м. Львів - салон &quot;Анна Шарм&quot;', 'Весільний салон &quot;Анна Шарм&quot;  пропонує великий вибір весільних суконь і аксесуарів у місті Львові, у нас виконають будь-які побажання кожної нареченої!', '&lt;div style=&quot;text-align: center;&quot;&gt;\r\n	&lt;br /&gt;\r\n	&lt;span style=&quot;color:#5e005e;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;b&gt;Весільні сукні Львів - салон &amp;quot;Анна Шарм&amp;quot;&amp;nbsp;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/div&gt;\r\n&lt;div style=&quot;text-align: justify;&quot;&gt;\r\n	&lt;span style=&quot;font-size: 16px; color: rgb(94, 0, 94); text-align: justify;&quot;&gt;День весілля &amp;ndash; це єдиний день коли жінка, прокинувшись, вже знає, що одягне. Але ж які приємні муки передували цьому дню. Не потрібно розказувати наскільки є важливою весільна сукня нареченої. Ще будучи маленькими дівчатками, ми уявляли себе, в цей найщасливіший день, в шикарній весільній сукні, від якої мліли всі навколо. Подорослішавши наші бажання не змінились, все така ж шикарна весільна сукня, має покорити всіх запрошених гостей, та й просто людей на вулиці. Кожна з нас вірить в те, що &amp;laquo;білу сукню&amp;raquo; одягне лише раз, тому вона має бути бездоганною. Мода мінлива, з кожним роком з&amp;rsquo;являються все нові і нові тенденції на весільні сукні. Весільний салон &amp;laquo;Анна Шарм&amp;raquo;, вже досить давно працює на цьому ринку, тому як ніхто краще знаємо про всі нові модні тенденції та які весільні сукні модні саме у Львові. У нас Ви зможете знайти ідеальну сукню, саме таку, яку ви мріяли одягнути в цей радісний день, при цьому якість буде відповідати адекватній ціні. Дозвольте собі повністю насолодитись днем свого весілля, в прекрасній, комфортній весільній сукні від &amp;laquo;Анна Шарм&amp;raquo;.&lt;/span&gt;&lt;/div&gt;\r\n'),
(44, 2, 'Партнери', '', '', '&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;span style=&quot;font-family:arial,helvetica,sans-serif;&quot;&gt;&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;color:#9900cc;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;line-height: 15.07px;&quot;&gt;НАШІ ПАРТНЕРИ Rooftop restaurant &amp;amp; club &amp;laquo;PartyFon&amp;raquo;.&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;br /&gt;\r\n&lt;br style=&quot;color: rgb(0, 0, 0); font-family: tahoma, arial, verdana, sans-serif, ''Lucida Sans''; font-size: 11px; line-height: 15.07px;&quot; /&gt;\r\n&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;color:#800080;&quot;&gt;&lt;span style=&quot;line-height: 15.07px;&quot;&gt;Rooftop restaurant &amp;amp; club &amp;laquo;PartyFon&amp;raquo;: вдень &amp;ndash; це розкішний ресторан із приголомшливим інтер&amp;rsquo;єром та авторською кухнею, сувора елегантність та розкішна панорама міста Лева, вночі &amp;ndash; це яскравий клуб із цікавими програмами щотижня.&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: tahoma, arial, verdana, sans-serif, ''Lucida Sans''; font-size: 11px; line-height: 15.07px;&quot; /&gt;\r\n&lt;span style=&quot;line-height: 15.07px;&quot;&gt;У цьому ресторані панує затишок та насолода. Завітавши до &amp;laquo;PartyFon&amp;raquo; &amp;ndash; всі життєві турботи залишаться за кам&amp;rsquo;яним муром, а Вам випаде нагода стати митцем театру страв та справжнім гурманом у пануючому дусі старого Львова. Дозвольте відпочити своїй душі, і тілу.&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: tahoma, arial, verdana, sans-serif, ''Lucida Sans''; font-size: 11px; line-height: 15.07px;&quot; /&gt;\r\n&lt;span style=&quot;line-height: 15.07px;&quot;&gt;Ресторан ідеально підійде, як для романтичної вечері закоханих, так і для зустрічі старих друзів.&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: tahoma, arial, verdana, sans-serif, ''Lucida Sans''; font-size: 11px; line-height: 15.07px;&quot; /&gt;\r\n&lt;span style=&quot;line-height: 15.07px;&quot;&gt;Центральне розташування ідеально підходить для бізнес-перемовин, офіційного прийняття, бенкету, чи просто сімейного обіду.&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: tahoma, arial, verdana, sans-serif, ''Lucida Sans''; font-size: 11px; line-height: 15.07px;&quot; /&gt;\r\n&lt;span style=&quot;line-height: 15.07px;&quot;&gt;м. Львів, пл. Соборна 14-15 Торгово - офісний центр Роксолана&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: tahoma, arial, verdana, sans-serif, ''Lucida Sans''; font-size: 11px; line-height: 15.07px;&quot; /&gt;\r\n&lt;br /&gt;\r\n');

-- --------------------------------------------------------

--
-- Структура таблиці `information_image`
--

CREATE TABLE IF NOT EXISTS `information_image` (
  `information_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `information_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `image_desc` varchar(255) DEFAULT '',
  PRIMARY KEY (`information_image_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13722 ;

--
-- Дамп даних таблиці `information_image`
--

INSERT INTO `information_image` (`information_image_id`, `information_id`, `image`, `sort_order`, `image_desc`) VALUES
(13379, 39, 'data/vechirni_sykni/12_Evening_Dresses.jpg', 991, '\\r2\\nВечірні сукні'),
(13378, 39, 'data/vechirni_sykni/11_Evening_Dresses.jpg', 990, '\\r2\\nВечірні сукні'),
(13377, 39, 'data/vechirni_sykni/10_Evening_Dresses.jpg', 989, '\\r2\\nВечірні сукні'),
(13376, 39, 'data/vechirni_sykni/9_Evening_Dresses.jpg', 987, '\\r2\\nВечірні сукні'),
(13375, 39, 'data/vechirni_sykni/8_Evening_Dresses.jpg', 986, '\\r2\\nВечірні сукні'),
(13701, 41, 'data/sykni/DSC_5260.JPG', 4089, '\\r2\\n'),
(13700, 41, 'data/sykni/DSC_5217.JPG', 4089, '\\r2\\n'),
(13699, 41, 'data/sykni/DSC_9422.jpg', 4088, '\\r2\\n'),
(13698, 41, 'data/sykni/21_zachisku-600x700.jpg', 4087, '\\r2\\n'),
(13697, 41, 'data/sykni/DSC_9427.jpg', 4086, '\\r2\\n'),
(13696, 41, 'data/sykni/DSC_9377.jpg', 4085, '\\r2\\n'),
(13695, 41, 'data/sykni/DSC_9364.jpg', 4084, '\\r2\\n'),
(13694, 41, 'data/sykni/DSC_9355.jpg', 4083, '\\r2\\n'),
(13693, 41, 'data/sykni/DSC_7417.JPG', 4082, '\\r2\\nЗлата'),
(13692, 41, 'data/sykni/9_zachisku-600x700.jpg', 4081, '\\r2\\nЗлата'),
(13691, 41, 'data/sykni/WNgsyUgp1vQ.jpg', 4080, '\\r2\\nКароліна'),
(13690, 41, 'data/sykni/DSC_7479.JPG', 4079, '\\r2\\nКароліна'),
(13689, 41, 'data/sykni/53.jpg', 4078, '\\r2\\nКароліна'),
(13683, 41, 'data/sykni/33.jpg', 3300, '\\r2\\nКatrin'),
(13688, 41, 'data/sykni/DSC_5180.JPG', 4073, '\\r2\\n'),
(13687, 41, 'data/sykni/DSC_5153.JPG', 4072, '\\r2\\n'),
(13686, 41, 'data/sykni/DSC_5117.JPG', 4071, '\\r2\\n'),
(13685, 41, 'data/sykni/DSC_5229.JPG', 4050, '\\r2\\n'),
(13684, 41, 'data/sykni/34.jpg', 3400, '\\r2\\nКatrin'),
(13682, 41, 'data/sykni/32.jpg', 3200, '\\r2\\nAfina'),
(13681, 41, 'data/sykni/31.jpg', 3100, '\\r2\\nAfina'),
(13680, 41, 'data/sykni/30.jpg', 3000, '\\r2\\nRoksana'),
(13679, 41, 'data/sykni/29.jpg', 2900, '\\r2\\nBohemia'),
(13678, 41, 'data/sykni/28.jpg', 2800, '\\r2\\nBohemia'),
(13374, 39, 'data/vechirni_sykni/7_Evening_Dresses.jpg', 985, '\\r2\\nВечірні сукні'),
(13372, 39, 'data/vechirni_sykni/3_nikol.jpg', 982, '\\r2\\nNikol'),
(13677, 41, 'data/sykni/27.jpg', 2700, '\\r2\\nJoice'),
(13676, 41, 'data/sykni/26.jpg', 2600, '\\r2\\nJoice'),
(13675, 41, 'data/sykni/25.jpg', 2500, '\\r2\\nOlivia'),
(13373, 39, 'data/vechirni_sykni/6_Evening_Dresses.jpg', 983, '\\r2\\nRia'),
(13370, 39, 'data/vizaj/2_nikol.jpg', 980, '\\r2\\nНіколь №2'),
(13371, 39, 'data/vechirni_sykni/2_Evening_Dresses.jpg', 981, '\\r2\\nВечірні сукні'),
(13368, 39, 'data/vechirni_sykni/1_Nikol2.jpg', 979, '\\r2\\nNikol2'),
(13369, 39, 'data/vechirni_sykni/4_Oksana.jpg', 980, '\\r2\\nOksana'),
(13367, 39, 'data/vechirni_sykni/salon_klaudia_0009.jpg', 978, '\\r2\\nMilana'),
(13366, 39, 'data/vechirni_sykni/salon_klaudia_0008.jpg', 976, '\\r2\\nMia'),
(13365, 39, 'data/vechirni_sykni/BpUWHruv2BE.jpg', 975, '\\r2\\nKatrin'),
(13364, 39, 'data/vechirni_sykni/uyjHFFvTrCE.jpg', 974, '\\r2\\nIzabel'),
(13363, 39, 'data/vechirni_sykni/137509397451f644d6941e9-333x500.jpg', 973, '\\r2\\nIzabel'),
(13362, 39, 'data/2016 vechirni/3wlUcP_0cEc.jpg', 970, '\\r2\\nSara'),
(13355, 39, 'data/2016 vechirni/0wMtb35k5bM.jpg', 963, '\\r2\\nMishell'),
(13361, 39, 'data/2016 vechirni/IMG_5068.jpg', 969, '\\r2\\nSara'),
(13360, 39, 'data/2016 vechirni/88bxJZUwz-4.jpg', 968, '\\r2\\nSara'),
(13359, 39, 'data/2016 vechirni/I4Rug5nzyPI.jpg', 967, '\\r2\\nAdel'),
(13358, 39, 'data/2016 vechirni/I4Rug5nzyPI.jpg', 966, '\\r2\\nAdel'),
(13357, 39, 'data/2016 vechirni/3n48ww5NeVc.jpg', 965, '\\r2\\nAdel'),
(13356, 39, 'data/2016 vechirni/wf5ONd9J8aE.jpg', 964, '\\r2\\nAdel'),
(13671, 41, 'data/sykni/45.jpg', 2301, '\\r2\\nЛаура'),
(13672, 41, 'data/sykni/EV9wAF6Zhns.jpg', 2302, '\\r2\\nЛаура'),
(13673, 41, 'data/sykni/rBvT6hZFGKQ.jpg', 2303, '\\r2\\nЛаура'),
(13674, 41, 'data/sykni/24.jpg', 2400, '\\r2\\nKristal'),
(13670, 41, 'data/sykni/23.jpg', 2300, '\\r2\\nk05060-1x'),
(13667, 41, 'data/sykni/20.jpg', 2000, '\\r2\\nk05078-1x'),
(13668, 41, 'data/sykni/21.jpg', 2100, '\\r2\\nk05078-1x'),
(13669, 41, 'data/sykni/22.jpg', 2200, '\\r2\\nk05060-1x'),
(13666, 41, 'data/sykni/19.jpg', 1900, '\\r2\\nk05004-1x'),
(13665, 41, 'data/sykni/18.jpg', 1800, '\\r2\\nk05004-1x'),
(13664, 41, 'data/sykni/17.jpg', 1700, '\\r2\\nk05084-0z'),
(13663, 41, 'data/sykni/16.jpg', 1600, '\\r2\\nk05084-0z'),
(13662, 41, 'data/sykni/15.jpg', 1500, '\\r2\\nk05084-0z'),
(13661, 41, 'data/sykni/14.jpg', 1400, '\\r2\\nk95064-1x'),
(13660, 41, 'data/sykni/13.jpg', 1300, '\\r2\\nk95064-1x'),
(13659, 41, 'data/sykni/12.jpg', 1200, '\\r2\\nk95076-1x'),
(13658, 41, 'data/sykni/11.jpg', 1100, '\\r2\\nk95076-1x'),
(13657, 41, 'data/sykni/10.jpg', 1000, '\\r2\\nk95076-1x'),
(13656, 41, 'data/sykni/9.jpg', 990, '\\r2\\nk95162-1x'),
(13655, 41, 'data/sykni/8.jpg', 980, '\\r2\\nk95162-1x'),
(13654, 41, 'data/sykni/7.jpg', 979, '\\r2\\nk95162-1x'),
(13653, 41, 'data/sykni/DSC_8845.JPG', 962, '\\r2\\nДіва'),
(13651, 41, 'data/sykni/6.jpg', 960, '\\r2\\nДіва'),
(13652, 41, 'data/sykni/DSC_8828.JPG', 961, '\\r2\\nДіва'),
(13650, 41, 'data/sykni/DSC_8800.JPG', 959, '\\r2\\nБіла троянда'),
(13649, 41, 'data/sykni/5.jpg', 958, '\\r2\\nБіла троянда'),
(13648, 41, 'data/sykni/111111.JPG', 957, '\\r2\\nБіла троянда'),
(13647, 41, 'data/sykni/4.jpg', 956, '\\r2\\nФея'),
(13646, 41, 'data/sykni/DSC_8782.JPG', 955, '\\r2\\nФея'),
(13645, 41, 'data/sykni/DSC_8788.JPG', 954, '\\r2\\nФея'),
(13644, 41, 'data/sykni/DSC_8764.JPG', 952, '\\r2\\nМаргарита'),
(13643, 41, 'data/sykni/DSC_8761.JPG', 951, '\\r2\\nМаргарита'),
(13642, 41, 'data/sykni/3.jpg', 950, '\\r2\\nМаргарита'),
(13641, 41, 'data/sykni/2.jpg', 945, '\\r2\\nNineli'),
(13640, 41, 'data/sykni/1.jpg', 940, '\\r2\\nАфіна'),
(13639, 41, 'data/sykni_062014/higar_novias19.jpeg', 932, '\\r2\\nNovias'),
(13638, 41, 'data/sykni_062014/higar_novias13.jpeg', 931, '\\r2\\nNovias'),
(13637, 41, 'data/sykni_062014/e5gOgWZ1bCY.jpg', 930, '\\r2\\nAnna Sharm Desing 2015 №012'),
(13636, 41, 'data/sykni_062014/Mzjztlmstd8.jpg', 929, '\\r2\\nAnna Sharm Desing 2015 №012'),
(13635, 41, 'data/sykni_062014/NsVHAuQDPaI.jpg', 928, '\\r2\\nAnna Sharm Desing 2015 №011'),
(13633, 41, 'data/sykni_062014/eT3FfUFvT-w.jpg', 926, '\\r2\\nAnna Sharm Desing 2015 №011'),
(13634, 41, 'data/sykni_062014/s2Din1aj4OI.jpg', 927, '\\r2\\nAnna Sharm Desing 2015 №011'),
(13631, 41, 'data/sykni_062014/cENFyZY9QV4.jpg', 924, '\\r2\\nAnna Sharm Desing 2015 №173'),
(13632, 41, 'data/sykni_062014/mZZ6v-E4lr0.jpg', 925, '\\r2\\nAnna Sharm Desing 2015 №011'),
(13630, 41, 'data/sykni_062014/IPLbsAq_Cf4.jpg', 923, '\\r2\\nAnna Sharm Desing 2015 №173'),
(13629, 41, 'data/sykni_062014/-9IMF_tAPN0.jpg', 922, '\\r2\\nAnna Sharm Desing 2015 №173'),
(13628, 41, 'data/sykni_062014/1ldXaxSu7Zw.jpg', 921, '\\r2\\nAnna Sharm Desing 2015 Christina'),
(13626, 41, 'data/sykni_062014/LjZboymn0EI.jpg', 919, '\\r2\\n&quot;Pronovias&quot;'),
(13627, 41, 'data/sykni_062014/iJU9EBDM9y8.jpg', 920, '\\r2\\nAnna Sharm Desing 2015 Christina'),
(13625, 41, 'data/sykni_062014/France-413x500.jpg', 918, '\\r2\\n&quot;Pronovias&quot;'),
(13624, 41, 'data/sykni_062014/DGmcDajVTJ0.jpg', 917, '\\r2\\n&quot;Pronovias&quot;'),
(13622, 41, 'data/sykni_062014/RfC4-2srvw4.jpg', 915, '\\r2\\nKnightly '),
(13623, 41, 'data/sykni_062014/CCGWijOoXgo.jpg', 916, '\\r2\\nKnightly '),
(13621, 41, 'data/sykni_062014/7hFeEh18Mb8.jpg', 914, '\\r2\\nKnightly '),
(13620, 41, 'data/sykni_062014/ABB_5827-700x700.jpg', 912, '\\r2\\nСукня № 176'),
(13619, 41, 'data/sykni_062014/ABB_5821-700x700.jpg', 911, '\\r2\\nСукня № 176'),
(13618, 41, 'data/sykni_062014/ABB_5815-700x700.jpg', 910, '\\r2\\nСукня № 176'),
(13617, 41, 'data/sykni_062014/ABB_5753-700x700.jpg', 909, '\\r2\\nСукня № 173'),
(13616, 41, 'data/sykni_062014/ABB_5748-700x700.jpg', 908, '\\r2\\nСукня № 173'),
(13615, 41, 'data/sykni_062014/ABB_5743-700x700.jpg', 907, '\\r2\\nСукня № 173'),
(13614, 41, 'data/sykni_062014/Y11320-01.jpg', 906, '\\r2\\nSophia Tolli (USA)'),
(13613, 41, 'data/sykni_062014/y11320_sophia_tolli_wedding_dress_primary.jpg', 905, '\\r2\\nSophia Tolli (USA)'),
(13612, 41, 'data/sykni_062014/main_image.jpg', 904, '\\r2\\nSophia Tolli (USA)'),
(13611, 41, 'data/sykni_062014/sQeE8zmhB5aOFaj8.jpg', 903, '\\r2\\nGalina Signature Style (USA)'),
(13610, 41, 'data/sykni_062014/Davi270_1.jpg', 902, '\\r2\\nGalina Signature Style (USA)'),
(13609, 41, 'data/sykni_062014/1200x1200_1388084222103-dbis14swg625ivoryfron.jpg', 901, '\\r2\\nGalina Signature Style (USA)'),
(13608, 41, 'data/sykni/108_82013.jpg', 900, '\\r2\\nСукня №108 ВЕСНЯНА КВІТКА'),
(13607, 41, 'data/sykni/108_72013.jpg', 899, '\\r2\\nСукня №108 ВЕСНЯНА КВІТКА'),
(13606, 41, 'data/sykni/108_52013.jpg', 896, '\\r2\\nСукня №108 ВЕСНЯНА КВІТКА'),
(13605, 41, 'data/sykni/105_42013.jpg', 895, '\\r2\\nСукня №105 ПЕРЛИНА'),
(13604, 41, 'data/sykni/105_82013.jpg', 894, '\\r2\\nСукня №105 ПЕРЛИНА'),
(13603, 41, 'data/sykni/105_72013.jpg', 892, '\\r2\\nСукня №105 ПЕРЛИНА'),
(13602, 41, 'data/sykni/105_62013.jpg', 890, '\\r2\\nСукня №105 ПЕРЛИНА'),
(13598, 41, 'data/sykni/090_52013.jpg', 884, '\\r2\\nСукня №090'),
(13599, 41, 'data/sykni/092_72013.jpg', 886, '\\r2\\nСукня 092К'),
(13600, 41, 'data/sykni/092_112013.jpg', 888, '\\r2\\nСукня №092F'),
(13601, 41, 'data/sykni/092_142013.jpg', 889, '\\r2\\nСукня №092F'),
(13597, 41, 'data/sykni/090_12013.jpg', 883, '\\r2\\nСукня №090'),
(13592, 41, 'data/sykni/089_42013.jpg', 878, '\\r2\\nСукня №89'),
(13593, 41, 'data/sykni/089_52013.jpg', 879, '\\r2\\nСукня №89'),
(13594, 41, 'data/sykni/089_62013.jpg', 880, '\\r2\\nСукня №89'),
(13595, 41, 'data/sykni/109_12013.jpg', 881, '\\r2\\nСукня №109'),
(13596, 41, 'data/sykni/109_22013.jpg', 882, '\\r2\\nСукня №109'),
(13591, 41, 'data/sykni/089_22013.jpg', 876, '\\r2\\nСукня №89'),
(13590, 41, 'data/sykni/077_82013.jpg', 874, '\\r2\\nСукня №077'),
(13589, 41, 'data/sykni/077_72013.jpg', 872, '\\r2\\nСукня №077'),
(13588, 41, 'data/sykni/077_62013.jpg', 870, '\\r2\\nСукня №077'),
(13586, 41, 'data/sykni/037_42013.jpg', 864, '\\r2\\nСукня №037'),
(13587, 41, 'data/sykni/037_62013.jpg', 868, '\\r2\\nСукня №037'),
(13585, 41, 'data/sykni/037_32013.jpg', 862, '\\r2\\nСукня №037'),
(13584, 41, 'data/sykni/028_52013.jpg', 860, '\\r2\\nСукня №028'),
(13583, 41, 'data/sykni/028_22013.jpg', 858, '\\r2\\nСукня №028'),
(13582, 41, 'data/sykni/028_12013.jpg', 856, '\\r2\\nСукня №028'),
(13581, 41, 'data/sykni_062014/verawang33.jpg', 855, '\\r2\\nVera Wang (USA)'),
(13580, 41, 'data/sykni_062014/verawang33-1.jpg', 854, '\\r2\\nVera Wang (USA)'),
(13579, 41, 'data/sykni_062014/1000052_615833665101313_1506998794_n.jpg', 853, '\\r2\\nVera Wang (USA)'),
(13578, 41, 'data/sykni_062014/227_2.jpg', 846, '\\r2\\nСукня №227'),
(13577, 41, 'data/sykni_062014/227_1.jpg', 845, '\\r2\\nСукня №227'),
(13576, 41, 'data/sykni_062014/Photo (10).jpg', 844, '\\r2\\nСукня №223'),
(13575, 41, 'data/sykni_062014/223_2.jpg', 843, '\\r2\\nСукня №223'),
(13574, 41, 'data/sykni_062014/223_1.jpg', 842, '\\r2\\nСукня №223'),
(13573, 41, 'data/sykni_062014/222_2.jpg', 841, '\\r2\\nСукня №222'),
(13572, 41, 'data/sykni_062014/222_1.jpg', 840, '\\r2\\nСукня №222'),
(13571, 41, 'data/sykni_062014/1222.jpg', 839, '\\r2\\nСукня №222'),
(13570, 41, 'data/sykni_062014/Photo (7).jpg', 838, '\\r2\\nСукня №221'),
(13569, 41, 'data/sykni_062014/221_2.jpg', 837, '\\r2\\nСукня №221'),
(13568, 41, 'data/sykni_062014/221_1.jpg', 836, '\\r2\\nСукня №221'),
(13566, 41, 'data/sykni_062014/196_1.jpg', 834, '\\r2\\nСукня №196'),
(13567, 41, 'data/sykni_062014/196_2.jpg', 835, '\\r2\\nСукня №196'),
(13565, 41, 'data/sykni_062014/193_2.jpg', 833, '\\r2\\nСукня №193'),
(13564, 41, 'data/sykni_062014/193_1.jpg', 832, '\\r2\\nСукня №193'),
(13563, 41, 'data/sykni_062014/179_2.jpg', 831, '\\r2\\nСукня №179'),
(13562, 41, 'data/sykni_062014/Photo (3).jpg', 831, '\\r2\\nСукня №179'),
(13561, 41, 'data/sykni_062014/179_1.jpg', 830, '\\r2\\nСукня №179'),
(13560, 41, 'data/sykni_062014/7mcMztZ_UKY.jpg', 828, '\\r2\\nAnna Sharm Desing 2015 Maxima'),
(13559, 41, 'data/sykni_062014/QcVRCNpZ0CE.jpg', 827, '\\r2\\nAnna Sharm Desing 2015 Maxima'),
(13558, 41, 'data/sykni_062014/AHF_0206.jpg', 826, '\\r2\\nAnna Sharm Desing 2015 Maxima'),
(13557, 41, 'data/sykni_062014/MJIg1FyZ31k.jpg', 825, '\\r2\\nAnna Sharm Desing 2015 Milan'),
(13556, 41, 'data/sykni_062014/hE91OcCZ5UE.jpg', 824, '\\r2\\nAnna Sharm Desing 2015 Milan'),
(13555, 41, 'data/sykni_062014/_Q4uLvs--FQ.jpg', 823, '\\r2\\nAnna Sharm Desing 2015 Milan'),
(13554, 41, 'data/sykni_062014/SRsfVkSX69Q.jpg', 822, '\\r2\\nAnna Sharm Desing 2015 Malena'),
(13549, 41, 'data/7Sv1K-XYb8M.jpg', 817, '\\r2\\nAnna Sharm Desing 2015 Madonna'),
(13550, 41, 'data/sykni_062014/EjzzPhPiDlA.jpg', 818, '\\r2\\nAnna Sharm Desing 2015 Madonna'),
(13551, 41, 'data/sykni_062014/AHF_0098.jpg', 819, '\\r2\\nAnna Sharm Desing 2015 Madonna'),
(13552, 41, 'data/sykni_062014/bDnnKsdB7oA.jpg', 820, '\\r2\\nAnna Sharm Desing 2015 Malena'),
(13553, 41, 'data/sykni_062014/g6bq5nZF-WA.jpg', 821, '\\r2\\nAnna Sharm Desing 2015 Malena'),
(13548, 41, 'data/sykni_062014/4ii5T2WUwCk.jpg', 816, '\\r2\\nAnna Sharm Desing 2015 Virdginia'),
(13547, 41, 'data/sykni_062014/YGCyQnM8N9k.jpg', 815, '\\r2\\nAnna Sharm Desing 2015 Virdginia'),
(13546, 41, 'data/sykni_062014/AHF_0016.jpg', 813, '\\r2\\nAnna Sharm Desing  Livia'),
(13545, 41, 'data/sykni_062014/AHF_0058-1.jpg', 812, '\\r2\\nAnna Sharm Desing  Livia'),
(13544, 41, 'data/sykni_062014/AHF_0040-1.jpg', 811, '\\r2\\nAnna Sharm Desing Anna'),
(13543, 41, 'data/sykni_062014/AHF_0017.jpg', 810, '\\r2\\nAnna Sharm Desing Anna'),
(13542, 41, 'data/sykni_062014/AHF_0034-1.jpg', 809, '\\r2\\nAnna Sharm Desing Anna'),
(13541, 41, 'data/sykni_062014/AHF_0074.jpg', 808, '\\r2\\nAnna Sharm Desing Patrisia'),
(13540, 41, 'data/sykni_062014/AHF_0084.jpg', 806, '\\r2\\nAnna Sharm Desing Patrisia'),
(13539, 41, 'data/sykni_062014/AHF_0167.jpg', 805, '\\r2\\nAnna Sharm Desing  Daniella'),
(13538, 41, 'data/sykni_062014/AHF_0191.jpg', 804, '\\r2\\nAnna Sharm Desing  Daniella'),
(13537, 41, 'data/sykni_062014/AHF_0130.jpg', 803, '\\r2\\nAnna Sharm Desing  Mishel'),
(13536, 41, 'data/sykni_062014/AHF_0116.jpg', 802, '\\r2\\nAnna Sharm Desing  Mishel'),
(13528, 41, 'data/LATISHA.jpg', 793, '\\r2\\nLite by Dominiss Latisha'),
(13529, 41, 'data/LAURA2.jpg', 794, '\\r2\\nLite by Dominiss Laura'),
(13530, 41, 'data/LAURA1.jpg', 795, '\\r2\\nLite by Dominiss Laura'),
(13531, 41, 'data/LAURA.jpg', 796, '\\r2\\nLite by Dominiss Laura'),
(13532, 41, 'data/LARYS1.jpg', 798, '\\r2\\nLite by Dominiss Larys'),
(13533, 41, 'data/LARYS.jpg', 799, '\\r2\\nLite by Dominiss Larys'),
(13534, 41, 'data/lama1.jpg', 800, '\\r2\\nLite by Dominiss Lama'),
(13535, 41, 'data/lama.jpg', 801, '\\r2\\nLite by Dominiss Lama'),
(13526, 41, 'data/LATISHA2.jpg', 791, '\\r2\\nLite by Dominiss Latisha'),
(13527, 41, 'data/LATISHA1.jpg', 792, '\\r2\\nLite by Dominiss Latisha'),
(13525, 41, 'data/Laury (3).jpg', 790, '\\r2\\nLite by Dominiss Laury'),
(13524, 41, 'data/Laury (5).jpg', 789, '\\r2\\nLite by Dominiss Laury'),
(13523, 41, 'data/LAURY.jpg', 787, '\\r2\\nLite by Dominiss Laury'),
(13521, 41, 'data/LEANTE1.jpg', 785, '\\r2\\nLite by Dominiss Leante'),
(13522, 41, 'data/LEANTE.jpg', 786, '\\r2\\nLite by Dominiss Leante'),
(13520, 41, 'data/LEANTE2.jpg', 784, '\\r2\\nLite by Dominiss Leante'),
(13519, 41, 'data/LENNI.jpg', 783, '\\r2\\nLite by Dominiss Lenni'),
(13518, 41, 'data/LENNI1.jpg', 782, '\\r2\\nLite by Dominiss Lenni'),
(13517, 41, 'data/LEONNE.jpg', 781, '\\r2\\nLite by Dominiss Leonne'),
(13515, 41, 'data/LEOZA1.jpg', 779, '\\r2\\nLite by Dominiss Leoza'),
(13516, 41, 'data/LEONNE1.jpg', 780, '\\r2\\nLite by Dominiss Leonne'),
(13514, 41, 'data/LEOZA.jpg', 778, '\\r2\\nLite by Dominiss Leoza'),
(13513, 41, 'data/LESSIE.jpg', 777, '\\r2\\nLite by Dominiss Lessie'),
(13512, 41, 'data/LESSIE1.jpg', 776, '\\r2\\nLite by Dominiss Lessie'),
(13511, 41, 'data/LESTER1.jpg', 775, '\\r2\\nLite by Dominiss Lester'),
(13510, 41, 'data/LESTER2.jpg', 774, '\\r2\\nLite by Dominiss Lester'),
(13509, 41, 'data/LESTER3.jpg', 773, '\\r2\\nLite by Dominiss Lester'),
(13508, 41, 'data/LETICIA.jpg', 772, '\\r2\\nLite by Dominiss Leticia'),
(13507, 41, 'data/LETICIA1.jpg', 771, '\\r2\\nLite by Dominiss Leticia'),
(13506, 41, 'data/LETICIA2.jpg', 770, '\\r2\\nLite by Dominiss Leticia'),
(13505, 41, 'data/LEXIA3.jpg', 769, '\\r2\\nLite by Dominiss Lexia'),
(13504, 41, 'data/LEXIA1.jpg', 768, '\\r2\\nLite by Dominiss Lexia'),
(13503, 41, 'data/LEXIA2.jpg', 767, '\\r2\\nLite by Dominiss Lexia'),
(13502, 41, 'data/LIANNA1.jpg', 765, '\\r2\\nLite by Dominiss Lianna'),
(13501, 41, 'data/LIANNA3.jpg', 764, '\\r2\\nLite by Dominiss Lianna'),
(13500, 41, 'data/LIANNA2.jpg', 763, '\\r2\\nLite by Dominiss Lianna'),
(13499, 41, 'data/LIDIA.jpg1.jpg', 762, '\\r2\\nLite by Dominiss Lidia'),
(13498, 41, 'data/LIDIA2.jpg', 761, '\\r2\\nLite by Dominiss Lidia'),
(13497, 41, 'data/LILAK1.jpg', 760, '\\r2\\nLite by Dominiss Lilak'),
(13496, 41, 'data/LILAK2.jpg', 759, '\\r2\\nLite by Dominiss Lilak'),
(13495, 41, 'data/LINDA1.jpg', 758, '\\r2\\nLite by Dominiss Linda'),
(13494, 41, 'data/LINDA2.jpg', 757, '\\r2\\nLite by Dominiss Linda'),
(13493, 41, 'data/LINDA3.jpg', 756, '\\r2\\nLite by Dominiss Linda'),
(13490, 41, 'data/LIRA2.jpg', 753, '\\r2\\nLite by Dominiss Lira'),
(13492, 41, 'data/LIRA1.jpg', 755, '\\r2\\nLite by Dominiss Lira'),
(13491, 41, 'data/LIRA3.jpg', 754, '\\r2\\nLite by Dominiss Lira'),
(13354, 39, 'data/2016 vechirni/msyXpFKaCRg.jpg', 962, '\\r2\\nMishell'),
(13353, 39, 'data/2016 vechirni/QrlYtNadbr8.jpg', 961, '\\r2\\nMishell'),
(13352, 39, 'data/2016 vechirni/IMG_5348.jpg', 960, '\\r2\\nLiora '),
(13351, 39, 'data/2016 vechirni/IMG_5333.jpg', 959, '\\r2\\nLiora '),
(13350, 39, 'data/2016 vechirni/IMG_5350.jpg', 958, '\\r2\\nLiora '),
(13349, 39, 'data/2016 vechirni/IMG_5351.jpg', 957, '\\r2\\nLiora '),
(13348, 39, 'data/2016 vechirni/a98rgRhrlVg.jpg', 956, '\\r2\\nMilan'),
(13489, 41, 'data/LOIS.jpg1.jpg', 752, '\\r2\\nLite by Dominiss Lois'),
(13488, 41, 'data/LOIS.jpg2.jpg', 751, '\\r2\\nLite by Dominiss Lois'),
(13487, 41, 'data/LOIS.jpg3.jpg', 750, '\\r2\\nLite by Dominiss Lois'),
(13486, 41, 'data/LOLITA1.jpg', 749, '\\r2\\nLite by Dominiss Lolita'),
(13485, 41, 'data/LOLITA2.jpg', 748, '\\r2\\nLite by Dominiss Lolita'),
(13484, 41, 'data/LONDON1.jpg', 747, '\\r2\\nLite by Dominiss London'),
(13483, 41, 'data/LONDON2.jpg', 746, '\\r2\\nLite by Dominiss London'),
(13482, 41, 'data/LONDON3.jpg', 745, '\\r2\\nLite by Dominiss London'),
(13480, 41, 'data/LORA1.jpg', 743, '\\r2\\nLite by Dominiss Lora'),
(13481, 41, 'data/LORA2.jpg', 744, '\\r2\\nLite by Dominiss Lora'),
(13477, 41, 'data/LOREN3.jpg', 740, '\\r2\\nLite by Dominiss Loren'),
(13478, 41, 'data/LOREN1.jpg', 741, '\\r2\\nLite by Dominiss Loren'),
(13479, 41, 'data/LOREN2.jpg', 742, '\\r2\\nLite by Dominiss Loren'),
(13476, 41, 'data/LOTUS.jpg', 739, '\\r2\\nLite by Dominiss Lotus'),
(13475, 41, 'data/LOTUS1.jpg', 738, '\\r2\\nLite by Dominiss Lotus'),
(13474, 41, 'data/LUSYA2.jpg', 737, '\\r2\\nLite by Dominiss Lusya'),
(13473, 41, 'data/LUSYA1.jpg', 736, '\\r2\\nLite by Dominiss Lusya'),
(13472, 41, 'data/LUSYA3.jpg', 735, '\\r2\\nLite by Dominiss Lusya'),
(13471, 41, 'data/2016 vesilni/IMG_5628.jpg', 734, '\\r2\\nMaricca'),
(13470, 41, 'data/2016 vesilni/IMG_5626.jpg', 733, '\\r2\\nMaricca'),
(13469, 41, 'data/2016 vesilni/IMG_5623.jpg', 732, '\\r2\\nMaricca'),
(13468, 41, 'data/2016 vesilni/4ijokN619Co.jpg', 731, '\\r2\\nMaricca'),
(13467, 41, 'data/2016 vesilni/IMG_5725.jpg', 730, '\\r2\\nSicilia'),
(13466, 41, 'data/2016 vesilni/WJvdK8EOzco.jpg', 729, '\\r2\\nSicilia'),
(13465, 41, 'data/2016 vesilni/IMG_5709.jpg', 728, '\\r2\\nSicilia'),
(13462, 41, 'data/2016 vesilni/IMG_5923.jpg', 724, '\\r2\\nJeny'),
(13464, 41, 'data/2016 vesilni/IMG_5707.jpg', 727, '\\r2\\nSicilia'),
(13463, 41, 'data/2016 vesilni/IMG_5702.jpg', 726, '\\r2\\nSicilia'),
(13461, 41, 'data/2016 vesilni/IMG_5910.jpg', 723, '\\r2\\nJeny'),
(13460, 41, 'data/2016 vesilni/IMG_5933.jpg', 722, '\\r2\\nJeny'),
(13459, 41, 'data/2016 vesilni/IMG_5832.jpg', 721, '\\r2\\nMelani'),
(13458, 41, 'data/2016 vesilni/IMG_5820.jpg', 720, '\\r2\\nMelani'),
(13457, 41, 'data/2016 vesilni/IMG_5797.jpg', 719, '\\r2\\nMelani'),
(13456, 41, 'data/2016 vesilni/IMG_5804.jpg', 718, '\\r2\\nMelani'),
(13455, 41, 'data/2016 vesilni/wPEyFPDqZ9o.jpg', 717, '\\r2\\nMelani'),
(13454, 41, 'data/2016 vesilni/IMG_5849.jpg', 716, '\\r2\\nAdel 3'),
(13453, 41, 'data/2016 vesilni/IMG_5845.jpg', 715, '\\r2\\nAdel 3'),
(13452, 41, 'data/2016 vesilni/1LQ0-CQRjs0.jpg', 714, '\\r2\\nAdel 3'),
(13451, 41, 'data/2016 vesilni/IMG_5856.jpg', 713, '\\r2\\nAdel 2'),
(13450, 41, 'data/2016 vesilni/IMG_5882.jpg', 712, '\\r2\\nAdel 1'),
(13449, 41, 'data/2016 vesilni/8xPxlx4k9oU.jpg', 711, '\\r2\\nAdel 1'),
(13448, 41, 'data/2016 vesilni/-22CcYwhsFA.jpg', 710, '\\r2\\nAdel 1'),
(13447, 41, 'data/2016 vesilni/Y5ogkeHYpqI.jpg', 709, '\\r2\\nЖакет'),
(13446, 41, 'data/2016 vesilni/xzSvss7sNCw.jpg', 708, '\\r2\\nЖакет'),
(13445, 41, 'data/2016 vesilni/IMG_5896.jpg', 706, '\\r2\\nЖакет'),
(13444, 41, 'data/2016 vesilni/lapVl3nswNk.jpg', 705, '\\r2\\nSara'),
(13443, 41, 'data/2016 vesilni/IMG_5900.jpg', 704, '\\r2\\nSara'),
(13442, 41, 'data/2016 vesilni/hMw_EJwbj8g.jpg', 703, '\\r2\\nSara'),
(13441, 41, 'data/2016 vesilni/IMG_5902.jpg', 702, '\\r2\\nSara'),
(13440, 41, 'data/2016 vesilni/dAnPzu_K5sM.jpg', 701, '\\r2\\nLaticia'),
(13439, 41, 'data/2016 vesilni/IMG_5946.jpg', 700, '\\r2\\nLaticia'),
(13438, 41, 'data/2016 vesilni/7lzzFPxBqkE.jpg', 699, '\\r2\\nLaticia'),
(13437, 41, 'data/2016 vesilni/IMG_5764.jpg', 698, '\\r2\\nЗлата'),
(13436, 41, 'data/2016 vesilni/IMG_5773.jpg', 697, '\\r2\\nЗлата'),
(13435, 41, 'data/2016 vesilni/IMG_5760.jpg', 696, '\\r2\\nЗлата'),
(13434, 41, 'data/2016 vesilni/8yhuffRGdT02.jpg', 695, '\\r2\\nCrystal'),
(13433, 41, 'data/2016 vesilni/IMG_57091.jpg', 694, '\\r2\\nCrystal'),
(13432, 41, 'data/2016 vesilni/kupum4Z8nok1.jpg', 693, '\\r2\\nCrystal'),
(13431, 41, 'data/2016 vesilni/IMG_6182.jpg', 691, '\\r2\\nСофія'),
(13430, 41, 'data/2016 vesilni/IMG_6183.jpg', 690, '\\r2\\nСофія'),
(13429, 41, 'data/2016 vesilni/IMG_6178.jpg', 689, '\\r2\\nСофія'),
(13347, 39, 'data/2016 vechirni/bNcl3jjqskM.jpg', 955, '\\r2\\nMilan'),
(13346, 39, 'data/2016 vechirni/wGPWkPYh06E.jpg', 954, '\\r2\\nMilan'),
(13345, 39, 'data/2016 vechirni/UGXPMkiJjIo.jpg', 953, '\\r2\\nStella'),
(13344, 39, 'data/2016 vechirni/q2aZAXUY7Oo.jpg', 952, '\\r2\\nStella'),
(13343, 39, 'data/2016 vechirni/xm6cSE37qBA.jpg', 951, '\\r2\\nStella and Bianca'),
(13342, 39, 'data/2016 vechirni/ERABSjcQKoA.jpg', 950, '\\r2\\nStella and Bianca'),
(13341, 39, 'data/2016 vechirni/KmGYz-iCw1k.jpg', 949, '\\r2\\nBianca'),
(13340, 39, 'data/2016 vechirni/g277RigDDIU.jpg', 948, '\\r2\\nBianca'),
(13339, 39, 'data/2016 vechirni/ZdT7HFpj6DU.jpg', 947, '\\r2\\nBianca'),
(13338, 39, 'data/2016 vechirni/CCWyBp0ZS0Q.jpg', 944, '\\r2\\nMarsella '),
(13337, 39, 'data/2016 vechirni/tCMSyLit5q0.jpg', 943, '\\r2\\nMarsella '),
(13336, 39, 'data/2016 vechirni/OfJOaTLAVt8.jpg', 942, '\\r2\\nMarsella '),
(13335, 39, 'data/2016 vechirni/AxqB_Y9R_aw.jpg', 941, '\\r2\\nMarsella and Patricia'),
(13334, 39, 'data/2016 vechirni/7WkGj85YfyU.jpg', 940, '\\r2\\nPatricia'),
(13333, 39, 'data/2016 vechirni/bY61k8OVp7Q.jpg', 939, '\\r2\\nPatricia'),
(13332, 39, 'data/2016 vechirni/vtn7Idsrz0A.jpg', 938, '\\r2\\nPatricia'),
(13331, 39, 'data/2016 vechirni/Ge91vv0b7fs.jpg', 937, '\\r2\\nJesica'),
(13330, 39, 'data/2016 vechirni/9nTcqLPibgA.jpg', 936, '\\r2\\nJesica'),
(13329, 39, 'data/2016 vechirni/IMG_6575.jpg', 935, '\\r2\\nJesica'),
(13323, 39, 'data/2016 vechirni/hBWqindawIM.jpg', 929, '\\r2\\nGlory'),
(13324, 39, 'data/2016 vechirni/iybLRVPadOo.jpg', 930, '\\r2\\nGlory'),
(13325, 39, 'data/2016 vechirni/z4EB389-01w.jpg', 931, '\\r2\\nGlory and Erica'),
(13326, 39, 'data/2016 vechirni/IMG_6543.jpg', 932, '\\r2\\nErica'),
(13327, 39, 'data/2016 vechirni/wDZTnU-OEEU.jpg', 933, '\\r2\\nErica'),
(13328, 39, 'data/2016 vechirni/R5DA7lmffxE.jpg', 934, '\\r2\\nErica'),
(13321, 39, 'data/2016 vechirni/IMG_6517.jpg', 927, '\\r2\\nGlory'),
(13322, 39, 'data/2016 vechirni/IMG_6521.jpg', 928, '\\r2\\nGlory'),
(13320, 39, 'data/2016 vechirni/XEnhSvCt4lA.jpg', 926, '\\r2\\nFavorite'),
(13319, 39, 'data/2016 vechirni/IMG_6608.jpg', 925, '\\r2\\nFavorite'),
(13318, 39, 'data/2016 vechirni/IMG_6631.jpg', 924, '\\r2\\nFavorite and Late'),
(13317, 39, 'data/2016 vechirni/1tm0f1eHQ48.jpg', 923, '\\r2\\nLate'),
(13427, 41, 'data/2016 vesilni/IMG_6211.jpg', 686, '\\r2\\n'),
(13428, 41, 'data/2016 vesilni/IMG_6190.jpg', 687, '\\r2\\nСофія'),
(13426, 41, 'data/2016 vesilni/IMG_6209.jpg', 685, '\\r2\\nDione'),
(13425, 41, 'data/2016 vesilni/IMG_6207.jpg', 684, '\\r2\\nDione'),
(13424, 41, 'data/2016 vesilni/IMG_6208.jpg', 683, '\\r2\\nDione'),
(13423, 41, 'data/2016 vesilni/IMG_6197.jpg', 682, '\\r2\\nDione'),
(13421, 41, 'data/2016 vesilni/IMG_6166.jpg', 681, '\\r2\\nJeneva'),
(13422, 41, 'data/2016 vesilni/IMG_6203.jpg', 681, '\\r2\\nDione'),
(13414, 41, 'data/2016 vesilni/IMG_6156.jpg', 674, '\\r2\\nЗлата'),
(13415, 41, 'data/2016 vesilni/IMG_6151.jpg', 675, '\\r2\\nЗлата'),
(13416, 41, 'data/2016 vesilni/IMG_6157.jpg', 676, '\\r2\\nЗлата'),
(13417, 41, 'data/2016 vesilni/IMG_6158.jpg', 677, '\\r2\\nЗлата'),
(13420, 41, 'data/2016 vesilni/IMG_6169.jpg', 680, '\\r2\\nJeneva'),
(13419, 41, 'data/2016 vesilni/IMG_6177.jpg', 679, '\\r2\\nJeneva'),
(10920, 43, 'data/klientu/IMG-127.JPG', 1006, '\\r2\\n'),
(10919, 43, 'data/klientu/IMG-143 (1).JPG', 1005, '\\r2\\n'),
(10918, 43, 'data/klientu/2hx-gml0T7g.jpg', 1004, '\\r2\\n'),
(10915, 43, 'data/klientu/txwNs66Oy8g.jpg', 1001, '\\r2\\n'),
(10916, 43, 'data/klientu/_IvrVxkdGS8.jpg', 1002, '\\r2\\n'),
(10917, 43, 'data/klientu/UbUJY7i6c8Q.jpg', 1003, '\\r2\\n'),
(10914, 43, 'data/klientu/IaSwXedpHp0.jpg', 1000, '\\r2\\n'),
(10913, 43, 'data/klientu/12.jpg', 999, '\\r2\\nХристина Anna Sharm Design'),
(10912, 43, 'data/klientu/aF0xeHOspZ01.jpg', 998, '\\r2\\nХристина Anna Sharm Design'),
(10909, 43, 'data/klientu/h0K40imvOv4.jpg', 994, '\\r2\\nОльга у сукні Anna Sharm Design'),
(10910, 43, 'data/klientu/253.jpg', 996, '\\r2\\nХристина Anna Sharm Design'),
(10911, 43, 'data/klientu/LTXKMvIhQWQ23.jpg', 997, '\\r2\\nХристина Anna Sharm Design'),
(10908, 43, 'data/klientu/QLcWEijI3t8.jpg', 993, '\\r2\\nОльга у сукні Anna Sharm Design'),
(10907, 43, 'data/klientu/-Xf0RHgAFoU.jpg', 992, '\\r2\\n Anna Sharm Design'),
(13418, 41, 'data/2016 vesilni/IMG_6160.jpg', 678, '\\r2\\nЗлата'),
(13412, 41, 'data/2016 vesilni/IMG_6226.jpg', 672, '\\r2\\nSion'),
(13413, 41, 'data/2016 vesilni/IMG_6232.jpg', 673, '\\r2\\nSion'),
(10906, 43, 'data/klientu/rVtAnTXQRFw.jpg', 991, '\\r2\\n Anna Sharm Design'),
(10736, 44, 'data/WwrrJWlUXzo.jpg', 0, '\\r2\\n'),
(10905, 43, 'data/klientu/A_5y1eYOvhU.jpg', 990, '\\r2\\n Anna Sharm Design'),
(10904, 43, 'data/klientu/J7LIQnmhDPM.jpg', 989, '\\r2\\n Anna Sharm Design'),
(10903, 43, 'data/klientu/Ky4BZoA78KE.jpg', 987, '\\r2\\nОлександра у сукні Anna Sharm Design'),
(10902, 43, 'data/klientu/h1KvT1etlR4.jpg', 988, '\\r2\\n Anna Sharm Design'),
(10901, 43, 'data/klientu/LXmxQkGco1I.jpg', 986, '\\r2\\nОлександра у сукні Anna Sharm Design'),
(10900, 43, 'data/klientu/Mli3ZmVEA6I.jpg', 985, '\\r2\\nОлександра у сукні Anna Sharm Design'),
(10899, 43, 'data/klientu/xJv5X2HrtQY.jpg', 984, '\\r2\\nОлександра у сукні Anna Sharm Design'),
(10898, 43, 'data/klientu/U5d9pBcgAhI.jpg', 983, '\\r2\\nБогдана  у сукні Anna Sharm Design'),
(10897, 43, 'data/klientu/xQjQEvqXDZI.jpg', 982, '\\r2\\nБогдана  у сукні Anna Sharm Design'),
(10896, 43, 'data/klientu/zpK9MdSb9DA.jpg', 981, '\\r2\\nБогдана  у сукні Anna Sharm Design'),
(10895, 43, 'data/klientu/911BfufGJoc.jpg', 980, '\\r2\\nБогдана  у сукні Anna Sharm Design'),
(10893, 43, 'data/klientu/001-445.jpg', 978, '\\r2\\nАнастасія у сукні Ida Torez &quot; Avrora&quot;'),
(10894, 43, 'data/klientu/001-405.jpg', 979, '\\r2\\nАнастасія у сукні Ida Torez &quot; Avrora&quot;'),
(10892, 43, 'data/klientu/001-468.jpg', 976, '\\r2\\nАнастасія у сукні Ida Torez &quot; Avrora&quot;'),
(10891, 43, 'data/klientu/001-17.jpg', 975, '\\r2\\nАнастасія у сукні Ida Torez &quot; Avrora&quot;'),
(10890, 43, 'data/klientu/99RSsJb56eE.jpg', 974, '\\r2\\nГалина у сукні Anna Sharm Design'),
(10889, 43, 'data/klientu/hvP9w-FJkaw.jpg', 973, '\\r2\\nГалина у сукні Anna Sharm Design'),
(10888, 43, 'data/klientu/B-wWlyYyn3s.jpg', 973, '\\r2\\nГалина у сукні Anna Sharm Design'),
(10887, 43, 'data/klientu/kxvnIYveyLM.jpg', 972, '\\r2\\nГалина у сукні Anna Sharm Design'),
(10886, 43, 'data/klientu/ferKzW2ZL-o.jpg', 972, '\\r2\\nГалина у сукні Anna Sharm Design'),
(10885, 43, 'data/klientu/xYF2GbpkLAI1.jpg', 971, '\\r2\\nЗоряна у сукні Anna Sharm Design'),
(10884, 43, 'data/klientu/mhDE_KvtdXI1.jpg', 970, '\\r2\\nЗоряна у сукні Anna Sharm Design'),
(10883, 43, 'data/klientu/A5HOS5eg28g1.jpg', 969, '\\r2\\nЗоряна у сукні Anna Sharm Design'),
(13411, 41, 'data/2016 vesilni/IMG_6235.jpg', 671, '\\r2\\nSion'),
(13410, 41, 'data/2016 vesilni/IMG_6220.jpg', 670, '\\r2\\nSion'),
(13409, 41, 'data/2016 vesilni/IMG_6357.jpg', 669, '\\r2\\nНіжність'),
(13408, 41, 'data/2016 vesilni/IMG_6360.jpg', 668, '\\r2\\nНіжність'),
(13407, 41, 'data/2016 vesilni/IMG_6341.jpg', 667, '\\r2\\nНіжність'),
(13406, 41, 'data/2016 vesilni/IMG_6345.jpg', 665, '\\r2\\nНіжність'),
(13401, 41, 'data/2016 vesilni/IMG_6318.jpg', 659, '\\r2\\nGloria'),
(13402, 41, 'data/2016 vesilni/IMG_6126.jpg', 661, '\\r2\\nMocco'),
(13403, 41, 'data/2016 vesilni/IMG_6129.jpg', 662, '\\r2\\nMocco'),
(13404, 41, 'data/2016 vesilni/IMG_6139.jpg', 663, '\\r2\\nMocco'),
(13405, 41, 'data/2016 vesilni/IMG_6141.jpg', 664, '\\r2\\nMocco'),
(13400, 41, 'data/2016 vesilni/IMG_6326.jpg', 658, '\\r2\\nGloria'),
(13399, 41, 'data/2016 vesilni/IMG_6337.jpg', 660, '\\r2\\nGloria'),
(13398, 41, 'data/2016 vesilni/IMG_6307.jpg', 657, '\\r2\\nноркова шубка'),
(13397, 41, 'data/2016 vesilni/IMG_6302.jpg', 654, '\\r2\\nноркова шубка'),
(13396, 41, 'data/2016 vesilni/IMG_6297.jpg', 653, '\\r2\\nЛілея'),
(13395, 41, 'data/2016 vesilni/IMG_6296.jpg', 652, '\\r2\\nЛілея'),
(13394, 41, 'data/2016 vesilni/IMG_6291.jpg', 651, '\\r2\\nЛілея'),
(13393, 41, 'data/2016 vesilni/IMG_6293.jpg', 650, '\\r2\\nЛілея'),
(13392, 41, 'data/2016 vesilni/IMG_6274.jpg', 649, '\\r2\\nРомашка'),
(13391, 41, 'data/2016 vesilni/IMG_6261.jpg', 648, '\\r2\\nРомашка'),
(13390, 41, 'data/2016 vesilni/IMG_6250.jpg', 647, '\\r2\\nРомашка'),
(13389, 41, 'data/2016 vesilni/IMG_6254.jpg', 646, '\\r2\\nРомашка'),
(13316, 39, 'data/2016 vechirni/WVgE0DgcAa4.jpg', 922, '\\r2\\nLate'),
(13315, 39, 'data/2016 vechirni/IMG_6653.jpg', 921, '\\r2\\nLate'),
(13314, 39, 'data/2016 vechirni/x_rGO2l4nF4.jpg', 920, '\\r2\\nMarsala'),
(13313, 39, 'data/2016 vechirni/IMG_66591.jpg', 919, '\\r2\\nMarsala'),
(13312, 39, 'data/2016 vechirni/IMG_6654.jpg', 918, '\\r2\\nMarsala'),
(13311, 39, 'data/2016 vechirni/IMG_6664.jpg', 917, '\\r2\\nMarsala'),
(13310, 39, 'data/2016 vechirni/KfK1H6KQxJQ.jpg', 916, '\\r2\\nEmma'),
(13309, 39, 'data/2016 vechirni/IMG_6599.jpg', 915, '\\r2\\nEmma'),
(13308, 39, 'data/2016 vechirni/IMG_6585.jpg', 914, '\\r2\\nEmma'),
(13307, 39, 'data/2016 vechirni/IMG_6606.jpg', 913, '\\r2\\nEmma'),
(13304, 39, 'data/2016 vechirni/LyTjiC-G0Zw.jpg', 910, '\\r2\\nAstoria'),
(13305, 39, 'data/2016 vechirni/RKyEzbiNVlU.jpg', 911, '\\r2\\nAstoria'),
(13306, 39, 'data/2016 vechirni/z1OVAvzBeAo.jpg', 912, '\\r2\\nAstoria'),
(13303, 39, 'data/2016 vechirni/IMG_6376.jpg', 909, '\\r2\\nAmeliny'),
(13302, 39, 'data/2016 vechirni/IMG_6367.jpg', 908, '\\r2\\nAmeliny'),
(13301, 39, 'data/2016 vechirni/IMG_6383.jpg', 907, '\\r2\\nAmeliny'),
(13300, 39, 'data/2016 vechirni/IMG_6373.jpg', 906, '\\r2\\nAmeliny'),
(13299, 39, 'data/2016 vechirni/IMG_6418.jpg', 905, '\\r2\\nBritany'),
(13298, 39, 'data/2016 vechirni/IMG_6423.jpg', 904, '\\r2\\nBritany'),
(13297, 39, 'data/2016 vechirni/IMG_6410.jpg', 903, '\\r2\\nBritany'),
(13296, 39, 'data/2016 vechirni/IMG_6434.jpg', 902, '\\r2\\nBoston and Britany'),
(13295, 39, 'data/2016 vechirni/IMG_6458.jpg', 901, '\\r2\\nBoston'),
(13294, 39, 'data/2016 vechirni/IMG_6461.jpg', 900, '\\r2\\nBoston'),
(13293, 39, 'data/2016 vechirni/IMG_6466.jpg', 899, '\\r2\\nBoston'),
(13292, 39, 'data/2016 vechirni/IMG_6486.jpg', 898, '\\r2\\nDonna'),
(13291, 39, 'data/2016 vechirni/IMG_6484.jpg', 897, '\\r2\\nDonna'),
(13290, 39, 'data/2016 vechirni/IMG_6472.jpg', 896, '\\r2\\nDonna'),
(13289, 39, 'data/2016 vechirni/IMG_6470.jpg', 895, '\\r2\\nDonna'),
(13288, 39, 'data/2016 vechirni/IMG_6467.jpg', 894, '\\r2\\nDonna'),
(13287, 39, 'data/2016 vechirni/IMG_6502.jpg', 893, '\\r2\\nAmely'),
(13286, 39, 'data/2016 vechirni/IMG_6491.jpg', 892, '\\r2\\nAmely'),
(13285, 39, 'data/2016 vechirni/IMG_6493.jpg', 891, '\\r2\\nAmely'),
(13380, 39, 'data/vechirni_sykni/13_Evening_Dresses.jpg', 992, '\\r2\\nВечірні сукні'),
(13381, 39, 'data/vechirni_sykni/14_Evening_Dresses.jpg', 993, '\\r2\\nВечірні сукні'),
(13382, 39, 'data/vechirni_sykni/15_Evening_Dresses.jpg', 994, '\\r2\\nDiana'),
(13383, 39, 'no_image.jpg', 995, '\\r2\\nDiana'),
(13384, 39, 'data/vechirni_sykni/16_Evening_Dresses.jpg', 996, '\\r2\\nВечірні сукні'),
(13385, 39, 'data/vechirni_sykni/17_Evening_Dresses.jpg', 997, '\\r2\\nNikol'),
(13386, 39, 'data/vizaj/1_nikol.jpg', 998, '\\r2\\nNikol'),
(13387, 39, 'data/vechirni_sykni/18_Evening_Dresses.jpg', 999, '\\r2\\nВечірні сукні'),
(13388, 39, 'data/vechirni_sykni/19_Evening_Dresses.jpg', 1000, '\\r2\\nВечірні сукні'),
(13702, 41, 'data/sykni/DSC_5239.JPG', 4090, '\\r2\\n'),
(13703, 41, 'data/sykni/42.jpg', 4200, '\\r2\\nРозалі'),
(13704, 41, 'data/sykni/40.jpg', 4201, '\\r2\\nЮлія'),
(13705, 41, 'data/sykni/43.jpg', 4300, '\\r2\\nМіскелі'),
(13706, 41, 'data/sykni/44.jpg', 4400, '\\r2\\nЛеді вайт'),
(13707, 41, 'data/sykni/46.jpg', 4600, '\\r2\\nЕнжела'),
(13708, 41, 'data/sykni/47.jpg', 4700, '\\r2\\nДаяна'),
(13709, 41, 'data/sykni/50.jpg', 4701, '\\r2\\nАнета'),
(13710, 41, 'data/sykni/51.jpg', 4702, '\\r2\\nАврора'),
(13711, 41, 'data/sykni/35.jpg', 4703, '\\r2\\nАnna №2'),
(13712, 41, 'data/sykni/36.jpg', 4704, '\\r2\\nЕlisia'),
(13713, 41, 'data/sykni/37.jpg', 4705, '\\r2\\nNikolya'),
(13714, 41, 'data/sykni/38.jpg', 4706, '\\r2\\nАnna'),
(13715, 41, 'data/sykni/39.jpg', 4707, '\\r2\\nFelichita'),
(13716, 41, 'data/sykni/55.jpg', 5500, '\\r2\\nМарта'),
(13717, 41, 'no_image.jpg', 5700, '\\r2\\nБогдана'),
(13718, 41, 'data/sykni/58.jpg', 5800, '\\r2\\nГабріелла'),
(13719, 41, 'data/sykni/59.jpg', 5900, '\\r2\\nЗлата'),
(13720, 41, 'data/sykni/60.jpg', 6000, '\\r2\\nЗлата'),
(13721, 41, 'data/sykni/62.jpg', 6200, '\\r2\\nСукня');

-- --------------------------------------------------------

--
-- Структура таблиці `information_to_layout`
--

CREATE TABLE IF NOT EXISTS `information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблиці `information_to_store`
--

CREATE TABLE IF NOT EXISTS `information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп даних таблиці `information_to_store`
--

INSERT INTO `information_to_store` (`information_id`, `store_id`) VALUES
(39, 0),
(41, 0),
(42, 0),
(43, 0),
(44, 0);

-- --------------------------------------------------------

--
-- Структура таблиці `language`
--

CREATE TABLE IF NOT EXISTS `language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `code` varchar(5) COLLATE utf8_bin NOT NULL,
  `locale` varchar(255) COLLATE utf8_bin NOT NULL,
  `image` varchar(64) COLLATE utf8_bin NOT NULL,
  `directory` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `filename` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=6 ;

--
-- Дамп даних таблиці `language`
--

INSERT INTO `language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `filename`, `sort_order`, `status`) VALUES
(2, 'Українська', 'ua', 'ua_UA.utf-8, ua_ua, ukrainian', 'ua.png', 'ukrainian', 'ukrainian', 0, 1);

-- --------------------------------------------------------

--
-- Структура таблиці `layout`
--

CREATE TABLE IF NOT EXISTS `layout` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`layout_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=13 ;

--
-- Дамп даних таблиці `layout`
--

INSERT INTO `layout` (`layout_id`, `name`) VALUES
(1, 'Home'),
(4, 'Default'),
(8, 'Contact'),
(9, 'Sitemap'),
(11, 'Information');

-- --------------------------------------------------------

--
-- Структура таблиці `layout_route`
--

CREATE TABLE IF NOT EXISTS `layout_route` (
  `layout_route_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`layout_route_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=33 ;

--
-- Дамп даних таблиці `layout_route`
--

INSERT INTO `layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(26, 1, 0, 'common/home'),
(24, 11, 0, 'information/information'),
(31, 8, 0, 'information/contact');

-- --------------------------------------------------------

--
-- Структура таблиці `length_class`
--

CREATE TABLE IF NOT EXISTS `length_class` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL,
  PRIMARY KEY (`length_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;

--
-- Дамп даних таблиці `length_class`
--

INSERT INTO `length_class` (`length_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '10.00000000'),
(3, '2.57000000');

-- --------------------------------------------------------

--
-- Структура таблиці `length_class_description`
--

CREATE TABLE IF NOT EXISTS `length_class_description` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) COLLATE utf8_bin NOT NULL,
  `unit` varchar(4) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`length_class_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;

--
-- Дамп даних таблиці `length_class_description`
--

INSERT INTO `length_class_description` (`length_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 2, 'Сантиметр', 'см.'),
(2, 2, 'Міліметр', 'мм.'),
(3, 2, 'Дюйм', 'in');

-- --------------------------------------------------------

--
-- Структура таблиці `manufacturer`
--

CREATE TABLE IF NOT EXISTS `manufacturer` (
  `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=52 ;

--
-- Дамп даних таблиці `manufacturer`
--

INSERT INTO `manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`) VALUES
(8, 'ARIEL', 'data/manufacturers/ariel.png', 1),
(9, 'ACE', 'data/4c92c-ace.png', 3),
(49, 'HPinc', 'data/manufacturers/hp_logo.jpg', 5);

-- --------------------------------------------------------

--
-- Структура таблиці `manufacturer_to_store`
--

CREATE TABLE IF NOT EXISTS `manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`manufacturer_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп даних таблиці `manufacturer_to_store`
--

INSERT INTO `manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES
(8, 0),
(9, 0),
(49, 0);

-- --------------------------------------------------------

--
-- Структура таблиці `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(1) NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `image_size` int(1) NOT NULL DEFAULT '0',
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=9 ;

--
-- Дамп даних таблиці `news`
--

INSERT INTO `news` (`news_id`, `status`, `image`, `image_size`, `date_added`) VALUES
(1, 1, '', 0, '2012-11-05 19:17:20'),
(2, 1, 'data/leohostel/IMG_7540-7542.jpg', 0, '2012-11-05 19:40:57'),
(3, 1, 'data/leohostel/IMG_7697-7702.jpg', 0, '2012-11-05 21:44:57'),
(5, 0, 'data/Leohostel/IMG_7540-7542.jpg', 0, '2012-12-05 08:45:09'),
(6, 0, 'data/Leohostel/IMG_7478.jpg', 0, '2012-12-05 08:47:59'),
(7, 1, 'data/61408671__SHokolad.jpg', 0, '2013-01-14 14:23:59'),
(8, 1, '', 0, '2013-01-20 12:45:14');

-- --------------------------------------------------------

--
-- Структура таблиці `news_description`
--

CREATE TABLE IF NOT EXISTS `news_description` (
  `news_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `meta_description` varchar(255) COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`news_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп даних таблиці `news_description`
--

INSERT INTO `news_description` (`news_id`, `language_id`, `title`, `meta_description`, `description`) VALUES
(1, 3, '&quot;Леохостел&quot; приглашает на Рождественскую ярмарку 2013 ', 'Рождественскую ярмарку 2013, лехостел , львов проживание, отели львова', '&lt;p style=&quot;text-align: justify; &quot;&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;span id=&quot;result_box&quot; lang=&quot;ru&quot;&gt;&lt;span title=&quot;&amp;quot;Леохостел&amp;quot; запрошує львів''ян та гостей міста на Різдвяний ярмарок&quot;&gt;&lt;strong&gt;&amp;quot;Леохостел&amp;quot;&lt;/strong&gt; приглашает львовян и гостей города на&lt;strong&gt; Рождественскую ярмарку&lt;/strong&gt;&lt;/span&gt;&lt;br /&gt;\r\n	&lt;span title=&quot;Офіційне відкриття – 8 грудня 2012&quot;&gt;Официальное открытие - 8 декабря 2012&lt;/span&gt;&lt;br /&gt;\r\n	&lt;span title=&quot;Офіційне закриття – 14 січня 2013&quot;&gt;Официальное закрытие - 14 января 2013&lt;/span&gt;&lt;br /&gt;\r\n	&lt;span title=&quot;Час роботи ярмарку: робочі дні 12.00 – 22.00, вихідні та святкові 11.00 – 23.00&quot;&gt;Время работы ярмарки: рабочие дни 12.00 - 22.00, выходные и праздничные 11.00 - 23.00&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;span title=&quot;Цьогорічний Різдвяний ярмарок традиційно стане епіцентром святкувань із безліччю цікавих заходів та подій для кожного львів''янина та гостя нашого міста&quot;&gt;НынешниЯ Рождественская ярмарка традиционно станет эпицентром торжеств с множеством интересных мероприятий и событий для каждого львовянина и гостя нашего города&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;span title=&quot;На території ярмарок постійно діятимуть:&quot;&gt;На территории ярмарка постоянно действуют:&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&amp;nbsp; &amp;nbsp; - &amp;nbsp; &lt;/span&gt;&lt;span title=&quot;Гастрономічний сектор( презентація страв національної кухні)&quot;&gt;Гастрономический сектор (презентация блюд национальной кухни)&lt;br /&gt;\r\n	&amp;nbsp; - &lt;/span&gt;&lt;span title=&quot;Сувенірний сектор ( презентація, виставки-продаж виробів кращих народних майстрів України)&quot;&gt;Сувенирный сектор (презентация, выставки-продажи изделий лучших народных мастеров Украины)&lt;br /&gt;\r\n	&amp;nbsp; - &lt;/span&gt;&lt;span title=&quot;“Територія різдвяного настрою” (різдвяна розважальна програма для дорослих та дітей).&quot;&gt;&amp;quot;Территория рождественского настроения&amp;quot; (рождественская развлекательная программа для взрослых и детей).&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;span title=&quot;На площі перед Львівською оперою на час проведення Різдвяної ярмарки відбуватимуться різноманітні культурні заходи, проводитимуться тематичні майстер-класи, відбуватимуться виступи фольклорних колективів не тільки зі Львова, а й з усієї країни.&quot;&gt;На площади перед Львовской оперой на время проведения Рождественской ярмарки будут проходить культурные мероприятия, будут проводиться тематические мастер-классы, пройдут выступления фольклорных коллективов не только из Львова, но и всей страны.&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;span title=&quot;7 січня на площі перед Львівською оперою відбудеться приготування різдвяної куті та частування нею усіх гостей ярмарки.&quot;&gt;7 января на площади перед Львовской оперой состоится приготовления рождественской кутьи и угощение им всех гостей ярмарки.&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;span title=&quot;Просто неба буде встановлено величезний казаннавколо якого буде розміщений подіум на якому кращі господині Львова будуть проводити майстер-класи з розтирання маку, подріблення горіхів,замочування родзинок та кураги та ін.&quot;&gt;Будет установлен огромный казан, вокруг&amp;nbsp; которого размещен подиум, на котором лучшие хозяйки Львова будут проводить мастер-классы с растирания мака, дробления орехов, замачивание изюма и кураги и др..&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;span title=&quot;Усі ці інгредієнти потім стануть завершальним акордом у приготуванні, а потім і частуванні під веселу коляду.&quot;&gt;Все эти ингредиенты потом станут завершающим аккордом в приготовлении, а затем и угощении под веселую коляду.&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n'),
(2, 2, 'НОВИЙ хостел у Львові', '', '&lt;pre style=&quot;text-align: justify;&quot;&gt;\r\n&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;strong&gt;Ексклюзивна пропозиція!&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/pre&gt;\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;Пропонуємо для туристичних груп - школярів, студентів, дорослих подорожуючих,&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family: ''trebuchet ms'', helvetica, sans-serif; font-size: 16px;&quot;&gt;а також і не для груп - для індивідуальних туристів - &amp;nbsp;відпочинок у Львові - по програмі&lt;/span&gt;&lt;strong style=&quot;font-family: ''trebuchet ms'', helvetica, sans-serif; font-size: 16px;&quot;&gt;&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;strong&gt;*** Все Включено ***&lt;/strong&gt; ( проживання, харчування, екскурсії) .&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;Наступає період Новорічних свят - місто Львів з радістю запрошує на святкування !&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;pre style=&quot;text-align: justify;&quot;&gt;\r\n&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;Хостел &amp;laquo;Леохостел&amp;raquo;&amp;nbsp; знаходиться в центральній частині Львова &amp;ndash; всього 5 хв. ходьби \r\n&lt;/span&gt;&lt;/span&gt;&lt;/pre&gt;\r\n&lt;pre style=&quot;text-align: justify;&quot;&gt;\r\n&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;до Оперного театру, пр. Свободи, пл.Ринок. &lt;/span&gt;&lt;/span&gt;&lt;/pre&gt;\r\n&lt;pre style=&quot;text-align: justify;&quot;&gt;\r\n&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;Ціна для груп : проживання у хостелі &amp;nbsp;+ триразове &amp;nbsp;харчування &amp;nbsp;у ресторані поруч \r\n&lt;/span&gt;&lt;/span&gt;&lt;/pre&gt;\r\n&lt;pre style=&quot;text-align: justify;&quot;&gt;\r\n&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;і все це - &amp;nbsp;&amp;nbsp;за ціною 220 грн. з особи за добу. &lt;/span&gt;&lt;/span&gt;&lt;/pre&gt;\r\n&lt;pre style=&quot;text-align: justify;&quot;&gt;\r\n&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;Також для групи можемо запропонувати&amp;nbsp; Безкоштовну&amp;nbsp; екскурсію&amp;nbsp; по визначних місцях Львова ! &lt;/span&gt;&lt;/span&gt;&lt;/pre&gt;\r\n&lt;pre style=&quot;text-align: justify;&quot;&gt;\r\n&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;В хостелі одночасно можна розмістити групу&amp;nbsp; до 60&amp;nbsp; осіб&amp;nbsp; у&amp;nbsp; 4-,6-,8-,10-місних номерах.&amp;nbsp;&amp;nbsp; &amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/pre&gt;\r\n&lt;pre style=&quot;text-align: justify;&quot;&gt;\r\n&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;Якщо для групи протягом дня запланована екскурсія - \r\n&lt;/span&gt;&lt;/span&gt;&lt;/pre&gt;\r\n&lt;pre style=&quot;text-align: justify;&quot;&gt;\r\n&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;можна обрати тільки проживання + одноразове харчування &amp;ndash; сніданок&amp;nbsp; - відповідно ціна коригується. &lt;/span&gt;&lt;/span&gt;&lt;/pre&gt;\r\n&lt;pre style=&quot;text-align: justify;&quot;&gt;\r\n&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;u&gt;За додаткову оплату&amp;nbsp; пропонуємо&lt;/u&gt;&amp;nbsp; : оренда автобуса для Вашої групи, прокат велосипедів,\r\n&lt;/span&gt;&lt;/span&gt;&lt;/pre&gt;\r\n&lt;pre style=&quot;text-align: justify;&quot;&gt;\r\n&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;організація екскурсій по замках Львівщини та в мальовничі Карпати . &lt;/span&gt;&lt;/span&gt;&lt;/pre&gt;\r\n&lt;pre style=&quot;text-align: justify;&quot;&gt;\r\n&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;Екскурсії по Львову БЕЗКОШТОВНО.&lt;/span&gt;&lt;/span&gt;&lt;/pre&gt;\r\n&lt;pre style=&quot;text-align: justify;&quot;&gt;\r\n&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;u&gt;Важливо&lt;/u&gt; :&amp;nbsp; на всій території хостелу&amp;nbsp; - Безкоштовний доступ до інтернету Wi-Fi !&lt;/span&gt;&lt;/span&gt;&lt;/pre&gt;\r\n&lt;pre style=&quot;text-align: justify;&quot;&gt;\r\n&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;Ми впевнені , що проживання у хостелі &amp;laquo;Леохостел&amp;raquo;&amp;nbsp; залишить неповторні&amp;nbsp; і приємні&amp;nbsp; спогади\r\n&lt;/span&gt;&lt;/span&gt;&lt;/pre&gt;\r\n&lt;pre style=&quot;text-align: justify;&quot;&gt;\r\n&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;про подорож у Львів . &amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/pre&gt;\r\n'),
(1, 4, '&quot;Leohostel&quot; invites to Christmas market in 2013', '&quot;Leohostel&quot; invites to Christmas market in 2013', '&lt;p style=&quot;text-align: justify; &quot;&gt;\r\n	&lt;span class=&quot;short_text&quot; id=&quot;result_box&quot; lang=&quot;en&quot;&gt;&lt;span class=&quot;hps atn&quot;&gt;&amp;quot;&lt;/span&gt;&lt;span&gt;Leohostel&lt;/span&gt;&lt;span&gt;&amp;quot; invites to&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;Christmas market&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;in 2013 &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p style=&quot;text-align: justify; &quot;&gt;\r\n	www.yarmarok.lviv.ua&lt;/p&gt;\r\n'),
(3, 4, 'Leohostel - Jazz Bez ', 'Leohostel - Jazz Bez ', '&lt;p&gt;\r\n	&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;span style=&quot;font-family: ''trebuchet ms'', helvetica, sans-serif;&quot;&gt;Leohostel&amp;nbsp; - Ukraine, &amp;nbsp;Lviv, Lukiyanovycha 3 Street&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;span style=&quot;font-family: ''trebuchet ms'', helvetica, sans-serif;&quot;&gt;tel:&amp;nbsp; +38-032-238-21-90&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;span style=&quot;font-family: ''trebuchet ms'', helvetica, sans-serif;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp; +38-096-427-15-19&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;div&gt;\r\n	&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;span style=&quot;font-family: ''trebuchet ms'', helvetica, sans-serif;&quot;&gt;fax: +38 032 238-42-86&lt;/span&gt;&lt;/span&gt;&lt;/div&gt;\r\n&lt;div&gt;\r\n	&amp;nbsp;&lt;/div&gt;\r\n&lt;div&gt;\r\n	&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;span style=&quot;font-family: ''trebuchet ms'', helvetica, sans-serif;&quot;&gt;e-mail :&amp;nbsp;&lt;a href=&quot;mailto:%20info@leohostel.lviv.ua&quot;&gt;info@leohostel.lviv.ua&lt;/a&gt;&lt;/span&gt;&lt;/span&gt;&lt;/div&gt;\r\n&lt;div&gt;\r\n	&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;span style=&quot;font-family: ''trebuchet ms'', helvetica, sans-serif;&quot;&gt;web-site:&amp;nbsp;&lt;a href=&quot;http://www.leohostel.lviv.ua&quot;&gt;www.leohostel.lviv.ua&lt;/a&gt;&lt;/span&gt;&lt;/span&gt;&lt;/div&gt;\r\n&lt;div&gt;\r\n	&amp;nbsp;&lt;/div&gt;\r\n&lt;div&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;Leohostel - Jazz Bez&lt;/span&gt;&lt;/span&gt;&lt;/div&gt;\r\n&lt;div&gt;\r\n	&lt;a href=&quot;http://dzyga.com/jazzbez/&quot; target=&quot;_blank&quot;&gt;&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;http://dzyga.com/jazzbez/&lt;/span&gt;&lt;/span&gt;&lt;/a&gt;&lt;/div&gt;\r\n'),
(2, 4, 'Leohostel ', 'Leohostel  - Ukraine', '&lt;p&gt;\r\n	&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;span style=&quot;font-family: ''trebuchet ms'', helvetica, sans-serif;&quot;&gt;Leohostel&amp;nbsp; - Ukraine, &amp;nbsp;Lviv, Lukiyanovycha 3 Street&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;span style=&quot;font-family: ''trebuchet ms'', helvetica, sans-serif;&quot;&gt;tel:&amp;nbsp; +38-032-238-21-90&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;span style=&quot;font-family: ''trebuchet ms'', helvetica, sans-serif;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp; +38-096-427-15-19&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;div&gt;\r\n	&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;span style=&quot;font-family: ''trebuchet ms'', helvetica, sans-serif;&quot;&gt;fax: +38 032 238-42-86&lt;/span&gt;&lt;/span&gt;&lt;/div&gt;\r\n&lt;div&gt;\r\n	&amp;nbsp;&lt;/div&gt;\r\n&lt;div&gt;\r\n	&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;span style=&quot;font-family: ''trebuchet ms'', helvetica, sans-serif;&quot;&gt;e-mail :&amp;nbsp;&lt;a href=&quot;mailto:%20info@leohostel.lviv.ua&quot;&gt;info@leohostel.lviv.ua&lt;/a&gt;&lt;/span&gt;&lt;/span&gt;&lt;/div&gt;\r\n&lt;div&gt;\r\n	&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;span style=&quot;font-family: ''trebuchet ms'', helvetica, sans-serif;&quot;&gt;web-site:&amp;nbsp;&lt;a href=&quot;http://www.leohostel.lviv.ua&quot;&gt;www.leohostel.lviv.ua&lt;/a&gt;&lt;/span&gt;&lt;/span&gt;&lt;/div&gt;\r\n'),
(2, 3, 'НОВЫЙ хостел во Львове ', '', '&lt;p style=&quot;text-align: justify; &quot;&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;span id=&quot;result_box&quot; lang=&quot;ru&quot;&gt;&lt;strong&gt;&lt;span title=&quot;Ексклюзивна пропозиція!&quot;&gt;Эксклюзивное предложение!&lt;/span&gt;&lt;/strong&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;span title=&quot;Пропонуємо для туристичних груп - школярів, студентів, дорослих подорожуючих, а також і не для груп - для індивідуальних туристів - відпочинок у Львові - по програмі&quot;&gt;Предлагаем для туристических групп - школьников, студентов, взрослых туристов, а также и не для групп - для индивидуальных туристов - отдых во Львове - по программе&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;span title=&quot;*** Все Включено *** ( проживання, харчування, екскурсії) .&quot;&gt;&lt;strong&gt;*** Все Включено ***&lt;/strong&gt; (проживание, питание, экскурсии).&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;span title=&quot;Наступає період Новорічних свят - місто Львів з радістю запрошує на святкування !&quot;&gt;Наступает период Новогодних праздников - город Львов с радостью приглашает на празднование!&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;span title=&quot;Хостел «Леохостел» знаходиться в центральній частині Львова – всього 5 хв.&quot;&gt;Хостел &amp;laquo;Леохостел&amp;raquo; находится в центральной части Львова - всего 5 мин. &lt;/span&gt;&lt;span title=&quot;ходьби&quot;&gt;ходьбы&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;span title=&quot;до Оперного театру, пр. Свободи, пл.Ринок.&quot;&gt;до Оперного театра, пр. Свободы, пл.Рынок.&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;span title=&quot;Ціна для груп : проживання у хостелі + триразове харчування у ресторані поруч&quot;&gt;Цена для групп: проживание в хостеле + трехразовое питание в ресторане рядом&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;span title=&quot;і все це - за ціною 220 грн.&quot;&gt;и все это - по цене 220 грн. &lt;/span&gt;&lt;span title=&quot;з особи за добу.&quot;&gt;с человека в сутки.&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;span title=&quot;Також для групи можемо запропонувати Безкоштовну екскурсію по визначних місцях Львова !&quot;&gt;Также для группы можем предложить Бесплатную экскурсию по достопримечательностям Львова!&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;span title=&quot;В хостелі одночасно можна розмістити групу до 60 осіб у 4-,6-,8-,10-місних номерах.&quot;&gt;В хостеле одновременно можно разместить группу до 60 человек в 4 -, 6 -, 8 - ,10-местных номерах.&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;span title=&quot;Якщо для групи протягом дня запланована екскурсія -&quot;&gt;Если группы в течение дня запланирована экскурсия -&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;span title=&quot;можна обрати тільки проживання + одноразове харчування – сніданок - відповідно ціна коригується.&quot;&gt;можно выбрать только проживание + одноразовое питание - завтрак - соответственно цена корректируется.&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;span title=&quot;За додаткову оплату пропонуємо : оренда автобуса для Вашої групи, прокат велосипедів,&quot;&gt;&lt;u&gt;За дополнительную плату предлагаем&lt;/u&gt;: аренда автобуса для Вашей группы, прокат велосипедов,&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;span title=&quot;організація екскурсій по замках Львівщини та в мальовничі Карпати .&quot;&gt;организация экскурсий по замкам Львовщины и в живописные Карпаты.&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;span title=&quot;Екскурсії по Львову БЕЗКОШТОВНО.&quot;&gt;Экскурсии по Львову Бесплатно..&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;span title=&quot;Важливо : на всій території хостелу - Безкоштовний доступ до інтернету Wi-Fi !&quot;&gt;&lt;u&gt;Важно: &lt;/u&gt;на всей территории хостела - Бесплатный доступ в интернет Wi-Fi!&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;span title=&quot;Ми впевнені , що проживання у хостелі «Леохостел» залишить неповторні і приємні спогади&quot;&gt;Мы уверены, что проживание в хостеле &amp;laquo;Леохостел&amp;raquo; оставит неповторимые и приятные воспоминания&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;span title=&quot;про подорож у Львів .&quot;&gt;о путешествии во Львов.&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n'),
(3, 3, 'Леохостел приглашает на Jazz Bez  ', 'Jazz Bez , леохостел, фестивали львова, хостелы львова', '&lt;p&gt;\r\n	&lt;br /&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;span id=&quot;result_box&quot; lang=&quot;ru&quot;&gt;&lt;strong&gt;&lt;span class=&quot;hps&quot;&gt;НОВЫЙ&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;хостел&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;Leohostel&lt;/span&gt; &lt;/strong&gt;&lt;span class=&quot;hps&quot;&gt;-&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;Украина&lt;/span&gt;&lt;span&gt;,&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;Львов, ул.&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;Лукияновича&lt;/span&gt;&lt;span&gt;,&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;3 -&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;приглашает&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;львов&lt;/span&gt;&lt;span class=&quot;hps&quot;&gt;ян&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;и гостей города на&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;span style=&quot;color:#800000;&quot;&gt;&lt;span class=&quot;hps&quot;&gt;XII Международный&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;джазовый&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;фестиваль&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;Jazz Bez&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;(7 - 17&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;декабря)&lt;/span&gt;&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;span class=&quot;hps&quot;&gt;В начале зимы&lt;/span&gt;&lt;span&gt;,&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;с 7 по&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;17 декабря состоится&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;XII Международный&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;джазовый&lt;/span&gt; &lt;span class=&quot;hps atn&quot;&gt;фестиваль &amp;laquo;&lt;/span&gt;&lt;span&gt;Jazz Bez&lt;/span&gt;&lt;span&gt;&amp;raquo;.&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;span class=&quot;hps&quot;&gt;В этом году&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;джаз&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;соединит&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;16 городов Украины&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;и Польши: Львов&lt;/span&gt;&lt;span&gt;,&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;Луцк, Киев&lt;/span&gt;&lt;span&gt;,&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;Харьков&lt;/span&gt;&lt;span&gt;,&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;Тернополь&lt;/span&gt;&lt;span&gt;,&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;Ивано-Франковск&lt;/span&gt;&lt;span&gt;,&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;Ровно&lt;/span&gt;&lt;span&gt;,&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;Севастополь&lt;/span&gt;&lt;span&gt;,&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;Одессу&lt;/span&gt;&lt;span&gt;,&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;Черкассы&lt;/span&gt;&lt;span&gt;,&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;Перемышль&lt;/span&gt;&lt;span&gt;,&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;Люблин&lt;/span&gt;&lt;span&gt;,&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;Санок&lt;/span&gt;&lt;span&gt;,&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;Новица&lt;/span&gt;&lt;span&gt;,&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;Ярослав и&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;Белосток.&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&amp;nbsp;&amp;nbsp; &lt;span class=&quot;hps&quot;&gt;Уже двенадцать&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;лет подряд&lt;/span&gt;&lt;span&gt;,&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;несмотря ни на какие&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;территориальные&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;разграничения и&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;условности&lt;/span&gt;&lt;span&gt;,&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;&amp;laquo;Jazz Bez&amp;raquo;&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;приносит радость&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;меломанам&lt;/span&gt;&lt;span&gt;,&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;объединяет&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;организаторов&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;из разных городов&lt;/span&gt;&lt;span&gt;,&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;провоцирует&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;публику&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;к размышлениям&lt;/span&gt;&lt;span&gt;,&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;а&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;музыкантов -&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;к поиску новых&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;оттенков&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;джаза и&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;экспериментов.&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&amp;nbsp;&amp;nbsp; &lt;span class=&quot;hps&quot;&gt;Изюминкой фестиваля&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;&amp;laquo;Jazz Bez&amp;raquo;&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;является сочетание&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;максимального количества джазовых&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;стилей:&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;swing&lt;/span&gt;&lt;span&gt;,&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;fusion&lt;/span&gt;&lt;span&gt;,&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;bebop&lt;/span&gt;&lt;span&gt;,&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;jazz rock&lt;/span&gt;&lt;span&gt;,&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;funk&lt;/span&gt;&lt;span&gt;,&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;cool&lt;/span&gt;&lt;span&gt;,&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;free jazz&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;...&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;span class=&quot;hps&quot;&gt;На протяжении фестиваля&lt;/span&gt; выступит &lt;span class=&quot;hps&quot;&gt;более 100&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;музыкантов из&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;США&lt;/span&gt;&lt;span&gt;,&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;Канады&lt;/span&gt;&lt;span&gt;,&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;Израиля&lt;/span&gt;&lt;span&gt;,&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;Германии&lt;/span&gt;&lt;span&gt;,&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;Швейцарии&lt;/span&gt;&lt;span&gt;,&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;Великобритании&lt;/span&gt;&lt;span&gt;,&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;Португалии&lt;/span&gt;&lt;span&gt;,&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;России&lt;/span&gt;&lt;span&gt;,&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;Литвы&lt;/span&gt;&lt;span&gt;,&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;Словакии&lt;/span&gt;&lt;span&gt;,&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;Польши и Украины.&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n'),
(3, 2, 'Леохостел запрошує на Jazz Bez', ' Jazz Bez lviv', '&lt;p style=&quot;text-align: justify;&quot;&gt;\r\n	&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;span style=&quot;color:#800000;&quot;&gt;&lt;strong&gt;НОВИЙ хостел Leohostel&amp;nbsp; &lt;/strong&gt;&lt;/span&gt;- Україна,&amp;nbsp; м.Львів, вул. Лукіяновича, 3&lt;/span&gt;&lt;/span&gt;&amp;nbsp; -&amp;nbsp;&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt; запрошує львів&amp;quot;ян та гостей міста&amp;nbsp; на&amp;nbsp; &amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;\r\n	&lt;span style=&quot;color:#8b4513;&quot;&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;ХІІ міжнародний джазовий фестиваль Jazz Bez (7 - 17 грудня)&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&amp;nbsp;&amp;nbsp; На початку зими, із 7 по 17 грудня відбудеться ХІІ міжнародний джазовий фестиваль &amp;laquo;Jazz Bez&amp;raquo;. &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;strong&gt;Цього року джаз поєднає 16 міст України та Польщі: &lt;/strong&gt;Львів, Луцьк, Київ, Харків, Тернопіль, Івано-Франківськ, Рівне, Севастополь, Одесу, Черкаси, Перемишль, Люблін, Санок, Новицю, Ярослав та Білосток.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&amp;nbsp; Вже дванадцять років поспіль, незважаючи на жодні територіальні розмежування та умовності, &amp;laquo;Jazz Bez&amp;raquo;&amp;nbsp; приносить радість меломанам, об&amp;#39;єднує організаторів з різних міст, провокує публіку до роздумів, а музикантів - до пошуку нових відтінків джазу та експериментів.&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&amp;nbsp; Родзинкою фестивалю &amp;laquo;Jazz Bez&amp;raquo; є поєднання максимальної кількості джазових стилів: swing, fusion, bebop, jazz rock, funk, cool, free jazz...&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;Упродовж фестивалю джазуватиме більше 100 музикантів зі&amp;nbsp; США, Канади, Ізраїлю, Німеччини, Швейцарії, Великобританії, Португалії, Росії, Литви, Словаччини, Польщі та України.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n'),
(1, 2, ' Леохостел запрошує на Різдвяний ярмарок 8.12.2012- 14.01.2013', 'рідвяний ярмарок 2013, різдво у львові, леохостел ', '&lt;p&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;strong&gt;&amp;quot;Леохостел&amp;quot; запрошує львів&amp;rsquo;ян та гостей міста на&amp;nbsp; Різдвяний ярмарок&lt;/strong&gt;&lt;br /&gt;\r\n	Офіційне відкриття &amp;ndash; &lt;strong&gt;8 грудня 2012&lt;/strong&gt;&lt;br /&gt;\r\n	Офіційне закриття &amp;ndash; &lt;strong&gt;14 січня 2013&lt;/strong&gt;&lt;br /&gt;\r\n	Час роботи ярмарку: &lt;strong&gt;робочі дні 12.00 &amp;ndash; 22.00, вихідні та святкові 11.00 &amp;ndash; 23.00&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;Цьогорічний Різдвяний ярмарок традиційно стане епіцентром святкувань із безліччю цікавих заходів та подій для кожного львів&amp;rsquo;янина та гостя нашого міста&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;strong&gt;На території ярмарок постійно діятимуть:&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;strong&gt;Гастрономічний сектор&lt;/strong&gt;( презентація страв&amp;nbsp; національної кухні)&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;strong&gt;Сувенірний сектор&lt;/strong&gt; ( презентація, виставки-продаж виробів кращих народних майстрів України)&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;strong&gt;&amp;ldquo;Територія різдвяного настрою&amp;rdquo; (&lt;/strong&gt;різдвяна розважальна програма для дорослих та дітей).&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;На площі перед Львівською оперою на час проведення Різдвяної ярмарки&amp;nbsp; відбуватимуться різноманітні культурні заходи, проводитимуться тематичні майстер-класи, відбуватимуться виступи фольклорних колективів не тільки зі Львова, а й з усієї країни.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;7 січня на площі перед Львівською оперою&amp;nbsp;&lt;strong&gt;відбудеться приготування різдвяної куті&lt;/strong&gt;&amp;nbsp;та частування нею усіх гостей ярмарки.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;Просто неба&amp;nbsp;&lt;strong&gt;буде встановлено величезний казан&lt;/strong&gt;навколо якого буде розміщений подіум на якому&amp;nbsp;&lt;strong&gt;кращі господині Львова&lt;/strong&gt;&amp;nbsp;будуть проводити майстер-класи з розтирання маку, подріблення горіхів,замочування родзинок та кураги та ін.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;Усі ці інгредієнти потім стануть завершальним акордом у&amp;nbsp; приготуванні, а потім і&amp;nbsp;&lt;strong&gt;частуванні під веселу коляду&lt;/strong&gt;.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;Детальніше на сайті &amp;nbsp; Львівські ярмарки&amp;nbsp; &lt;/span&gt;&lt;/span&gt;- &lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;www.yarmarok.lviv.ua&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n'),
(3, 5, 'Відкрився Леохостел2', '', '&lt;p&gt;\r\n	&lt;span style=&quot;color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans-serif; &quot;&gt;Відкрився Леохостел1&lt;/span&gt;&lt;/p&gt;\r\n'),
(7, 5, ' VI City Chocolate Festival', '', '&lt;p&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;span&gt;VI City Chocolate Festival&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n'),
(2, 5, 'Відкрився Леохостел1', '', '&lt;p style=&quot;text-align: justify; &quot;&gt;\r\n	&lt;span style=&quot;text-align: justify; &quot;&gt;Відкрився Леохостел&lt;/span&gt;&lt;/p&gt;\r\n'),
(5, 3, 'Новый год 2013 у &quot;Леотель&quot; и &quot;Наш городок&quot;', '', '&lt;p&gt;\r\n	Новый год 2013 у &amp;quot;Леотель&amp;quot; и &amp;quot;Наш городок&amp;quot;&lt;/p&gt;\r\n'),
(5, 4, 'New Year''s Day 2013 in Lviv', '', '&lt;p&gt;\r\n	New Year&amp;#39;s Day 2013 in Lviv&lt;/p&gt;\r\n'),
(5, 5, 'New Year''s Day 2013 in Lviv', '', '&lt;p&gt;\r\n	New Year&amp;#39;s Day 2013 in Lviv&lt;/p&gt;\r\n'),
(6, 4, '&quot;Leohostel&quot; invites to Leotel', '', '&lt;p&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;strong&gt;Celebrate the New Year&amp;rsquo;s Eve 2013 in a new way!&lt;br /&gt;\r\n	Only in&amp;nbsp;a New Restaurant &amp;ldquo;Leotel&amp;rdquo;!&lt;/strong&gt;&lt;br /&gt;\r\n	Our chief represents holiday specialties:&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	Meat and vegetable assortments&lt;br /&gt;\r\n	Red caviar appetizers&lt;br /&gt;\r\n	Jellied beef tongue&lt;br /&gt;\r\n	Festive herring and spicy rolls&lt;br /&gt;\r\n	Salad &amp;ldquo;Olivier&amp;rdquo; with salmon&lt;br /&gt;\r\n	New Year salad with the beef tongue and tender salad &amp;quot;Austrian&amp;quot;&lt;br /&gt;\r\n	Hot broth with quails&lt;br /&gt;\r\n	White fish fillet with vegetables&lt;br /&gt;\r\n	Dolma&lt;br /&gt;\r\n	&amp;quot;Leo&amp;quot; pork with asparagus beans and caramelized tomatoes&lt;br /&gt;\r\n	Stuffed salmon&lt;br /&gt;\r\n	Home-made ice-cream &amp;ldquo;Semifredo&amp;rdquo;&lt;br /&gt;\r\n	Champagne, vodka, compote and soft drinks&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	Greetings from Father Frost and Snow Maiden on the dance floor,&lt;br /&gt;\r\n	entertainment program, funny contests and nice surprises,&lt;br /&gt;\r\n	Festive fortune telling from the mysterious Gypsies,&lt;br /&gt;\r\n	performances, New Year disco and lots of other holiday presents.&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	At the midnight the New Year gorgeous fireworks&lt;br /&gt;\r\n	will bloom in the night sky!&lt;br /&gt;\r\n	We will be happy to make this New Year Eve just unforgettable for You !&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	New Year in the restaurant &amp;ldquo;Leotel&amp;rdquo; &amp;ndash; it&amp;rsquo;s full of fun, bright, elegant and&lt;br /&gt;\r\n	fabulous holiday!&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	Cost per person - 700 UAH.&lt;br /&gt;\r\n	The price is &amp;laquo;All Inclusive&amp;raquo; - entertaining program, New Year Disco, festive&lt;br /&gt;\r\n	menu and beverages.&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	Also information about restaurant &amp;ldquo;Leotel&amp;rdquo; on the website:&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	http://leotel.lviv.ua/ua/3/restoran.html&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	Restaurant &amp;ldquo;Leotel&amp;rdquo; &amp;ndash; a new restaurant in Lviv!&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	Lviv, Lukiyanovycha 3 Street (near the Citadel)&lt;br /&gt;\r\n	tel.&lt;br /&gt;\r\n	+38 032 238 21 97&lt;br /&gt;\r\n	+38 096 377 51 58&lt;br /&gt;\r\n	e-mail: restoran.leotel@ukr.net&lt;br /&gt;\r\n	web-site: www.leotel.lviv.ua&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n'),
(6, 5, '&quot;Leohostel&quot; invites to Christmas market in 2013', '', '&lt;p&gt;\r\n	&amp;quot;Leohostel&amp;quot; invites to Christmas market in 2013&lt;/p&gt;\r\n');
INSERT INTO `news_description` (`news_id`, `language_id`, `title`, `meta_description`, `description`) VALUES
(6, 2, ' Леохостел запрошує на Новорічну ніч у &quot;Леотель&quot;', ' Леохостел запрошує на Новорічну ніч у &quot;Леотель&quot;', '&lt;p&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;strong&gt;Зустрічайте Новорічну ніч 2013 по-новому !&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;strong&gt;Тільки у&amp;nbsp;&lt;/strong&gt;&lt;strong&gt;Новому&amp;nbsp;Ресторані &amp;quot;Леотель&amp;quot;&lt;/strong&gt;&lt;strong&gt;&amp;nbsp;!&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;На святковому столі -&amp;nbsp;&amp;nbsp;фірмові страви від шеф-кухаря:&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;strong&gt;М`ясне та овочеве асорті&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;strong&gt;Канапки з червоною ікрою&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;strong&gt;Заливний язик&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;strong&gt;Святковий оселедець та пікантні роли&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;strong&gt;Олів`є з лососем&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;strong&gt;Новорічний салат з язиком та ніжний салат &amp;quot;Австріяк&amp;quot;&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;strong&gt;Гарячий бульйон з перепілки&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;strong&gt;Філе білої риби з овочами&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;strong&gt;Долма&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;strong&gt;Свинина &amp;quot;Лео&amp;quot; з шпар&lt;/strong&gt;&lt;strong&gt;а&lt;/strong&gt;&lt;strong&gt;гівкою та карамелізованими помідорами&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;strong&gt;Фарширований лосось&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;strong&gt;Морозиво власного приготування &amp;quot;Семіфредо&amp;quot;&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;strong&gt;Шампанське, горілка, узвар та безалкогольні напої.&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;strong&gt;На танцювальному майданчику -&amp;nbsp;вітання&amp;nbsp;від Діда Мороза&amp;nbsp;та&amp;nbsp;Снігуроньки , розважальна&lt;/strong&gt; &lt;strong&gt;&amp;nbsp;програма&amp;nbsp;&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;strong&gt;з веселими конкурсами та приємними сюрпризами, святкові ворожіння від загадкових циганок,&amp;nbsp;виступи шоу-балетів,&amp;nbsp; новорічна дискотека&amp;nbsp;та багато інших святкових подарунків.&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;strong&gt;А о дванадцятій годині в нічному небі розквітне святковий феєрверк!&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;strong&gt;Ми будемо дуже раді зробити цю Новорічну ніч для Вас просто незабутньою!&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;strong&gt;Новий рік у &lt;/strong&gt;&lt;strong&gt;ресторані &amp;laquo;Леотель&amp;raquo;&lt;/strong&gt;&lt;strong&gt; - &lt;/strong&gt;&lt;strong&gt;це&lt;/strong&gt;&lt;strong&gt;&amp;nbsp; весело, яскраво , вишукано, казково!&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;strong&gt;&lt;u&gt;Вартість святкування&lt;/u&gt;&lt;/strong&gt;&lt;strong&gt; для 1 ос. &lt;/strong&gt;&lt;strong&gt;-&lt;/strong&gt; &lt;strong&gt;700&lt;/strong&gt;&lt;strong&gt; грн. &lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;strong&gt;&lt;u&gt;У ціну &amp;laquo;ВСЕ ВКЛЮЧЕНО&amp;raquo;&lt;/u&gt;&lt;/strong&gt;&lt;strong&gt; - розважальна програма, новорічна дискотека, святковий стіл та напої.&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;strong&gt;&lt;u&gt;замовлення столиків за тел.&lt;/u&gt;&lt;/strong&gt;&lt;strong&gt;&lt;u&gt; :&lt;/u&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;strong&gt;&amp;nbsp;+38-032-238-21-97&amp;nbsp; &amp;nbsp;&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;strong&gt;+38-096-377-51-58&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;strong&gt;Ресторан &amp;quot; Леотель&amp;quot; - новий ресторан у Львові !&amp;nbsp;&lt;/strong&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;strong&gt;м.Львів, вул.Лукіяновича, 3&amp;nbsp;(р-н Цитаделі, бічна вул. Коперника )&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/strong&gt;&lt;strong&gt;&amp;nbsp; &lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;strong&gt;тел.&amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;+38 032 238 21 97&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;strong&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; +38 096 377 51 58&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;e-mail: restoran.leotel@ukr.net&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;strong&gt;&lt;a href=&quot;http://leotel.lviv.ua/ua/3/restoran.html&quot; target=&quot;_blank&quot;&gt;www.leotel.lviv.ua&lt;/a&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n'),
(6, 3, '&quot;Леохостел&quot; приглашает на Новыйгод в ресторан Леотель!', '', '&lt;p style=&quot;text-align: justify; &quot;&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;strong&gt;Встречайте Новогоднюю ночь 2013 по-новому!&lt;br /&gt;\r\n	Только в Новом Ресторане &amp;laquo;Леотель&amp;raquo;!&lt;/strong&gt;&lt;br /&gt;\r\n	На праздничном столе &amp;ndash; фирменные блюда от шеф-повара:&lt;br /&gt;\r\n	Мясное и овощное ассорти&lt;br /&gt;\r\n	Бутерброды с красной икрой&lt;br /&gt;\r\n	Заливной язык&lt;br /&gt;\r\n	Праздничная сельдь и пикантные роли&lt;br /&gt;\r\n	Оливье с лососем&lt;br /&gt;\r\n	Новогодний салат с языком и салат &amp;laquo;Австрияк&amp;raquo;&lt;br /&gt;\r\n	Горячий бульон с перепелки&lt;br /&gt;\r\n	Филе белой рыбы с овощами&lt;br /&gt;\r\n	Долма&lt;br /&gt;\r\n	Свинина &amp;laquo;Лео&amp;raquo; с шпаргивкой и карамелизованными помидорами&lt;br /&gt;\r\n	Фаршированный лосось&lt;br /&gt;\r\n	Мороженое собственного приготовления &amp;laquo;Семифреда&amp;raquo;&lt;br /&gt;\r\n	Шампанское, водка, узвар и безалкогольные напитки&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;strong&gt;На танцплощадке &lt;/strong&gt;&amp;ndash; приветствие от Деда Мороза и Снегурочки,&lt;br /&gt;\r\n	развлекательная программа&lt;br /&gt;\r\n	с веселыми конкурсами и приятными сюрпризами, праздничные гадания от&lt;br /&gt;\r\n	веселых цыган, выступления шоу-балетов, новогодняя дискотека и много&lt;br /&gt;\r\n	других праздничных подарков.&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	А в двенадцать часов в ночном небе Вас порадует праздничный фейерверк!&lt;br /&gt;\r\n	Ми будем очень рады сделать эту Новогоднюю ночь для Вас просто&lt;br /&gt;\r\n	незабываемой!&lt;br /&gt;\r\n	&lt;strong&gt;Новый год в ресторане &amp;laquo;Леотель&amp;raquo;&lt;/strong&gt; - это весело, ярко, изыскано и сказочно!&lt;br /&gt;\r\n	Стоимость празднования для 1 чел. &amp;ndash; 700грн.&lt;br /&gt;\r\n	В цену &amp;laquo;Все включено&amp;raquo; - развлекательная программа, новогодняя&lt;br /&gt;\r\n	дискотека, праздничный стол и напитки.&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	заказ столиков за ном:&lt;br /&gt;\r\n	+38-032-238-21-97&lt;br /&gt;\r\n	+38-096-377-51-58&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p style=&quot;text-align: justify; &quot;&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;Ресторан &amp;laquo;Леотель&amp;raquo; - новый ресторан в Львове!&lt;br /&gt;\r\n	г.Львов, ул.Лукияновича,3,(р-н Цытадели, боковая ул.Коперника)&lt;br /&gt;\r\n	+38 032 238 21 97&lt;br /&gt;\r\n	+38 096 377 51 58&lt;br /&gt;\r\n	e-mail:&amp;nbsp;restoran.leotel@ukr.net&lt;br /&gt;\r\n	web-site: www.leotel.lviv.ua&lt;/span&gt;&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n'),
(5, 2, 'Новий рік 2013 у &quot;Леотель&quot; та &quot;Наш Городок&quot;', 'НОВИЙ РІК У РЕСТОРАНІ ЛЕОТЕЛЬ ТА РЕСТОРАНІ НАШ ГОРОДОК', '&lt;p style=&quot;text-align: center;&quot;&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;span class=&quot;userContent&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;Ресторан &amp;quot;Леотель&amp;quot; запрошує на святкування Нового року 2013!&lt;/span&gt;&lt;/strong&gt;&lt;br /&gt;\r\n	&lt;strong&gt;&lt;span style=&quot;color:#ff0000;&quot;&gt;31 грудня 2012 - 1 січня 2013 - ресторан &amp;quot;Леотель&amp;quot; - і Місце зустрічі змінити не можна )))&lt;/span&gt;&lt;/strong&gt;&lt;br /&gt;\r\n	На святковому столі &amp;ndash; смачні страви від шеф-кухаря.&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;br /&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n&lt;p align=&quot;center&quot;&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;М`ясне та овочеве асорті&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p align=&quot;center&quot;&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&amp;nbsp;&amp;nbsp; Канапки з червоною ікрою&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p align=&quot;center&quot;&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;Заливний язик&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p align=&quot;center&quot;&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;Святковий оселедець та пікантні роли&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p align=&quot;center&quot;&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;Олів`є з лососем&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p align=&quot;center&quot;&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;Новорічний салат з язиком та ніжний салат &amp;quot;Австріяк&amp;quot;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p align=&quot;center&quot;&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;Гарячий бульйон з перепілки&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p align=&quot;center&quot;&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;Філе білої риби з овочами&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p align=&quot;center&quot;&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&amp;nbsp;Долма&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p align=&quot;center&quot;&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;Свинина &amp;quot;Лео&amp;quot; з шпарагівкою та карамелізованими помідорами&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p align=&quot;center&quot;&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;Фарширований лосось&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p align=&quot;center&quot;&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;Морозиво власного приготування &amp;quot;Семіфредо&amp;quot;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p align=&quot;center&quot;&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;Шампанське, горілка, узвар та безалкогольні напої.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p align=&quot;center&quot;&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n&lt;p align=&quot;center&quot;&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;На танцювальному майданчику -&amp;nbsp;вітання&amp;nbsp;від Діда Мороза&amp;nbsp;та&amp;nbsp;Снігуроньки , розважальна &amp;nbsp;програма&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p align=&quot;center&quot;&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;з веселими конкурсами та приємними сюрпризами, святкові ворожіння від загадкових циганок,&amp;nbsp;виступи шоу-балетів,&amp;nbsp; новорічна дискотека&amp;nbsp;та багато інших святкових подарунків.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p align=&quot;center&quot;&gt;\r\n	&lt;br /&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;А о дванадцятій годині в нічному небі розквітне святковий феєрверк!&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p align=&quot;center&quot;&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;Ми будемо дуже раді зробити цю Новорічну ніч для Вас просто незабутньою!&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p align=&quot;center&quot;&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;Новий рік у ресторані &amp;laquo;Леотель&amp;raquo; - це&amp;nbsp; весело, яскраво , вишукано, казково!&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p align=&quot;center&quot;&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;u&gt;Вартість святкування&lt;/u&gt; для 1 ос. - 700 грн. &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p align=&quot;center&quot;&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;u&gt;У ціну &amp;laquo;ВСЕ ВКЛЮЧЕНО&amp;raquo;&lt;/u&gt; - розважальна програма, новорічна дискотека, святковий стіл та напої.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p align=&quot;center&quot;&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n&lt;p align=&quot;center&quot;&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;u&gt;замовлення столиків за тел. :&lt;/u&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p align=&quot;center&quot;&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&amp;nbsp;+38-032-238-21-97&amp;nbsp; &amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p align=&quot;center&quot;&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;+38-096-377-51-58&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;div class=&quot;text_exposed_show&quot; style=&quot;text-align: center;&quot;&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;span class=&quot;userContent&quot;&gt;Запрошуємо !!!&lt;br /&gt;\r\n	Ресторан &amp;quot;Леотель&amp;quot;&lt;br /&gt;\r\n	м.Львів, вул.Лукіяновича , 3&lt;br /&gt;\r\n	+38-032-238-21-97&lt;/span&gt;&lt;/span&gt;&lt;br /&gt;\r\n	&lt;span style=&quot;font-family:trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;span class=&quot;userContent&quot;&gt;+38&lt;/span&gt;&lt;span class=&quot;xfmb&quot;&gt;&lt;span&gt;&lt;span class=&quot;xfmc2&quot;&gt;&lt;span class=&quot;xfmc4&quot;&gt;&lt;span&gt;-096-377-51-58&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/div&gt;\r\n&lt;div class=&quot;text_exposed_show&quot; style=&quot;text-align: center;&quot;&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;span class=&quot;userContent&quot;&gt;e-mail: info@leotel.lviv.ua&lt;br /&gt;\r\n	&lt;a href=&quot;http://www.leotel.lviv.ua/&quot; target=&quot;_blank&quot;&gt;www.leotel.lviv.ua&lt;/a&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/div&gt;\r\n&lt;div class=&quot;text_exposed_show&quot; style=&quot;text-align: center;&quot;&gt;\r\n	&amp;nbsp;&lt;/div&gt;\r\n&lt;div class=&quot;text_exposed_show&quot; style=&quot;text-align: center;&quot;&gt;\r\n	&lt;span style=&quot;font-size:20px;&quot;&gt;*********************&lt;/span&gt;&lt;/div&gt;\r\n&lt;div class=&quot;text_exposed_show&quot; style=&quot;text-align: center;&quot;&gt;\r\n	&amp;nbsp;&lt;/div&gt;\r\n&lt;div class=&quot;text_exposed_show&quot; style=&quot;text-align: center;&quot;&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;span class=&quot;userContent&quot;&gt;&lt;span style=&quot;color:#ff0000;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;*** Ресторан &amp;quot;Наш Городок&amp;quot; - Святкуємо Новий рік 2013 ! ***&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;br /&gt;\r\n	Усім, хто втомився від роботи і вважає, що НОВИЙ РІК у Львові - це традиційно , а краще за межами Львова - тоді Вам&amp;nbsp; до нас - &lt;span style=&quot;color:#ff0000;&quot;&gt;&lt;strong&gt;у &amp;quot;НАШ ГОРОДОК&amp;quot;&lt;/strong&gt;&lt;/span&gt;&lt;br /&gt;\r\n	Новий рік - це найчарівніша подія в житті, це свято каз&lt;/span&gt;ки, свято, коли збуваються найзаповітніші мрії - тому запрошуємо Вас, ваших рідних, друзів, колег в зимову казку від ресторану &amp;quot;Наш Городок&amp;quot; , яка відбудеться &lt;span style=&quot;color:#ff0000;&quot;&gt;31 грудня 2012 року&lt;/span&gt; біля Львова у м.Городок&lt;/span&gt;&lt;/span&gt;&lt;br /&gt;\r\n	&lt;div class=&quot;text_exposed_show&quot;&gt;\r\n		&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;span class=&quot;userContent&quot;&gt;Є така прикмета: &amp;quot;Як зустрінеш новий рік, так його і проживеш&amp;quot;&lt;br /&gt;\r\n		Ми пропонуємо зустрічати Новий рік обов&amp;quot;язково : Вишукано, Весело , Смачно !&lt;br /&gt;\r\n		Для Вас святкові забави від Діда Мороза та Снігурочки , розважальна концертна програма , феєрверки , запальна новорічна дискотека та найголовніше - на святковому столі - смачні страви від шеф-кухаря та новорічні напої !&lt;br /&gt;\r\n		&lt;strong&gt;Вартість Новорічного святкування &lt;/strong&gt;- 450 грн. з особи .&lt;br /&gt;\r\n		При замовленні до 1 грудня - знижки ))&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		Запрошуємо :&lt;br /&gt;\r\n		Ресторан &amp;quot;Наш Городок&amp;quot;&lt;br /&gt;\r\n		м.Городок, вул.Підгай , 1&lt;br /&gt;\r\n		тел. 093 483-13-85&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;text_exposed_show&quot;&gt;\r\n		&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;span class=&quot;userContent&quot;&gt;097-451-49-36 &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;text_exposed_show&quot;&gt;\r\n		&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;span class=&quot;userContent&quot;&gt;( конт.особа-Оксана)&lt;br /&gt;\r\n		&lt;a href=&quot;http://www.nash-gorodok.com/?page_id=40&quot; rel=&quot;nofollow nofollow&quot; target=&quot;_blank&quot;&gt;www.nash-gorodok.com&lt;/a&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;text_exposed_show&quot;&gt;\r\n		&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;span class=&quot;userContent&quot;&gt;e-mail :&amp;nbsp; nash_gorodok@ukr.net&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;p&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n'),
(1, 5, 'Відкрився Леохостел', '', '&lt;p style=&quot;text-align: justify; &quot;&gt;\r\n	Відкрився Леохостел&lt;/p&gt;\r\n'),
(7, 4, ' VI City Chocolate Festival', ' VI City Chocolate Festival', '&lt;p&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;b&gt;&lt;span&gt;VI Chocolate Festival, the sweetest holiday of the country, will take place in Lviv!&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;color:#a52a2a;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;strong&gt;www.shokolad.lviv.ua&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p align=&quot;justify&quot;&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;span&gt;Do you dream about sweet weekend? &lt;/span&gt;&lt;span style=&quot;color:#ff0000;&quot;&gt;&lt;span&gt;Welcome to Lviv in Valentine&amp;rsquo;s Day!&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p align=&quot;justify&quot;&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;span&gt;&lt;strong&gt;From 14&lt;sup&gt;th&lt;/sup&gt; to 17&lt;sup&gt;th&lt;/sup&gt; of February in Lviv Art Palace (17, Kopernyka Str.)&lt;/strong&gt; an extraordinary and brilliant performance &lt;/span&gt;―&lt;span&gt; VI City Chocolate Festival will take place. In those days the city invites all sweet tooth to taste the best variety of chocolate sweets. After all at the festival the record for the number of represented types of chocolate and chocolate products will be once again beaten.&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p align=&quot;justify&quot;&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;span&gt;A separate area where the biggest chocolate festival in the world EuroChocolate Festival in Perugia will present itself will be the highlight of the festival. All chocolate lovers can enjoy the most delicious Italian sweets in Lviv at Chocolate Festival.&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n'),
(7, 3, 'Праздник Шоколада во Львове', 'Праздник Шоколада во Львове, день валентина', '&lt;p&gt;\r\n	&lt;span style=&quot;font-family:trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;14-17 февраля 2013 года&lt;/strong&gt;&amp;nbsp; &lt;b&gt;&lt;strong&gt;-&lt;/strong&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-family:trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;b&gt;Во Львове состоится самый сладкий праздник страны ― VI Праздник Шоколада!&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p align=&quot;justify&quot;&gt;\r\n	&lt;span style=&quot;font-family:trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(128, 0, 0);&quot;&gt;&lt;strong&gt;&lt;span class=&quot;events-date&quot;&gt;14-17 февраля &lt;/span&gt;2013 -&amp;nbsp; г.Львов, &lt;span class=&quot;b-cblock__attrs__address b-icon b-icon__address&quot;&gt;ул. Коперника, 17&lt;/span&gt;&lt;br /&gt;\r\n	&lt;span class=&quot;b-cblock__attrs__address b-icon b-icon__web&quot;&gt;www.shokolad.lviv.ua&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-family:trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;Мечтаете о сладких выходных? &lt;span style=&quot;color:#ff0000;&quot;&gt;Посетите Львов в День святого Валентина! &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-family:trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;Ведь с 14 по 17 февраля во Львовском дворце искусств (ул. Коперника, 17) состоится чрезвычайное и яркое действо &amp;mdash; VI Городской Праздник Шоколада. В эти дни город гостеприимно приглашает всех сладкоежек попробовать лучшие и разнообразные шоколадные сладости. Ведь на этом фестивале будет в очередной раз побит рекорд по количеству представленных видов шоколада и шоколадных изделий.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-family:trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;Изюминкой праздника станет то, что будет отдельная зона, на которой будет себя презентовать самый большой шоколадный фестиваль мира ― EuroChocolate фестиваль в Перудже. Все ценители шоколада смогут насладиться вкусными итальянскими сладостями во Львове на Празднике Шоколада.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-family:trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;Также в этом году будут угощать всех желающих огромным кремово-шоколадным &amp;ldquo;многоэтажным&amp;rdquo; тортом! Будет смаковать удивительно!&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n'),
(7, 2, 'Свято Шоколаду у Львові', 'Свято шоколаду, день валентина у львові', '&lt;p align=&quot;justify&quot;&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;Свято Шоколаду&lt;/span&gt; запрошує усіх поціновувачів та шанувальників солодощів поринути у світ гармонії і смакування шоколадного мистецтва.&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p align=&quot;justify&quot;&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;span style=&quot;color: rgb(128, 0, 0);&quot;&gt;&lt;strong&gt;&lt;span class=&quot;events-date&quot;&gt;14-17&amp;nbsp;лютого &lt;/span&gt;2013 -&amp;nbsp; м.Львів, &lt;span class=&quot;b-cblock__attrs__address b-icon b-icon__address&quot;&gt;вул. Коперника, 17, центр міста&lt;/span&gt;&lt;br /&gt;\r\n	&lt;span class=&quot;b-cblock__attrs__address b-icon b-icon__web&quot;&gt;www.shokolad.lviv.ua&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p align=&quot;justify&quot;&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;span&gt;Мрієте про солодкі вихідні? &lt;/span&gt;&lt;span style=&quot;color:#ff0000;&quot;&gt;&lt;span&gt;Завітайте до&amp;nbsp;&lt;/span&gt;Львова&amp;nbsp;&lt;span&gt;у День святого Валентина! &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p align=&quot;justify&quot;&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;span&gt;Адже з &lt;b&gt;14 по 17 лютого у Львівському палаці мистецтв&lt;/b&gt; &lt;span&gt;(вул. Коперника, 17) &lt;/span&gt;&amp;nbsp;відбудеться надзвичайне та яскраве дійство &amp;ndash; &lt;/span&gt;&lt;b&gt;VI&lt;/b&gt;&lt;span&gt;&lt;b&gt; Національне Свято Шоколаду.&lt;/b&gt; В ці дні місто гостинно запрошує всіх ласунів скуштувати найкращі та найрізноманітніші &amp;nbsp;шоколадні солодощі. Адже на цьому фестивалі буде вкотре побитий рекорд по кількості представлених видів шоколаду та шоколадних виробів.&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p align=&quot;justify&quot;&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;span&gt;&lt;b&gt;Родзинкою Свята стане&lt;/b&gt; те, що буде окрема зона, на якій себе презентуватиме найбільший шоколадний фестиваль&amp;nbsp;світу &amp;ndash; &lt;b&gt;EuroChocolate&lt;/b&gt; фестиваль у Перуджі. Всі поціновувачі шоколаду зможуть &lt;b&gt;посмакувати найсмачнішими італійськими солодощами у Львові на Святі Шоколаду&lt;/b&gt;.&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p align=&quot;justify&quot;&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;b&gt;&lt;span&gt;Також цьогоріч пригощатимуть всіх охочих величезним кремово-шоколадним &amp;laquo;кількаповерховим&amp;raquo; тортом!&amp;nbsp;Смакуватиме дивовижно!&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n'),
(8, 5, 'Discounts on accommodation hostel LEOHOSTEL!', 'Discounts on accommodation hostel LEOHOSTEL!', '&lt;p&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;span id=&quot;result_box&quot; lang=&quot;en&quot;&gt;&lt;span style=&quot;color:#ff0000;&quot;&gt;&lt;span class=&quot;hps&quot;&gt;Discounts on&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;accommodation&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;hostel&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;LEOHOSTEL&lt;/span&gt;&lt;span&gt;!&lt;/span&gt;&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;span class=&quot;hps&quot;&gt;New prices for&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;accommodation in&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;hostel&lt;/span&gt; &lt;span class=&quot;hps atn&quot;&gt;&amp;quot;&lt;/span&gt;&lt;span&gt;Leohostel&lt;/span&gt;&lt;span&gt;&amp;quot; - just&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;two months -&lt;/span&gt; &lt;span style=&quot;color:#ff0000;&quot;&gt;&lt;span class=&quot;hps&quot;&gt;February, March&lt;/span&gt;&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;-&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;are&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;promotional&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;prices:&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;span class=&quot;hps&quot;&gt;accommodation in&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;8 -,&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;10 -&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;double rooms&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;- &lt;span style=&quot;color:#ff0000;&quot;&gt;59&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#ff0000;&quot;&gt; &lt;span class=&quot;hps&quot;&gt;UAH.&lt;/span&gt; &lt;/span&gt;&lt;span class=&quot;hps&quot;&gt;per person per night&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;span id=&quot;result_box&quot; lang=&quot;en&quot;&gt;&lt;span class=&quot;hps&quot;&gt;accommodation&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;span id=&quot;result_box&quot; lang=&quot;en&quot;&gt; &lt;span class=&quot;hps atn&quot;&gt;in&amp;nbsp; 6-&lt;/span&gt;&lt;span&gt;bed rooms&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;- &lt;span style=&quot;color:#ff0000;&quot;&gt;69&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#ff0000;&quot;&gt; &lt;span class=&quot;hps&quot;&gt;UAH.&lt;/span&gt; &lt;/span&gt;&lt;span class=&quot;hps&quot;&gt;per person per night&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;span class=&quot;hps&quot;&gt;accommodation in&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;4 -&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;bed rooms&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;- &lt;span style=&quot;color:#ff0000;&quot;&gt;89&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#ff0000;&quot;&gt; &lt;span class=&quot;hps&quot;&gt;UAH.&lt;/span&gt;&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;per person per night&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;span class=&quot;hps&quot;&gt;***&amp;nbsp; Price&lt;/span&gt; f&lt;span class=&quot;hps&quot;&gt;or groups&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;by appointment&lt;/span&gt;&lt;span&gt;!&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	Hostel Leohostel&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;span class=&quot;hps&quot;&gt;+38 032-238-21-90&lt;/span&gt;&lt;br /&gt;\r\n	&lt;span class=&quot;hps&quot;&gt;+38 096-427-15-19&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;span lang=&quot;en&quot;&gt;&lt;span class=&quot;hps&quot;&gt;e-mail: info@leohostel.lviv.ua&lt;/span&gt;&lt;br /&gt;\r\n	&lt;span class=&quot;hps&quot;&gt;Website&lt;/span&gt;&lt;span&gt;: www.leohostel.lviv.ua&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n'),
(8, 4, 'Discounts on accommodation hostel LEOHOSTEL!', 'Discounts on accommodation hostel LEOHOSTEL!\r\n', '&lt;p&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;span id=&quot;result_box&quot; lang=&quot;en&quot;&gt;&lt;span style=&quot;color:#ff0000;&quot;&gt;&lt;span class=&quot;hps&quot;&gt;Discounts on&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;accommodation&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;hostel&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;LEOHOSTEL&lt;/span&gt;&lt;span&gt;!&lt;/span&gt;&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;span class=&quot;hps&quot;&gt;New prices for&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;accommodation in&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;hostel&lt;/span&gt; &lt;span class=&quot;hps atn&quot;&gt;&amp;quot;&lt;/span&gt;&lt;span&gt;Leohostel&lt;/span&gt;&lt;span&gt;&amp;quot; - just&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;two months -&lt;/span&gt; &lt;span style=&quot;color:#ff0000;&quot;&gt;&lt;span class=&quot;hps&quot;&gt;February, March&lt;/span&gt;&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;-&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;are&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;promotional&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;prices:&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;span class=&quot;hps&quot;&gt;accommodation in&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;8 -,&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;10 -&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;double rooms&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;- &lt;span style=&quot;color:#ff0000;&quot;&gt;59&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#ff0000;&quot;&gt; &lt;span class=&quot;hps&quot;&gt;UAH.&lt;/span&gt; &lt;/span&gt;&lt;span class=&quot;hps&quot;&gt;per person per night&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;span id=&quot;result_box&quot; lang=&quot;en&quot;&gt;&lt;span class=&quot;hps&quot;&gt;accommodation&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;span id=&quot;result_box&quot; lang=&quot;en&quot;&gt; &lt;span class=&quot;hps atn&quot;&gt;in&amp;nbsp; 6-&lt;/span&gt;&lt;span&gt;bed rooms&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;- &lt;span style=&quot;color:#ff0000;&quot;&gt;69&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#ff0000;&quot;&gt; &lt;span class=&quot;hps&quot;&gt;UAH.&lt;/span&gt; &lt;/span&gt;&lt;span class=&quot;hps&quot;&gt;per person per night&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;span class=&quot;hps&quot;&gt;accommodation in&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;4 -&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;bed rooms&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;- &lt;span style=&quot;color:#ff0000;&quot;&gt;89&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#ff0000;&quot;&gt; &lt;span class=&quot;hps&quot;&gt;UAH.&lt;/span&gt;&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;per person per night&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;span class=&quot;hps&quot;&gt;***&amp;nbsp; Price&lt;/span&gt; f&lt;span class=&quot;hps&quot;&gt;or groups&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;by appointment&lt;/span&gt;&lt;span&gt;!&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	Hostel Leohostel&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;span class=&quot;hps&quot;&gt;+38 032-238-21-90&lt;/span&gt;&lt;br /&gt;\r\n	&lt;span class=&quot;hps&quot;&gt;+38 096-427-15-19&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;span lang=&quot;en&quot;&gt;&lt;span class=&quot;hps&quot;&gt;e-mail: info@leohostel.lviv.ua&lt;/span&gt;&lt;br /&gt;\r\n	&lt;span class=&quot;hps&quot;&gt;Website&lt;/span&gt;&lt;span&gt;: www.leohostel.lviv.ua&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n'),
(8, 2, 'ЗНИЖКИ на проживання у хостелі ЛЕОХОСТЕЛ !', 'ЗНИЖКИ на проживання у хостелі ЛЕОХОСТЕЛ !', '&lt;p&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:#ff0000;&quot;&gt;ЗНИЖКИ на проживання у хостелі ЛЕОХОСТЕЛ !&lt;/span&gt;&lt;/strong&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;span style=&quot;color:#b22222;&quot;&gt;Нові ціни на проживання у хостелі &amp;quot;Леохостел&amp;quot; &lt;/span&gt;- тільки два місяці - &lt;span style=&quot;color:#ff0000;&quot;&gt;ЛЮТИЙ, БЕРЕЗЕНЬ&amp;nbsp;&lt;/span&gt; - діють акційні ціни :&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	проживання у 8-, 10- місних номерах - &lt;span style=&quot;color:#ff0000;&quot;&gt;59 грн.&lt;/span&gt; з особи за добу&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	проживання у 6-місних номерах - &lt;span style=&quot;color:#ff0000;&quot;&gt;69 грн.&lt;/span&gt; з особи за добу&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	проживання у 4- місних номерах - &lt;span style=&quot;color:#ff0000;&quot;&gt;89 грн.&lt;/span&gt; з особи за добу&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	*** Для груп ціни по домовленості !&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	У нас завжди комфортно , недорого , 5 хв. до центру Львова - пр.Свободи.&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	Телефонуйте :&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	+38 032-238-21-90 &amp;nbsp;&lt;br /&gt;\r\n	+38 096-427-15-19&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;e-mail :&amp;nbsp;&amp;nbsp;&amp;nbsp; info@leohostel.lviv.ua&lt;br /&gt;\r\n	веб-сайт: www.leohostel.lviv.ua&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n');
INSERT INTO `news_description` (`news_id`, `language_id`, `title`, `meta_description`, `description`) VALUES
(8, 3, 'СКИДКИ на проживание в хостеле ЛЕОХОСТЕЛ!', 'СКИДКИ на проживание в хостеле ЛЕОХОСТЕЛ!', '&lt;p&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;span id=&quot;result_box&quot; lang=&quot;ru&quot;&gt;&lt;span style=&quot;color:#ff0000;&quot;&gt;&lt;span class=&quot;hps&quot;&gt;СКИДКИ&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;на проживание&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;в хостеле&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;ЛЕОХОСТЕЛ&lt;/span&gt;&lt;span&gt;!&lt;/span&gt;&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;span style=&quot;color:#ff0000;&quot;&gt;&lt;span class=&quot;hps&quot;&gt;Новые&lt;/span&gt; &lt;/span&gt;&lt;span class=&quot;hps&quot;&gt;&lt;span style=&quot;color:#ff0000;&quot;&gt;цены&lt;/span&gt; на проживание в&lt;/span&gt; &lt;span class=&quot;hps atn&quot;&gt;хостеле &amp;quot;&lt;/span&gt;&lt;span&gt;Леохостел&lt;/span&gt;&lt;span&gt;&amp;quot; - только&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;два месяца -&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;&lt;span style=&quot;color:#ff0000;&quot;&gt;февраль, март &lt;/span&gt;-&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;действуют акционные&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;цены:&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;span class=&quot;hps&quot;&gt;проживание в&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;8 -&lt;/span&gt;&lt;span&gt;,&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;10 -&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;местных&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;номерах -&lt;/span&gt; &lt;span style=&quot;color:#ff0000;&quot;&gt;&lt;span class=&quot;hps&quot;&gt;59 грн.&lt;/span&gt;&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;с человека в сутки&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;span class=&quot;hps&quot;&gt;проживание в&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;6-местных&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;номерах -&lt;/span&gt; &lt;span style=&quot;color:#ff0000;&quot;&gt;&lt;span class=&quot;hps&quot;&gt;69 грн.&lt;/span&gt;&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;с человека в сутки&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;span class=&quot;hps&quot;&gt;проживание в&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;4 - местных номерах&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;-&lt;span style=&quot;color:#ff0000;&quot;&gt; 89 грн.&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#ff0000;&quot;&gt; &lt;/span&gt;&lt;span class=&quot;hps&quot;&gt;с человека в сутки&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;span class=&quot;hps&quot;&gt;*** Для&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;групп цены&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;по&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;договоренности!&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;span class=&quot;hps&quot;&gt;У нас&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;всегда комфортно&lt;/span&gt;&lt;span&gt;,&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;недорого&lt;/span&gt;&lt;span&gt;,&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;5 мин.&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;до центра Львова&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;-&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;пр. Свободы&lt;/span&gt;&lt;span&gt;.&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;span class=&quot;hps&quot;&gt;Звоните:&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;span class=&quot;hps&quot;&gt;+38 032-238-21-90&lt;/span&gt;&lt;br /&gt;\r\n	&lt;span class=&quot;hps&quot;&gt;+38 096-427-15-19&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;font-family: trebuchet ms,helvetica,sans-serif;&quot;&gt;&lt;span lang=&quot;ru&quot;&gt;&lt;span class=&quot;hps&quot;&gt;e&lt;/span&gt;&lt;span class=&quot;atn&quot;&gt;-&lt;/span&gt;&lt;span&gt;mail&lt;/span&gt;&lt;span&gt;:&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;info@leohostel.lviv.ua&lt;/span&gt;&lt;br /&gt;\r\n	&lt;span class=&quot;hps&quot;&gt;сайт:&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;www.leohostel.lviv.ua&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n');

-- --------------------------------------------------------

--
-- Структура таблиці `news_to_store`
--

CREATE TABLE IF NOT EXISTS `news_to_store` (
  `news_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`news_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп даних таблиці `news_to_store`
--

INSERT INTO `news_to_store` (`news_id`, `store_id`) VALUES
(1, 0),
(2, 0),
(3, 0),
(5, 0),
(6, 0),
(7, 0),
(8, 0);

-- --------------------------------------------------------

--
-- Структура таблиці `option`
--

CREATE TABLE IF NOT EXISTS `option` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) COLLATE utf8_bin NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=14 ;

--
-- Дамп даних таблиці `option`
--

INSERT INTO `option` (`option_id`, `type`, `sort_order`) VALUES
(1, 'radio', 2),
(2, 'checkbox', 3),
(4, 'text', 4),
(5, 'select', 1),
(6, 'textarea', 5),
(7, 'file', 6),
(8, 'date', 7),
(9, 'time', 8),
(10, 'datetime', 9),
(11, 'select', 1),
(12, 'date', 1),
(13, 'radio', 1);

-- --------------------------------------------------------

--
-- Структура таблиці `option_description`
--

CREATE TABLE IF NOT EXISTS `option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`option_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп даних таблиці `option_description`
--

INSERT INTO `option_description` (`option_id`, `language_id`, `name`) VALUES
(13, 2, 'Упаковка'),
(1, 2, 'Radio'),
(2, 2, 'Checkbox'),
(4, 2, 'Text'),
(6, 2, 'Textarea'),
(8, 2, 'Date'),
(7, 2, 'File'),
(5, 2, 'Select'),
(9, 2, 'Time'),
(10, 2, 'Date &amp; Time'),
(12, 2, 'Delivery Date'),
(11, 2, 'Size');

-- --------------------------------------------------------

--
-- Структура таблиці `option_value`
--

CREATE TABLE IF NOT EXISTS `option_value` (
  `option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8_bin NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_value_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=51 ;

--
-- Дамп даних таблиці `option_value`
--

INSERT INTO `option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES
(43, 1, '', 3),
(32, 1, '', 1),
(45, 2, '', 4),
(44, 2, '', 3),
(42, 5, '', 4),
(41, 5, '', 3),
(39, 5, '', 1),
(40, 5, '', 2),
(31, 1, '', 2),
(23, 2, '', 1),
(24, 2, '', 2),
(46, 11, '', 1),
(47, 11, '', 2),
(48, 11, '', 3),
(49, 13, 'no_image.jpg', 1),
(50, 13, 'no_image.jpg', 0);

-- --------------------------------------------------------

--
-- Структура таблиці `option_value_description`
--

CREATE TABLE IF NOT EXISTS `option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`option_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп даних таблиці `option_value_description`
--

INSERT INTO `option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES
(50, 2, 13, '2,5 кг.'),
(49, 2, 13, '1,5 кг.'),
(43, 2, 1, 'Large'),
(32, 2, 1, 'Small'),
(45, 2, 2, 'Checkbox 4'),
(44, 2, 2, 'Checkbox 3'),
(31, 2, 1, 'Medium'),
(42, 2, 5, 'Yellow'),
(41, 2, 5, 'Green'),
(39, 2, 5, 'Red'),
(40, 2, 5, 'Blue'),
(23, 2, 2, 'Checkbox 1'),
(24, 2, 2, 'Checkbox 2'),
(48, 2, 11, 'Large'),
(47, 2, 11, 'Medium'),
(46, 2, 11, 'Small');

-- --------------------------------------------------------

--
-- Структура таблиці `order`
--

CREATE TABLE IF NOT EXISTS `order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` int(11) NOT NULL DEFAULT '0',
  `invoice_prefix` varchar(26) COLLATE utf8_bin NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `store_url` varchar(255) COLLATE utf8_bin NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lastname` varchar(32) COLLATE utf8_bin NOT NULL,
  `email` varchar(96) COLLATE utf8_bin NOT NULL,
  `telephone` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `fax` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `shipping_firstname` varchar(32) COLLATE utf8_bin NOT NULL,
  `shipping_lastname` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `shipping_company` varchar(32) COLLATE utf8_bin NOT NULL,
  `shipping_address_1` varchar(128) COLLATE utf8_bin NOT NULL,
  `shipping_address_2` varchar(128) COLLATE utf8_bin NOT NULL,
  `shipping_city` varchar(128) COLLATE utf8_bin NOT NULL,
  `shipping_postcode` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '',
  `shipping_country` varchar(128) COLLATE utf8_bin NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) COLLATE utf8_bin NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text COLLATE utf8_bin NOT NULL,
  `shipping_method` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `shipping_code` varchar(128) COLLATE utf8_bin NOT NULL,
  `payment_firstname` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `payment_lastname` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `payment_company` varchar(32) COLLATE utf8_bin NOT NULL,
  `payment_address_1` varchar(128) COLLATE utf8_bin NOT NULL,
  `payment_address_2` varchar(128) COLLATE utf8_bin NOT NULL,
  `payment_city` varchar(128) COLLATE utf8_bin NOT NULL,
  `payment_postcode` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '',
  `payment_country` varchar(128) COLLATE utf8_bin NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) COLLATE utf8_bin NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text COLLATE utf8_bin NOT NULL,
  `payment_method` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `payment_code` varchar(128) COLLATE utf8_bin NOT NULL,
  `comment` text COLLATE utf8_bin NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) COLLATE utf8_bin NOT NULL,
  `currency_value` decimal(15,8) NOT NULL,
  `ip` varchar(15) COLLATE utf8_bin NOT NULL,
  `forwarded_ip` varchar(15) COLLATE utf8_bin NOT NULL,
  `user_agent` varchar(255) COLLATE utf8_bin NOT NULL,
  `accept_language` varchar(255) COLLATE utf8_bin NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=27 ;

--
-- Дамп даних таблиці `order`
--

INSERT INTO `order` (`order_id`, `invoice_no`, `invoice_prefix`, `store_id`, `store_name`, `store_url`, `customer_id`, `customer_group_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `shipping_firstname`, `shipping_lastname`, `shipping_company`, `shipping_address_1`, `shipping_address_2`, `shipping_city`, `shipping_postcode`, `shipping_country`, `shipping_country_id`, `shipping_zone`, `shipping_zone_id`, `shipping_address_format`, `shipping_method`, `shipping_code`, `payment_firstname`, `payment_lastname`, `payment_company`, `payment_address_1`, `payment_address_2`, `payment_city`, `payment_postcode`, `payment_country`, `payment_country_id`, `payment_zone`, `payment_zone_id`, `payment_address_format`, `payment_method`, `payment_code`, `comment`, `total`, `order_status_id`, `affiliate_id`, `commission`, `language_id`, `currency_id`, `currency_code`, `currency_value`, `ip`, `forwarded_ip`, `user_agent`, `accept_language`, `date_added`, `date_modified`) VALUES
(6, 0, 'INV-2011-00', 0, 'domovychok.com.ua', 'http://opencart.slcompany.com.ua/', 3, 8, 'Володя', 'Сегеда', 'websufix@yahoo.com', '097 565466 ', '', 'Володя', 'Сегеда', '', 'ssssss', '', 'ssssssss', '4946', 'Україна', 220, 'Івано-Франківська', 3486, '', 'Самовивіз зі складу', 'pickup.pickup', 'Володя', 'Сегеда', '', 'ssssss', '', 'ssssssss', '4946', 'Україна', 220, 'Івано-Франківська', 3486, '', 'Оплата при доставці', 'cod', '', '100.0000', 0, 0, '0.0000', 2, 4, 'GRN', '1.00000000', '46.202.218.252', '', 'Opera/9.80 (Windows NT 5.1; U; Edition Ukraine Local; ru) Presto/2.9.168 Version/11.52', 'uk-UA,uk;q=0.9,en;q=0.8', '2012-07-02 18:27:33', '2012-07-02 18:27:33'),
(7, 0, 'INV-2011-00', 0, 'domovychok.com.ua', 'http://opencart.slcompany.com.ua/', 3, 8, 'Володя', 'Сегеда', 'websufix@yahoo.com', '097 565466 ', '', 'Володя', 'Сегеда', '', 'ssssss', '', 'ssssssss', '4946', 'Україна', 220, 'Івано-Франківська', 3486, '', 'Самовивіз зі складу', 'pickup.pickup', 'Володя', 'Сегеда', '', 'ssssss', '', 'ssssssss', '4946', 'Україна', 220, 'Івано-Франківська', 3486, '', 'Оплата при доставці', 'cod', '', '100.0000', 0, 0, '0.0000', 2, 4, 'GRN', '1.00000000', '46.202.218.252', '', 'Opera/9.80 (Windows NT 5.1; U; Edition Ukraine Local; ru) Presto/2.9.168 Version/11.52', 'uk-UA,uk;q=0.9,en;q=0.8', '2012-07-02 18:27:34', '2012-07-02 18:27:34'),
(9, 0, 'INV-2011-00', 0, 'domovychok.com.ua', 'http://opencart.slcompany.com.ua/', 1, 8, 'Volodia', 'Secf', 'websufixlviv@ukr.net', '5646496', '', 'Volodia', 'Secf', '', 'Lviv', '', 'lviv', '79035', 'United Kingdom', 222, 'Anglesey', 3515, '', 'Самовивіз зі складу', 'pickup.pickup', 'Volodia', 'Secf', '', 'Lviv', '', 'lviv', '79035', 'United Kingdom', 222, 'Anglesey', 3515, '', 'Оплата при доставці', 'cod', '', '2301.0000', 0, 0, '0.0000', 2, 4, 'GRN', '1.00000000', '46.203.226.40', '', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/536.11 (KHTML, like Gecko) Chrome/20.0.1132.47 Safari/536.11', 'uk-UA,uk;q=0.8,ru;q=0.6,en-US;q=0.4,en;q=0.2', '2012-07-05 15:41:34', '2012-07-05 15:41:34'),
(11, 0, 'INV-2011-00', 0, 'domovychok.com.ua--Найдомашніший магазин', 'http://opencart.slcompany.com.ua/', 0, 8, 'dffhfdh', '', 'dfhdf@sdd.com', 'dhdhf', '', 'dffhfdh', '', '', 'dhhfdfh', '', 'dhdh', '', 'Україна', 220, 'Рівненська', 3497, '', 'Самовивіз зі складу', 'pickup.pickup', 'dffhfdh', '', '', 'dhhfdfh', '', 'dhdh', '', 'Україна', 220, 'Рівненська', 3497, '', 'Оплата при доставці', 'cod', '', '90.0000', 0, 0, '0.0000', 2, 4, 'GRN', '1.00000000', '46.202.95.200', '', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/536.11 (KHTML, like Gecko) Chrome/20.0.1132.47 Safari/536.11', 'uk-UA,uk;q=0.8,ru;q=0.6,en-US;q=0.4,en;q=0.2', '2012-07-09 09:29:27', '2012-07-09 09:29:27'),
(12, 0, 'INV-2011-00', 0, 'domovychok.com.ua--Найдомашніший магазин', 'http://opencart.slcompany.com.ua/', 0, 8, 'dffhfdh', '', 'dfhdf@sdd.com', 'dhdhf', '', 'dffhfdh', '', '', 'dhhfdfh', '', 'dhdh', '', 'Україна', 220, 'Рівненська', 3497, '', 'Самовивіз зі складу', 'pickup.pickup', 'dffhfdh', '', '', 'dhhfdfh', '', 'dhdh', '', 'Україна', 220, 'Рівненська', 3497, '', 'Оплата при доставці', 'cod', '', '90.0000', 0, 0, '0.0000', 2, 4, 'GRN', '1.00000000', '46.202.95.200', '', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/536.11 (KHTML, like Gecko) Chrome/20.0.1132.47 Safari/536.11', 'uk-UA,uk;q=0.8,ru;q=0.6,en-US;q=0.4,en;q=0.2', '2012-07-09 09:32:30', '2012-07-09 09:32:30'),
(13, 0, 'INV-2011-00', 0, 'domovychok.com.ua--Найдомашніший магазин', 'http://opencart.slcompany.com.ua/', 0, 8, 'dffhfdh', '', 'dfhdf@sdd.com', 'dhdhf', '', 'dffhfdh', '', '', 'dhhfdfh', '', 'dhdh', '', 'Україна', 220, 'Рівненська', 3497, '', 'Самовивіз зі складу', 'pickup.pickup', 'dffhfdh', '', '', 'dhhfdfh', '', 'dhdh', '', 'Україна', 220, 'Рівненська', 3497, '', 'Оплата при доставці', 'cod', '', '90.0000', 0, 0, '0.0000', 2, 4, 'GRN', '1.00000000', '46.202.95.200', '', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/536.11 (KHTML, like Gecko) Chrome/20.0.1132.47 Safari/536.11', 'uk-UA,uk;q=0.8,ru;q=0.6,en-US;q=0.4,en;q=0.2', '2012-07-09 09:36:11', '2012-07-09 09:36:11'),
(14, 0, 'INV-2011-00', 0, 'domovychok.com.ua--Найдомашніший магазин', 'http://opencart.slcompany.com.ua/', 0, 8, 'dffhfdh', '', 'dfhdf@sdd.com', 'dhdhf', '', 'dffhfdh', '', '', 'dhhfdfh', '', 'dhdh', '', 'Україна', 220, 'Рівненська', 3497, '', 'Самовивіз зі складу', 'pickup.pickup', 'dffhfdh', '', '', 'dhhfdfh', '', 'dhdh', '', 'Україна', 220, 'Рівненська', 3497, '', 'Оплата при доставці', 'cod', '', '90.0000', 0, 0, '0.0000', 2, 4, 'GRN', '1.00000000', '46.202.95.200', '', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/536.11 (KHTML, like Gecko) Chrome/20.0.1132.47 Safari/536.11', 'uk-UA,uk;q=0.8,ru;q=0.6,en-US;q=0.4,en;q=0.2', '2012-07-09 09:38:24', '2012-07-09 09:38:24'),
(15, 0, 'INV-2011-00', 0, 'domovychok.com.ua--Найдомашніший магазин', 'http://opencart.slcompany.com.ua/', 0, 8, 'Volodia', '', 'websufixlviv@ukr.net', '096-1419950', '', 'Volodia', '', '', 'Lviv address', '', 'Lviv city', '', 'Україна', 220, 'Львівська ', 3493, '', 'Самовивіз зі складу', 'pickup.pickup', 'Volodia', '', '', 'Lviv address', '', 'Lviv city', '', 'Україна', 220, 'Львівська ', 3493, '', 'Оплата при доставці', 'cod', '', '90.0000', 0, 0, '0.0000', 2, 4, 'GRN', '1.00000000', '46.202.95.200', '', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/536.11 (KHTML, like Gecko) Chrome/20.0.1132.47 Safari/536.11', 'uk-UA,uk;q=0.8,ru;q=0.6,en-US;q=0.4,en;q=0.2', '2012-07-09 09:39:13', '2012-07-09 09:39:13');

-- --------------------------------------------------------

--
-- Структура таблиці `order_download`
--

CREATE TABLE IF NOT EXISTS `order_download` (
  `order_download_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `filename` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `mask` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `remaining` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `order_fraud`
--

CREATE TABLE IF NOT EXISTS `order_fraud` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `country_match` varchar(3) COLLATE utf8_bin NOT NULL,
  `country_code` varchar(2) COLLATE utf8_bin NOT NULL,
  `high_risk_country` varchar(3) COLLATE utf8_bin NOT NULL,
  `distance` int(11) NOT NULL,
  `ip_region` varchar(255) COLLATE utf8_bin NOT NULL,
  `ip_city` varchar(255) COLLATE utf8_bin NOT NULL,
  `ip_latitude` decimal(10,6) NOT NULL,
  `ip_longitude` decimal(10,6) NOT NULL,
  `ip_isp` varchar(255) COLLATE utf8_bin NOT NULL,
  `ip_org` varchar(255) COLLATE utf8_bin NOT NULL,
  `ip_asnum` int(11) NOT NULL,
  `ip_user_type` varchar(255) COLLATE utf8_bin NOT NULL,
  `ip_country_confidence` varchar(3) COLLATE utf8_bin NOT NULL,
  `ip_region_confidence` varchar(3) COLLATE utf8_bin NOT NULL,
  `ip_city_confidence` varchar(3) COLLATE utf8_bin NOT NULL,
  `ip_postal_confidence` varchar(3) COLLATE utf8_bin NOT NULL,
  `ip_postal_code` varchar(10) COLLATE utf8_bin NOT NULL,
  `ip_accuracy_radius` int(11) NOT NULL,
  `ip_net_speed_cell` varchar(255) COLLATE utf8_bin NOT NULL,
  `ip_metro_code` int(3) NOT NULL,
  `ip_area_code` int(3) NOT NULL,
  `ip_time_zone` varchar(255) COLLATE utf8_bin NOT NULL,
  `ip_region_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `ip_domain` varchar(255) COLLATE utf8_bin NOT NULL,
  `ip_country_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `ip_continent_code` varchar(2) COLLATE utf8_bin NOT NULL,
  `ip_corporate_proxy` varchar(3) COLLATE utf8_bin NOT NULL,
  `anonymous_proxy` varchar(3) COLLATE utf8_bin NOT NULL,
  `proxy_score` int(3) NOT NULL,
  `is_trans_proxy` varchar(3) COLLATE utf8_bin NOT NULL,
  `free_mail` varchar(3) COLLATE utf8_bin NOT NULL,
  `carder_email` varchar(3) COLLATE utf8_bin NOT NULL,
  `high_risk_username` varchar(3) COLLATE utf8_bin NOT NULL,
  `high_risk_password` varchar(3) COLLATE utf8_bin NOT NULL,
  `bin_match` varchar(10) COLLATE utf8_bin NOT NULL,
  `bin_country` varchar(2) COLLATE utf8_bin NOT NULL,
  `bin_name_match` varchar(3) COLLATE utf8_bin NOT NULL,
  `bin_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `bin_phone_match` varchar(3) COLLATE utf8_bin NOT NULL,
  `bin_phone` varchar(32) COLLATE utf8_bin NOT NULL,
  `customer_phone_in_billing_location` varchar(8) COLLATE utf8_bin NOT NULL,
  `ship_forward` varchar(3) COLLATE utf8_bin NOT NULL,
  `city_postal_match` varchar(3) COLLATE utf8_bin NOT NULL,
  `ship_city_postal_match` varchar(3) COLLATE utf8_bin NOT NULL,
  `score` decimal(10,5) NOT NULL,
  `explanation` text COLLATE utf8_bin NOT NULL,
  `risk_score` decimal(10,5) NOT NULL,
  `queries_remaining` int(11) NOT NULL,
  `maxmind_id` varchar(8) COLLATE utf8_bin NOT NULL,
  `error` text COLLATE utf8_bin NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблиці `order_history`
--

CREATE TABLE IF NOT EXISTS `order_history` (
  `order_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(5) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_bin NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`order_history_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=19 ;

-- --------------------------------------------------------

--
-- Структура таблиці `order_option`
--

CREATE TABLE IF NOT EXISTS `order_option` (
  `order_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `value` text COLLATE utf8_bin NOT NULL,
  `type` varchar(32) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`order_option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=12 ;

--
-- Дамп даних таблиці `order_option`
--

INSERT INTO `order_option` (`order_option_id`, `order_id`, `order_product_id`, `product_option_id`, `product_option_value_id`, `name`, `value`, `type`) VALUES
(1, 6, 7, 225, 0, 'Delivery Date', '2011-04-22', 'date'),
(2, 7, 8, 225, 0, 'Delivery Date', '2011-04-22', 'date'),
(4, 11, 19, 228, 19, 'Упаковка', '1,5 кг.', 'radio'),
(5, 12, 20, 228, 19, 'Упаковка', '1,5 кг.', 'radio'),
(6, 13, 21, 228, 19, 'Упаковка', '1,5 кг.', 'radio'),
(7, 14, 22, 228, 19, 'Упаковка', '1,5 кг.', 'radio'),
(8, 15, 23, 228, 19, 'Упаковка', '1,5 кг.', 'radio');

-- --------------------------------------------------------

--
-- Структура таблиці `order_product`
--

CREATE TABLE IF NOT EXISTS `order_product` (
  `order_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `model` varchar(24) COLLATE utf8_bin NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL,
  PRIMARY KEY (`order_product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=37 ;

--
-- Дамп даних таблиці `order_product`
--

INSERT INTO `order_product` (`order_product_id`, `order_id`, `product_id`, `name`, `model`, `quantity`, `price`, `total`, `tax`, `reward`) VALUES
(7, 6, 47, 'HP LP3065', 'Product 21', 1, '100.0000', '100.0000', '0.0000', 300),
(8, 7, 47, 'HP LP3065', 'Product 21', 1, '100.0000', '100.0000', '0.0000', 300),
(10, 9, 41, 'iMac', 'Product 14', 10, '100.0000', '1000.0000', '0.0000', 0),
(11, 9, 28, 'HTC Touch HD', 'Product 1', 2, '100.0000', '200.0000', '0.0000', 800),
(12, 9, 40, 'iPhone', 'product 11', 1, '101.0000', '101.0000', '0.0000', 0),
(13, 9, 46, 'Sony VAIO', 'Product 19', 1, '1000.0000', '1000.0000', '0.0000', 0),
(19, 11, 42, 'Ariel Біла троянда', 'Product 15', 1, '90.0000', '90.0000', '0.0000', 0),
(20, 12, 42, 'Ariel Біла троянда', 'Product 15', 1, '90.0000', '90.0000', '0.0000', 0),
(21, 13, 42, 'Ariel Біла троянда', 'Product 15', 1, '90.0000', '90.0000', '0.0000', 0),
(22, 14, 42, 'Ariel Біла троянда', 'Product 15', 1, '90.0000', '90.0000', '0.0000', 0),
(23, 15, 42, 'Ariel Біла троянда', 'Product 15', 1, '90.0000', '90.0000', '0.0000', 0);

-- --------------------------------------------------------

--
-- Структура таблиці `order_status`
--

CREATE TABLE IF NOT EXISTS `order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`order_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=17 ;

--
-- Дамп даних таблиці `order_status`
--

INSERT INTO `order_status` (`order_status_id`, `language_id`, `name`) VALUES
(2, 2, 'Processing'),
(3, 2, 'Shipped'),
(7, 2, 'Відмінено'),
(5, 2, 'Оброблено'),
(8, 2, 'Denied'),
(9, 2, 'Canceled Reversal'),
(10, 2, 'Не вдалося'),
(11, 2, 'Refunded'),
(12, 2, 'Reversed'),
(13, 2, 'Chargeback'),
(1, 2, 'Обробка'),
(16, 2, 'Анульовано'),
(15, 2, 'Processed'),
(14, 2, 'Expired');

-- --------------------------------------------------------

--
-- Структура таблиці `order_total`
--

CREATE TABLE IF NOT EXISTS `order_total` (
  `order_total_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) COLLATE utf8_bin NOT NULL,
  `title` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `text` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`order_total_id`),
  KEY `idx_orders_total_orders_id` (`order_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=85 ;

--
-- Дамп даних таблиці `order_total`
--

INSERT INTO `order_total` (`order_total_id`, `order_id`, `code`, `title`, `text`, `value`, `sort_order`) VALUES
(22, 6, 'sub_total', 'Сума', '100.00 грн.', '100.0000', 1),
(23, 6, 'shipping', 'Самовивіз зі складу', '0.00 грн.', '0.0000', 3),
(24, 6, 'total', 'Всього до сплати', '100.00 грн.', '100.0000', 9),
(25, 7, 'sub_total', 'Сума', '100.00 грн.', '100.0000', 1),
(26, 7, 'shipping', 'Самовивіз зі складу', '0.00 грн.', '0.0000', 3),
(27, 7, 'total', 'Всього до сплати', '100.00 грн.', '100.0000', 9),
(31, 9, 'sub_total', 'Сума', '2,301.00 грн.', '2301.0000', 1),
(32, 9, 'shipping', 'Самовивіз зі складу', '0.00 грн.', '0.0000', 3),
(33, 9, 'total', 'Всього до сплати', '2,301.00 грн.', '2301.0000', 9),
(37, 11, 'sub_total', 'Сума', '90.00 грн.', '90.0000', 1),
(38, 11, 'shipping', 'Самовивіз зі складу', '0.00 грн.', '0.0000', 3),
(39, 11, 'total', 'Всього до сплати', '90.00 грн.', '90.0000', 9),
(40, 12, 'sub_total', 'Сума', '90.00 грн.', '90.0000', 1),
(41, 12, 'shipping', 'Самовивіз зі складу', '0.00 грн.', '0.0000', 3),
(42, 12, 'total', 'Всього до сплати', '90.00 грн.', '90.0000', 9),
(43, 13, 'sub_total', 'Сума', '90.00 грн.', '90.0000', 1),
(44, 13, 'shipping', 'Самовивіз зі складу', '0.00 грн.', '0.0000', 3),
(45, 13, 'total', 'Всього до сплати', '90.00 грн.', '90.0000', 9),
(46, 14, 'sub_total', 'Сума', '90.00 грн.', '90.0000', 1),
(47, 14, 'shipping', 'Самовивіз зі складу', '0.00 грн.', '0.0000', 3),
(48, 14, 'total', 'Всього до сплати', '90.00 грн.', '90.0000', 9),
(49, 15, 'sub_total', 'Сума', '90.00 грн.', '90.0000', 1),
(50, 15, 'shipping', 'Самовивіз зі складу', '0.00 грн.', '0.0000', 3),
(51, 15, 'total', 'Всього до сплати', '90.00 грн.', '90.0000', 9);

-- --------------------------------------------------------

--
-- Структура таблиці `order_voucher`
--

CREATE TABLE IF NOT EXISTS `order_voucher` (
  `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8_bin NOT NULL,
  `code` varchar(10) COLLATE utf8_bin NOT NULL,
  `from_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `from_email` varchar(96) COLLATE utf8_bin NOT NULL,
  `to_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `to_email` varchar(96) COLLATE utf8_bin NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text COLLATE utf8_bin NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  PRIMARY KEY (`order_voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(64) COLLATE utf8_bin NOT NULL,
  `sku` varchar(64) COLLATE utf8_bin NOT NULL,
  `upc` varchar(12) COLLATE utf8_bin NOT NULL,
  `location` varchar(128) COLLATE utf8_bin NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` int(8) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL,
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `viewed` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=53 ;

-- --------------------------------------------------------

--
-- Структура таблиці `product_attribute`
--

CREATE TABLE IF NOT EXISTS `product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`product_id`,`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблиці `product_description`
--

CREATE TABLE IF NOT EXISTS `product_description` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL,
  `meta_description` varchar(255) COLLATE utf8_bin NOT NULL,
  `meta_keyword` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`product_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=53 ;

-- --------------------------------------------------------

--
-- Структура таблиці `product_discount`
--

CREATE TABLE IF NOT EXISTS `product_discount` (
  `product_discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_discount_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=471 ;

-- --------------------------------------------------------

--
-- Структура таблиці `product_image`
--

CREATE TABLE IF NOT EXISTS `product_image` (
  `product_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_image_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2433 ;

-- --------------------------------------------------------

--
-- Структура таблиці `product_option`
--

CREATE TABLE IF NOT EXISTS `product_option` (
  `product_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value` text COLLATE utf8_bin NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`product_option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=230 ;

-- --------------------------------------------------------

--
-- Структура таблиці `product_option_value`
--

CREATE TABLE IF NOT EXISTS `product_option_value` (
  `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) COLLATE utf8_bin NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) COLLATE utf8_bin NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`product_option_value_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=22 ;

-- --------------------------------------------------------

--
-- Структура таблиці `product_related`
--

CREATE TABLE IF NOT EXISTS `product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблиці `product_reward`
--

CREATE TABLE IF NOT EXISTS `product_reward` (
  `product_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `points` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_reward_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=655 ;

-- --------------------------------------------------------

--
-- Структура таблиці `product_special`
--

CREATE TABLE IF NOT EXISTS `product_special` (
  `product_special_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_special_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=472 ;

-- --------------------------------------------------------

--
-- Структура таблиці `product_tag`
--

CREATE TABLE IF NOT EXISTS `product_tag` (
  `product_tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `tag` varchar(32) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`product_tag_id`),
  KEY `product_id` (`product_id`),
  KEY `language_id` (`language_id`),
  KEY `tag` (`tag`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=357 ;

-- --------------------------------------------------------

--
-- Структура таблиці `product_to_category`
--

CREATE TABLE IF NOT EXISTS `product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблиці `product_to_download`
--

CREATE TABLE IF NOT EXISTS `product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблиці `product_to_layout`
--

CREATE TABLE IF NOT EXISTS `product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблиці `product_to_store`
--

CREATE TABLE IF NOT EXISTS `product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблиці `return`
--

CREATE TABLE IF NOT EXISTS `return` (
  `return_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) COLLATE utf8_bin NOT NULL,
  `lastname` varchar(32) COLLATE utf8_bin NOT NULL,
  `email` varchar(96) COLLATE utf8_bin NOT NULL,
  `telephone` varchar(32) COLLATE utf8_bin NOT NULL,
  `product` varchar(255) COLLATE utf8_bin NOT NULL,
  `model` varchar(64) COLLATE utf8_bin NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text COLLATE utf8_bin,
  `date_ordered` date NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`return_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `return_action`
--

CREATE TABLE IF NOT EXISTS `return_action` (
  `return_action_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`return_action_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;

--
-- Дамп даних таблиці `return_action`
--

INSERT INTO `return_action` (`return_action_id`, `language_id`, `name`) VALUES
(1, 2, 'Refunded'),
(2, 2, 'Credit Issued'),
(3, 2, 'Replacement Sent');

-- --------------------------------------------------------

--
-- Структура таблиці `return_history`
--

CREATE TABLE IF NOT EXISTS `return_history` (
  `return_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text COLLATE utf8_bin NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`return_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `return_reason`
--

CREATE TABLE IF NOT EXISTS `return_reason` (
  `return_reason_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`return_reason_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=6 ;

--
-- Дамп даних таблиці `return_reason`
--

INSERT INTO `return_reason` (`return_reason_id`, `language_id`, `name`) VALUES
(1, 2, 'Dead On Arrival'),
(2, 2, 'Received Wrong Item'),
(3, 2, 'Order Error'),
(4, 2, 'Faulty, please supply details'),
(5, 2, 'Other, please supply details');

-- --------------------------------------------------------

--
-- Структура таблиці `return_status`
--

CREATE TABLE IF NOT EXISTS `return_status` (
  `return_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`return_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;

--
-- Дамп даних таблиці `return_status`
--

INSERT INTO `return_status` (`return_status_id`, `language_id`, `name`) VALUES
(1, 2, 'Pending'),
(3, 2, 'Complete'),
(2, 2, 'Awaiting Products');

-- --------------------------------------------------------

--
-- Структура таблиці `review`
--

CREATE TABLE IF NOT EXISTS `review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `text` text COLLATE utf8_bin NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`review_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `setting`
--

CREATE TABLE IF NOT EXISTS `setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `group` varchar(32) COLLATE utf8_bin NOT NULL,
  `key` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `value` text COLLATE utf8_bin NOT NULL,
  `serialized` tinyint(1) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=29130 ;

--
-- Дамп даних таблиці `setting`
--

INSERT INTO `setting` (`setting_id`, `store_id`, `group`, `key`, `value`, `serialized`) VALUES
(26059, 0, 'shipping', 'shipping_sort_order', '3', 0),
(26061, 0, 'sub_total', 'sub_total_sort_order', '1', 0),
(26060, 0, 'sub_total', 'sub_total_status', '1', 0),
(26028, 0, 'tax', 'tax_sort_order', '5', 0),
(16013, 0, 'total', 'total_sort_order', '9', 0),
(16012, 0, 'total', 'total_status', '1', 0),
(26027, 0, 'tax', 'tax_status', '0', 0),
(24747, 0, 'free_checkout', 'free_checkout_sort_order', '1', 0),
(26055, 0, 'cod', 'cod_status', '1', 0),
(26054, 0, 'cod', 'cod_geo_zone_id', '0', 0),
(26058, 0, 'shipping', 'shipping_status', '1', 0),
(26057, 0, 'shipping', 'shipping_estimator', '0', 0),
(26022, 0, 'coupon', 'coupon_sort_order', '4', 0),
(26021, 0, 'coupon', 'coupon_status', '0', 0),
(26614, 0, 'flat', 'flat_sort_order', '1', 0),
(26613, 0, 'flat', 'flat_status', '1', 0),
(26612, 0, 'flat', 'flat_geo_zone_id', '0', 0),
(26611, 0, 'flat', 'flat_tax_class_id', '0', 0),
(26610, 0, 'flat', 'flat_cost', '0', 0),
(24726, 0, 'credit', 'credit_sort_order', '7', 0),
(24725, 0, 'credit', 'credit_status', '0', 0),
(26024, 0, 'reward', 'reward_sort_order', '2', 0),
(26023, 0, 'reward', 'reward_status', '0', 0),
(27725, 0, 'mainpageseo', 'uk_desc', 'Салон весільних суконь &quot;Анна Шарм&quot;', 0),
(26026, 0, 'voucher', 'voucher_sort_order', '8', 0),
(26025, 0, 'voucher', 'voucher_status', '0', 0),
(27724, 0, 'mainpageseo', 'uk_title', 'Салон весільних суконь &quot;Анна Шарм&quot;', 0),
(24746, 0, 'free_checkout', 'free_checkout_status', '0', 0),
(24745, 0, 'free_checkout', 'free_checkout_order_status_id', '1', 0),
(24727, 0, 'pickup', 'pickup_geo_zone_id', '0', 0),
(24728, 0, 'pickup', 'pickup_status', '1', 0),
(24729, 0, 'pickup', 'pickup_sort_order', '1', 0),
(26616, 0, 'item', 'item_tax_class_id', '0', 0),
(26617, 0, 'item', 'item_geo_zone_id', '0', 0),
(26618, 0, 'item', 'item_status', '0', 0),
(26619, 0, 'item', 'item_sort_order', '', 0),
(26053, 0, 'cod', 'cod_order_status_id', '1', 0),
(26052, 0, 'cod', 'cod_total', '0.01', 0),
(26056, 0, 'cod', 'cod_sort_order', '5', 0),
(26615, 0, 'item', 'item_cost', '10', 0),
(28338, 0, 'slideshow', 'slideshow_module', 'a:1:{i:0;a:7:{s:9:"banner_id";s:1:"9";s:5:"width";s:3:"300";s:6:"height";s:3:"450";s:9:"layout_id";s:1:"1";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}}', 1),
(28868, 0, 'welcome', 'welcome_module', 'a:2:{i:1;a:6:{s:11:"description";a:1:{i:2;s:1284:"&lt;p style=&quot;text-align: center;&quot;&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;color: rgb(94, 0, 94);&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;img alt=&quot;&quot; src=&quot;http://anna-sharm.com/image/data/logo/shapka.png&quot; style=&quot;width: 720px; height: 64px;&quot; /&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;color: rgb(94, 0, 94);&quot;&gt;Ось уже 15 років ми обслуговуємо найвибагливіших клієнтів з України та з закордону.&lt;/span&gt; &lt;/span&gt;&lt;/p&gt;\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;color: rgb(94, 0, 94);&quot;&gt;В нашому салоні Ви знайдете ексклюзивні моделі весільних та вечірніх суконь, для пошиття, яких використовуються тканини з усіх&amp;nbsp;країн світу.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n";}s:9:"layout_id";s:1:"1";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";s:5:"label";s:32:"Текст на ГОЛОВНІЙ";}i:2;a:6:{s:11:"description";a:1:{i:2;s:1576:"&lt;div&gt;\r\n	&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;span style=&quot;font-family:arial,helvetica,sans-serif;&quot;&gt;&lt;span style=&quot;color: rgb(94, 0, 94);&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;м.Львів &amp;nbsp;вул. Ім. І.Франка 21 / кв. 2А&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;br /&gt;\r\n	&amp;nbsp;&lt;/div&gt;\r\n&lt;div&gt;\r\n	&lt;span style=&quot;font-family:arial,helvetica,sans-serif;&quot;&gt;&lt;span style=&quot;color: rgb(94, 0, 94);&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;тел.:&lt;/strong&gt; &amp;nbsp; &amp;nbsp; &amp;nbsp; (032) 275 - 87 - 38&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/div&gt;\r\n&lt;div&gt;\r\n	&lt;span style=&quot;font-family:arial,helvetica,sans-serif;&quot;&gt;&lt;span style=&quot;color: rgb(94, 0, 94);&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;моб.:&lt;/strong&gt; &amp;nbsp; &amp;nbsp; &amp;nbsp;(098) 253 - 86 - 66&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/div&gt;\r\n&lt;div&gt;\r\n	&lt;span style=&quot;font-family:arial,helvetica,sans-serif;&quot;&gt;&lt;span style=&quot;color: rgb(94, 0, 94);&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;е-mail:&lt;/strong&gt; &amp;nbsp; &amp;nbsp; mira1969@meta.ua&lt;/span&gt;&lt;/span&gt;&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;span style=&quot;color:#4b0082;&quot;&gt;&lt;span style=&quot;font-size:16px;&quot;&gt;http://vk.com/annasharm.lviv&lt;br /&gt;\r\n	Instagram: &amp;nbsp;anna.sharm&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/div&gt;\r\n";}s:9:"layout_id";s:1:"8";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";s:5:"label";s:16:"Контакти";}}', 1),
(29127, 0, 'config', 'config_error_log', '1', 0),
(29128, 0, 'config', 'config_error_filename', 'myerrorlog.txt', 0),
(29129, 0, 'config', 'config_google_analytics', '&lt;script&gt;\r\n  (function(i,s,o,g,r,a,m){i[''GoogleAnalyticsObject'']=r;i[r]=i[r]||function(){\r\n  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),\r\n  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)\r\n  })(window,document,''script'',''https://www.google-analytics.com/analytics.js'',''ga'');\r\n\r\n  ga(''create'', ''UA-77438144-1'', ''auto'');\r\n  ga(''send'', ''pageview'');\r\n\r\n&lt;/script&gt;', 0),
(29126, 0, 'config', 'config_error_display', '0', 0),
(29125, 0, 'config', 'config_compression', '0', 0),
(29124, 0, 'config', 'config_encryption', '1sfdfsdf345', 0),
(29123, 0, 'config', 'config_maintenance', '0', 0),
(29122, 0, 'config', 'config_seo_url', '1', 0),
(29121, 0, 'config', 'config_use_ssl', '0', 0),
(29120, 0, 'config', 'config_fraud_status_id', '7', 0),
(29119, 0, 'config', 'config_fraud_score', '', 0),
(29118, 0, 'config', 'config_fraud_key', '', 0),
(29117, 0, 'config', 'config_fraud_detection', '0', 0),
(29116, 0, 'config', 'config_alert_emails', '', 0),
(29115, 0, 'config', 'config_account_mail', '1', 0),
(29114, 0, 'config', 'config_alert_mail', '1', 0),
(29113, 0, 'config', 'config_smtp_timeout', '5', 0),
(29112, 0, 'config', 'config_smtp_port', '25', 0),
(29111, 0, 'config', 'config_smtp_password', '', 0),
(29110, 0, 'config', 'config_smtp_username', '', 0),
(29109, 0, 'config', 'config_smtp_host', '', 0),
(29108, 0, 'config', 'config_mail_parameter', '', 0),
(29107, 0, 'config', 'config_mail_protocol', 'mail', 0),
(29106, 0, 'config', 'config_image_cart_height', '47', 0),
(29105, 0, 'config', 'config_image_cart_width', '47', 0),
(29104, 0, 'config', 'config_image_wishlist_height', '47', 0),
(29103, 0, 'config', 'config_image_wishlist_width', '47', 0),
(29102, 0, 'config', 'config_image_compare_height', '90', 0),
(29100, 0, 'config', 'config_image_related_height', '80', 0),
(29101, 0, 'config', 'config_image_compare_width', '90', 0),
(29099, 0, 'config', 'config_image_related_width', '80', 0),
(29098, 0, 'config', 'config_image_additional_height', '74', 0),
(29097, 0, 'config', 'config_image_additional_width', '74', 0),
(29096, 0, 'config', 'config_image_product_height', '80', 0),
(29095, 0, 'config', 'config_image_product_width', '80', 0),
(29094, 0, 'config', 'config_image_popup_height', '500', 0),
(29093, 0, 'config', 'config_image_popup_width', '500', 0),
(29092, 0, 'config', 'config_image_thumb_height', '228', 0),
(29091, 0, 'config', 'config_image_thumb_width', '228', 0),
(29090, 0, 'config', 'config_image_category_height', '80', 0),
(29089, 0, 'config', 'config_image_category_width', '80', 0),
(29088, 0, 'config', 'config_icon', 'data/logo/logo_mini.png', 0),
(29087, 0, 'config', 'config_logo', '', 0),
(29084, 0, 'config', 'config_download', '0', 0),
(29085, 0, 'config', 'config_upload_allowed', 'jpg, JPG, jpeg, gif, png, txt', 0),
(29086, 0, 'config', 'config_cart_weight', '0', 0),
(29083, 0, 'config', 'config_review_status', '0', 0),
(29082, 0, 'config', 'config_return_status_id', '2', 0),
(29081, 0, 'config', 'config_complete_status_id', '5', 0),
(29080, 0, 'config', 'config_order_status_id', '1', 0),
(29079, 0, 'config', 'config_stock_status_id', '7', 0),
(29078, 0, 'config', 'config_stock_checkout', '1', 0),
(29077, 0, 'config', 'config_stock_warning', '0', 0),
(29076, 0, 'config', 'config_stock_display', '0', 0),
(29075, 0, 'config', 'config_commission', '5', 0),
(29074, 0, 'config', 'config_affiliate_id', '0', 0),
(29073, 0, 'config', 'config_checkout_id', '0', 0),
(29072, 0, 'config', 'config_account_id', '0', 0),
(29071, 0, 'config', 'config_guest_checkout', '1', 0),
(29070, 0, 'config', 'config_customer_approval', '0', 0),
(29069, 0, 'config', 'config_customer_price', '0', 0),
(29068, 0, 'config', 'config_customer_group_id', '8', 0),
(29067, 0, 'config', 'config_order_edit', '100', 0),
(29066, 0, 'config', 'config_invoice_prefix', 'INV-2012-00', 0),
(29065, 0, 'config', 'config_tax_customer', 'shipping', 0),
(29064, 0, 'config', 'config_tax_default', 'shipping', 0),
(29063, 0, 'config', 'config_tax', '0', 0),
(29062, 0, 'config', 'config_admin_limit', '40', 0),
(29061, 0, 'config', 'config_catalog_limit', '40', 0),
(29060, 0, 'config', 'config_weight_class_id', '1', 0),
(29059, 0, 'config', 'config_length_class_id', '1', 0),
(29058, 0, 'config', 'config_currency_auto', '0', 0),
(29057, 0, 'config', 'config_currency', 'GRN', 0),
(29056, 0, 'config', 'config_admin_language', 'ua', 0),
(29055, 0, 'config', 'config_language', 'ua', 0),
(29054, 0, 'config', 'config_zone_id', '3493', 0),
(29053, 0, 'config', 'config_country_id', '220', 0),
(29052, 0, 'config', 'config_layout_id', '4', 0),
(29051, 0, 'config', 'config_template', 'default', 0),
(29050, 0, 'config', 'config_meta_description', 'anna-sharm.com', 0),
(29048, 0, 'config', 'config_fax', '', 0),
(29049, 0, 'config', 'config_title', 'anna-sharm.com', 0),
(29047, 0, 'config', 'config_telephone', '(097)555-33-11', 0),
(29046, 0, 'config', 'config_email', 'mira1969@meta.ua', 0),
(29045, 0, 'config', 'config_address', 'Львів\r\n79000\r\nУкраїна', 0),
(29044, 0, 'config', 'config_owner', 'anna-sharm.com', 0),
(29043, 0, 'config', 'config_name', '&quot;Анна Шарм&quot;. Всі права захищено', 0);

-- --------------------------------------------------------

--
-- Структура таблиці `stock_status`
--

CREATE TABLE IF NOT EXISTS `stock_status` (
  `stock_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`stock_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=9 ;

--
-- Дамп даних таблиці `stock_status`
--

INSERT INTO `stock_status` (`stock_status_id`, `language_id`, `name`) VALUES
(7, 2, 'На складі'),
(8, 2, 'Pre-Order'),
(5, 2, 'Out Of Stock'),
(6, 2, '2 - 3 Дні');

-- --------------------------------------------------------

--
-- Структура таблиці `store`
--

CREATE TABLE IF NOT EXISTS `store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_bin NOT NULL,
  `url` varchar(255) COLLATE utf8_bin NOT NULL,
  `ssl` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `tax_class`
--

CREATE TABLE IF NOT EXISTS `tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`tax_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=11 ;

--
-- Дамп даних таблиці `tax_class`
--

INSERT INTO `tax_class` (`tax_class_id`, `title`, `description`, `date_added`, `date_modified`) VALUES
(9, 'Taxable Goods', 'Taxed Stuff', '2009-01-06 23:21:53', '2011-09-23 14:07:50'),
(10, 'Downloadable Products', 'Downloadable', '2011-09-21 22:19:39', '2011-09-22 10:27:36');

-- --------------------------------------------------------

--
-- Структура таблиці `tax_rate`
--

CREATE TABLE IF NOT EXISTS `tax_rate` (
  `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) COLLATE utf8_bin NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) COLLATE utf8_bin NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`tax_rate_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=88 ;

--
-- Дамп даних таблиці `tax_rate`
--

INSERT INTO `tax_rate` (`tax_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`) VALUES
(86, 3, 'VAT (17.5%)', '17.5000', 'P', '2011-03-09 21:17:10', '2012-06-30 09:56:42'),
(87, 3, 'Eco Tax (-2.00)', '2.0000', 'F', '2011-09-21 21:49:23', '2012-06-30 09:56:35');

-- --------------------------------------------------------

--
-- Структура таблиці `tax_rate_to_customer_group`
--

CREATE TABLE IF NOT EXISTS `tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`tax_rate_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблиці `tax_rule`
--

CREATE TABLE IF NOT EXISTS `tax_rule` (
  `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) COLLATE utf8_bin NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`tax_rule_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=129 ;

--
-- Дамп даних таблиці `tax_rule`
--

INSERT INTO `tax_rule` (`tax_rule_id`, `tax_class_id`, `tax_rate_id`, `based`, `priority`) VALUES
(121, 10, 86, 'payment', 1),
(120, 10, 87, 'store', 0),
(128, 9, 86, 'shipping', 1),
(127, 9, 87, 'shipping', 2);

-- --------------------------------------------------------

--
-- Структура таблиці `url_alias`
--

CREATE TABLE IF NOT EXISTS `url_alias` (
  `url_alias_id` int(11) NOT NULL AUTO_INCREMENT,
  `query` varchar(255) COLLATE utf8_bin NOT NULL,
  `keyword` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`url_alias_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1285 ;

--
-- Дамп даних таблиці `url_alias`
--

INSERT INTO `url_alias` (`url_alias_id`, `query`, `keyword`) VALUES
(1263, 'information_id=44', 'partneru'),
(1112, 'news_id=1', 'Відкрився Леохостел'),
(1070, 'news_id=2', 'Відкрився_Леохостел1'),
(1104, 'news_id=3', 'Відкрився Леохостел1'),
(1284, 'information_id=41', 'kolekcii_sykon'),
(1269, 'information_id=43', 'nashi_klientu'),
(1108, 'news_id=5', 'Новий рік 2013 у ресторанах  &quot;Леотель&quot; та &quot;Наш Городок&quot;'),
(899, 'manufacturer_id=49', 'HPinc'),
(898, 'manufacturer_id=8', 'ARIEL'),
(1283, 'information_id=39', 'vechirni_sukni'),
(922, 'manufacturer_id=9', 'ACE'),
(1109, 'news_id=6', '&quot;Leohostel&quot; invites to Christmas market in 2013'),
(1107, 'news_id=7', 'Свято Шоколаду у Львові'),
(1173, 'information_id=42', 'info');

-- --------------------------------------------------------

--
-- Структура таблиці `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '',
  `password` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `firstname` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lastname` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `email` varchar(96) COLLATE utf8_bin NOT NULL DEFAULT '',
  `code` varchar(32) COLLATE utf8_bin NOT NULL,
  `ip` varchar(15) COLLATE utf8_bin NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Дамп даних таблиці `user`
--

INSERT INTO `user` (`user_id`, `user_group_id`, `username`, `password`, `firstname`, `lastname`, `email`, `code`, `ip`, `status`, `date_added`) VALUES
(1, 1, 'admin', '8af3d766e694eb4f2148b4b3d638d7bc', 'admin', 'admin', 'info@info.ua', '', '185.46.222.6', 1, '2012-06-29 17:52:55');

-- --------------------------------------------------------

--
-- Структура таблиці `user_group`
--

CREATE TABLE IF NOT EXISTS `user_group` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_bin NOT NULL,
  `permission` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`user_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=11 ;

--
-- Дамп даних таблиці `user_group`
--

INSERT INTO `user_group` (`user_group_id`, `name`, `permission`) VALUES
(1, 'Top Administrator', 'a:2:{s:6:"access";a:127:{i:0;s:17:"catalog/attribute";i:1;s:23:"catalog/attribute_group";i:2;s:16:"catalog/category";i:3;s:16:"catalog/download";i:4;s:19:"catalog/information";i:5;s:20:"catalog/manufacturer";i:6;s:14:"catalog/option";i:7;s:15:"catalog/product";i:8;s:14:"catalog/review";i:9;s:18:"common/filemanager";i:10;s:13:"design/banner";i:11;s:13:"design/layout";i:12;s:14:"extension/feed";i:13;s:16:"extension/module";i:14;s:17:"extension/payment";i:15;s:18:"extension/shipping";i:16;s:15:"extension/total";i:17;s:16:"feed/google_base";i:18;s:19:"feed/google_sitemap";i:19;s:20:"localisation/country";i:20;s:21:"localisation/currency";i:21;s:21:"localisation/geo_zone";i:22;s:21:"localisation/language";i:23;s:25:"localisation/length_class";i:24;s:25:"localisation/order_status";i:25;s:26:"localisation/return_action";i:26;s:26:"localisation/return_reason";i:27;s:26:"localisation/return_status";i:28;s:25:"localisation/stock_status";i:29;s:22:"localisation/tax_class";i:30;s:21:"localisation/tax_rate";i:31;s:25:"localisation/weight_class";i:32;s:17:"localisation/zone";i:33;s:14:"module/account";i:34;s:16:"module/affiliate";i:35;s:13:"module/banner";i:36;s:17:"module/bestseller";i:37;s:15:"module/carousel";i:38;s:15:"module/category";i:39;s:15:"module/featured";i:40;s:18:"module/google_talk";i:41;s:18:"module/information";i:42;s:13:"module/latest";i:43;s:16:"module/slideshow";i:44;s:14:"module/special";i:45;s:12:"module/store";i:46;s:14:"module/welcome";i:47;s:16:"payment/alertpay";i:48;s:24:"payment/authorizenet_aim";i:49;s:21:"payment/bank_transfer";i:50;s:14:"payment/cheque";i:51;s:11:"payment/cod";i:52;s:21:"payment/free_checkout";i:53;s:14:"payment/liqpay";i:54;s:20:"payment/moneybookers";i:55;s:14:"payment/nochex";i:56;s:15:"payment/paymate";i:57;s:16:"payment/paypoint";i:58;s:26:"payment/perpetual_payments";i:59;s:14:"payment/pp_pro";i:60;s:17:"payment/pp_pro_uk";i:61;s:19:"payment/pp_standard";i:62;s:15:"payment/sagepay";i:63;s:22:"payment/sagepay_direct";i:64;s:18:"payment/sagepay_us";i:65;s:19:"payment/twocheckout";i:66;s:28:"payment/web_payment_software";i:67;s:16:"payment/worldpay";i:68;s:27:"report/affiliate_commission";i:69;s:22:"report/customer_credit";i:70;s:21:"report/customer_order";i:71;s:22:"report/customer_reward";i:72;s:24:"report/product_purchased";i:73;s:21:"report/product_viewed";i:74;s:18:"report/sale_coupon";i:75;s:17:"report/sale_order";i:76;s:18:"report/sale_return";i:77;s:20:"report/sale_shipping";i:78;s:15:"report/sale_tax";i:79;s:14:"sale/affiliate";i:80;s:12:"sale/contact";i:81;s:11:"sale/coupon";i:82;s:13:"sale/customer";i:83;s:19:"sale/customer_group";i:84;s:10:"sale/order";i:85;s:11:"sale/return";i:86;s:12:"sale/voucher";i:87;s:18:"sale/voucher_theme";i:88;s:15:"setting/setting";i:89;s:13:"setting/store";i:90;s:17:"shipping/citylink";i:91;s:13:"shipping/flat";i:92;s:13:"shipping/free";i:93;s:13:"shipping/item";i:94;s:23:"shipping/parcelforce_48";i:95;s:15:"shipping/pickup";i:96;s:19:"shipping/royal_mail";i:97;s:12:"shipping/ups";i:98;s:13:"shipping/usps";i:99;s:15:"shipping/weight";i:100;s:11:"tool/backup";i:101;s:14:"tool/error_log";i:102;s:12:"total/coupon";i:103;s:12:"total/credit";i:104;s:14:"total/handling";i:105;s:19:"total/low_order_fee";i:106;s:12:"total/reward";i:107;s:14:"total/shipping";i:108;s:15:"total/sub_total";i:109;s:9:"total/tax";i:110;s:11:"total/total";i:111;s:13:"total/voucher";i:112;s:9:"user/user";i:113;s:20:"user/user_permission";i:114;s:15:"shipping/pickup";i:115;s:15:"shipping/pickup";i:116;s:13:"shipping/item";i:117;s:17:"module/bestseller";i:118;s:13:"module/latest";i:119;s:18:"module/information";i:120;s:14:"module/welcome";i:121;s:14:"module/special";i:122;s:12:"module/store";i:123;s:14:"module/account";i:124;s:11:"module/news";i:125;s:16:"module/slideshow";i:126;s:18:"module/mainpageseo";}s:6:"modify";a:127:{i:0;s:17:"catalog/attribute";i:1;s:23:"catalog/attribute_group";i:2;s:16:"catalog/category";i:3;s:16:"catalog/download";i:4;s:19:"catalog/information";i:5;s:20:"catalog/manufacturer";i:6;s:14:"catalog/option";i:7;s:15:"catalog/product";i:8;s:14:"catalog/review";i:9;s:18:"common/filemanager";i:10;s:13:"design/banner";i:11;s:13:"design/layout";i:12;s:14:"extension/feed";i:13;s:16:"extension/module";i:14;s:17:"extension/payment";i:15;s:18:"extension/shipping";i:16;s:15:"extension/total";i:17;s:16:"feed/google_base";i:18;s:19:"feed/google_sitemap";i:19;s:20:"localisation/country";i:20;s:21:"localisation/currency";i:21;s:21:"localisation/geo_zone";i:22;s:21:"localisation/language";i:23;s:25:"localisation/length_class";i:24;s:25:"localisation/order_status";i:25;s:26:"localisation/return_action";i:26;s:26:"localisation/return_reason";i:27;s:26:"localisation/return_status";i:28;s:25:"localisation/stock_status";i:29;s:22:"localisation/tax_class";i:30;s:21:"localisation/tax_rate";i:31;s:25:"localisation/weight_class";i:32;s:17:"localisation/zone";i:33;s:14:"module/account";i:34;s:16:"module/affiliate";i:35;s:13:"module/banner";i:36;s:17:"module/bestseller";i:37;s:15:"module/carousel";i:38;s:15:"module/category";i:39;s:15:"module/featured";i:40;s:18:"module/google_talk";i:41;s:18:"module/information";i:42;s:13:"module/latest";i:43;s:16:"module/slideshow";i:44;s:14:"module/special";i:45;s:12:"module/store";i:46;s:14:"module/welcome";i:47;s:16:"payment/alertpay";i:48;s:24:"payment/authorizenet_aim";i:49;s:21:"payment/bank_transfer";i:50;s:14:"payment/cheque";i:51;s:11:"payment/cod";i:52;s:21:"payment/free_checkout";i:53;s:14:"payment/liqpay";i:54;s:20:"payment/moneybookers";i:55;s:14:"payment/nochex";i:56;s:15:"payment/paymate";i:57;s:16:"payment/paypoint";i:58;s:26:"payment/perpetual_payments";i:59;s:14:"payment/pp_pro";i:60;s:17:"payment/pp_pro_uk";i:61;s:19:"payment/pp_standard";i:62;s:15:"payment/sagepay";i:63;s:22:"payment/sagepay_direct";i:64;s:18:"payment/sagepay_us";i:65;s:19:"payment/twocheckout";i:66;s:28:"payment/web_payment_software";i:67;s:16:"payment/worldpay";i:68;s:27:"report/affiliate_commission";i:69;s:22:"report/customer_credit";i:70;s:21:"report/customer_order";i:71;s:22:"report/customer_reward";i:72;s:24:"report/product_purchased";i:73;s:21:"report/product_viewed";i:74;s:18:"report/sale_coupon";i:75;s:17:"report/sale_order";i:76;s:18:"report/sale_return";i:77;s:20:"report/sale_shipping";i:78;s:15:"report/sale_tax";i:79;s:14:"sale/affiliate";i:80;s:12:"sale/contact";i:81;s:11:"sale/coupon";i:82;s:13:"sale/customer";i:83;s:19:"sale/customer_group";i:84;s:10:"sale/order";i:85;s:11:"sale/return";i:86;s:12:"sale/voucher";i:87;s:18:"sale/voucher_theme";i:88;s:15:"setting/setting";i:89;s:13:"setting/store";i:90;s:17:"shipping/citylink";i:91;s:13:"shipping/flat";i:92;s:13:"shipping/free";i:93;s:13:"shipping/item";i:94;s:23:"shipping/parcelforce_48";i:95;s:15:"shipping/pickup";i:96;s:19:"shipping/royal_mail";i:97;s:12:"shipping/ups";i:98;s:13:"shipping/usps";i:99;s:15:"shipping/weight";i:100;s:11:"tool/backup";i:101;s:14:"tool/error_log";i:102;s:12:"total/coupon";i:103;s:12:"total/credit";i:104;s:14:"total/handling";i:105;s:19:"total/low_order_fee";i:106;s:12:"total/reward";i:107;s:14:"total/shipping";i:108;s:15:"total/sub_total";i:109;s:9:"total/tax";i:110;s:11:"total/total";i:111;s:13:"total/voucher";i:112;s:9:"user/user";i:113;s:20:"user/user_permission";i:114;s:15:"shipping/pickup";i:115;s:15:"shipping/pickup";i:116;s:13:"shipping/item";i:117;s:17:"module/bestseller";i:118;s:13:"module/latest";i:119;s:18:"module/information";i:120;s:14:"module/welcome";i:121;s:14:"module/special";i:122;s:12:"module/store";i:123;s:14:"module/account";i:124;s:11:"module/news";i:125;s:16:"module/slideshow";i:126;s:18:"module/mainpageseo";}}'),
(10, 'Demonstration', '');

-- --------------------------------------------------------

--
-- Структура таблиці `voucher`
--

CREATE TABLE IF NOT EXISTS `voucher` (
  `voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) COLLATE utf8_bin NOT NULL,
  `from_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `from_email` varchar(96) COLLATE utf8_bin NOT NULL,
  `to_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `to_email` varchar(96) COLLATE utf8_bin NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text COLLATE utf8_bin NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `voucher_history`
--

CREATE TABLE IF NOT EXISTS `voucher_history` (
  `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `voucher_theme`
--

CREATE TABLE IF NOT EXISTS `voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`voucher_theme_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=9 ;

--
-- Дамп даних таблиці `voucher_theme`
--

INSERT INTO `voucher_theme` (`voucher_theme_id`, `image`) VALUES
(8, 'data/canon_eos_5d_2.jpg'),
(7, 'data/gift-voucher-birthday.jpg'),
(6, 'data/apple_logo.jpg');

-- --------------------------------------------------------

--
-- Структура таблиці `voucher_theme_description`
--

CREATE TABLE IF NOT EXISTS `voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`voucher_theme_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп даних таблиці `voucher_theme_description`
--

INSERT INTO `voucher_theme_description` (`voucher_theme_id`, `language_id`, `name`) VALUES
(6, 2, 'Christmas'),
(7, 2, 'Birthday'),
(8, 2, 'General');

-- --------------------------------------------------------

--
-- Структура таблиці `weight_class`
--

CREATE TABLE IF NOT EXISTS `weight_class` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  PRIMARY KEY (`weight_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=7 ;

--
-- Дамп даних таблиці `weight_class`
--

INSERT INTO `weight_class` (`weight_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '1000.00000000');

-- --------------------------------------------------------

--
-- Структура таблиці `weight_class_description`
--

CREATE TABLE IF NOT EXISTS `weight_class_description` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) COLLATE utf8_bin NOT NULL,
  `unit` varchar(4) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`weight_class_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=7 ;

--
-- Дамп даних таблиці `weight_class_description`
--

INSERT INTO `weight_class_description` (`weight_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 2, 'Кілограм', 'кг.'),
(2, 2, 'Грам', 'г.');

-- --------------------------------------------------------

--
-- Структура таблиці `zone`
--

CREATE TABLE IF NOT EXISTS `zone` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `code` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `name` varchar(128) COLLATE utf8_bin NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3968 ;

--
-- Дамп даних таблиці `zone`
--

INSERT INTO `zone` (`zone_id`, `country_id`, `code`, `name`, `status`) VALUES
(199, 14, 'BUR', 'Burgenland', 1),
(200, 14, 'KAR', 'Kärnten', 1),
(201, 14, 'NOS', 'Nieder&ouml;sterreich', 1),
(202, 14, 'OOS', 'Ober&ouml;sterreich', 1),
(203, 14, 'SAL', 'Salzburg', 1),
(204, 14, 'STE', 'Steiermark', 1),
(205, 14, 'TIR', 'Tirol', 1),
(206, 14, 'VOR', 'Vorarlberg', 1),
(207, 14, 'WIE', 'Wien', 1),
(230, 15, 'GOR', 'Goranboy', 1),
(231, 15, 'GOY', 'Goycay', 1),
(232, 15, 'HAC', 'Haciqabul', 1),
(233, 15, 'IMI', 'Imisli', 1),
(234, 15, 'ISM', 'Ismayilli', 1),
(235, 15, 'KAL', 'Kalbacar', 1),
(236, 15, 'KUR', 'Kurdamir', 1),
(237, 15, 'LA', 'Lankaran', 1),
(238, 15, 'LAC', 'Lacin', 1),
(239, 15, 'LAN', 'Lankaran', 1),
(240, 15, 'LER', 'Lerik', 1),
(321, 18, 'CHI', 'Chittagong', 1),
(322, 18, 'DHA', 'Dhaka', 1),
(323, 18, 'KHU', 'Khulna', 1),
(324, 18, 'RAJ', 'Rajshahi', 1),
(325, 18, 'SYL', 'Sylhet', 1),
(326, 19, 'CC', 'Christ Church', 1),
(327, 19, 'AND', 'Saint Andrew', 1),
(328, 19, 'GEO', 'Saint George', 1),
(329, 19, 'JAM', 'Saint James', 1),
(330, 19, 'JOH', 'Saint John', 1),
(331, 19, 'JOS', 'Saint Joseph', 1),
(332, 19, 'LUC', 'Saint Lucy', 1),
(333, 19, 'MIC', 'Saint Michael', 1),
(334, 19, 'PET', 'Saint Peter', 1),
(335, 19, 'PHI', 'Saint Philip', 1),
(336, 19, 'THO', 'Saint Thomas', 1),
(337, 20, 'BR', 'Brestskaya (Brest)', 1),
(338, 20, 'HO', 'Homyel''skaya (Homyel'')', 1),
(339, 20, 'HM', 'Horad Minsk', 1),
(340, 20, 'HR', 'Hrodzyenskaya (Hrodna)', 1),
(341, 20, 'MA', 'Mahilyowskaya (Mahilyow)', 1),
(342, 20, 'MI', 'Minskaya', 1),
(343, 20, 'VI', 'Vitsyebskaya (Vitsyebsk)', 1),
(344, 21, 'VAN', 'Antwerpen', 1),
(345, 21, 'WBR', 'Brabant Wallon', 1),
(346, 21, 'WHT', 'Hainaut', 1),
(347, 21, 'WLG', 'Liege', 1),
(348, 21, 'VLI', 'Limburg', 1),
(349, 21, 'WLX', 'Luxembourg', 1),
(350, 21, 'WNA', 'Namur', 1),
(351, 21, 'VOV', 'Oost-Vlaanderen', 1),
(352, 21, 'VBR', 'Vlaams Brabant', 1),
(353, 21, 'VWV', 'West-Vlaanderen', 1),
(354, 22, 'BZ', 'Belize', 1),
(355, 22, 'CY', 'Cayo', 1),
(356, 22, 'CR', 'Corozal', 1),
(357, 22, 'OW', 'Orange Walk', 1),
(358, 22, 'SC', 'Stann Creek', 1),
(359, 22, 'TO', 'Toledo', 1),
(360, 23, 'AL', 'Alibori', 1),
(361, 23, 'AK', 'Atakora', 1),
(362, 23, 'AQ', 'Atlantique', 1),
(363, 23, 'BO', 'Borgou', 1),
(364, 23, 'CO', 'Collines', 1),
(365, 23, 'DO', 'Donga', 1),
(366, 23, 'KO', 'Kouffo', 1),
(367, 23, 'LI', 'Littoral', 1),
(368, 23, 'MO', 'Mono', 1),
(369, 23, 'OU', 'Oueme', 1),
(370, 23, 'PL', 'Plateau', 1),
(371, 23, 'ZO', 'Zou', 1),
(372, 24, 'DS', 'Devonshire', 1),
(373, 24, 'HC', 'Hamilton City', 1),
(374, 24, 'HA', 'Hamilton', 1),
(375, 24, 'PG', 'Paget', 1),
(376, 24, 'PB', 'Pembroke', 1),
(377, 24, 'GC', 'Saint George City', 1),
(378, 24, 'SG', 'Saint George''s', 1),
(379, 24, 'SA', 'Sandys', 1),
(380, 24, 'SM', 'Smith''s', 1),
(381, 24, 'SH', 'Southampton', 1),
(382, 24, 'WA', 'Warwick', 1),
(383, 25, 'BUM', 'Bumthang', 1),
(384, 25, 'CHU', 'Chukha', 1),
(385, 25, 'DAG', 'Dagana', 1),
(386, 25, 'GAS', 'Gasa', 1),
(387, 25, 'HAA', 'Haa', 1),
(388, 25, 'LHU', 'Lhuntse', 1),
(389, 25, 'MON', 'Mongar', 1),
(390, 25, 'PAR', 'Paro', 1),
(391, 25, 'PEM', 'Pemagatshel', 1),
(392, 25, 'PUN', 'Punakha', 1),
(393, 25, 'SJO', 'Samdrup Jongkhar', 1),
(394, 25, 'SAT', 'Samtse', 1),
(395, 25, 'SAR', 'Sarpang', 1),
(396, 25, 'THI', 'Thimphu', 1),
(397, 25, 'TRG', 'Trashigang', 1),
(398, 25, 'TRY', 'Trashiyangste', 1),
(399, 25, 'TRO', 'Trongsa', 1),
(400, 25, 'TSI', 'Tsirang', 1),
(401, 25, 'WPH', 'Wangdue Phodrang', 1),
(402, 25, 'ZHE', 'Zhemgang', 1),
(403, 26, 'BEN', 'Beni', 1),
(404, 26, 'CHU', 'Chuquisaca', 1),
(405, 26, 'COC', 'Cochabamba', 1),
(406, 26, 'LPZ', 'La Paz', 1),
(407, 26, 'ORU', 'Oruro', 1),
(408, 26, 'PAN', 'Pando', 1),
(409, 26, 'POT', 'Potosi', 1),
(410, 26, 'SCZ', 'Santa Cruz', 1),
(411, 26, 'TAR', 'Tarija', 1),
(412, 27, 'BRO', 'Brcko district', 1),
(413, 27, 'FUS', 'Unsko-Sanski Kanton', 1),
(414, 27, 'FPO', 'Posavski Kanton', 1),
(415, 27, 'FTU', 'Tuzlanski Kanton', 1),
(416, 27, 'FZE', 'Zenicko-Dobojski Kanton', 1),
(417, 27, 'FBP', 'Bosanskopodrinjski Kanton', 1),
(418, 27, 'FSB', 'Srednjebosanski Kanton', 1),
(419, 27, 'FHN', 'Hercegovacko-neretvanski Kanton', 1),
(420, 27, 'FZH', 'Zapadnohercegovacka Zupanija', 1),
(421, 27, 'FSA', 'Kanton Sarajevo', 1),
(422, 27, 'FZA', 'Zapadnobosanska', 1),
(423, 27, 'SBL', 'Banja Luka', 1),
(424, 27, 'SDO', 'Doboj', 1),
(425, 27, 'SBI', 'Bijeljina', 1),
(426, 27, 'SVL', 'Vlasenica', 1),
(427, 27, 'SSR', 'Sarajevo-Romanija or Sokolac', 1),
(428, 27, 'SFO', 'Foca', 1),
(429, 27, 'STR', 'Trebinje', 1),
(430, 28, 'CE', 'Central', 1),
(431, 28, 'GH', 'Ghanzi', 1),
(432, 28, 'KD', 'Kgalagadi', 1),
(433, 28, 'KT', 'Kgatleng', 1),
(434, 28, 'KW', 'Kweneng', 1),
(435, 28, 'NG', 'Ngamiland', 1),
(436, 28, 'NE', 'North East', 1),
(437, 28, 'NW', 'North West', 1),
(438, 28, 'SE', 'South East', 1),
(439, 28, 'SO', 'Southern', 1),
(440, 30, 'AC', 'Acre', 1),
(441, 30, 'AL', 'Alagoas', 1),
(442, 30, 'AP', 'Amapa', 1),
(443, 30, 'AM', 'Amazonas', 1),
(444, 30, 'BA', 'Bahia', 1),
(445, 30, 'CE', 'Ceara', 1),
(446, 30, 'DF', 'Distrito Federal', 1),
(447, 30, 'ES', 'Espirito Santo', 1),
(448, 30, 'GO', 'Goias', 1),
(449, 30, 'MA', 'Maranhao', 1),
(450, 30, 'MT', 'Mato Grosso', 1),
(451, 30, 'MS', 'Mato Grosso do Sul', 1),
(452, 30, 'MG', 'Minas Gerais', 1),
(453, 30, 'PA', 'Para', 1),
(454, 30, 'PB', 'Paraiba', 1),
(455, 30, 'PR', 'Parana', 1),
(456, 30, 'PE', 'Pernambuco', 1),
(457, 30, 'PI', 'Piaui', 1),
(458, 30, 'RJ', 'Rio de Janeiro', 1),
(459, 30, 'RN', 'Rio Grande do Norte', 1),
(460, 30, 'RS', 'Rio Grande do Sul', 1),
(461, 30, 'RO', 'Rondonia', 1),
(462, 30, 'RR', 'Roraima', 1),
(463, 30, 'SC', 'Santa Catarina', 1),
(464, 30, 'SP', 'Sao Paulo', 1),
(465, 30, 'SE', 'Sergipe', 1),
(466, 30, 'TO', 'Tocantins', 1),
(467, 31, 'PB', 'Peros Banhos', 1),
(468, 31, 'SI', 'Salomon Islands', 1),
(469, 31, 'NI', 'Nelsons Island', 1),
(470, 31, 'TB', 'Three Brothers', 1),
(471, 31, 'EA', 'Eagle Islands', 1),
(472, 31, 'DI', 'Danger Island', 1),
(473, 31, 'EG', 'Egmont Islands', 1),
(474, 31, 'DG', 'Diego Garcia', 1),
(475, 32, 'BEL', 'Belait', 1),
(476, 32, 'BRM', 'Brunei and Muara', 1),
(477, 32, 'TEM', 'Temburong', 1),
(478, 32, 'TUT', 'Tutong', 1),
(479, 33, '', 'Blagoevgrad', 1),
(480, 33, '', 'Burgas', 1),
(481, 33, '', 'Dobrich', 1),
(482, 33, '', 'Gabrovo', 1),
(483, 33, '', 'Haskovo', 1),
(484, 33, '', 'Kardjali', 1),
(485, 33, '', 'Kyustendil', 1),
(486, 33, '', 'Lovech', 1),
(487, 33, '', 'Montana', 1),
(488, 33, '', 'Pazardjik', 1),
(489, 33, '', 'Pernik', 1),
(490, 33, '', 'Pleven', 1),
(491, 33, '', 'Plovdiv', 1),
(492, 33, '', 'Razgrad', 1),
(493, 33, '', 'Shumen', 1),
(494, 33, '', 'Silistra', 1),
(495, 33, '', 'Sliven', 1),
(496, 33, '', 'Smolyan', 1),
(497, 33, '', 'Sofia', 1),
(498, 33, '', 'Sofia - town', 1),
(499, 33, '', 'Stara Zagora', 1),
(500, 33, '', 'Targovishte', 1),
(501, 33, '', 'Varna', 1),
(502, 33, '', 'Veliko Tarnovo', 1),
(503, 33, '', 'Vidin', 1),
(504, 33, '', 'Vratza', 1),
(505, 33, '', 'Yambol', 1),
(506, 34, 'BAL', 'Bale', 1),
(507, 34, 'BAM', 'Bam', 1),
(508, 34, 'BAN', 'Banwa', 1),
(509, 34, 'BAZ', 'Bazega', 1),
(510, 34, 'BOR', 'Bougouriba', 1),
(511, 34, 'BLG', 'Boulgou', 1),
(512, 34, 'BOK', 'Boulkiemde', 1),
(513, 34, 'COM', 'Comoe', 1),
(514, 34, 'GAN', 'Ganzourgou', 1),
(515, 34, 'GNA', 'Gnagna', 1),
(516, 34, 'GOU', 'Gourma', 1),
(517, 34, 'HOU', 'Houet', 1),
(518, 34, 'IOA', 'Ioba', 1),
(519, 34, 'KAD', 'Kadiogo', 1),
(520, 34, 'KEN', 'Kenedougou', 1),
(521, 34, 'KOD', 'Komondjari', 1),
(522, 34, 'KOP', 'Kompienga', 1),
(523, 34, 'KOS', 'Kossi', 1),
(524, 34, 'KOL', 'Koulpelogo', 1),
(525, 34, 'KOT', 'Kouritenga', 1),
(526, 34, 'KOW', 'Kourweogo', 1),
(527, 34, 'LER', 'Leraba', 1),
(528, 34, 'LOR', 'Loroum', 1),
(529, 34, 'MOU', 'Mouhoun', 1),
(530, 34, 'NAH', 'Nahouri', 1),
(531, 34, 'NAM', 'Namentenga', 1),
(532, 34, 'NAY', 'Nayala', 1),
(533, 34, 'NOU', 'Noumbiel', 1),
(534, 34, 'OUB', 'Oubritenga', 1),
(535, 34, 'OUD', 'Oudalan', 1),
(536, 34, 'PAS', 'Passore', 1),
(537, 34, 'PON', 'Poni', 1),
(538, 34, 'SAG', 'Sanguie', 1),
(539, 34, 'SAM', 'Sanmatenga', 1),
(540, 34, 'SEN', 'Seno', 1),
(541, 34, 'SIS', 'Sissili', 1),
(542, 34, 'SOM', 'Soum', 1),
(543, 34, 'SOR', 'Sourou', 1),
(544, 34, 'TAP', 'Tapoa', 1),
(545, 34, 'TUY', 'Tuy', 1),
(546, 34, 'YAG', 'Yagha', 1),
(547, 34, 'YAT', 'Yatenga', 1),
(548, 34, 'ZIR', 'Ziro', 1),
(549, 34, 'ZOD', 'Zondoma', 1),
(550, 34, 'ZOW', 'Zoundweogo', 1),
(551, 35, 'BB', 'Bubanza', 1),
(552, 35, 'BJ', 'Bujumbura', 1),
(553, 35, 'BR', 'Bururi', 1),
(554, 35, 'CA', 'Cankuzo', 1),
(555, 35, 'CI', 'Cibitoke', 1),
(556, 35, 'GI', 'Gitega', 1),
(557, 35, 'KR', 'Karuzi', 1),
(558, 35, 'KY', 'Kayanza', 1),
(559, 35, 'KI', 'Kirundo', 1),
(560, 35, 'MA', 'Makamba', 1),
(561, 35, 'MU', 'Muramvya', 1),
(562, 35, 'MY', 'Muyinga', 1),
(563, 35, 'MW', 'Mwaro', 1),
(564, 35, 'NG', 'Ngozi', 1),
(565, 35, 'RT', 'Rutana', 1),
(566, 35, 'RY', 'Ruyigi', 1),
(567, 36, 'PP', 'Phnom Penh', 1),
(568, 36, 'PS', 'Preah Seihanu (Kompong Som or Sihanoukville)', 1),
(569, 36, 'PA', 'Pailin', 1),
(570, 36, 'KB', 'Keb', 1),
(571, 36, 'BM', 'Banteay Meanchey', 1),
(572, 36, 'BA', 'Battambang', 1),
(573, 36, 'KM', 'Kampong Cham', 1),
(574, 36, 'KN', 'Kampong Chhnang', 1),
(575, 36, 'KU', 'Kampong Speu', 1),
(576, 36, 'KO', 'Kampong Som', 1),
(577, 36, 'KT', 'Kampong Thom', 1),
(578, 36, 'KP', 'Kampot', 1),
(579, 36, 'KL', 'Kandal', 1),
(580, 36, 'KK', 'Kaoh Kong', 1),
(581, 36, 'KR', 'Kratie', 1),
(582, 36, 'MK', 'Mondul Kiri', 1),
(583, 36, 'OM', 'Oddar Meancheay', 1),
(584, 36, 'PU', 'Pursat', 1),
(585, 36, 'PR', 'Preah Vihear', 1),
(586, 36, 'PG', 'Prey Veng', 1),
(587, 36, 'RK', 'Ratanak Kiri', 1),
(588, 36, 'SI', 'Siemreap', 1),
(589, 36, 'ST', 'Stung Treng', 1),
(590, 36, 'SR', 'Svay Rieng', 1),
(591, 36, 'TK', 'Takeo', 1),
(592, 37, 'ADA', 'Adamawa (Adamaoua)', 1),
(593, 37, 'CEN', 'Centre', 1),
(594, 37, 'EST', 'East (Est)', 1),
(595, 37, 'EXN', 'Extreme North (Extreme-Nord)', 1),
(596, 37, 'LIT', 'Littoral', 1),
(597, 37, 'NOR', 'North (Nord)', 1),
(598, 37, 'NOT', 'Northwest (Nord-Ouest)', 1),
(599, 37, 'OUE', 'West (Ouest)', 1),
(600, 37, 'SUD', 'South (Sud)', 1),
(601, 37, 'SOU', 'Southwest (Sud-Ouest).', 1),
(602, 38, 'AB', 'Alberta', 1),
(603, 38, 'BC', 'British Columbia', 1),
(604, 38, 'MB', 'Manitoba', 1),
(605, 38, 'NB', 'New Brunswick', 1),
(606, 38, 'NL', 'Newfoundland and Labrador', 1),
(607, 38, 'NT', 'Northwest Territories', 1),
(608, 38, 'NS', 'Nova Scotia', 1),
(609, 38, 'NU', 'Nunavut', 1),
(610, 38, 'ON', 'Ontario', 1),
(611, 38, 'PE', 'Prince Edward Island', 1),
(612, 38, 'QC', 'Qu&eacute;bec', 1),
(613, 38, 'SK', 'Saskatchewan', 1),
(614, 38, 'YT', 'Yukon Territory', 1),
(615, 39, 'BV', 'Boa Vista', 1),
(616, 39, 'BR', 'Brava', 1),
(617, 39, 'CS', 'Calheta de Sao Miguel', 1),
(618, 39, 'MA', 'Maio', 1),
(619, 39, 'MO', 'Mosteiros', 1),
(620, 39, 'PA', 'Paul', 1),
(621, 39, 'PN', 'Porto Novo', 1),
(622, 39, 'PR', 'Praia', 1),
(623, 39, 'RG', 'Ribeira Grande', 1),
(624, 39, 'SL', 'Sal', 1),
(625, 39, 'CA', 'Santa Catarina', 1),
(626, 39, 'CR', 'Santa Cruz', 1),
(627, 39, 'SD', 'Sao Domingos', 1),
(628, 39, 'SF', 'Sao Filipe', 1),
(629, 39, 'SN', 'Sao Nicolau', 1),
(630, 39, 'SV', 'Sao Vicente', 1),
(631, 39, 'TA', 'Tarrafal', 1),
(632, 40, 'CR', 'Creek', 1),
(633, 40, 'EA', 'Eastern', 1),
(634, 40, 'ML', 'Midland', 1),
(635, 40, 'ST', 'South Town', 1),
(636, 40, 'SP', 'Spot Bay', 1),
(637, 40, 'SK', 'Stake Bay', 1),
(638, 40, 'WD', 'West End', 1),
(639, 40, 'WN', 'Western', 1),
(640, 41, 'BBA', 'Bamingui-Bangoran', 1),
(641, 41, 'BKO', 'Basse-Kotto', 1),
(642, 41, 'HKO', 'Haute-Kotto', 1),
(643, 41, 'HMB', 'Haut-Mbomou', 1),
(644, 41, 'KEM', 'Kemo', 1),
(645, 41, 'LOB', 'Lobaye', 1),
(646, 41, 'MKD', 'Mambere-KadeÔ', 1),
(647, 41, 'MBO', 'Mbomou', 1),
(648, 41, 'NMM', 'Nana-Mambere', 1),
(649, 41, 'OMP', 'Ombella-M''Poko', 1),
(650, 41, 'OUK', 'Ouaka', 1),
(651, 41, 'OUH', 'Ouham', 1),
(652, 41, 'OPE', 'Ouham-Pende', 1),
(653, 41, 'VAK', 'Vakaga', 1),
(654, 41, 'NGR', 'Nana-Grebizi', 1),
(655, 41, 'SMB', 'Sangha-Mbaere', 1),
(656, 41, 'BAN', 'Bangui', 1),
(657, 42, 'BA', 'Batha', 1),
(658, 42, 'BI', 'Biltine', 1),
(659, 42, 'BE', 'Borkou-Ennedi-Tibesti', 1),
(660, 42, 'CB', 'Chari-Baguirmi', 1),
(661, 42, 'GU', 'Guera', 1),
(662, 42, 'KA', 'Kanem', 1),
(663, 42, 'LA', 'Lac', 1),
(664, 42, 'LC', 'Logone Occidental', 1),
(665, 42, 'LR', 'Logone Oriental', 1),
(666, 42, 'MK', 'Mayo-Kebbi', 1),
(667, 42, 'MC', 'Moyen-Chari', 1),
(668, 42, 'OU', 'Ouaddai', 1),
(669, 42, 'SA', 'Salamat', 1),
(670, 42, 'TA', 'Tandjile', 1),
(671, 43, 'AI', 'Aisen del General Carlos Ibanez', 1),
(672, 43, 'AN', 'Antofagasta', 1),
(673, 43, 'AR', 'Araucania', 1),
(674, 43, 'AT', 'Atacama', 1),
(675, 43, 'BI', 'Bio-Bio', 1),
(676, 43, 'CO', 'Coquimbo', 1),
(677, 43, 'LI', 'Libertador General Bernardo O''Hi', 1),
(678, 43, 'LL', 'Los Lagos', 1),
(679, 43, 'MA', 'Magallanes y de la Antartica Chi', 1),
(680, 43, 'ML', 'Maule', 1),
(681, 43, 'RM', 'Region Metropolitana', 1),
(682, 43, 'TA', 'Tarapaca', 1),
(683, 43, 'VS', 'Valparaiso', 1),
(684, 44, 'AN', 'Anhui', 1),
(685, 44, 'BE', 'Beijing', 1),
(686, 44, 'CH', 'Chongqing', 1),
(687, 44, 'FU', 'Fujian', 1),
(688, 44, 'GA', 'Gansu', 1),
(689, 44, 'GU', 'Guangdong', 1),
(690, 44, 'GX', 'Guangxi', 1),
(691, 44, 'GZ', 'Guizhou', 1),
(692, 44, 'HA', 'Hainan', 1),
(693, 44, 'HB', 'Hebei', 1),
(694, 44, 'HL', 'Heilongjiang', 1),
(695, 44, 'HE', 'Henan', 1),
(696, 44, 'HK', 'Hong Kong', 1),
(697, 44, 'HU', 'Hubei', 1),
(698, 44, 'HN', 'Hunan', 1),
(699, 44, 'IM', 'Inner Mongolia', 1),
(700, 44, 'JI', 'Jiangsu', 1),
(701, 44, 'JX', 'Jiangxi', 1),
(702, 44, 'JL', 'Jilin', 1),
(703, 44, 'LI', 'Liaoning', 1),
(704, 44, 'MA', 'Macau', 1),
(705, 44, 'NI', 'Ningxia', 1),
(706, 44, 'SH', 'Shaanxi', 1),
(707, 44, 'SA', 'Shandong', 1),
(708, 44, 'SG', 'Shanghai', 1),
(709, 44, 'SX', 'Shanxi', 1),
(710, 44, 'SI', 'Sichuan', 1),
(711, 44, 'TI', 'Tianjin', 1),
(712, 44, 'XI', 'Xinjiang', 1),
(713, 44, 'YU', 'Yunnan', 1),
(714, 44, 'ZH', 'Zhejiang', 1),
(715, 46, 'D', 'Direction Island', 1),
(716, 46, 'H', 'Home Island', 1),
(717, 46, 'O', 'Horsburgh Island', 1),
(718, 46, 'S', 'South Island', 1),
(719, 46, 'W', 'West Island', 1),
(720, 47, 'AMZ', 'Amazonas', 1),
(721, 47, 'ANT', 'Antioquia', 1),
(722, 47, 'ARA', 'Arauca', 1),
(723, 47, 'ATL', 'Atlantico', 1),
(724, 47, 'BDC', 'Bogota D.C.', 1),
(725, 47, 'BOL', 'Bolivar', 1),
(726, 47, 'BOY', 'Boyaca', 1),
(727, 47, 'CAL', 'Caldas', 1),
(728, 47, 'CAQ', 'Caqueta', 1),
(729, 47, 'CAS', 'Casanare', 1),
(730, 47, 'CAU', 'Cauca', 1),
(731, 47, 'CES', 'Cesar', 1),
(732, 47, 'CHO', 'Choco', 1),
(733, 47, 'COR', 'Cordoba', 1),
(734, 47, 'CAM', 'Cundinamarca', 1),
(735, 47, 'GNA', 'Guainia', 1),
(736, 47, 'GJR', 'Guajira', 1),
(737, 47, 'GVR', 'Guaviare', 1),
(738, 47, 'HUI', 'Huila', 1),
(739, 47, 'MAG', 'Magdalena', 1),
(740, 47, 'MET', 'Meta', 1),
(741, 47, 'NAR', 'Narino', 1),
(742, 47, 'NDS', 'Norte de Santander', 1),
(743, 47, 'PUT', 'Putumayo', 1),
(744, 47, 'QUI', 'Quindio', 1),
(745, 47, 'RIS', 'Risaralda', 1),
(746, 47, 'SAP', 'San Andres y Providencia', 1),
(747, 47, 'SAN', 'Santander', 1),
(748, 47, 'SUC', 'Sucre', 1),
(749, 47, 'TOL', 'Tolima', 1),
(750, 47, 'VDC', 'Valle del Cauca', 1),
(751, 47, 'VAU', 'Vaupes', 1),
(752, 47, 'VIC', 'Vichada', 1),
(753, 48, 'G', 'Grande Comore', 1),
(754, 48, 'A', 'Anjouan', 1),
(755, 48, 'M', 'Moheli', 1),
(756, 49, 'BO', 'Bouenza', 1),
(757, 49, 'BR', 'Brazzaville', 1),
(758, 49, 'CU', 'Cuvette', 1),
(759, 49, 'CO', 'Cuvette-Ouest', 1),
(760, 49, 'KO', 'Kouilou', 1),
(761, 49, 'LE', 'Lekoumou', 1),
(762, 49, 'LI', 'Likouala', 1),
(763, 49, 'NI', 'Niari', 1),
(764, 49, 'PL', 'Plateaux', 1),
(765, 49, 'PO', 'Pool', 1),
(766, 49, 'SA', 'Sangha', 1),
(767, 50, 'PU', 'Pukapuka', 1),
(768, 50, 'RK', 'Rakahanga', 1),
(769, 50, 'MK', 'Manihiki', 1),
(770, 50, 'PE', 'Penrhyn', 1),
(771, 50, 'NI', 'Nassau Island', 1),
(772, 50, 'SU', 'Surwarrow', 1),
(773, 50, 'PA', 'Palmerston', 1),
(774, 50, 'AI', 'Aitutaki', 1),
(775, 50, 'MA', 'Manuae', 1),
(776, 50, 'TA', 'Takutea', 1),
(777, 50, 'MT', 'Mitiaro', 1),
(778, 50, 'AT', 'Atiu', 1),
(779, 50, 'MU', 'Mauke', 1),
(780, 50, 'RR', 'Rarotonga', 1),
(781, 50, 'MG', 'Mangaia', 1),
(782, 51, 'AL', 'Alajuela', 1),
(783, 51, 'CA', 'Cartago', 1),
(784, 51, 'GU', 'Guanacaste', 1),
(785, 51, 'HE', 'Heredia', 1),
(786, 51, 'LI', 'Limon', 1),
(787, 51, 'PU', 'Puntarenas', 1),
(788, 51, 'SJ', 'San Jose', 1),
(789, 52, 'ABE', 'Abengourou', 1),
(790, 52, 'ABI', 'Abidjan', 1),
(791, 52, 'ABO', 'Aboisso', 1),
(792, 52, 'ADI', 'Adiake', 1),
(793, 52, 'ADZ', 'Adzope', 1),
(794, 52, 'AGB', 'Agboville', 1),
(795, 52, 'AGN', 'Agnibilekrou', 1),
(796, 52, 'ALE', 'Alepe', 1),
(797, 52, 'BOC', 'Bocanda', 1),
(798, 52, 'BAN', 'Bangolo', 1),
(799, 52, 'BEO', 'Beoumi', 1),
(800, 52, 'BIA', 'Biankouma', 1),
(801, 52, 'BDK', 'Bondoukou', 1),
(802, 52, 'BGN', 'Bongouanou', 1),
(803, 52, 'BFL', 'Bouafle', 1),
(804, 52, 'BKE', 'Bouake', 1),
(805, 52, 'BNA', 'Bouna', 1),
(806, 52, 'BDL', 'Boundiali', 1),
(807, 52, 'DKL', 'Dabakala', 1),
(808, 52, 'DBU', 'Dabou', 1),
(809, 52, 'DAL', 'Daloa', 1),
(810, 52, 'DAN', 'Danane', 1),
(811, 52, 'DAO', 'Daoukro', 1),
(812, 52, 'DIM', 'Dimbokro', 1),
(813, 52, 'DIV', 'Divo', 1),
(814, 52, 'DUE', 'Duekoue', 1),
(815, 52, 'FER', 'Ferkessedougou', 1),
(816, 52, 'GAG', 'Gagnoa', 1),
(817, 52, 'GBA', 'Grand-Bassam', 1),
(818, 52, 'GLA', 'Grand-Lahou', 1),
(819, 52, 'GUI', 'Guiglo', 1),
(820, 52, 'ISS', 'Issia', 1),
(821, 52, 'JAC', 'Jacqueville', 1),
(822, 52, 'KAT', 'Katiola', 1),
(823, 52, 'KOR', 'Korhogo', 1),
(824, 52, 'LAK', 'Lakota', 1),
(825, 52, 'MAN', 'Man', 1),
(826, 52, 'MKN', 'Mankono', 1),
(827, 52, 'MBA', 'Mbahiakro', 1),
(828, 52, 'ODI', 'Odienne', 1),
(829, 52, 'OUM', 'Oume', 1),
(830, 52, 'SAK', 'Sakassou', 1),
(831, 52, 'SPE', 'San-Pedro', 1),
(832, 52, 'SAS', 'Sassandra', 1),
(833, 52, 'SEG', 'Seguela', 1),
(834, 52, 'SIN', 'Sinfra', 1),
(835, 52, 'SOU', 'Soubre', 1),
(836, 52, 'TAB', 'Tabou', 1),
(837, 52, 'TAN', 'Tanda', 1),
(838, 52, 'TIE', 'Tiebissou', 1),
(839, 52, 'TIN', 'Tingrela', 1),
(840, 52, 'TIA', 'Tiassale', 1),
(841, 52, 'TBA', 'Touba', 1),
(842, 52, 'TLP', 'Toulepleu', 1),
(843, 52, 'TMD', 'Toumodi', 1),
(844, 52, 'VAV', 'Vavoua', 1),
(845, 52, 'YAM', 'Yamoussoukro', 1),
(846, 52, 'ZUE', 'Zuenoula', 1),
(847, 53, 'BB', 'Bjelovar-Bilogora', 1),
(848, 53, 'CZ', 'City of Zagreb', 1),
(849, 53, 'DN', 'Dubrovnik-Neretva', 1),
(850, 53, 'IS', 'Istra', 1),
(851, 53, 'KA', 'Karlovac', 1),
(852, 53, 'KK', 'Koprivnica-Krizevci', 1),
(853, 53, 'KZ', 'Krapina-Zagorje', 1),
(854, 53, 'LS', 'Lika-Senj', 1),
(855, 53, 'ME', 'Medimurje', 1),
(856, 53, 'OB', 'Osijek-Baranja', 1),
(857, 53, 'PS', 'Pozega-Slavonia', 1),
(858, 53, 'PG', 'Primorje-Gorski Kotar', 1),
(859, 53, 'SI', 'Sibenik', 1),
(860, 53, 'SM', 'Sisak-Moslavina', 1),
(861, 53, 'SB', 'Slavonski Brod-Posavina', 1),
(862, 53, 'SD', 'Split-Dalmatia', 1),
(863, 53, 'VA', 'Varazdin', 1),
(864, 53, 'VP', 'Virovitica-Podravina', 1),
(865, 53, 'VS', 'Vukovar-Srijem', 1),
(866, 53, 'ZK', 'Zadar-Knin', 1),
(867, 53, 'ZA', 'Zagreb', 1),
(868, 54, 'CA', 'Camaguey', 1),
(869, 54, 'CD', 'Ciego de Avila', 1),
(870, 54, 'CI', 'Cienfuegos', 1),
(871, 54, 'CH', 'Ciudad de La Habana', 1),
(872, 54, 'GR', 'Granma', 1),
(873, 54, 'GU', 'Guantanamo', 1),
(874, 54, 'HO', 'Holguin', 1),
(875, 54, 'IJ', 'Isla de la Juventud', 1),
(876, 54, 'LH', 'La Habana', 1),
(877, 54, 'LT', 'Las Tunas', 1),
(878, 54, 'MA', 'Matanzas', 1),
(879, 54, 'PR', 'Pinar del Rio', 1),
(880, 54, 'SS', 'Sancti Spiritus', 1),
(881, 54, 'SC', 'Santiago de Cuba', 1),
(882, 54, 'VC', 'Villa Clara', 1),
(883, 55, 'F', 'Famagusta', 1),
(884, 55, 'K', 'Kyrenia', 1),
(885, 55, 'A', 'Larnaca', 1),
(886, 55, 'I', 'Limassol', 1),
(887, 55, 'N', 'Nicosia', 1),
(888, 55, 'P', 'Paphos', 1),
(889, 56, 'U', 'Ústecký', 1),
(890, 56, 'C', 'Jihočeský', 1),
(891, 56, 'B', 'Jihomoravský', 1),
(892, 56, 'K', 'Karlovarský', 1),
(893, 56, 'H', 'Královehradecký', 1),
(894, 56, 'L', 'Liberecký', 1),
(895, 56, 'T', 'Moravskoslezský', 1),
(896, 56, 'M', 'Olomoucký', 1),
(897, 56, 'E', 'Pardubický', 1),
(898, 56, 'P', 'Plzeňský', 1),
(899, 56, 'A', 'Praha', 1),
(900, 56, 'S', 'Středočeský', 1),
(901, 56, 'J', 'Vysočina', 1),
(902, 56, 'Z', 'Zlínský', 1),
(903, 57, 'AR', 'Arhus', 1),
(904, 57, 'BH', 'Bornholm', 1),
(905, 57, 'CO', 'Copenhagen', 1),
(906, 57, 'FO', 'Faroe Islands', 1),
(907, 57, 'FR', 'Frederiksborg', 1),
(908, 57, 'FY', 'Fyn', 1),
(909, 57, 'KO', 'Kobenhavn', 1),
(910, 57, 'NO', 'Nordjylland', 1),
(911, 57, 'RI', 'Ribe', 1),
(912, 57, 'RK', 'Ringkobing', 1),
(913, 57, 'RO', 'Roskilde', 1),
(914, 57, 'SO', 'Sonderjylland', 1),
(915, 57, 'ST', 'Storstrom', 1),
(916, 57, 'VK', 'Vejle', 1),
(917, 57, 'VJ', 'Vestj&aelig;lland', 1),
(918, 57, 'VB', 'Viborg', 1),
(919, 58, 'S', '''Ali Sabih', 1),
(920, 58, 'K', 'Dikhil', 1),
(921, 58, 'J', 'Djibouti', 1),
(922, 58, 'O', 'Obock', 1),
(923, 58, 'T', 'Tadjoura', 1),
(924, 59, 'AND', 'Saint Andrew Parish', 1),
(925, 59, 'DAV', 'Saint David Parish', 1),
(926, 59, 'GEO', 'Saint George Parish', 1),
(927, 59, 'JOH', 'Saint John Parish', 1),
(928, 59, 'JOS', 'Saint Joseph Parish', 1),
(929, 59, 'LUK', 'Saint Luke Parish', 1),
(930, 59, 'MAR', 'Saint Mark Parish', 1),
(931, 59, 'PAT', 'Saint Patrick Parish', 1),
(932, 59, 'PAU', 'Saint Paul Parish', 1),
(933, 59, 'PET', 'Saint Peter Parish', 1),
(934, 60, 'DN', 'Distrito Nacional', 1),
(935, 60, 'AZ', 'Azua', 1),
(936, 60, 'BC', 'Baoruco', 1),
(937, 60, 'BH', 'Barahona', 1),
(938, 60, 'DJ', 'Dajabon', 1),
(939, 60, 'DU', 'Duarte', 1),
(940, 60, 'EL', 'Elias Pina', 1),
(941, 60, 'SY', 'El Seybo', 1),
(942, 60, 'ET', 'Espaillat', 1),
(943, 60, 'HM', 'Hato Mayor', 1),
(944, 60, 'IN', 'Independencia', 1),
(945, 60, 'AL', 'La Altagracia', 1),
(946, 60, 'RO', 'La Romana', 1),
(947, 60, 'VE', 'La Vega', 1),
(948, 60, 'MT', 'Maria Trinidad Sanchez', 1),
(949, 60, 'MN', 'Monsenor Nouel', 1),
(950, 60, 'MC', 'Monte Cristi', 1),
(951, 60, 'MP', 'Monte Plata', 1),
(952, 60, 'PD', 'Pedernales', 1),
(953, 60, 'PR', 'Peravia (Bani)', 1),
(954, 60, 'PP', 'Puerto Plata', 1),
(955, 60, 'SL', 'Salcedo', 1),
(956, 60, 'SM', 'Samana', 1),
(957, 60, 'SH', 'Sanchez Ramirez', 1),
(958, 60, 'SC', 'San Cristobal', 1),
(959, 60, 'JO', 'San Jose de Ocoa', 1),
(960, 60, 'SJ', 'San Juan', 1),
(961, 60, 'PM', 'San Pedro de Macoris', 1),
(962, 60, 'SA', 'Santiago', 1),
(963, 60, 'ST', 'Santiago Rodriguez', 1),
(964, 60, 'SD', 'Santo Domingo', 1),
(965, 60, 'VA', 'Valverde', 1),
(966, 61, 'AL', 'Aileu', 1),
(967, 61, 'AN', 'Ainaro', 1),
(968, 61, 'BA', 'Baucau', 1),
(969, 61, 'BO', 'Bobonaro', 1),
(970, 61, 'CO', 'Cova Lima', 1),
(971, 61, 'DI', 'Dili', 1),
(972, 61, 'ER', 'Ermera', 1),
(973, 61, 'LA', 'Lautem', 1),
(974, 61, 'LI', 'Liquica', 1),
(975, 61, 'MT', 'Manatuto', 1),
(976, 61, 'MF', 'Manufahi', 1),
(977, 61, 'OE', 'Oecussi', 1),
(978, 61, 'VI', 'Viqueque', 1),
(979, 62, 'AZU', 'Azuay', 1),
(980, 62, 'BOL', 'Bolivar', 1),
(981, 62, 'CAN', 'Ca&ntilde;ar', 1),
(982, 62, 'CAR', 'Carchi', 1),
(983, 62, 'CHI', 'Chimborazo', 1),
(984, 62, 'COT', 'Cotopaxi', 1),
(985, 62, 'EOR', 'El Oro', 1),
(986, 62, 'ESM', 'Esmeraldas', 1),
(987, 62, 'GPS', 'Gal&aacute;pagos', 1),
(988, 62, 'GUA', 'Guayas', 1),
(989, 62, 'IMB', 'Imbabura', 1),
(990, 62, 'LOJ', 'Loja', 1),
(991, 62, 'LRO', 'Los Rios', 1),
(992, 62, 'MAN', 'Manab&iacute;', 1),
(993, 62, 'MSA', 'Morona Santiago', 1),
(994, 62, 'NAP', 'Napo', 1),
(995, 62, 'ORE', 'Orellana', 1),
(996, 62, 'PAS', 'Pastaza', 1),
(997, 62, 'PIC', 'Pichincha', 1),
(998, 62, 'SUC', 'Sucumb&iacute;os', 1),
(999, 62, 'TUN', 'Tungurahua', 1),
(1000, 62, 'ZCH', 'Zamora Chinchipe', 1),
(1001, 63, 'DHY', 'Ad Daqahliyah', 1),
(1002, 63, 'BAM', 'Al Bahr al Ahmar', 1),
(1003, 63, 'BHY', 'Al Buhayrah', 1),
(1004, 63, 'FYM', 'Al Fayyum', 1),
(1005, 63, 'GBY', 'Al Gharbiyah', 1),
(1006, 63, 'IDR', 'Al Iskandariyah', 1),
(1007, 63, 'IML', 'Al Isma''iliyah', 1),
(1008, 63, 'JZH', 'Al Jizah', 1),
(1009, 63, 'MFY', 'Al Minufiyah', 1),
(1010, 63, 'MNY', 'Al Minya', 1),
(1011, 63, 'QHR', 'Al Qahirah', 1),
(1012, 63, 'QLY', 'Al Qalyubiyah', 1),
(1013, 63, 'WJD', 'Al Wadi al Jadid', 1),
(1014, 63, 'SHQ', 'Ash Sharqiyah', 1),
(1015, 63, 'SWY', 'As Suways', 1),
(1016, 63, 'ASW', 'Aswan', 1),
(1017, 63, 'ASY', 'Asyut', 1),
(1018, 63, 'BSW', 'Bani Suwayf', 1),
(1019, 63, 'BSD', 'Bur Sa''id', 1),
(1020, 63, 'DMY', 'Dumyat', 1),
(1021, 63, 'JNS', 'Janub Sina''', 1),
(1022, 63, 'KSH', 'Kafr ash Shaykh', 1),
(1023, 63, 'MAT', 'Matruh', 1),
(1024, 63, 'QIN', 'Qina', 1),
(1025, 63, 'SHS', 'Shamal Sina''', 1),
(1026, 63, 'SUH', 'Suhaj', 1),
(1027, 64, 'AH', 'Ahuachapan', 1),
(1028, 64, 'CA', 'Cabanas', 1),
(1029, 64, 'CH', 'Chalatenango', 1),
(1030, 64, 'CU', 'Cuscatlan', 1),
(1031, 64, 'LB', 'La Libertad', 1),
(1032, 64, 'PZ', 'La Paz', 1),
(1033, 64, 'UN', 'La Union', 1),
(1034, 64, 'MO', 'Morazan', 1),
(1035, 64, 'SM', 'San Miguel', 1),
(1036, 64, 'SS', 'San Salvador', 1),
(1037, 64, 'SV', 'San Vicente', 1),
(1038, 64, 'SA', 'Santa Ana', 1),
(1039, 64, 'SO', 'Sonsonate', 1),
(1040, 64, 'US', 'Usulutan', 1),
(1041, 65, 'AN', 'Provincia Annobon', 1),
(1042, 65, 'BN', 'Provincia Bioko Norte', 1),
(1043, 65, 'BS', 'Provincia Bioko Sur', 1),
(1044, 65, 'CS', 'Provincia Centro Sur', 1),
(1045, 65, 'KN', 'Provincia Kie-Ntem', 1),
(1046, 65, 'LI', 'Provincia Litoral', 1),
(1047, 65, 'WN', 'Provincia Wele-Nzas', 1),
(1048, 66, 'MA', 'Central (Maekel)', 1),
(1049, 66, 'KE', 'Anseba (Keren)', 1),
(1050, 66, 'DK', 'Southern Red Sea (Debub-Keih-Bahri)', 1),
(1051, 66, 'SK', 'Northern Red Sea (Semien-Keih-Bahri)', 1),
(1052, 66, 'DE', 'Southern (Debub)', 1),
(1053, 66, 'BR', 'Gash-Barka (Barentu)', 1),
(1054, 67, 'HA', 'Harjumaa (Tallinn)', 1),
(1055, 67, 'HI', 'Hiiumaa (Kardla)', 1),
(1056, 67, 'IV', 'Ida-Virumaa (Johvi)', 1),
(1057, 67, 'JA', 'Jarvamaa (Paide)', 1),
(1058, 67, 'JO', 'Jogevamaa (Jogeva)', 1),
(1059, 67, 'LV', 'Laane-Virumaa (Rakvere)', 1),
(1060, 67, 'LA', 'Laanemaa (Haapsalu)', 1),
(1061, 67, 'PA', 'Parnumaa (Parnu)', 1),
(1062, 67, 'PO', 'Polvamaa (Polva)', 1),
(1063, 67, 'RA', 'Raplamaa (Rapla)', 1),
(1064, 67, 'SA', 'Saaremaa (Kuessaare)', 1),
(1065, 67, 'TA', 'Tartumaa (Tartu)', 1),
(1066, 67, 'VA', 'Valgamaa (Valga)', 1),
(1067, 67, 'VI', 'Viljandimaa (Viljandi)', 1),
(1068, 67, 'VO', 'Vorumaa (Voru)', 1),
(1069, 68, 'AF', 'Afar', 1),
(1070, 68, 'AH', 'Amhara', 1),
(1071, 68, 'BG', 'Benishangul-Gumaz', 1),
(1072, 68, 'GB', 'Gambela', 1),
(1073, 68, 'HR', 'Hariai', 1),
(1074, 68, 'OR', 'Oromia', 1),
(1075, 68, 'SM', 'Somali', 1),
(1076, 68, 'SN', 'Southern Nations - Nationalities and Peoples Region', 1),
(1077, 68, 'TG', 'Tigray', 1),
(1078, 68, 'AA', 'Addis Ababa', 1),
(1079, 68, 'DD', 'Dire Dawa', 1),
(1080, 71, 'C', 'Central Division', 1),
(1081, 71, 'N', 'Northern Division', 1),
(1082, 71, 'E', 'Eastern Division', 1),
(1083, 71, 'W', 'Western Division', 1),
(1084, 71, 'R', 'Rotuma', 1),
(1085, 72, 'AL', 'Ahvenanmaan Laani', 1),
(1086, 72, 'ES', 'Etela-Suomen Laani', 1),
(1087, 72, 'IS', 'Ita-Suomen Laani', 1),
(1088, 72, 'LS', 'Lansi-Suomen Laani', 1),
(1089, 72, 'LA', 'Lapin Lanani', 1),
(1090, 72, 'OU', 'Oulun Laani', 1),
(1091, 73, 'AL', 'Alsace', 1),
(1092, 73, 'AQ', 'Aquitaine', 1),
(1093, 73, 'AU', 'Auvergne', 1),
(1094, 73, 'BR', 'Brittany', 1),
(1095, 73, 'BU', 'Burgundy', 1),
(1096, 73, 'CE', 'Center Loire Valley', 1),
(1097, 73, 'CH', 'Champagne', 1),
(1098, 73, 'CO', 'Corse', 1),
(1099, 73, 'FR', 'France Comte', 1),
(1100, 73, 'LA', 'Languedoc Roussillon', 1),
(1101, 73, 'LI', 'Limousin', 1),
(1102, 73, 'LO', 'Lorraine', 1),
(1103, 73, 'MI', 'Midi Pyrenees', 1),
(1104, 73, 'NO', 'Nord Pas de Calais', 1),
(1105, 73, 'NR', 'Normandy', 1),
(1106, 73, 'PA', 'Paris / Ill de France', 1),
(1107, 73, 'PI', 'Picardie', 1),
(1108, 73, 'PO', 'Poitou Charente', 1),
(1109, 73, 'PR', 'Provence', 1),
(1110, 73, 'RH', 'Rhone Alps', 1),
(1111, 73, 'RI', 'Riviera', 1),
(1112, 73, 'WE', 'Western Loire Valley', 1),
(1113, 74, 'Et', 'Etranger', 1),
(1114, 74, '01', 'Ain', 1),
(1115, 74, '02', 'Aisne', 1),
(1116, 74, '03', 'Allier', 1),
(1117, 74, '04', 'Alpes de Haute Provence', 1),
(1118, 74, '05', 'Hautes-Alpes', 1),
(1119, 74, '06', 'Alpes Maritimes', 1),
(1120, 74, '07', 'Ard&egrave;che', 1),
(1121, 74, '08', 'Ardennes', 1),
(1122, 74, '09', 'Ari&egrave;ge', 1),
(1123, 74, '10', 'Aube', 1),
(1124, 74, '11', 'Aude', 1),
(1125, 74, '12', 'Aveyron', 1),
(1126, 74, '13', 'Bouches du Rh&ocirc;ne', 1),
(1127, 74, '14', 'Calvados', 1),
(1128, 74, '15', 'Cantal', 1),
(1129, 74, '16', 'Charente', 1),
(1130, 74, '17', 'Charente Maritime', 1),
(1131, 74, '18', 'Cher', 1),
(1132, 74, '19', 'Corr&egrave;ze', 1),
(1133, 74, '2A', 'Corse du Sud', 1),
(1134, 74, '2B', 'Haute Corse', 1),
(1135, 74, '21', 'C&ocirc;te d&#039;or', 1),
(1136, 74, '22', 'C&ocirc;tes d&#039;Armor', 1),
(1137, 74, '23', 'Creuse', 1),
(1138, 74, '24', 'Dordogne', 1),
(1139, 74, '25', 'Doubs', 1),
(1140, 74, '26', 'Dr&ocirc;me', 1),
(1141, 74, '27', 'Eure', 1),
(1142, 74, '28', 'Eure et Loir', 1),
(1143, 74, '29', 'Finist&egrave;re', 1),
(1144, 74, '30', 'Gard', 1),
(1145, 74, '31', 'Haute Garonne', 1),
(1146, 74, '32', 'Gers', 1),
(1147, 74, '33', 'Gironde', 1),
(1148, 74, '34', 'H&eacute;rault', 1),
(1149, 74, '35', 'Ille et Vilaine', 1),
(1150, 74, '36', 'Indre', 1),
(1151, 74, '37', 'Indre et Loire', 1),
(1152, 74, '38', 'Is&eacute;re', 1),
(1153, 74, '39', 'Jura', 1),
(1154, 74, '40', 'Landes', 1),
(1155, 74, '41', 'Loir et Cher', 1),
(1156, 74, '42', 'Loire', 1),
(1157, 74, '43', 'Haute Loire', 1),
(1158, 74, '44', 'Loire Atlantique', 1),
(1159, 74, '45', 'Loiret', 1),
(1160, 74, '46', 'Lot', 1),
(1161, 74, '47', 'Lot et Garonne', 1),
(1162, 74, '48', 'Loz&egrave;re', 1),
(1163, 74, '49', 'Maine et Loire', 1),
(1164, 74, '50', 'Manche', 1),
(1165, 74, '51', 'Marne', 1),
(1166, 74, '52', 'Haute Marne', 1),
(1167, 74, '53', 'Mayenne', 1),
(1168, 74, '54', 'Meurthe et Moselle', 1),
(1169, 74, '55', 'Meuse', 1),
(1170, 74, '56', 'Morbihan', 1),
(1171, 74, '57', 'Moselle', 1),
(1172, 74, '58', 'Ni&egrave;vre', 1),
(1173, 74, '59', 'Nord', 1),
(1174, 74, '60', 'Oise', 1),
(1175, 74, '61', 'Orne', 1),
(1176, 74, '62', 'Pas de Calais', 1),
(1177, 74, '63', 'Puy de D&ocirc;me', 1),
(1178, 74, '64', 'Pyr&eacute;n&eacute;es Atlantiques', 1),
(1179, 74, '65', 'Hautes Pyr&eacute;n&eacute;es', 1),
(1180, 74, '66', 'Pyr&eacute;n&eacute;es Orientales', 1),
(1181, 74, '67', 'Bas Rhin', 1),
(1182, 74, '68', 'Haut Rhin', 1),
(1183, 74, '69', 'Rh&ocirc;ne', 1),
(1184, 74, '70', 'Haute Sa&ocirc;ne', 1),
(1185, 74, '71', 'Sa&ocirc;ne et Loire', 1),
(1186, 74, '72', 'Sarthe', 1),
(1187, 74, '73', 'Savoie', 1),
(1188, 74, '74', 'Haute Savoie', 1),
(1189, 74, '75', 'Paris', 1),
(1190, 74, '76', 'Seine Maritime', 1),
(1191, 74, '77', 'Seine et Marne', 1),
(1192, 74, '78', 'Yvelines', 1),
(1193, 74, '79', 'Deux S&egrave;vres', 1),
(1194, 74, '80', 'Somme', 1),
(1195, 74, '81', 'Tarn', 1),
(1196, 74, '82', 'Tarn et Garonne', 1),
(1197, 74, '83', 'Var', 1),
(1198, 74, '84', 'Vaucluse', 1),
(1199, 74, '85', 'Vend&eacute;e', 1),
(1200, 74, '86', 'Vienne', 1),
(1201, 74, '87', 'Haute Vienne', 1),
(1202, 74, '88', 'Vosges', 1),
(1203, 74, '89', 'Yonne', 1),
(1204, 74, '90', 'Territoire de Belfort', 1),
(1205, 74, '91', 'Essonne', 1),
(1206, 74, '92', 'Hauts de Seine', 1),
(1207, 74, '93', 'Seine St-Denis', 1),
(1208, 74, '94', 'Val de Marne', 1),
(1209, 74, '95', 'Val d''Oise', 1),
(1210, 76, 'M', 'Archipel des Marquises', 1),
(1211, 76, 'T', 'Archipel des Tuamotu', 1),
(1212, 76, 'I', 'Archipel des Tubuai', 1),
(1213, 76, 'V', 'Iles du Vent', 1),
(1214, 76, 'S', 'Iles Sous-le-Vent', 1),
(1215, 77, 'C', 'Iles Crozet', 1),
(1216, 77, 'K', 'Iles Kerguelen', 1),
(1217, 77, 'A', 'Ile Amsterdam', 1),
(1218, 77, 'P', 'Ile Saint-Paul', 1),
(1219, 77, 'D', 'Adelie Land', 1),
(1220, 78, 'ES', 'Estuaire', 1),
(1221, 78, 'HO', 'Haut-Ogooue', 1),
(1222, 78, 'MO', 'Moyen-Ogooue', 1),
(1223, 78, 'NG', 'Ngounie', 1),
(1224, 78, 'NY', 'Nyanga', 1),
(1225, 78, 'OI', 'Ogooue-Ivindo', 1),
(1226, 78, 'OL', 'Ogooue-Lolo', 1),
(1227, 78, 'OM', 'Ogooue-Maritime', 1),
(1228, 78, 'WN', 'Woleu-Ntem', 1),
(1229, 79, 'BJ', 'Banjul', 1),
(1230, 79, 'BS', 'Basse', 1),
(1231, 79, 'BR', 'Brikama', 1),
(1232, 79, 'JA', 'Janjangbure', 1),
(1233, 79, 'KA', 'Kanifeng', 1),
(1234, 79, 'KE', 'Kerewan', 1),
(1235, 79, 'KU', 'Kuntaur', 1),
(1236, 79, 'MA', 'Mansakonko', 1),
(1237, 79, 'LR', 'Lower River', 1),
(1238, 79, 'CR', 'Central River', 1),
(1239, 79, 'NB', 'North Bank', 1),
(1240, 79, 'UR', 'Upper River', 1),
(1241, 79, 'WE', 'Western', 1),
(1242, 80, 'AB', 'Abkhazia', 1),
(1243, 80, 'AJ', 'Ajaria', 1),
(1244, 80, 'TB', 'Tbilisi', 1),
(1245, 80, 'GU', 'Guria', 1),
(1246, 80, 'IM', 'Imereti', 1),
(1247, 80, 'KA', 'Kakheti', 1),
(1248, 80, 'KK', 'Kvemo Kartli', 1),
(1249, 80, 'MM', 'Mtskheta-Mtianeti', 1),
(1250, 80, 'RL', 'Racha Lechkhumi and Kvemo Svanet', 1),
(1251, 80, 'SZ', 'Samegrelo-Zemo Svaneti', 1),
(1252, 80, 'SJ', 'Samtskhe-Javakheti', 1),
(1253, 80, 'SK', 'Shida Kartli', 1),
(1254, 81, 'BAW', 'Baden-W&uuml;rttemberg', 1),
(1255, 81, 'BAY', 'Bayern', 1),
(1256, 81, 'BER', 'Berlin', 1),
(1257, 81, 'BRG', 'Brandenburg', 1),
(1258, 81, 'BRE', 'Bremen', 1),
(1259, 81, 'HAM', 'Hamburg', 1),
(1260, 81, 'HES', 'Hessen', 1),
(1261, 81, 'MEC', 'Mecklenburg-Vorpommern', 1),
(1262, 81, 'NDS', 'Niedersachsen', 1),
(1263, 81, 'NRW', 'Nordrhein-Westfalen', 1),
(1264, 81, 'RHE', 'Rheinland-Pfalz', 1),
(1265, 81, 'SAR', 'Saarland', 1),
(1266, 81, 'SAS', 'Sachsen', 1),
(1267, 81, 'SAC', 'Sachsen-Anhalt', 1),
(1268, 81, 'SCN', 'Schleswig-Holstein', 1),
(1269, 81, 'THE', 'Th&uuml;ringen', 1),
(1270, 82, 'AS', 'Ashanti Region', 1),
(1271, 82, 'BA', 'Brong-Ahafo Region', 1),
(1272, 82, 'CE', 'Central Region', 1),
(1273, 82, 'EA', 'Eastern Region', 1),
(1274, 82, 'GA', 'Greater Accra Region', 1),
(1275, 82, 'NO', 'Northern Region', 1),
(1276, 82, 'UE', 'Upper East Region', 1),
(1277, 82, 'UW', 'Upper West Region', 1),
(1278, 82, 'VO', 'Volta Region', 1),
(1279, 82, 'WE', 'Western Region', 1),
(1280, 84, 'AT', 'Attica', 1),
(1281, 84, 'CN', 'Central Greece', 1),
(1282, 84, 'CM', 'Central Macedonia', 1),
(1283, 84, 'CR', 'Crete', 1),
(1284, 84, 'EM', 'East Macedonia and Thrace', 1),
(1285, 84, 'EP', 'Epirus', 1),
(1286, 84, 'II', 'Ionian Islands', 1),
(1287, 84, 'NA', 'North Aegean', 1),
(1288, 84, 'PP', 'Peloponnesos', 1),
(1289, 84, 'SA', 'South Aegean', 1),
(1290, 84, 'TH', 'Thessaly', 1),
(1291, 84, 'WG', 'West Greece', 1),
(1292, 84, 'WM', 'West Macedonia', 1),
(1293, 85, 'A', 'Avannaa', 1),
(1294, 85, 'T', 'Tunu', 1),
(1295, 85, 'K', 'Kitaa', 1),
(1296, 86, 'A', 'Saint Andrew', 1),
(1297, 86, 'D', 'Saint David', 1),
(1298, 86, 'G', 'Saint George', 1),
(1299, 86, 'J', 'Saint John', 1),
(1300, 86, 'M', 'Saint Mark', 1),
(1301, 86, 'P', 'Saint Patrick', 1),
(1302, 86, 'C', 'Carriacou', 1),
(1303, 86, 'Q', 'Petit Martinique', 1),
(1304, 89, 'AV', 'Alta Verapaz', 1),
(1305, 89, 'BV', 'Baja Verapaz', 1),
(1306, 89, 'CM', 'Chimaltenango', 1),
(1307, 89, 'CQ', 'Chiquimula', 1),
(1308, 89, 'PE', 'El Peten', 1),
(1309, 89, 'PR', 'El Progreso', 1),
(1310, 89, 'QC', 'El Quiche', 1),
(1311, 89, 'ES', 'Escuintla', 1),
(1312, 89, 'GU', 'Guatemala', 1),
(1313, 89, 'HU', 'Huehuetenango', 1),
(1314, 89, 'IZ', 'Izabal', 1),
(1315, 89, 'JA', 'Jalapa', 1),
(1316, 89, 'JU', 'Jutiapa', 1),
(1317, 89, 'QZ', 'Quetzaltenango', 1),
(1318, 89, 'RE', 'Retalhuleu', 1),
(1319, 89, 'ST', 'Sacatepequez', 1),
(1320, 89, 'SM', 'San Marcos', 1),
(1321, 89, 'SR', 'Santa Rosa', 1),
(1322, 89, 'SO', 'Solola', 1),
(1323, 89, 'SU', 'Suchitepequez', 1),
(1324, 89, 'TO', 'Totonicapan', 1),
(1325, 89, 'ZA', 'Zacapa', 1),
(1326, 90, 'CNK', 'Conakry', 1),
(1327, 90, 'BYL', 'Beyla', 1),
(1328, 90, 'BFA', 'Boffa', 1),
(1329, 90, 'BOK', 'Boke', 1),
(1330, 90, 'COY', 'Coyah', 1),
(1331, 90, 'DBL', 'Dabola', 1),
(1332, 90, 'DLB', 'Dalaba', 1),
(1333, 90, 'DGR', 'Dinguiraye', 1),
(1334, 90, 'DBR', 'Dubreka', 1),
(1335, 90, 'FRN', 'Faranah', 1),
(1336, 90, 'FRC', 'Forecariah', 1),
(1337, 90, 'FRI', 'Fria', 1),
(1338, 90, 'GAO', 'Gaoual', 1),
(1339, 90, 'GCD', 'Gueckedou', 1),
(1340, 90, 'KNK', 'Kankan', 1),
(1341, 90, 'KRN', 'Kerouane', 1),
(1342, 90, 'KND', 'Kindia', 1),
(1343, 90, 'KSD', 'Kissidougou', 1),
(1344, 90, 'KBA', 'Koubia', 1),
(1345, 90, 'KDA', 'Koundara', 1),
(1346, 90, 'KRA', 'Kouroussa', 1),
(1347, 90, 'LAB', 'Labe', 1),
(1348, 90, 'LLM', 'Lelouma', 1),
(1349, 90, 'LOL', 'Lola', 1),
(1350, 90, 'MCT', 'Macenta', 1),
(1351, 90, 'MAL', 'Mali', 1),
(1352, 90, 'MAM', 'Mamou', 1),
(1353, 90, 'MAN', 'Mandiana', 1),
(1354, 90, 'NZR', 'Nzerekore', 1),
(1355, 90, 'PIT', 'Pita', 1),
(1356, 90, 'SIG', 'Siguiri', 1),
(1357, 90, 'TLM', 'Telimele', 1),
(1358, 90, 'TOG', 'Tougue', 1),
(1359, 90, 'YOM', 'Yomou', 1),
(1360, 91, 'BF', 'Bafata Region', 1),
(1361, 91, 'BB', 'Biombo Region', 1),
(1362, 91, 'BS', 'Bissau Region', 1),
(1363, 91, 'BL', 'Bolama Region', 1),
(1364, 91, 'CA', 'Cacheu Region', 1),
(1365, 91, 'GA', 'Gabu Region', 1),
(1366, 91, 'OI', 'Oio Region', 1),
(1367, 91, 'QU', 'Quinara Region', 1),
(1368, 91, 'TO', 'Tombali Region', 1),
(1369, 92, 'BW', 'Barima-Waini', 1),
(1370, 92, 'CM', 'Cuyuni-Mazaruni', 1),
(1371, 92, 'DM', 'Demerara-Mahaica', 1),
(1372, 92, 'EC', 'East Berbice-Corentyne', 1),
(1373, 92, 'EW', 'Essequibo Islands-West Demerara', 1),
(1374, 92, 'MB', 'Mahaica-Berbice', 1),
(1375, 92, 'PM', 'Pomeroon-Supenaam', 1),
(1376, 92, 'PI', 'Potaro-Siparuni', 1),
(1377, 92, 'UD', 'Upper Demerara-Berbice', 1),
(1378, 92, 'UT', 'Upper Takutu-Upper Essequibo', 1),
(1379, 93, 'AR', 'Artibonite', 1),
(1380, 93, 'CE', 'Centre', 1),
(1381, 93, 'GA', 'Grand''Anse', 1),
(1382, 93, 'ND', 'Nord', 1),
(1383, 93, 'NE', 'Nord-Est', 1),
(1384, 93, 'NO', 'Nord-Ouest', 1),
(1385, 93, 'OU', 'Ouest', 1),
(1386, 93, 'SD', 'Sud', 1),
(1387, 93, 'SE', 'Sud-Est', 1),
(1388, 94, 'F', 'Flat Island', 1),
(1389, 94, 'M', 'McDonald Island', 1),
(1390, 94, 'S', 'Shag Island', 1),
(1391, 94, 'H', 'Heard Island', 1),
(1392, 95, 'AT', 'Atlantida', 1),
(1393, 95, 'CH', 'Choluteca', 1),
(1394, 95, 'CL', 'Colon', 1),
(1395, 95, 'CM', 'Comayagua', 1),
(1396, 95, 'CP', 'Copan', 1),
(1397, 95, 'CR', 'Cortes', 1),
(1398, 95, 'PA', 'El Paraiso', 1),
(1399, 95, 'FM', 'Francisco Morazan', 1),
(1400, 95, 'GD', 'Gracias a Dios', 1),
(1401, 95, 'IN', 'Intibuca', 1),
(1402, 95, 'IB', 'Islas de la Bahia (Bay Islands)', 1),
(1403, 95, 'PZ', 'La Paz', 1),
(1404, 95, 'LE', 'Lempira', 1),
(1405, 95, 'OC', 'Ocotepeque', 1),
(1406, 95, 'OL', 'Olancho', 1),
(1407, 95, 'SB', 'Santa Barbara', 1),
(1408, 95, 'VA', 'Valle', 1),
(1409, 95, 'YO', 'Yoro', 1),
(1410, 96, 'HCW', 'Central and Western Hong Kong Island', 1),
(1411, 96, 'HEA', 'Eastern Hong Kong Island', 1),
(1412, 96, 'HSO', 'Southern Hong Kong Island', 1),
(1413, 96, 'HWC', 'Wan Chai Hong Kong Island', 1),
(1414, 96, 'KKC', 'Kowloon City Kowloon', 1),
(1415, 96, 'KKT', 'Kwun Tong Kowloon', 1),
(1416, 96, 'KSS', 'Sham Shui Po Kowloon', 1),
(1417, 96, 'KWT', 'Wong Tai Sin Kowloon', 1),
(1418, 96, 'KYT', 'Yau Tsim Mong Kowloon', 1),
(1419, 96, 'NIS', 'Islands New Territories', 1),
(1420, 96, 'NKT', 'Kwai Tsing New Territories', 1),
(1421, 96, 'NNO', 'North New Territories', 1),
(1422, 96, 'NSK', 'Sai Kung New Territories', 1),
(1423, 96, 'NST', 'Sha Tin New Territories', 1),
(1424, 96, 'NTP', 'Tai Po New Territories', 1),
(1425, 96, 'NTW', 'Tsuen Wan New Territories', 1),
(1426, 96, 'NTM', 'Tuen Mun New Territories', 1),
(1427, 96, 'NYL', 'Yuen Long New Territories', 1),
(1428, 97, 'BK', 'Bacs-Kiskun', 1),
(1429, 97, 'BA', 'Baranya', 1),
(1430, 97, 'BE', 'Bekes', 1),
(1431, 97, 'BS', 'Bekescsaba', 1),
(1432, 97, 'BZ', 'Borsod-Abauj-Zemplen', 1),
(1433, 97, 'BU', 'Budapest', 1),
(1434, 97, 'CS', 'Csongrad', 1),
(1435, 97, 'DE', 'Debrecen', 1),
(1436, 97, 'DU', 'Dunaujvaros', 1),
(1437, 97, 'EG', 'Eger', 1),
(1438, 97, 'FE', 'Fejer', 1),
(1439, 97, 'GY', 'Gyor', 1),
(1440, 97, 'GM', 'Gyor-Moson-Sopron', 1),
(1441, 97, 'HB', 'Hajdu-Bihar', 1),
(1442, 97, 'HE', 'Heves', 1),
(1443, 97, 'HO', 'Hodmezovasarhely', 1),
(1444, 97, 'JN', 'Jasz-Nagykun-Szolnok', 1),
(1445, 97, 'KA', 'Kaposvar', 1),
(1446, 97, 'KE', 'Kecskemet', 1),
(1447, 97, 'KO', 'Komarom-Esztergom', 1),
(1448, 97, 'MI', 'Miskolc', 1),
(1449, 97, 'NA', 'Nagykanizsa', 1),
(1450, 97, 'NO', 'Nograd', 1),
(1451, 97, 'NY', 'Nyiregyhaza', 1),
(1452, 97, 'PE', 'Pecs', 1),
(1453, 97, 'PS', 'Pest', 1),
(1454, 97, 'SO', 'Somogy', 1),
(1455, 97, 'SP', 'Sopron', 1),
(1456, 97, 'SS', 'Szabolcs-Szatmar-Bereg', 1),
(1457, 97, 'SZ', 'Szeged', 1),
(1458, 97, 'SE', 'Szekesfehervar', 1),
(1459, 97, 'SL', 'Szolnok', 1),
(1460, 97, 'SM', 'Szombathely', 1),
(1461, 97, 'TA', 'Tatabanya', 1),
(1462, 97, 'TO', 'Tolna', 1),
(1463, 97, 'VA', 'Vas', 1),
(1464, 97, 'VE', 'Veszprem', 1),
(1465, 97, 'ZA', 'Zala', 1),
(1466, 97, 'ZZ', 'Zalaegerszeg', 1),
(1467, 98, 'AL', 'Austurland', 1),
(1468, 98, 'HF', 'Hofuoborgarsvaeoi', 1),
(1469, 98, 'NE', 'Norourland eystra', 1),
(1470, 98, 'NV', 'Norourland vestra', 1),
(1471, 98, 'SL', 'Suourland', 1),
(1472, 98, 'SN', 'Suournes', 1),
(1473, 98, 'VF', 'Vestfiroir', 1),
(1474, 98, 'VL', 'Vesturland', 1),
(1475, 99, 'AN', 'Andaman and Nicobar Islands', 1),
(1476, 99, 'AP', 'Andhra Pradesh', 1),
(1477, 99, 'AR', 'Arunachal Pradesh', 1),
(1478, 99, 'AS', 'Assam', 1),
(1479, 99, 'BI', 'Bihar', 1),
(1480, 99, 'CH', 'Chandigarh', 1),
(1481, 99, 'DA', 'Dadra and Nagar Haveli', 1),
(1482, 99, 'DM', 'Daman and Diu', 1),
(1483, 99, 'DE', 'Delhi', 1),
(1484, 99, 'GO', 'Goa', 1),
(1485, 99, 'GU', 'Gujarat', 1),
(1486, 99, 'HA', 'Haryana', 1),
(1487, 99, 'HP', 'Himachal Pradesh', 1),
(1488, 99, 'JA', 'Jammu and Kashmir', 1),
(1489, 99, 'KA', 'Karnataka', 1),
(1490, 99, 'KE', 'Kerala', 1),
(1491, 99, 'LI', 'Lakshadweep Islands', 1),
(1492, 99, 'MP', 'Madhya Pradesh', 1),
(1493, 99, 'MA', 'Maharashtra', 1),
(1494, 99, 'MN', 'Manipur', 1),
(1495, 99, 'ME', 'Meghalaya', 1),
(1496, 99, 'MI', 'Mizoram', 1),
(1497, 99, 'NA', 'Nagaland', 1),
(1498, 99, 'OR', 'Orissa', 1),
(1499, 99, 'PO', 'Pondicherry', 1),
(1500, 99, 'PU', 'Punjab', 1),
(1501, 99, 'RA', 'Rajasthan', 1),
(1502, 99, 'SI', 'Sikkim', 1),
(1503, 99, 'TN', 'Tamil Nadu', 1),
(1504, 99, 'TR', 'Tripura', 1),
(1505, 99, 'UP', 'Uttar Pradesh', 1),
(1506, 99, 'WB', 'West Bengal', 1),
(1507, 100, 'AC', 'Aceh', 1),
(1508, 100, 'BA', 'Bali', 1),
(1509, 100, 'BT', 'Banten', 1),
(1510, 100, 'BE', 'Bengkulu', 1),
(1511, 100, 'BD', 'BoDeTaBek', 1),
(1512, 100, 'GO', 'Gorontalo', 1),
(1513, 100, 'JK', 'Jakarta Raya', 1),
(1514, 100, 'JA', 'Jambi', 1),
(1515, 100, 'JB', 'Jawa Barat', 1),
(1516, 100, 'JT', 'Jawa Tengah', 1),
(1517, 100, 'JI', 'Jawa Timur', 1),
(1518, 100, 'KB', 'Kalimantan Barat', 1),
(1519, 100, 'KS', 'Kalimantan Selatan', 1),
(1520, 100, 'KT', 'Kalimantan Tengah', 1),
(1521, 100, 'KI', 'Kalimantan Timur', 1),
(1522, 100, 'BB', 'Kepulauan Bangka Belitung', 1),
(1523, 100, 'LA', 'Lampung', 1),
(1524, 100, 'MA', 'Maluku', 1),
(1525, 100, 'MU', 'Maluku Utara', 1),
(1526, 100, 'NB', 'Nusa Tenggara Barat', 1),
(1527, 100, 'NT', 'Nusa Tenggara Timur', 1),
(1528, 100, 'PA', 'Papua', 1),
(1529, 100, 'RI', 'Riau', 1),
(1530, 100, 'SN', 'Sulawesi Selatan', 1),
(1531, 100, 'ST', 'Sulawesi Tengah', 1),
(1532, 100, 'SG', 'Sulawesi Tenggara', 1),
(1533, 100, 'SA', 'Sulawesi Utara', 1),
(1534, 100, 'SB', 'Sumatera Barat', 1),
(1535, 100, 'SS', 'Sumatera Selatan', 1),
(1536, 100, 'SU', 'Sumatera Utara', 1),
(1537, 100, 'YO', 'Yogyakarta', 1),
(1538, 101, 'TEH', 'Tehran', 1),
(1539, 101, 'QOM', 'Qom', 1),
(1540, 101, 'MKZ', 'Markazi', 1),
(1541, 101, 'QAZ', 'Qazvin', 1),
(1542, 101, 'GIL', 'Gilan', 1),
(1543, 101, 'ARD', 'Ardabil', 1),
(1544, 101, 'ZAN', 'Zanjan', 1),
(1545, 101, 'EAZ', 'East Azarbaijan', 1),
(1546, 101, 'WEZ', 'West Azarbaijan', 1),
(1547, 101, 'KRD', 'Kurdistan', 1),
(1548, 101, 'HMD', 'Hamadan', 1),
(1549, 101, 'KRM', 'Kermanshah', 1),
(1550, 101, 'ILM', 'Ilam', 1),
(1551, 101, 'LRS', 'Lorestan', 1),
(1552, 101, 'KZT', 'Khuzestan', 1),
(1553, 101, 'CMB', 'Chahar Mahaal and Bakhtiari', 1),
(1554, 101, 'KBA', 'Kohkiluyeh and Buyer Ahmad', 1),
(1555, 101, 'BSH', 'Bushehr', 1),
(1556, 101, 'FAR', 'Fars', 1),
(1557, 101, 'HRM', 'Hormozgan', 1),
(1558, 101, 'SBL', 'Sistan and Baluchistan', 1),
(1559, 101, 'KRB', 'Kerman', 1),
(1560, 101, 'YZD', 'Yazd', 1),
(1561, 101, 'EFH', 'Esfahan', 1),
(1562, 101, 'SMN', 'Semnan', 1),
(1563, 101, 'MZD', 'Mazandaran', 1),
(1564, 101, 'GLS', 'Golestan', 1),
(1565, 101, 'NKH', 'North Khorasan', 1),
(1566, 101, 'RKH', 'Razavi Khorasan', 1),
(1567, 101, 'SKH', 'South Khorasan', 1),
(1568, 102, 'BD', 'Baghdad', 1),
(1569, 102, 'SD', 'Salah ad Din', 1),
(1570, 102, 'DY', 'Diyala', 1),
(1571, 102, 'WS', 'Wasit', 1),
(1572, 102, 'MY', 'Maysan', 1),
(1573, 102, 'BA', 'Al Basrah', 1),
(1574, 102, 'DQ', 'Dhi Qar', 1),
(1575, 102, 'MU', 'Al Muthanna', 1),
(1576, 102, 'QA', 'Al Qadisyah', 1),
(1577, 102, 'BB', 'Babil', 1),
(1578, 102, 'KB', 'Al Karbala', 1),
(1579, 102, 'NJ', 'An Najaf', 1),
(1580, 102, 'AB', 'Al Anbar', 1),
(1581, 102, 'NN', 'Ninawa', 1),
(1582, 102, 'DH', 'Dahuk', 1),
(1583, 102, 'AL', 'Arbil', 1),
(1584, 102, 'TM', 'At Ta''mim', 1),
(1585, 102, 'SL', 'As Sulaymaniyah', 1),
(1586, 103, 'CA', 'Carlow', 1),
(1587, 103, 'CV', 'Cavan', 1),
(1588, 103, 'CL', 'Clare', 1),
(1589, 103, 'CO', 'Cork', 1),
(1590, 103, 'DO', 'Donegal', 1),
(1591, 103, 'DU', 'Dublin', 1),
(1592, 103, 'GA', 'Galway', 1),
(1593, 103, 'KE', 'Kerry', 1),
(1594, 103, 'KI', 'Kildare', 1),
(1595, 103, 'KL', 'Kilkenny', 1),
(1596, 103, 'LA', 'Laois', 1),
(1597, 103, 'LE', 'Leitrim', 1),
(1598, 103, 'LI', 'Limerick', 1),
(1599, 103, 'LO', 'Longford', 1),
(1600, 103, 'LU', 'Louth', 1),
(1601, 103, 'MA', 'Mayo', 1),
(1602, 103, 'ME', 'Meath', 1),
(1603, 103, 'MO', 'Monaghan', 1),
(1604, 103, 'OF', 'Offaly', 1),
(1605, 103, 'RO', 'Roscommon', 1),
(1606, 103, 'SL', 'Sligo', 1),
(1607, 103, 'TI', 'Tipperary', 1),
(1608, 103, 'WA', 'Waterford', 1),
(1609, 103, 'WE', 'Westmeath', 1),
(1610, 103, 'WX', 'Wexford', 1),
(1611, 103, 'WI', 'Wicklow', 1),
(1612, 104, 'BS', 'Be''er Sheva', 1),
(1613, 104, 'BH', 'Bika''at Hayarden', 1),
(1614, 104, 'EA', 'Eilat and Arava', 1),
(1615, 104, 'GA', 'Galil', 1),
(1616, 104, 'HA', 'Haifa', 1),
(1617, 104, 'JM', 'Jehuda Mountains', 1),
(1618, 104, 'JE', 'Jerusalem', 1),
(1619, 104, 'NE', 'Negev', 1),
(1620, 104, 'SE', 'Semaria', 1),
(1621, 104, 'SH', 'Sharon', 1),
(1622, 104, 'TA', 'Tel Aviv (Gosh Dan)', 1),
(3860, 105, 'CL', 'Caltanissetta', 1),
(3842, 105, 'AG', 'Agrigento', 1),
(3843, 105, 'AL', 'Alessandria', 1),
(3844, 105, 'AN', 'Ancona', 1),
(3845, 105, 'AO', 'Aosta', 1),
(3846, 105, 'AR', 'Arezzo', 1),
(3847, 105, 'AP', 'Ascoli Piceno', 1),
(3848, 105, 'AT', 'Asti', 1),
(3849, 105, 'AV', 'Avellino', 1),
(3850, 105, 'BA', 'Bari', 1),
(3851, 105, 'BL', 'Belluno', 1),
(3852, 105, 'BN', 'Benevento', 1),
(3853, 105, 'BG', 'Bergamo', 1),
(3854, 105, 'BI', 'Biella', 1),
(3855, 105, 'BO', 'Bologna', 1),
(3856, 105, 'BZ', 'Bolzano', 1),
(3857, 105, 'BS', 'Brescia', 1),
(3858, 105, 'BR', 'Brindisi', 1),
(3859, 105, 'CA', 'Cagliari', 1),
(1643, 106, 'CLA', 'Clarendon Parish', 1),
(1644, 106, 'HAN', 'Hanover Parish', 1),
(1645, 106, 'KIN', 'Kingston Parish', 1),
(1646, 106, 'MAN', 'Manchester Parish', 1),
(1647, 106, 'POR', 'Portland Parish', 1),
(1648, 106, 'AND', 'Saint Andrew Parish', 1),
(1649, 106, 'ANN', 'Saint Ann Parish', 1),
(1650, 106, 'CAT', 'Saint Catherine Parish', 1),
(1651, 106, 'ELI', 'Saint Elizabeth Parish', 1),
(1652, 106, 'JAM', 'Saint James Parish', 1),
(1653, 106, 'MAR', 'Saint Mary Parish', 1),
(1654, 106, 'THO', 'Saint Thomas Parish', 1),
(1655, 106, 'TRL', 'Trelawny Parish', 1),
(1656, 106, 'WML', 'Westmoreland Parish', 1),
(1657, 107, 'AI', 'Aichi', 1),
(1658, 107, 'AK', 'Akita', 1),
(1659, 107, 'AO', 'Aomori', 1),
(1660, 107, 'CH', 'Chiba', 1),
(1661, 107, 'EH', 'Ehime', 1),
(1662, 107, 'FK', 'Fukui', 1),
(1663, 107, 'FU', 'Fukuoka', 1),
(1664, 107, 'FS', 'Fukushima', 1),
(1665, 107, 'GI', 'Gifu', 1),
(1666, 107, 'GU', 'Gumma', 1),
(1667, 107, 'HI', 'Hiroshima', 1),
(1668, 107, 'HO', 'Hokkaido', 1),
(1669, 107, 'HY', 'Hyogo', 1),
(1670, 107, 'IB', 'Ibaraki', 1),
(1671, 107, 'IS', 'Ishikawa', 1),
(1672, 107, 'IW', 'Iwate', 1),
(1673, 107, 'KA', 'Kagawa', 1),
(1674, 107, 'KG', 'Kagoshima', 1),
(1675, 107, 'KN', 'Kanagawa', 1),
(1676, 107, 'KO', 'Kochi', 1),
(1677, 107, 'KU', 'Kumamoto', 1),
(1678, 107, 'KY', 'Kyoto', 1),
(1679, 107, 'MI', 'Mie', 1),
(1680, 107, 'MY', 'Miyagi', 1),
(1681, 107, 'MZ', 'Miyazaki', 1),
(1682, 107, 'NA', 'Nagano', 1),
(1683, 107, 'NG', 'Nagasaki', 1),
(1684, 107, 'NR', 'Nara', 1),
(1685, 107, 'NI', 'Niigata', 1),
(1686, 107, 'OI', 'Oita', 1),
(1687, 107, 'OK', 'Okayama', 1),
(1688, 107, 'ON', 'Okinawa', 1),
(1689, 107, 'OS', 'Osaka', 1),
(1690, 107, 'SA', 'Saga', 1),
(1691, 107, 'SI', 'Saitama', 1),
(1692, 107, 'SH', 'Shiga', 1),
(1693, 107, 'SM', 'Shimane', 1),
(1694, 107, 'SZ', 'Shizuoka', 1),
(1695, 107, 'TO', 'Tochigi', 1),
(1696, 107, 'TS', 'Tokushima', 1),
(1697, 107, 'TK', 'Tokyo', 1),
(1698, 107, 'TT', 'Tottori', 1),
(1699, 107, 'TY', 'Toyama', 1),
(1700, 107, 'WA', 'Wakayama', 1),
(1701, 107, 'YA', 'Yamagata', 1),
(1702, 107, 'YM', 'Yamaguchi', 1),
(1703, 107, 'YN', 'Yamanashi', 1),
(1704, 108, 'AM', '''Amman', 1),
(1705, 108, 'AJ', 'Ajlun', 1),
(1706, 108, 'AA', 'Al ''Aqabah', 1),
(1707, 108, 'AB', 'Al Balqa''', 1),
(1708, 108, 'AK', 'Al Karak', 1),
(1709, 108, 'AL', 'Al Mafraq', 1),
(1710, 108, 'AT', 'At Tafilah', 1),
(1711, 108, 'AZ', 'Az Zarqa''', 1),
(1712, 108, 'IR', 'Irbid', 1),
(1713, 108, 'JA', 'Jarash', 1),
(1714, 108, 'MA', 'Ma''an', 1),
(1715, 108, 'MD', 'Madaba', 1),
(1716, 109, 'AL', 'Almaty', 1),
(1717, 109, 'AC', 'Almaty City', 1),
(1718, 109, 'AM', 'Aqmola', 1),
(1719, 109, 'AQ', 'Aqtobe', 1),
(1720, 109, 'AS', 'Astana City', 1),
(1721, 109, 'AT', 'Atyrau', 1),
(1722, 109, 'BA', 'Batys Qazaqstan', 1),
(1723, 109, 'BY', 'Bayqongyr City', 1),
(1724, 109, 'MA', 'Mangghystau', 1),
(1725, 109, 'ON', 'Ongtustik Qazaqstan', 1),
(1726, 109, 'PA', 'Pavlodar', 1),
(1727, 109, 'QA', 'Qaraghandy', 1),
(1728, 109, 'QO', 'Qostanay', 1),
(1729, 109, 'QY', 'Qyzylorda', 1),
(1730, 109, 'SH', 'Shyghys Qazaqstan', 1),
(1731, 109, 'SO', 'Soltustik Qazaqstan', 1),
(1732, 109, 'ZH', 'Zhambyl', 1),
(1733, 110, 'CE', 'Central', 1),
(1734, 110, 'CO', 'Coast', 1),
(1735, 110, 'EA', 'Eastern', 1),
(1736, 110, 'NA', 'Nairobi Area', 1),
(1737, 110, 'NE', 'North Eastern', 1),
(1738, 110, 'NY', 'Nyanza', 1),
(1739, 110, 'RV', 'Rift Valley', 1),
(1740, 110, 'WE', 'Western', 1),
(1741, 111, 'AG', 'Abaiang', 1),
(1742, 111, 'AM', 'Abemama', 1),
(1743, 111, 'AK', 'Aranuka', 1),
(1744, 111, 'AO', 'Arorae', 1),
(1745, 111, 'BA', 'Banaba', 1),
(1746, 111, 'BE', 'Beru', 1),
(1747, 111, 'bT', 'Butaritari', 1),
(1748, 111, 'KA', 'Kanton', 1),
(1749, 111, 'KR', 'Kiritimati', 1),
(1750, 111, 'KU', 'Kuria', 1),
(1751, 111, 'MI', 'Maiana', 1),
(1752, 111, 'MN', 'Makin', 1),
(1753, 111, 'ME', 'Marakei', 1),
(1754, 111, 'NI', 'Nikunau', 1),
(1755, 111, 'NO', 'Nonouti', 1),
(1756, 111, 'ON', 'Onotoa', 1),
(1757, 111, 'TT', 'Tabiteuea', 1),
(1758, 111, 'TR', 'Tabuaeran', 1),
(1759, 111, 'TM', 'Tamana', 1),
(1760, 111, 'TW', 'Tarawa', 1),
(1761, 111, 'TE', 'Teraina', 1),
(1762, 112, 'CHA', 'Chagang-do', 1),
(1763, 112, 'HAB', 'Hamgyong-bukto', 1),
(1764, 112, 'HAN', 'Hamgyong-namdo', 1),
(1765, 112, 'HWB', 'Hwanghae-bukto', 1),
(1766, 112, 'HWN', 'Hwanghae-namdo', 1),
(1767, 112, 'KAN', 'Kangwon-do', 1),
(1768, 112, 'PYB', 'P''yongan-bukto', 1),
(1769, 112, 'PYN', 'P''yongan-namdo', 1),
(1770, 112, 'YAN', 'Ryanggang-do (Yanggang-do)', 1),
(1771, 112, 'NAJ', 'Rason Directly Governed City', 1),
(1772, 112, 'PYO', 'P''yongyang Special City', 1),
(1773, 113, 'CO', 'Ch''ungch''ong-bukto', 1),
(1774, 113, 'CH', 'Ch''ungch''ong-namdo', 1),
(1775, 113, 'CD', 'Cheju-do', 1),
(1776, 113, 'CB', 'Cholla-bukto', 1),
(1777, 113, 'CN', 'Cholla-namdo', 1),
(1778, 113, 'IG', 'Inch''on-gwangyoksi', 1),
(1779, 113, 'KA', 'Kangwon-do', 1),
(1780, 113, 'KG', 'Kwangju-gwangyoksi', 1),
(1781, 113, 'KD', 'Kyonggi-do', 1),
(1782, 113, 'KB', 'Kyongsang-bukto', 1),
(1783, 113, 'KN', 'Kyongsang-namdo', 1),
(1784, 113, 'PG', 'Pusan-gwangyoksi', 1),
(1785, 113, 'SO', 'Soul-t''ukpyolsi', 1),
(1786, 113, 'TA', 'Taegu-gwangyoksi', 1),
(1787, 113, 'TG', 'Taejon-gwangyoksi', 1),
(1788, 114, 'AL', 'Al ''Asimah', 1),
(1789, 114, 'AA', 'Al Ahmadi', 1),
(1790, 114, 'AF', 'Al Farwaniyah', 1),
(1791, 114, 'AJ', 'Al Jahra''', 1),
(1792, 114, 'HA', 'Hawalli', 1),
(1793, 115, 'GB', 'Bishkek', 1),
(1794, 115, 'B', 'Batken', 1),
(1795, 115, 'C', 'Chu', 1),
(1796, 115, 'J', 'Jalal-Abad', 1),
(1797, 115, 'N', 'Naryn', 1),
(1798, 115, 'O', 'Osh', 1),
(1799, 115, 'T', 'Talas', 1),
(1800, 115, 'Y', 'Ysyk-Kol', 1),
(1801, 116, 'VT', 'Vientiane', 1),
(1802, 116, 'AT', 'Attapu', 1),
(1803, 116, 'BK', 'Bokeo', 1),
(1804, 116, 'BL', 'Bolikhamxai', 1),
(1805, 116, 'CH', 'Champasak', 1),
(1806, 116, 'HO', 'Houaphan', 1);
INSERT INTO `zone` (`zone_id`, `country_id`, `code`, `name`, `status`) VALUES
(1807, 116, 'KH', 'Khammouan', 1),
(1808, 116, 'LM', 'Louang Namtha', 1),
(1809, 116, 'LP', 'Louangphabang', 1),
(1810, 116, 'OU', 'Oudomxai', 1),
(1811, 116, 'PH', 'Phongsali', 1),
(1812, 116, 'SL', 'Salavan', 1),
(1813, 116, 'SV', 'Savannakhet', 1),
(1814, 116, 'VI', 'Vientiane', 1),
(1815, 116, 'XA', 'Xaignabouli', 1),
(1816, 116, 'XE', 'Xekong', 1),
(1817, 116, 'XI', 'Xiangkhoang', 1),
(1818, 116, 'XN', 'Xaisomboun', 1),
(1819, 117, 'AIZ', 'Aizkraukles Rajons', 1),
(1820, 117, 'ALU', 'Aluksnes Rajons', 1),
(1821, 117, 'BAL', 'Balvu Rajons', 1),
(1822, 117, 'BAU', 'Bauskas Rajons', 1),
(1823, 117, 'CES', 'Cesu Rajons', 1),
(1824, 117, 'DGR', 'Daugavpils Rajons', 1),
(1825, 117, 'DOB', 'Dobeles Rajons', 1),
(1826, 117, 'GUL', 'Gulbenes Rajons', 1),
(1827, 117, 'JEK', 'Jekabpils Rajons', 1),
(1828, 117, 'JGR', 'Jelgavas Rajons', 1),
(1829, 117, 'KRA', 'Kraslavas Rajons', 1),
(1830, 117, 'KUL', 'Kuldigas Rajons', 1),
(1831, 117, 'LPR', 'Liepajas Rajons', 1),
(1832, 117, 'LIM', 'Limbazu Rajons', 1),
(1833, 117, 'LUD', 'Ludzas Rajons', 1),
(1834, 117, 'MAD', 'Madonas Rajons', 1),
(1835, 117, 'OGR', 'Ogres Rajons', 1),
(1836, 117, 'PRE', 'Preilu Rajons', 1),
(1837, 117, 'RZR', 'Rezeknes Rajons', 1),
(1838, 117, 'RGR', 'Rigas Rajons', 1),
(1839, 117, 'SAL', 'Saldus Rajons', 1),
(1840, 117, 'TAL', 'Talsu Rajons', 1),
(1841, 117, 'TUK', 'Tukuma Rajons', 1),
(1842, 117, 'VLK', 'Valkas Rajons', 1),
(1843, 117, 'VLM', 'Valmieras Rajons', 1),
(1844, 117, 'VSR', 'Ventspils Rajons', 1),
(1845, 117, 'DGV', 'Daugavpils', 1),
(1846, 117, 'JGV', 'Jelgava', 1),
(1847, 117, 'JUR', 'Jurmala', 1),
(1848, 117, 'LPK', 'Liepaja', 1),
(1849, 117, 'RZK', 'Rezekne', 1),
(1850, 117, 'RGA', 'Riga', 1),
(1851, 117, 'VSL', 'Ventspils', 1),
(1852, 119, 'BE', 'Berea', 1),
(1853, 119, 'BB', 'Butha-Buthe', 1),
(1854, 119, 'LE', 'Leribe', 1),
(1855, 119, 'MF', 'Mafeteng', 1),
(1856, 119, 'MS', 'Maseru', 1),
(1857, 119, 'MH', 'Mohale''s Hoek', 1),
(1858, 119, 'MK', 'Mokhotlong', 1),
(1859, 119, 'QN', 'Qacha''s Nek', 1),
(1860, 119, 'QT', 'Quthing', 1),
(1861, 119, 'TT', 'Thaba-Tseka', 1),
(1862, 120, 'BI', 'Bomi', 1),
(1863, 120, 'BG', 'Bong', 1),
(1864, 120, 'GB', 'Grand Bassa', 1),
(1865, 120, 'CM', 'Grand Cape Mount', 1),
(1866, 120, 'GG', 'Grand Gedeh', 1),
(1867, 120, 'GK', 'Grand Kru', 1),
(1868, 120, 'LO', 'Lofa', 1),
(1869, 120, 'MG', 'Margibi', 1),
(1870, 120, 'ML', 'Maryland', 1),
(1871, 120, 'MS', 'Montserrado', 1),
(1872, 120, 'NB', 'Nimba', 1),
(1873, 120, 'RC', 'River Cess', 1),
(1874, 120, 'SN', 'Sinoe', 1),
(1875, 121, 'AJ', 'Ajdabiya', 1),
(1876, 121, 'AZ', 'Al ''Aziziyah', 1),
(1877, 121, 'FA', 'Al Fatih', 1),
(1878, 121, 'JA', 'Al Jabal al Akhdar', 1),
(1879, 121, 'JU', 'Al Jufrah', 1),
(1880, 121, 'KH', 'Al Khums', 1),
(1881, 121, 'KU', 'Al Kufrah', 1),
(1882, 121, 'NK', 'An Nuqat al Khams', 1),
(1883, 121, 'AS', 'Ash Shati''', 1),
(1884, 121, 'AW', 'Awbari', 1),
(1885, 121, 'ZA', 'Az Zawiyah', 1),
(1886, 121, 'BA', 'Banghazi', 1),
(1887, 121, 'DA', 'Darnah', 1),
(1888, 121, 'GD', 'Ghadamis', 1),
(1889, 121, 'GY', 'Gharyan', 1),
(1890, 121, 'MI', 'Misratah', 1),
(1891, 121, 'MZ', 'Murzuq', 1),
(1892, 121, 'SB', 'Sabha', 1),
(1893, 121, 'SW', 'Sawfajjin', 1),
(1894, 121, 'SU', 'Surt', 1),
(1895, 121, 'TL', 'Tarabulus (Tripoli)', 1),
(1896, 121, 'TH', 'Tarhunah', 1),
(1897, 121, 'TU', 'Tubruq', 1),
(1898, 121, 'YA', 'Yafran', 1),
(1899, 121, 'ZL', 'Zlitan', 1),
(1900, 122, 'V', 'Vaduz', 1),
(1901, 122, 'A', 'Schaan', 1),
(1902, 122, 'B', 'Balzers', 1),
(1903, 122, 'N', 'Triesen', 1),
(1904, 122, 'E', 'Eschen', 1),
(1905, 122, 'M', 'Mauren', 1),
(1906, 122, 'T', 'Triesenberg', 1),
(1907, 122, 'R', 'Ruggell', 1),
(1908, 122, 'G', 'Gamprin', 1),
(1909, 122, 'L', 'Schellenberg', 1),
(1910, 122, 'P', 'Planken', 1),
(1911, 123, 'AL', 'Alytus', 1),
(1912, 123, 'KA', 'Kaunas', 1),
(1913, 123, 'KL', 'Klaipeda', 1),
(1914, 123, 'MA', 'Marijampole', 1),
(1915, 123, 'PA', 'Panevezys', 1),
(1916, 123, 'SI', 'Siauliai', 1),
(1917, 123, 'TA', 'Taurage', 1),
(1918, 123, 'TE', 'Telsiai', 1),
(1919, 123, 'UT', 'Utena', 1),
(1920, 123, 'VI', 'Vilnius', 1),
(1921, 124, 'DD', 'Diekirch', 1),
(1922, 124, 'DC', 'Clervaux', 1),
(1923, 124, 'DR', 'Redange', 1),
(1924, 124, 'DV', 'Vianden', 1),
(1925, 124, 'DW', 'Wiltz', 1),
(1926, 124, 'GG', 'Grevenmacher', 1),
(1927, 124, 'GE', 'Echternach', 1),
(1928, 124, 'GR', 'Remich', 1),
(1929, 124, 'LL', 'Luxembourg', 1),
(1930, 124, 'LC', 'Capellen', 1),
(1931, 124, 'LE', 'Esch-sur-Alzette', 1),
(1932, 124, 'LM', 'Mersch', 1),
(1933, 125, 'OLF', 'Our Lady Fatima Parish', 1),
(1934, 125, 'ANT', 'St. Anthony Parish', 1),
(1935, 125, 'LAZ', 'St. Lazarus Parish', 1),
(1936, 125, 'CAT', 'Cathedral Parish', 1),
(1937, 125, 'LAW', 'St. Lawrence Parish', 1),
(1938, 127, 'AN', 'Antananarivo', 1),
(1939, 127, 'AS', 'Antsiranana', 1),
(1940, 127, 'FN', 'Fianarantsoa', 1),
(1941, 127, 'MJ', 'Mahajanga', 1),
(1942, 127, 'TM', 'Toamasina', 1),
(1943, 127, 'TL', 'Toliara', 1),
(1944, 128, 'BLK', 'Balaka', 1),
(1945, 128, 'BLT', 'Blantyre', 1),
(1946, 128, 'CKW', 'Chikwawa', 1),
(1947, 128, 'CRD', 'Chiradzulu', 1),
(1948, 128, 'CTP', 'Chitipa', 1),
(1949, 128, 'DDZ', 'Dedza', 1),
(1950, 128, 'DWA', 'Dowa', 1),
(1951, 128, 'KRG', 'Karonga', 1),
(1952, 128, 'KSG', 'Kasungu', 1),
(1953, 128, 'LKM', 'Likoma', 1),
(1954, 128, 'LLG', 'Lilongwe', 1),
(1955, 128, 'MCG', 'Machinga', 1),
(1956, 128, 'MGC', 'Mangochi', 1),
(1957, 128, 'MCH', 'Mchinji', 1),
(1958, 128, 'MLJ', 'Mulanje', 1),
(1959, 128, 'MWZ', 'Mwanza', 1),
(1960, 128, 'MZM', 'Mzimba', 1),
(1961, 128, 'NTU', 'Ntcheu', 1),
(1962, 128, 'NKB', 'Nkhata Bay', 1),
(1963, 128, 'NKH', 'Nkhotakota', 1),
(1964, 128, 'NSJ', 'Nsanje', 1),
(1965, 128, 'NTI', 'Ntchisi', 1),
(1966, 128, 'PHL', 'Phalombe', 1),
(1967, 128, 'RMP', 'Rumphi', 1),
(1968, 128, 'SLM', 'Salima', 1),
(1969, 128, 'THY', 'Thyolo', 1),
(1970, 128, 'ZBA', 'Zomba', 1),
(1971, 129, 'JO', 'Johor', 1),
(1972, 129, 'KE', 'Kedah', 1),
(1973, 129, 'KL', 'Kelantan', 1),
(1974, 129, 'LA', 'Labuan', 1),
(1975, 129, 'ME', 'Melaka', 1),
(1976, 129, 'NS', 'Negeri Sembilan', 1),
(1977, 129, 'PA', 'Pahang', 1),
(1978, 129, 'PE', 'Perak', 1),
(1979, 129, 'PR', 'Perlis', 1),
(1980, 129, 'PP', 'Pulau Pinang', 1),
(1981, 129, 'SA', 'Sabah', 1),
(1982, 129, 'SR', 'Sarawak', 1),
(1983, 129, 'SE', 'Selangor', 1),
(1984, 129, 'TE', 'Terengganu', 1),
(1985, 129, 'WP', 'Wilayah Persekutuan', 1),
(1986, 130, 'THU', 'Thiladhunmathi Uthuru', 1),
(1987, 130, 'THD', 'Thiladhunmathi Dhekunu', 1),
(1988, 130, 'MLU', 'Miladhunmadulu Uthuru', 1),
(1989, 130, 'MLD', 'Miladhunmadulu Dhekunu', 1),
(1990, 130, 'MAU', 'Maalhosmadulu Uthuru', 1),
(1991, 130, 'MAD', 'Maalhosmadulu Dhekunu', 1),
(1992, 130, 'FAA', 'Faadhippolhu', 1),
(1993, 130, 'MAA', 'Male Atoll', 1),
(1994, 130, 'AAU', 'Ari Atoll Uthuru', 1),
(1995, 130, 'AAD', 'Ari Atoll Dheknu', 1),
(1996, 130, 'FEA', 'Felidhe Atoll', 1),
(1997, 130, 'MUA', 'Mulaku Atoll', 1),
(1998, 130, 'NAU', 'Nilandhe Atoll Uthuru', 1),
(1999, 130, 'NAD', 'Nilandhe Atoll Dhekunu', 1),
(2000, 130, 'KLH', 'Kolhumadulu', 1),
(2001, 130, 'HDH', 'Hadhdhunmathi', 1),
(2002, 130, 'HAU', 'Huvadhu Atoll Uthuru', 1),
(2003, 130, 'HAD', 'Huvadhu Atoll Dhekunu', 1),
(2004, 130, 'FMU', 'Fua Mulaku', 1),
(2005, 130, 'ADD', 'Addu', 1),
(2006, 131, 'GA', 'Gao', 1),
(2007, 131, 'KY', 'Kayes', 1),
(2008, 131, 'KD', 'Kidal', 1),
(2009, 131, 'KL', 'Koulikoro', 1),
(2010, 131, 'MP', 'Mopti', 1),
(2011, 131, 'SG', 'Segou', 1),
(2012, 131, 'SK', 'Sikasso', 1),
(2013, 131, 'TB', 'Tombouctou', 1),
(2014, 131, 'CD', 'Bamako Capital District', 1),
(2015, 132, 'ATT', 'Attard', 1),
(2016, 132, 'BAL', 'Balzan', 1),
(2017, 132, 'BGU', 'Birgu', 1),
(2018, 132, 'BKK', 'Birkirkara', 1),
(2019, 132, 'BRZ', 'Birzebbuga', 1),
(2020, 132, 'BOR', 'Bormla', 1),
(2021, 132, 'DIN', 'Dingli', 1),
(2022, 132, 'FGU', 'Fgura', 1),
(2023, 132, 'FLO', 'Floriana', 1),
(2024, 132, 'GDJ', 'Gudja', 1),
(2025, 132, 'GZR', 'Gzira', 1),
(2026, 132, 'GRG', 'Gargur', 1),
(2027, 132, 'GXQ', 'Gaxaq', 1),
(2028, 132, 'HMR', 'Hamrun', 1),
(2029, 132, 'IKL', 'Iklin', 1),
(2030, 132, 'ISL', 'Isla', 1),
(2031, 132, 'KLK', 'Kalkara', 1),
(2032, 132, 'KRK', 'Kirkop', 1),
(2033, 132, 'LIJ', 'Lija', 1),
(2034, 132, 'LUQ', 'Luqa', 1),
(2035, 132, 'MRS', 'Marsa', 1),
(2036, 132, 'MKL', 'Marsaskala', 1),
(2037, 132, 'MXL', 'Marsaxlokk', 1),
(2038, 132, 'MDN', 'Mdina', 1),
(2039, 132, 'MEL', 'Melliea', 1),
(2040, 132, 'MGR', 'Mgarr', 1),
(2041, 132, 'MST', 'Mosta', 1),
(2042, 132, 'MQA', 'Mqabba', 1),
(2043, 132, 'MSI', 'Msida', 1),
(2044, 132, 'MTF', 'Mtarfa', 1),
(2045, 132, 'NAX', 'Naxxar', 1),
(2046, 132, 'PAO', 'Paola', 1),
(2047, 132, 'PEM', 'Pembroke', 1),
(2048, 132, 'PIE', 'Pieta', 1),
(2049, 132, 'QOR', 'Qormi', 1),
(2050, 132, 'QRE', 'Qrendi', 1),
(2051, 132, 'RAB', 'Rabat', 1),
(2052, 132, 'SAF', 'Safi', 1),
(2053, 132, 'SGI', 'San Giljan', 1),
(2054, 132, 'SLU', 'Santa Lucija', 1),
(2055, 132, 'SPB', 'San Pawl il-Bahar', 1),
(2056, 132, 'SGW', 'San Gwann', 1),
(2057, 132, 'SVE', 'Santa Venera', 1),
(2058, 132, 'SIG', 'Siggiewi', 1),
(2059, 132, 'SLM', 'Sliema', 1),
(2060, 132, 'SWQ', 'Swieqi', 1),
(2061, 132, 'TXB', 'Ta Xbiex', 1),
(2062, 132, 'TRX', 'Tarxien', 1),
(2063, 132, 'VLT', 'Valletta', 1),
(2064, 132, 'XGJ', 'Xgajra', 1),
(2065, 132, 'ZBR', 'Zabbar', 1),
(2066, 132, 'ZBG', 'Zebbug', 1),
(2067, 132, 'ZJT', 'Zejtun', 1),
(2068, 132, 'ZRQ', 'Zurrieq', 1),
(2069, 132, 'FNT', 'Fontana', 1),
(2070, 132, 'GHJ', 'Ghajnsielem', 1),
(2071, 132, 'GHR', 'Gharb', 1),
(2072, 132, 'GHS', 'Ghasri', 1),
(2073, 132, 'KRC', 'Kercem', 1),
(2074, 132, 'MUN', 'Munxar', 1),
(2075, 132, 'NAD', 'Nadur', 1),
(2076, 132, 'QAL', 'Qala', 1),
(2077, 132, 'VIC', 'Victoria', 1),
(2078, 132, 'SLA', 'San Lawrenz', 1),
(2079, 132, 'SNT', 'Sannat', 1),
(2080, 132, 'ZAG', 'Xagra', 1),
(2081, 132, 'XEW', 'Xewkija', 1),
(2082, 132, 'ZEB', 'Zebbug', 1),
(2083, 133, 'ALG', 'Ailinginae', 1),
(2084, 133, 'ALL', 'Ailinglaplap', 1),
(2085, 133, 'ALK', 'Ailuk', 1),
(2086, 133, 'ARN', 'Arno', 1),
(2087, 133, 'AUR', 'Aur', 1),
(2088, 133, 'BKR', 'Bikar', 1),
(2089, 133, 'BKN', 'Bikini', 1),
(2090, 133, 'BKK', 'Bokak', 1),
(2091, 133, 'EBN', 'Ebon', 1),
(2092, 133, 'ENT', 'Enewetak', 1),
(2093, 133, 'EKB', 'Erikub', 1),
(2094, 133, 'JBT', 'Jabat', 1),
(2095, 133, 'JLT', 'Jaluit', 1),
(2096, 133, 'JEM', 'Jemo', 1),
(2097, 133, 'KIL', 'Kili', 1),
(2098, 133, 'KWJ', 'Kwajalein', 1),
(2099, 133, 'LAE', 'Lae', 1),
(2100, 133, 'LIB', 'Lib', 1),
(2101, 133, 'LKP', 'Likiep', 1),
(2102, 133, 'MJR', 'Majuro', 1),
(2103, 133, 'MLP', 'Maloelap', 1),
(2104, 133, 'MJT', 'Mejit', 1),
(2105, 133, 'MIL', 'Mili', 1),
(2106, 133, 'NMK', 'Namorik', 1),
(2107, 133, 'NAM', 'Namu', 1),
(2108, 133, 'RGL', 'Rongelap', 1),
(2109, 133, 'RGK', 'Rongrik', 1),
(2110, 133, 'TOK', 'Toke', 1),
(2111, 133, 'UJA', 'Ujae', 1),
(2112, 133, 'UJL', 'Ujelang', 1),
(2113, 133, 'UTK', 'Utirik', 1),
(2114, 133, 'WTH', 'Wotho', 1),
(2115, 133, 'WTJ', 'Wotje', 1),
(2116, 135, 'AD', 'Adrar', 1),
(2117, 135, 'AS', 'Assaba', 1),
(2118, 135, 'BR', 'Brakna', 1),
(2119, 135, 'DN', 'Dakhlet Nouadhibou', 1),
(2120, 135, 'GO', 'Gorgol', 1),
(2121, 135, 'GM', 'Guidimaka', 1),
(2122, 135, 'HC', 'Hodh Ech Chargui', 1),
(2123, 135, 'HG', 'Hodh El Gharbi', 1),
(2124, 135, 'IN', 'Inchiri', 1),
(2125, 135, 'TA', 'Tagant', 1),
(2126, 135, 'TZ', 'Tiris Zemmour', 1),
(2127, 135, 'TR', 'Trarza', 1),
(2128, 135, 'NO', 'Nouakchott', 1),
(2129, 136, 'BR', 'Beau Bassin-Rose Hill', 1),
(2130, 136, 'CU', 'Curepipe', 1),
(2131, 136, 'PU', 'Port Louis', 1),
(2132, 136, 'QB', 'Quatre Bornes', 1),
(2133, 136, 'VP', 'Vacoas-Phoenix', 1),
(2134, 136, 'AG', 'Agalega Islands', 1),
(2135, 136, 'CC', 'Cargados Carajos Shoals (Saint Brandon Islands)', 1),
(2136, 136, 'RO', 'Rodrigues', 1),
(2137, 136, 'BL', 'Black River', 1),
(2138, 136, 'FL', 'Flacq', 1),
(2139, 136, 'GP', 'Grand Port', 1),
(2140, 136, 'MO', 'Moka', 1),
(2141, 136, 'PA', 'Pamplemousses', 1),
(2142, 136, 'PW', 'Plaines Wilhems', 1),
(2143, 136, 'PL', 'Port Louis', 1),
(2144, 136, 'RR', 'Riviere du Rempart', 1),
(2145, 136, 'SA', 'Savanne', 1),
(2146, 138, 'BN', 'Baja California Norte', 1),
(2147, 138, 'BS', 'Baja California Sur', 1),
(2148, 138, 'CA', 'Campeche', 1),
(2149, 138, 'CI', 'Chiapas', 1),
(2150, 138, 'CH', 'Chihuahua', 1),
(2151, 138, 'CZ', 'Coahuila de Zaragoza', 1),
(2152, 138, 'CL', 'Colima', 1),
(2153, 138, 'DF', 'Distrito Federal', 1),
(2154, 138, 'DU', 'Durango', 1),
(2155, 138, 'GA', 'Guanajuato', 1),
(2156, 138, 'GE', 'Guerrero', 1),
(2157, 138, 'HI', 'Hidalgo', 1),
(2158, 138, 'JA', 'Jalisco', 1),
(2159, 138, 'ME', 'Mexico', 1),
(2160, 138, 'MI', 'Michoacan de Ocampo', 1),
(2161, 138, 'MO', 'Morelos', 1),
(2162, 138, 'NA', 'Nayarit', 1),
(2163, 138, 'NL', 'Nuevo Leon', 1),
(2164, 138, 'OA', 'Oaxaca', 1),
(2165, 138, 'PU', 'Puebla', 1),
(2166, 138, 'QA', 'Queretaro de Arteaga', 1),
(2167, 138, 'QR', 'Quintana Roo', 1),
(2168, 138, 'SA', 'San Luis Potosi', 1),
(2169, 138, 'SI', 'Sinaloa', 1),
(2170, 138, 'SO', 'Sonora', 1),
(2171, 138, 'TB', 'Tabasco', 1),
(2172, 138, 'TM', 'Tamaulipas', 1),
(2173, 138, 'TL', 'Tlaxcala', 1),
(2174, 138, 'VE', 'Veracruz-Llave', 1),
(2175, 138, 'YU', 'Yucatan', 1),
(2176, 138, 'ZA', 'Zacatecas', 1),
(2177, 139, 'C', 'Chuuk', 1),
(2178, 139, 'K', 'Kosrae', 1),
(2179, 139, 'P', 'Pohnpei', 1),
(2180, 139, 'Y', 'Yap', 1),
(2181, 140, 'GA', 'Gagauzia', 1),
(2182, 140, 'CU', 'Chisinau', 1),
(2183, 140, 'BA', 'Balti', 1),
(2184, 140, 'CA', 'Cahul', 1),
(2185, 140, 'ED', 'Edinet', 1),
(2186, 140, 'LA', 'Lapusna', 1),
(2187, 140, 'OR', 'Orhei', 1),
(2188, 140, 'SO', 'Soroca', 1),
(2189, 140, 'TI', 'Tighina', 1),
(2190, 140, 'UN', 'Ungheni', 1),
(2191, 140, 'SN', 'St‚nga Nistrului', 1),
(2192, 141, 'FV', 'Fontvieille', 1),
(2193, 141, 'LC', 'La Condamine', 1),
(2194, 141, 'MV', 'Monaco-Ville', 1),
(2195, 141, 'MC', 'Monte-Carlo', 1),
(2196, 142, '1', 'Ulanbaatar', 1),
(2197, 142, '035', 'Orhon', 1),
(2198, 142, '037', 'Darhan uul', 1),
(2199, 142, '039', 'Hentiy', 1),
(2200, 142, '041', 'Hovsgol', 1),
(2201, 142, '043', 'Hovd', 1),
(2202, 142, '046', 'Uvs', 1),
(2203, 142, '047', 'Tov', 1),
(2204, 142, '049', 'Selenge', 1),
(2205, 142, '051', 'Suhbaatar', 1),
(2206, 142, '053', 'Omnogovi', 1),
(2207, 142, '055', 'Ovorhangay', 1),
(2208, 142, '057', 'Dzavhan', 1),
(2209, 142, '059', 'DundgovL', 1),
(2210, 142, '061', 'Dornod', 1),
(2211, 142, '063', 'Dornogov', 1),
(2212, 142, '064', 'Govi-Sumber', 1),
(2213, 142, '065', 'Govi-Altay', 1),
(2214, 142, '067', 'Bulgan', 1),
(2215, 142, '069', 'Bayanhongor', 1),
(2216, 142, '071', 'Bayan-Olgiy', 1),
(2217, 142, '073', 'Arhangay', 1),
(2218, 143, 'A', 'Saint Anthony', 1),
(2219, 143, 'G', 'Saint Georges', 1),
(2220, 143, 'P', 'Saint Peter', 1),
(2221, 144, 'AGD', 'Agadir', 1),
(2222, 144, 'HOC', 'Al Hoceima', 1),
(2223, 144, 'AZI', 'Azilal', 1),
(2224, 144, 'BME', 'Beni Mellal', 1),
(2225, 144, 'BSL', 'Ben Slimane', 1),
(2226, 144, 'BLM', 'Boulemane', 1),
(2227, 144, 'CBL', 'Casablanca', 1),
(2228, 144, 'CHA', 'Chaouen', 1),
(2229, 144, 'EJA', 'El Jadida', 1),
(2230, 144, 'EKS', 'El Kelaa des Sraghna', 1),
(2231, 144, 'ERA', 'Er Rachidia', 1),
(2232, 144, 'ESS', 'Essaouira', 1),
(2233, 144, 'FES', 'Fes', 1),
(2234, 144, 'FIG', 'Figuig', 1),
(2235, 144, 'GLM', 'Guelmim', 1),
(2236, 144, 'IFR', 'Ifrane', 1),
(2237, 144, 'KEN', 'Kenitra', 1),
(2238, 144, 'KHM', 'Khemisset', 1),
(2239, 144, 'KHN', 'Khenifra', 1),
(2240, 144, 'KHO', 'Khouribga', 1),
(2241, 144, 'LYN', 'Laayoune', 1),
(2242, 144, 'LAR', 'Larache', 1),
(2243, 144, 'MRK', 'Marrakech', 1),
(2244, 144, 'MKN', 'Meknes', 1),
(2245, 144, 'NAD', 'Nador', 1),
(2246, 144, 'ORZ', 'Ouarzazate', 1),
(2247, 144, 'OUJ', 'Oujda', 1),
(2248, 144, 'RSA', 'Rabat-Sale', 1),
(2249, 144, 'SAF', 'Safi', 1),
(2250, 144, 'SET', 'Settat', 1),
(2251, 144, 'SKA', 'Sidi Kacem', 1),
(2252, 144, 'TGR', 'Tangier', 1),
(2253, 144, 'TAN', 'Tan-Tan', 1),
(2254, 144, 'TAO', 'Taounate', 1),
(2255, 144, 'TRD', 'Taroudannt', 1),
(2256, 144, 'TAT', 'Tata', 1),
(2257, 144, 'TAZ', 'Taza', 1),
(2258, 144, 'TET', 'Tetouan', 1),
(2259, 144, 'TIZ', 'Tiznit', 1),
(2260, 144, 'ADK', 'Ad Dakhla', 1),
(2261, 144, 'BJD', 'Boujdour', 1),
(2262, 144, 'ESM', 'Es Smara', 1),
(2263, 145, 'CD', 'Cabo Delgado', 1),
(2264, 145, 'GZ', 'Gaza', 1),
(2265, 145, 'IN', 'Inhambane', 1),
(2266, 145, 'MN', 'Manica', 1),
(2267, 145, 'MC', 'Maputo (city)', 1),
(2268, 145, 'MP', 'Maputo', 1),
(2269, 145, 'NA', 'Nampula', 1),
(2270, 145, 'NI', 'Niassa', 1),
(2271, 145, 'SO', 'Sofala', 1),
(2272, 145, 'TE', 'Tete', 1),
(2273, 145, 'ZA', 'Zambezia', 1),
(2274, 146, 'AY', 'Ayeyarwady', 1),
(2275, 146, 'BG', 'Bago', 1),
(2276, 146, 'MG', 'Magway', 1),
(2277, 146, 'MD', 'Mandalay', 1),
(2278, 146, 'SG', 'Sagaing', 1),
(2279, 146, 'TN', 'Tanintharyi', 1),
(2280, 146, 'YG', 'Yangon', 1),
(2281, 146, 'CH', 'Chin State', 1),
(2282, 146, 'KC', 'Kachin State', 1),
(2283, 146, 'KH', 'Kayah State', 1),
(2284, 146, 'KN', 'Kayin State', 1),
(2285, 146, 'MN', 'Mon State', 1),
(2286, 146, 'RK', 'Rakhine State', 1),
(2287, 146, 'SH', 'Shan State', 1),
(2288, 147, 'CA', 'Caprivi', 1),
(2289, 147, 'ER', 'Erongo', 1),
(2290, 147, 'HA', 'Hardap', 1),
(2291, 147, 'KR', 'Karas', 1),
(2292, 147, 'KV', 'Kavango', 1),
(2293, 147, 'KH', 'Khomas', 1),
(2294, 147, 'KU', 'Kunene', 1),
(2295, 147, 'OW', 'Ohangwena', 1),
(2296, 147, 'OK', 'Omaheke', 1),
(2297, 147, 'OT', 'Omusati', 1),
(2298, 147, 'ON', 'Oshana', 1),
(2299, 147, 'OO', 'Oshikoto', 1),
(2300, 147, 'OJ', 'Otjozondjupa', 1),
(2301, 148, 'AO', 'Aiwo', 1),
(2302, 148, 'AA', 'Anabar', 1),
(2303, 148, 'AT', 'Anetan', 1),
(2304, 148, 'AI', 'Anibare', 1),
(2305, 148, 'BA', 'Baiti', 1),
(2306, 148, 'BO', 'Boe', 1),
(2307, 148, 'BU', 'Buada', 1),
(2308, 148, 'DE', 'Denigomodu', 1),
(2309, 148, 'EW', 'Ewa', 1),
(2310, 148, 'IJ', 'Ijuw', 1),
(2311, 148, 'ME', 'Meneng', 1),
(2312, 148, 'NI', 'Nibok', 1),
(2313, 148, 'UA', 'Uaboe', 1),
(2314, 148, 'YA', 'Yaren', 1),
(2315, 149, 'BA', 'Bagmati', 1),
(2316, 149, 'BH', 'Bheri', 1),
(2317, 149, 'DH', 'Dhawalagiri', 1),
(2318, 149, 'GA', 'Gandaki', 1),
(2319, 149, 'JA', 'Janakpur', 1),
(2320, 149, 'KA', 'Karnali', 1),
(2321, 149, 'KO', 'Kosi', 1),
(2322, 149, 'LU', 'Lumbini', 1),
(2323, 149, 'MA', 'Mahakali', 1),
(2324, 149, 'ME', 'Mechi', 1),
(2325, 149, 'NA', 'Narayani', 1),
(2326, 149, 'RA', 'Rapti', 1),
(2327, 149, 'SA', 'Sagarmatha', 1),
(2328, 149, 'SE', 'Seti', 1),
(2329, 150, 'DR', 'Drenthe', 1),
(2330, 150, 'FL', 'Flevoland', 1),
(2331, 150, 'FR', 'Friesland', 1),
(2332, 150, 'GE', 'Gelderland', 1),
(2333, 150, 'GR', 'Groningen', 1),
(2334, 150, 'LI', 'Limburg', 1),
(2335, 150, 'NB', 'Noord Brabant', 1),
(2336, 150, 'NH', 'Noord Holland', 1),
(2337, 150, 'OV', 'Overijssel', 1),
(2338, 150, 'UT', 'Utrecht', 1),
(2339, 150, 'ZE', 'Zeeland', 1),
(2340, 150, 'ZH', 'Zuid Holland', 1),
(2341, 152, 'L', 'Iles Loyaute', 1),
(2342, 152, 'N', 'Nord', 1),
(2343, 152, 'S', 'Sud', 1),
(2344, 153, 'AUK', 'Auckland', 1),
(2345, 153, 'BOP', 'Bay of Plenty', 1),
(2346, 153, 'CAN', 'Canterbury', 1),
(2347, 153, 'COR', 'Coromandel', 1),
(2348, 153, 'GIS', 'Gisborne', 1),
(2349, 153, 'FIO', 'Fiordland', 1),
(2350, 153, 'HKB', 'Hawke''s Bay', 1),
(2351, 153, 'MBH', 'Marlborough', 1),
(2352, 153, 'MWT', 'Manawatu-Wanganui', 1),
(2353, 153, 'MCM', 'Mt Cook-Mackenzie', 1),
(2354, 153, 'NSN', 'Nelson', 1),
(2355, 153, 'NTL', 'Northland', 1),
(2356, 153, 'OTA', 'Otago', 1),
(2357, 153, 'STL', 'Southland', 1),
(2358, 153, 'TKI', 'Taranaki', 1),
(2359, 153, 'WGN', 'Wellington', 1),
(2360, 153, 'WKO', 'Waikato', 1),
(2361, 153, 'WAI', 'Wairprarapa', 1),
(2362, 153, 'WTC', 'West Coast', 1),
(2363, 154, 'AN', 'Atlantico Norte', 1),
(2364, 154, 'AS', 'Atlantico Sur', 1),
(2365, 154, 'BO', 'Boaco', 1),
(2366, 154, 'CA', 'Carazo', 1),
(2367, 154, 'CI', 'Chinandega', 1),
(2368, 154, 'CO', 'Chontales', 1),
(2369, 154, 'ES', 'Esteli', 1),
(2370, 154, 'GR', 'Granada', 1),
(2371, 154, 'JI', 'Jinotega', 1),
(2372, 154, 'LE', 'Leon', 1),
(2373, 154, 'MD', 'Madriz', 1),
(2374, 154, 'MN', 'Managua', 1),
(2375, 154, 'MS', 'Masaya', 1),
(2376, 154, 'MT', 'Matagalpa', 1),
(2377, 154, 'NS', 'Nuevo Segovia', 1),
(2378, 154, 'RS', 'Rio San Juan', 1),
(2379, 154, 'RI', 'Rivas', 1),
(2380, 155, 'AG', 'Agadez', 1),
(2381, 155, 'DF', 'Diffa', 1),
(2382, 155, 'DS', 'Dosso', 1),
(2383, 155, 'MA', 'Maradi', 1),
(2384, 155, 'NM', 'Niamey', 1),
(2385, 155, 'TH', 'Tahoua', 1),
(2386, 155, 'TL', 'Tillaberi', 1),
(2387, 155, 'ZD', 'Zinder', 1),
(2388, 156, 'AB', 'Abia', 1),
(2389, 156, 'CT', 'Abuja Federal Capital Territory', 1),
(2390, 156, 'AD', 'Adamawa', 1),
(2391, 156, 'AK', 'Akwa Ibom', 1),
(2392, 156, 'AN', 'Anambra', 1),
(2393, 156, 'BC', 'Bauchi', 1),
(2394, 156, 'BY', 'Bayelsa', 1),
(2395, 156, 'BN', 'Benue', 1),
(2396, 156, 'BO', 'Borno', 1),
(2397, 156, 'CR', 'Cross River', 1),
(2398, 156, 'DE', 'Delta', 1),
(2399, 156, 'EB', 'Ebonyi', 1),
(2400, 156, 'ED', 'Edo', 1),
(2401, 156, 'EK', 'Ekiti', 1),
(2402, 156, 'EN', 'Enugu', 1),
(2403, 156, 'GO', 'Gombe', 1),
(2404, 156, 'IM', 'Imo', 1),
(2405, 156, 'JI', 'Jigawa', 1),
(2406, 156, 'KD', 'Kaduna', 1),
(2407, 156, 'KN', 'Kano', 1),
(2408, 156, 'KT', 'Katsina', 1),
(2409, 156, 'KE', 'Kebbi', 1),
(2410, 156, 'KO', 'Kogi', 1),
(2411, 156, 'KW', 'Kwara', 1),
(2412, 156, 'LA', 'Lagos', 1),
(2413, 156, 'NA', 'Nassarawa', 1),
(2414, 156, 'NI', 'Niger', 1),
(2415, 156, 'OG', 'Ogun', 1),
(2416, 156, 'ONG', 'Ondo', 1),
(2417, 156, 'OS', 'Osun', 1),
(2418, 156, 'OY', 'Oyo', 1),
(2419, 156, 'PL', 'Plateau', 1),
(2420, 156, 'RI', 'Rivers', 1),
(2421, 156, 'SO', 'Sokoto', 1),
(2422, 156, 'TA', 'Taraba', 1),
(2423, 156, 'YO', 'Yobe', 1),
(2424, 156, 'ZA', 'Zamfara', 1),
(2425, 159, 'N', 'Northern Islands', 1),
(2426, 159, 'R', 'Rota', 1),
(2427, 159, 'S', 'Saipan', 1),
(2428, 159, 'T', 'Tinian', 1),
(2429, 160, 'AK', 'Akershus', 1),
(2430, 160, 'AA', 'Aust-Agder', 1),
(2431, 160, 'BU', 'Buskerud', 1),
(2432, 160, 'FM', 'Finnmark', 1),
(2433, 160, 'HM', 'Hedmark', 1),
(2434, 160, 'HL', 'Hordaland', 1),
(2435, 160, 'MR', 'More og Romdal', 1),
(2436, 160, 'NT', 'Nord-Trondelag', 1),
(2437, 160, 'NL', 'Nordland', 1),
(2438, 160, 'OF', 'Ostfold', 1),
(2439, 160, 'OP', 'Oppland', 1),
(2440, 160, 'OL', 'Oslo', 1),
(2441, 160, 'RL', 'Rogaland', 1),
(2442, 160, 'ST', 'Sor-Trondelag', 1),
(2443, 160, 'SJ', 'Sogn og Fjordane', 1),
(2444, 160, 'SV', 'Svalbard', 1),
(2445, 160, 'TM', 'Telemark', 1),
(2446, 160, 'TR', 'Troms', 1),
(2447, 160, 'VA', 'Vest-Agder', 1),
(2448, 160, 'VF', 'Vestfold', 1),
(2449, 161, 'DA', 'Ad Dakhiliyah', 1),
(2450, 161, 'BA', 'Al Batinah', 1),
(2451, 161, 'WU', 'Al Wusta', 1),
(2452, 161, 'SH', 'Ash Sharqiyah', 1),
(2453, 161, 'ZA', 'Az Zahirah', 1),
(2454, 161, 'MA', 'Masqat', 1),
(2455, 161, 'MU', 'Musandam', 1),
(2456, 161, 'ZU', 'Zufar', 1),
(2457, 162, 'B', 'Balochistan', 1),
(2458, 162, 'T', 'Federally Administered Tribal Areas', 1),
(2459, 162, 'I', 'Islamabad Capital Territory', 1),
(2460, 162, 'N', 'North-West Frontier', 1),
(2461, 162, 'P', 'Punjab', 1),
(2462, 162, 'S', 'Sindh', 1),
(2463, 163, 'AM', 'Aimeliik', 1),
(2464, 163, 'AR', 'Airai', 1),
(2465, 163, 'AN', 'Angaur', 1),
(2466, 163, 'HA', 'Hatohobei', 1),
(2467, 163, 'KA', 'Kayangel', 1),
(2468, 163, 'KO', 'Koror', 1),
(2469, 163, 'ME', 'Melekeok', 1),
(2470, 163, 'NA', 'Ngaraard', 1),
(2471, 163, 'NG', 'Ngarchelong', 1),
(2472, 163, 'ND', 'Ngardmau', 1),
(2473, 163, 'NT', 'Ngatpang', 1),
(2474, 163, 'NC', 'Ngchesar', 1),
(2475, 163, 'NR', 'Ngeremlengui', 1),
(2476, 163, 'NW', 'Ngiwal', 1),
(2477, 163, 'PE', 'Peleliu', 1),
(2478, 163, 'SO', 'Sonsorol', 1),
(2479, 164, 'BT', 'Bocas del Toro', 1),
(2480, 164, 'CH', 'Chiriqui', 1),
(2481, 164, 'CC', 'Cocle', 1),
(2482, 164, 'CL', 'Colon', 1),
(2483, 164, 'DA', 'Darien', 1),
(2484, 164, 'HE', 'Herrera', 1),
(2485, 164, 'LS', 'Los Santos', 1),
(2486, 164, 'PA', 'Panama', 1),
(2487, 164, 'SB', 'San Blas', 1),
(2488, 164, 'VG', 'Veraguas', 1),
(2489, 165, 'BV', 'Bougainville', 1),
(2490, 165, 'CE', 'Central', 1),
(2491, 165, 'CH', 'Chimbu', 1),
(2492, 165, 'EH', 'Eastern Highlands', 1),
(2493, 165, 'EB', 'East New Britain', 1),
(2494, 165, 'ES', 'East Sepik', 1),
(2495, 165, 'EN', 'Enga', 1),
(2496, 165, 'GU', 'Gulf', 1),
(2497, 165, 'MD', 'Madang', 1),
(2498, 165, 'MN', 'Manus', 1),
(2499, 165, 'MB', 'Milne Bay', 1),
(2500, 165, 'MR', 'Morobe', 1),
(2501, 165, 'NC', 'National Capital', 1),
(2502, 165, 'NI', 'New Ireland', 1),
(2503, 165, 'NO', 'Northern', 1),
(2504, 165, 'SA', 'Sandaun', 1),
(2505, 165, 'SH', 'Southern Highlands', 1),
(2506, 165, 'WE', 'Western', 1),
(2507, 165, 'WH', 'Western Highlands', 1),
(2508, 165, 'WB', 'West New Britain', 1),
(2509, 166, 'AG', 'Alto Paraguay', 1),
(2510, 166, 'AN', 'Alto Parana', 1),
(2511, 166, 'AM', 'Amambay', 1),
(2512, 166, 'AS', 'Asuncion', 1),
(2513, 166, 'BO', 'Boqueron', 1),
(2514, 166, 'CG', 'Caaguazu', 1),
(2515, 166, 'CZ', 'Caazapa', 1),
(2516, 166, 'CN', 'Canindeyu', 1),
(2517, 166, 'CE', 'Central', 1),
(2518, 166, 'CC', 'Concepcion', 1),
(2519, 166, 'CD', 'Cordillera', 1),
(2520, 166, 'GU', 'Guaira', 1),
(2521, 166, 'IT', 'Itapua', 1),
(2522, 166, 'MI', 'Misiones', 1),
(2523, 166, 'NE', 'Neembucu', 1),
(2524, 166, 'PA', 'Paraguari', 1),
(2525, 166, 'PH', 'Presidente Hayes', 1),
(2526, 166, 'SP', 'San Pedro', 1),
(2527, 167, 'AM', 'Amazonas', 1),
(2528, 167, 'AN', 'Ancash', 1),
(2529, 167, 'AP', 'Apurimac', 1),
(2530, 167, 'AR', 'Arequipa', 1),
(2531, 167, 'AY', 'Ayacucho', 1),
(2532, 167, 'CJ', 'Cajamarca', 1),
(2533, 167, 'CL', 'Callao', 1),
(2534, 167, 'CU', 'Cusco', 1),
(2535, 167, 'HV', 'Huancavelica', 1),
(2536, 167, 'HO', 'Huanuco', 1),
(2537, 167, 'IC', 'Ica', 1),
(2538, 167, 'JU', 'Junin', 1),
(2539, 167, 'LD', 'La Libertad', 1),
(2540, 167, 'LY', 'Lambayeque', 1),
(2541, 167, 'LI', 'Lima', 1),
(2542, 167, 'LO', 'Loreto', 1),
(2543, 167, 'MD', 'Madre de Dios', 1),
(2544, 167, 'MO', 'Moquegua', 1),
(2545, 167, 'PA', 'Pasco', 1),
(2546, 167, 'PI', 'Piura', 1),
(2547, 167, 'PU', 'Puno', 1),
(2548, 167, 'SM', 'San Martin', 1),
(2549, 167, 'TA', 'Tacna', 1),
(2550, 167, 'TU', 'Tumbes', 1),
(2551, 167, 'UC', 'Ucayali', 1),
(2552, 168, 'ABR', 'Abra', 1),
(2553, 168, 'ANO', 'Agusan del Norte', 1),
(2554, 168, 'ASU', 'Agusan del Sur', 1),
(2555, 168, 'AKL', 'Aklan', 1),
(2556, 168, 'ALB', 'Albay', 1),
(2557, 168, 'ANT', 'Antique', 1),
(2558, 168, 'APY', 'Apayao', 1),
(2559, 168, 'AUR', 'Aurora', 1),
(2560, 168, 'BAS', 'Basilan', 1),
(2561, 168, 'BTA', 'Bataan', 1),
(2562, 168, 'BTE', 'Batanes', 1),
(2563, 168, 'BTG', 'Batangas', 1),
(2564, 168, 'BLR', 'Biliran', 1),
(2565, 168, 'BEN', 'Benguet', 1),
(2566, 168, 'BOL', 'Bohol', 1),
(2567, 168, 'BUK', 'Bukidnon', 1),
(2568, 168, 'BUL', 'Bulacan', 1),
(2569, 168, 'CAG', 'Cagayan', 1),
(2570, 168, 'CNO', 'Camarines Norte', 1),
(2571, 168, 'CSU', 'Camarines Sur', 1),
(2572, 168, 'CAM', 'Camiguin', 1),
(2573, 168, 'CAP', 'Capiz', 1),
(2574, 168, 'CAT', 'Catanduanes', 1),
(2575, 168, 'CAV', 'Cavite', 1),
(2576, 168, 'CEB', 'Cebu', 1),
(2577, 168, 'CMP', 'Compostela', 1),
(2578, 168, 'DNO', 'Davao del Norte', 1),
(2579, 168, 'DSU', 'Davao del Sur', 1),
(2580, 168, 'DOR', 'Davao Oriental', 1),
(2581, 168, 'ESA', 'Eastern Samar', 1),
(2582, 168, 'GUI', 'Guimaras', 1),
(2583, 168, 'IFU', 'Ifugao', 1),
(2584, 168, 'INO', 'Ilocos Norte', 1),
(2585, 168, 'ISU', 'Ilocos Sur', 1),
(2586, 168, 'ILO', 'Iloilo', 1),
(2587, 168, 'ISA', 'Isabela', 1),
(2588, 168, 'KAL', 'Kalinga', 1),
(2589, 168, 'LAG', 'Laguna', 1),
(2590, 168, 'LNO', 'Lanao del Norte', 1),
(2591, 168, 'LSU', 'Lanao del Sur', 1),
(2592, 168, 'UNI', 'La Union', 1),
(2593, 168, 'LEY', 'Leyte', 1),
(2594, 168, 'MAG', 'Maguindanao', 1),
(2595, 168, 'MRN', 'Marinduque', 1),
(2596, 168, 'MSB', 'Masbate', 1),
(2597, 168, 'MIC', 'Mindoro Occidental', 1),
(2598, 168, 'MIR', 'Mindoro Oriental', 1),
(2599, 168, 'MSC', 'Misamis Occidental', 1),
(2600, 168, 'MOR', 'Misamis Oriental', 1),
(2601, 168, 'MOP', 'Mountain', 1),
(2602, 168, 'NOC', 'Negros Occidental', 1),
(2603, 168, 'NOR', 'Negros Oriental', 1),
(2604, 168, 'NCT', 'North Cotabato', 1),
(2605, 168, 'NSM', 'Northern Samar', 1),
(2606, 168, 'NEC', 'Nueva Ecija', 1),
(2607, 168, 'NVZ', 'Nueva Vizcaya', 1),
(2608, 168, 'PLW', 'Palawan', 1),
(2609, 168, 'PMP', 'Pampanga', 1),
(2610, 168, 'PNG', 'Pangasinan', 1),
(2611, 168, 'QZN', 'Quezon', 1),
(2612, 168, 'QRN', 'Quirino', 1),
(2613, 168, 'RIZ', 'Rizal', 1),
(2614, 168, 'ROM', 'Romblon', 1),
(2615, 168, 'SMR', 'Samar', 1),
(2616, 168, 'SRG', 'Sarangani', 1),
(2617, 168, 'SQJ', 'Siquijor', 1),
(2618, 168, 'SRS', 'Sorsogon', 1),
(2619, 168, 'SCO', 'South Cotabato', 1),
(2620, 168, 'SLE', 'Southern Leyte', 1),
(2621, 168, 'SKU', 'Sultan Kudarat', 1),
(2622, 168, 'SLU', 'Sulu', 1),
(2623, 168, 'SNO', 'Surigao del Norte', 1),
(2624, 168, 'SSU', 'Surigao del Sur', 1),
(2625, 168, 'TAR', 'Tarlac', 1),
(2626, 168, 'TAW', 'Tawi-Tawi', 1),
(2627, 168, 'ZBL', 'Zambales', 1),
(2628, 168, 'ZNO', 'Zamboanga del Norte', 1),
(2629, 168, 'ZSU', 'Zamboanga del Sur', 1),
(2630, 168, 'ZSI', 'Zamboanga Sibugay', 1),
(2631, 170, 'DO', 'Dolnoslaskie', 1),
(2632, 170, 'KP', 'Kujawsko-Pomorskie', 1),
(2633, 170, 'LO', 'Lodzkie', 1),
(2634, 170, 'LL', 'Lubelskie', 1),
(2635, 170, 'LU', 'Lubuskie', 1),
(2636, 170, 'ML', 'Malopolskie', 1),
(2637, 170, 'MZ', 'Mazowieckie', 1),
(2638, 170, 'OP', 'Opolskie', 1),
(2639, 170, 'PP', 'Podkarpackie', 1),
(2640, 170, 'PL', 'Podlaskie', 1),
(2641, 170, 'PM', 'Pomorskie', 1),
(2642, 170, 'SL', 'Slaskie', 1),
(2643, 170, 'SW', 'Swietokrzyskie', 1),
(2644, 170, 'WM', 'Warminsko-Mazurskie', 1),
(2645, 170, 'WP', 'Wielkopolskie', 1),
(2646, 170, 'ZA', 'Zachodniopomorskie', 1),
(2647, 198, 'P', 'Saint Pierre', 1),
(2648, 198, 'M', 'Miquelon', 1),
(2649, 171, 'AC', 'A&ccedil;ores', 1),
(2650, 171, 'AV', 'Aveiro', 1),
(2651, 171, 'BE', 'Beja', 1),
(2652, 171, 'BR', 'Braga', 1),
(2653, 171, 'BA', 'Bragan&ccedil;a', 1),
(2654, 171, 'CB', 'Castelo Branco', 1),
(2655, 171, 'CO', 'Coimbra', 1),
(2656, 171, 'EV', '&Eacute;vora', 1),
(2657, 171, 'FA', 'Faro', 1),
(2658, 171, 'GU', 'Guarda', 1),
(2659, 171, 'LE', 'Leiria', 1),
(2660, 171, 'LI', 'Lisboa', 1),
(2661, 171, 'ME', 'Madeira', 1),
(2662, 171, 'PO', 'Portalegre', 1),
(2663, 171, 'PR', 'Porto', 1),
(2664, 171, 'SA', 'Santar&eacute;m', 1),
(2665, 171, 'SE', 'Set&uacute;bal', 1),
(2666, 171, 'VC', 'Viana do Castelo', 1),
(2667, 171, 'VR', 'Vila Real', 1),
(2668, 171, 'VI', 'Viseu', 1),
(2669, 173, 'DW', 'Ad Dawhah', 1),
(2670, 173, 'GW', 'Al Ghuwayriyah', 1),
(2671, 173, 'JM', 'Al Jumayliyah', 1),
(2672, 173, 'KR', 'Al Khawr', 1),
(2673, 173, 'WK', 'Al Wakrah', 1),
(2674, 173, 'RN', 'Ar Rayyan', 1),
(2675, 173, 'JB', 'Jarayan al Batinah', 1),
(2676, 173, 'MS', 'Madinat ash Shamal', 1),
(2677, 173, 'UD', 'Umm Sa''id', 1),
(2678, 173, 'UL', 'Umm Salal', 1),
(2679, 175, 'AB', 'Alba', 1),
(2680, 175, 'AR', 'Arad', 1),
(2681, 175, 'AG', 'Arges', 1),
(2682, 175, 'BC', 'Bacau', 1),
(2683, 175, 'BH', 'Bihor', 1),
(2684, 175, 'BN', 'Bistrita-Nasaud', 1),
(2685, 175, 'BT', 'Botosani', 1),
(2686, 175, 'BV', 'Brasov', 1),
(2687, 175, 'BR', 'Braila', 1),
(2688, 175, 'B', 'Bucuresti', 1),
(2689, 175, 'BZ', 'Buzau', 1),
(2690, 175, 'CS', 'Caras-Severin', 1),
(2691, 175, 'CL', 'Calarasi', 1),
(2692, 175, 'CJ', 'Cluj', 1),
(2693, 175, 'CT', 'Constanta', 1),
(2694, 175, 'CV', 'Covasna', 1),
(2695, 175, 'DB', 'Dimbovita', 1),
(2696, 175, 'DJ', 'Dolj', 1),
(2697, 175, 'GL', 'Galati', 1),
(2698, 175, 'GR', 'Giurgiu', 1),
(2699, 175, 'GJ', 'Gorj', 1),
(2700, 175, 'HR', 'Harghita', 1),
(2701, 175, 'HD', 'Hunedoara', 1),
(2702, 175, 'IL', 'Ialomita', 1),
(2703, 175, 'IS', 'Iasi', 1),
(2704, 175, 'IF', 'Ilfov', 1),
(2705, 175, 'MM', 'Maramures', 1),
(2706, 175, 'MH', 'Mehedinti', 1),
(2707, 175, 'MS', 'Mures', 1),
(2708, 175, 'NT', 'Neamt', 1),
(2709, 175, 'OT', 'Olt', 1),
(2710, 175, 'PH', 'Prahova', 1),
(2711, 175, 'SM', 'Satu-Mare', 1),
(2712, 175, 'SJ', 'Salaj', 1),
(2713, 175, 'SB', 'Sibiu', 1),
(2714, 175, 'SV', 'Suceava', 1),
(2715, 175, 'TR', 'Teleorman', 1),
(2716, 175, 'TM', 'Timis', 1),
(2717, 175, 'TL', 'Tulcea', 1),
(2718, 175, 'VS', 'Vaslui', 1),
(2719, 175, 'VL', 'Valcea', 1),
(2720, 175, 'VN', 'Vrancea', 1),
(2721, 176, 'AB', 'Abakan', 1),
(2722, 176, 'AG', 'Aginskoye', 1),
(2723, 176, 'AN', 'Anadyr', 1),
(2724, 176, 'AR', 'Arkahangelsk', 1),
(2725, 176, 'AS', 'Astrakhan', 1),
(2726, 176, 'BA', 'Barnaul', 1),
(2727, 176, 'BE', 'Belgorod', 1),
(2728, 176, 'BI', 'Birobidzhan', 1),
(2729, 176, 'BL', 'Blagoveshchensk', 1),
(2730, 176, 'BR', 'Bryansk', 1),
(2731, 176, 'CH', 'Cheboksary', 1),
(2732, 176, 'CL', 'Chelyabinsk', 1),
(2733, 176, 'CR', 'Cherkessk', 1),
(2734, 176, 'CI', 'Chita', 1),
(2735, 176, 'DU', 'Dudinka', 1),
(2736, 176, 'EL', 'Elista', 1),
(2737, 176, 'GO', 'Gomo-Altaysk', 1),
(2738, 176, 'GA', 'Gorno-Altaysk', 1),
(2739, 176, 'GR', 'Groznyy', 1),
(2740, 176, 'IR', 'Irkutsk', 1),
(2741, 176, 'IV', 'Ivanovo', 1),
(2742, 176, 'IZ', 'Izhevsk', 1),
(2743, 176, 'KA', 'Kalinigrad', 1),
(2744, 176, 'KL', 'Kaluga', 1),
(2745, 176, 'KS', 'Kasnodar', 1),
(2746, 176, 'KZ', 'Kazan', 1),
(2747, 176, 'KE', 'Kemerovo', 1),
(2748, 176, 'KH', 'Khabarovsk', 1),
(2749, 176, 'KM', 'Khanty-Mansiysk', 1),
(2750, 176, 'KO', 'Kostroma', 1),
(2751, 176, 'KR', 'Krasnodar', 1),
(2752, 176, 'KN', 'Krasnoyarsk', 1),
(2753, 176, 'KU', 'Kudymkar', 1),
(2754, 176, 'KG', 'Kurgan', 1),
(2755, 176, 'KK', 'Kursk', 1),
(2756, 176, 'KY', 'Kyzyl', 1),
(2757, 176, 'LI', 'Lipetsk', 1),
(2758, 176, 'MA', 'Magadan', 1),
(2759, 176, 'MK', 'Makhachkala', 1),
(2760, 176, 'MY', 'Maykop', 1),
(2761, 176, 'MO', 'Moscow', 1),
(2762, 176, 'MU', 'Murmansk', 1),
(2763, 176, 'NA', 'Nalchik', 1),
(2764, 176, 'NR', 'Naryan Mar', 1),
(2765, 176, 'NZ', 'Nazran', 1),
(2766, 176, 'NI', 'Nizhniy Novgorod', 1),
(2767, 176, 'NO', 'Novgorod', 1),
(2768, 176, 'NV', 'Novosibirsk', 1),
(2769, 176, 'OM', 'Omsk', 1),
(2770, 176, 'OR', 'Orel', 1),
(2771, 176, 'OE', 'Orenburg', 1),
(2772, 176, 'PA', 'Palana', 1),
(2773, 176, 'PE', 'Penza', 1),
(2774, 176, 'PR', 'Perm', 1),
(2775, 176, 'PK', 'Petropavlovsk-Kamchatskiy', 1),
(2776, 176, 'PT', 'Petrozavodsk', 1),
(2777, 176, 'PS', 'Pskov', 1),
(2778, 176, 'RO', 'Rostov-na-Donu', 1),
(2779, 176, 'RY', 'Ryazan', 1),
(2780, 176, 'SL', 'Salekhard', 1),
(2781, 176, 'SA', 'Samara', 1),
(2782, 176, 'SR', 'Saransk', 1),
(2783, 176, 'SV', 'Saratov', 1),
(2784, 176, 'SM', 'Smolensk', 1),
(2785, 176, 'SP', 'St. Petersburg', 1),
(2786, 176, 'ST', 'Stavropol', 1),
(2787, 176, 'SY', 'Syktyvkar', 1),
(2788, 176, 'TA', 'Tambov', 1),
(2789, 176, 'TO', 'Tomsk', 1),
(2790, 176, 'TU', 'Tula', 1),
(2791, 176, 'TR', 'Tura', 1),
(2792, 176, 'TV', 'Tver', 1),
(2793, 176, 'TY', 'Tyumen', 1),
(2794, 176, 'UF', 'Ufa', 1),
(2795, 176, 'UL', 'Ul''yanovsk', 1),
(2796, 176, 'UU', 'Ulan-Ude', 1),
(2797, 176, 'US', 'Ust''-Ordynskiy', 1),
(2798, 176, 'VL', 'Vladikavkaz', 1),
(2799, 176, 'VA', 'Vladimir', 1),
(2800, 176, 'VV', 'Vladivostok', 1),
(2801, 176, 'VG', 'Volgograd', 1),
(2802, 176, 'VD', 'Vologda', 1),
(2803, 176, 'VO', 'Voronezh', 1),
(2804, 176, 'VY', 'Vyatka', 1),
(2805, 176, 'YA', 'Yakutsk', 1),
(2806, 176, 'YR', 'Yaroslavl', 1),
(2807, 176, 'YE', 'Yekaterinburg', 1),
(2808, 176, 'YO', 'Yoshkar-Ola', 1),
(2809, 177, 'BU', 'Butare', 1),
(2810, 177, 'BY', 'Byumba', 1),
(2811, 177, 'CY', 'Cyangugu', 1),
(2812, 177, 'GK', 'Gikongoro', 1),
(2813, 177, 'GS', 'Gisenyi', 1),
(2814, 177, 'GT', 'Gitarama', 1),
(2815, 177, 'KG', 'Kibungo', 1),
(2816, 177, 'KY', 'Kibuye', 1),
(2817, 177, 'KR', 'Kigali Rurale', 1),
(2818, 177, 'KV', 'Kigali-ville', 1),
(2819, 177, 'RU', 'Ruhengeri', 1),
(2820, 177, 'UM', 'Umutara', 1),
(2821, 178, 'CCN', 'Christ Church Nichola Town', 1),
(2822, 178, 'SAS', 'Saint Anne Sandy Point', 1),
(2823, 178, 'SGB', 'Saint George Basseterre', 1),
(2824, 178, 'SGG', 'Saint George Gingerland', 1),
(2825, 178, 'SJW', 'Saint James Windward', 1),
(2826, 178, 'SJC', 'Saint John Capesterre', 1),
(2827, 178, 'SJF', 'Saint John Figtree', 1),
(2828, 178, 'SMC', 'Saint Mary Cayon', 1),
(2829, 178, 'CAP', 'Saint Paul Capesterre', 1),
(2830, 178, 'CHA', 'Saint Paul Charlestown', 1),
(2831, 178, 'SPB', 'Saint Peter Basseterre', 1),
(2832, 178, 'STL', 'Saint Thomas Lowland', 1),
(2833, 178, 'STM', 'Saint Thomas Middle Island', 1),
(2834, 178, 'TPP', 'Trinity Palmetto Point', 1),
(2835, 179, 'AR', 'Anse-la-Raye', 1),
(2836, 179, 'CA', 'Castries', 1),
(2837, 179, 'CH', 'Choiseul', 1),
(2838, 179, 'DA', 'Dauphin', 1),
(2839, 179, 'DE', 'Dennery', 1),
(2840, 179, 'GI', 'Gros-Islet', 1),
(2841, 179, 'LA', 'Laborie', 1),
(2842, 179, 'MI', 'Micoud', 1),
(2843, 179, 'PR', 'Praslin', 1),
(2844, 179, 'SO', 'Soufriere', 1),
(2845, 179, 'VF', 'Vieux-Fort', 1),
(2846, 180, 'C', 'Charlotte', 1),
(2847, 180, 'R', 'Grenadines', 1),
(2848, 180, 'A', 'Saint Andrew', 1),
(2849, 180, 'D', 'Saint David', 1),
(2850, 180, 'G', 'Saint George', 1),
(2851, 180, 'P', 'Saint Patrick', 1),
(2852, 181, 'AN', 'A''ana', 1),
(2853, 181, 'AI', 'Aiga-i-le-Tai', 1),
(2854, 181, 'AT', 'Atua', 1),
(2855, 181, 'FA', 'Fa''asaleleaga', 1),
(2856, 181, 'GE', 'Gaga''emauga', 1),
(2857, 181, 'GF', 'Gagaifomauga', 1),
(2858, 181, 'PA', 'Palauli', 1),
(2859, 181, 'SA', 'Satupa''itea', 1),
(2860, 181, 'TU', 'Tuamasaga', 1),
(2861, 181, 'VF', 'Va''a-o-Fonoti', 1),
(2862, 181, 'VS', 'Vaisigano', 1),
(2863, 182, 'AC', 'Acquaviva', 1),
(2864, 182, 'BM', 'Borgo Maggiore', 1),
(2865, 182, 'CH', 'Chiesanuova', 1),
(2866, 182, 'DO', 'Domagnano', 1),
(2867, 182, 'FA', 'Faetano', 1),
(2868, 182, 'FI', 'Fiorentino', 1),
(2869, 182, 'MO', 'Montegiardino', 1),
(2870, 182, 'SM', 'Citta di San Marino', 1),
(2871, 182, 'SE', 'Serravalle', 1),
(2872, 183, 'S', 'Sao Tome', 1),
(2873, 183, 'P', 'Principe', 1),
(2874, 184, 'BH', 'Al Bahah', 1),
(2875, 184, 'HS', 'Al Hudud ash Shamaliyah', 1),
(2876, 184, 'JF', 'Al Jawf', 1),
(2877, 184, 'MD', 'Al Madinah', 1),
(2878, 184, 'QS', 'Al Qasim', 1),
(2879, 184, 'RD', 'Ar Riyad', 1),
(2880, 184, 'AQ', 'Ash Sharqiyah (Eastern)', 1),
(2881, 184, 'AS', '''Asir', 1),
(2882, 184, 'HL', 'Ha''il', 1),
(2883, 184, 'JZ', 'Jizan', 1),
(2884, 184, 'ML', 'Makkah', 1),
(2885, 184, 'NR', 'Najran', 1),
(2886, 184, 'TB', 'Tabuk', 1),
(2887, 185, 'DA', 'Dakar', 1),
(2888, 185, 'DI', 'Diourbel', 1),
(2889, 185, 'FA', 'Fatick', 1),
(2890, 185, 'KA', 'Kaolack', 1),
(2891, 185, 'KO', 'Kolda', 1),
(2892, 185, 'LO', 'Louga', 1),
(2893, 185, 'MA', 'Matam', 1),
(2894, 185, 'SL', 'Saint-Louis', 1),
(2895, 185, 'TA', 'Tambacounda', 1),
(2896, 185, 'TH', 'Thies', 1),
(2897, 185, 'ZI', 'Ziguinchor', 1),
(2898, 186, 'AP', 'Anse aux Pins', 1),
(2899, 186, 'AB', 'Anse Boileau', 1),
(2900, 186, 'AE', 'Anse Etoile', 1),
(2901, 186, 'AL', 'Anse Louis', 1),
(2902, 186, 'AR', 'Anse Royale', 1),
(2903, 186, 'BL', 'Baie Lazare', 1),
(2904, 186, 'BS', 'Baie Sainte Anne', 1),
(2905, 186, 'BV', 'Beau Vallon', 1),
(2906, 186, 'BA', 'Bel Air', 1),
(2907, 186, 'BO', 'Bel Ombre', 1),
(2908, 186, 'CA', 'Cascade', 1),
(2909, 186, 'GL', 'Glacis', 1),
(2910, 186, 'GM', 'Grand'' Anse (on Mahe)', 1),
(2911, 186, 'GP', 'Grand'' Anse (on Praslin)', 1),
(2912, 186, 'DG', 'La Digue', 1),
(2913, 186, 'RA', 'La Riviere Anglaise', 1),
(2914, 186, 'MB', 'Mont Buxton', 1),
(2915, 186, 'MF', 'Mont Fleuri', 1),
(2916, 186, 'PL', 'Plaisance', 1),
(2917, 186, 'PR', 'Pointe La Rue', 1),
(2918, 186, 'PG', 'Port Glaud', 1),
(2919, 186, 'SL', 'Saint Louis', 1),
(2920, 186, 'TA', 'Takamaka', 1),
(2921, 187, 'E', 'Eastern', 1),
(2922, 187, 'N', 'Northern', 1),
(2923, 187, 'S', 'Southern', 1),
(2924, 187, 'W', 'Western', 1),
(2925, 189, 'BA', 'Banskobystrický', 1),
(2926, 189, 'BR', 'Bratislavský', 1),
(2927, 189, 'KO', 'Košický', 1),
(2928, 189, 'NI', 'Nitriansky', 1),
(2929, 189, 'PR', 'Prešovský', 1),
(2930, 189, 'TC', 'Trenčiansky', 1),
(2931, 189, 'TV', 'Trnavský', 1),
(2932, 189, 'ZI', 'Žilinský', 1),
(2933, 191, 'CE', 'Central', 1),
(2934, 191, 'CH', 'Choiseul', 1),
(2935, 191, 'GC', 'Guadalcanal', 1),
(2936, 191, 'HO', 'Honiara', 1),
(2937, 191, 'IS', 'Isabel', 1),
(2938, 191, 'MK', 'Makira', 1),
(2939, 191, 'ML', 'Malaita', 1),
(2940, 191, 'RB', 'Rennell and Bellona', 1),
(2941, 191, 'TM', 'Temotu', 1),
(2942, 191, 'WE', 'Western', 1),
(2943, 192, 'AW', 'Awdal', 1),
(2944, 192, 'BK', 'Bakool', 1),
(2945, 192, 'BN', 'Banaadir', 1),
(2946, 192, 'BR', 'Bari', 1),
(2947, 192, 'BY', 'Bay', 1),
(2948, 192, 'GA', 'Galguduud', 1),
(2949, 192, 'GE', 'Gedo', 1),
(2950, 192, 'HI', 'Hiiraan', 1),
(2951, 192, 'JD', 'Jubbada Dhexe', 1),
(2952, 192, 'JH', 'Jubbada Hoose', 1),
(2953, 192, 'MU', 'Mudug', 1),
(2954, 192, 'NU', 'Nugaal', 1),
(2955, 192, 'SA', 'Sanaag', 1),
(2956, 192, 'SD', 'Shabeellaha Dhexe', 1),
(2957, 192, 'SH', 'Shabeellaha Hoose', 1),
(2958, 192, 'SL', 'Sool', 1),
(2959, 192, 'TO', 'Togdheer', 1),
(2960, 192, 'WG', 'Woqooyi Galbeed', 1),
(2961, 193, 'EC', 'Eastern Cape', 1),
(2962, 193, 'FS', 'Free State', 1),
(2963, 193, 'GT', 'Gauteng', 1),
(2964, 193, 'KN', 'KwaZulu-Natal', 1),
(2965, 193, 'LP', 'Limpopo', 1),
(2966, 193, 'MP', 'Mpumalanga', 1),
(2967, 193, 'NW', 'North West', 1),
(2968, 193, 'NC', 'Northern Cape', 1),
(2969, 193, 'WC', 'Western Cape', 1),
(2970, 195, 'CA', 'La Coru&ntilde;a', 1),
(2971, 195, 'AL', '&Aacute;lava', 1),
(2972, 195, 'AB', 'Albacete', 1),
(2973, 195, 'AC', 'Alicante', 1),
(2974, 195, 'AM', 'Almeria', 1),
(2975, 195, 'AS', 'Asturias', 1),
(2976, 195, 'AV', '&Aacute;vila', 1),
(2977, 195, 'BJ', 'Badajoz', 1),
(2978, 195, 'IB', 'Baleares', 1),
(2979, 195, 'BA', 'Barcelona', 1),
(2980, 195, 'BU', 'Burgos', 1),
(2981, 195, 'CC', 'C&aacute;ceres', 1),
(2982, 195, 'CZ', 'C&aacute;diz', 1),
(2983, 195, 'CT', 'Cantabria', 1),
(2984, 195, 'CL', 'Castell&oacute;n', 1),
(2985, 195, 'CE', 'Ceuta', 1),
(2986, 195, 'CR', 'Ciudad Real', 1),
(2987, 195, 'CD', 'C&oacute;rdoba', 1),
(2988, 195, 'CU', 'Cuenca', 1),
(2989, 195, 'GI', 'Girona', 1),
(2990, 195, 'GD', 'Granada', 1),
(2991, 195, 'GJ', 'Guadalajara', 1),
(2992, 195, 'GP', 'Guip&uacute;zcoa', 1),
(2993, 195, 'HL', 'Huelva', 1),
(2994, 195, 'HS', 'Huesca', 1),
(2995, 195, 'JN', 'Ja&eacute;n', 1),
(2996, 195, 'RJ', 'La Rioja', 1),
(2997, 195, 'PM', 'Las Palmas', 1),
(2998, 195, 'LE', 'Leon', 1),
(2999, 195, 'LL', 'Lleida', 1),
(3000, 195, 'LG', 'Lugo', 1),
(3001, 195, 'MD', 'Madrid', 1),
(3002, 195, 'MA', 'Malaga', 1),
(3003, 195, 'ML', 'Melilla', 1),
(3004, 195, 'MU', 'Murcia', 1),
(3005, 195, 'NV', 'Navarra', 1),
(3006, 195, 'OU', 'Ourense', 1),
(3007, 195, 'PL', 'Palencia', 1),
(3008, 195, 'PO', 'Pontevedra', 1),
(3009, 195, 'SL', 'Salamanca', 1),
(3010, 195, 'SC', 'Santa Cruz de Tenerife', 1),
(3011, 195, 'SG', 'Segovia', 1),
(3012, 195, 'SV', 'Sevilla', 1),
(3013, 195, 'SO', 'Soria', 1),
(3014, 195, 'TA', 'Tarragona', 1),
(3015, 195, 'TE', 'Teruel', 1),
(3016, 195, 'TO', 'Toledo', 1),
(3017, 195, 'VC', 'Valencia', 1),
(3018, 195, 'VD', 'Valladolid', 1),
(3019, 195, 'VZ', 'Vizcaya', 1),
(3020, 195, 'ZM', 'Zamora', 1),
(3021, 195, 'ZR', 'Zaragoza', 1),
(3022, 196, 'CE', 'Central', 1),
(3023, 196, 'EA', 'Eastern', 1),
(3024, 196, 'NC', 'North Central', 1),
(3025, 196, 'NO', 'Northern', 1),
(3026, 196, 'NW', 'North Western', 1),
(3027, 196, 'SA', 'Sabaragamuwa', 1),
(3028, 196, 'SO', 'Southern', 1),
(3029, 196, 'UV', 'Uva', 1),
(3030, 196, 'WE', 'Western', 1),
(3031, 197, 'A', 'Ascension', 1),
(3032, 197, 'S', 'Saint Helena', 1),
(3033, 197, 'T', 'Tristan da Cunha', 1),
(3034, 199, 'ANL', 'A''ali an Nil', 1),
(3035, 199, 'BAM', 'Al Bahr al Ahmar', 1),
(3036, 199, 'BRT', 'Al Buhayrat', 1),
(3037, 199, 'JZR', 'Al Jazirah', 1),
(3038, 199, 'KRT', 'Al Khartum', 1),
(3039, 199, 'QDR', 'Al Qadarif', 1),
(3040, 199, 'WDH', 'Al Wahdah', 1),
(3041, 199, 'ANB', 'An Nil al Abyad', 1),
(3042, 199, 'ANZ', 'An Nil al Azraq', 1),
(3043, 199, 'ASH', 'Ash Shamaliyah', 1),
(3044, 199, 'BJA', 'Bahr al Jabal', 1),
(3045, 199, 'GIS', 'Gharb al Istiwa''iyah', 1),
(3046, 199, 'GBG', 'Gharb Bahr al Ghazal', 1),
(3047, 199, 'GDA', 'Gharb Darfur', 1),
(3048, 199, 'GKU', 'Gharb Kurdufan', 1),
(3049, 199, 'JDA', 'Janub Darfur', 1),
(3050, 199, 'JKU', 'Janub Kurdufan', 1),
(3051, 199, 'JQL', 'Junqali', 1),
(3052, 199, 'KSL', 'Kassala', 1),
(3053, 199, 'NNL', 'Nahr an Nil', 1),
(3054, 199, 'SBG', 'Shamal Bahr al Ghazal', 1),
(3055, 199, 'SDA', 'Shamal Darfur', 1),
(3056, 199, 'SKU', 'Shamal Kurdufan', 1),
(3057, 199, 'SIS', 'Sharq al Istiwa''iyah', 1),
(3058, 199, 'SNR', 'Sinnar', 1),
(3059, 199, 'WRB', 'Warab', 1),
(3060, 200, 'BR', 'Brokopondo', 1),
(3061, 200, 'CM', 'Commewijne', 1),
(3062, 200, 'CR', 'Coronie', 1),
(3063, 200, 'MA', 'Marowijne', 1),
(3064, 200, 'NI', 'Nickerie', 1),
(3065, 200, 'PA', 'Para', 1),
(3066, 200, 'PM', 'Paramaribo', 1),
(3067, 200, 'SA', 'Saramacca', 1),
(3068, 200, 'SI', 'Sipaliwini', 1),
(3069, 200, 'WA', 'Wanica', 1),
(3070, 202, 'H', 'Hhohho', 1),
(3071, 202, 'L', 'Lubombo', 1),
(3072, 202, 'M', 'Manzini', 1),
(3073, 202, 'S', 'Shishelweni', 1),
(3074, 203, 'K', 'Blekinge', 1),
(3075, 203, 'W', 'Dalama', 1),
(3076, 203, 'X', 'G&auml;vleborg', 1),
(3077, 203, 'I', 'Gotland', 1),
(3078, 203, 'N', 'Halland', 1),
(3079, 203, 'Z', 'J&auml;mtland', 1),
(3080, 203, 'F', 'J&ouml;nk&ouml;ping', 1),
(3081, 203, 'H', 'Kalmar', 1),
(3082, 203, 'G', 'Kronoberg', 1),
(3083, 203, 'BD', 'Norrbotten', 1),
(3084, 203, 'T', '&Ouml;rebro', 1),
(3085, 203, 'E', '&Ouml;sterg&ouml;tland', 1),
(3086, 203, 'M', 'Sk&aring;ne', 1),
(3087, 203, 'D', 'S&ouml;dermanland', 1),
(3088, 203, 'AB', 'Stockholm', 1),
(3089, 203, 'C', 'Uppsala', 1),
(3090, 203, 'S', 'V&auml;rmland', 1),
(3091, 203, 'AC', 'V&auml;sterbotten', 1),
(3092, 203, 'Y', 'V&auml;sternorrland', 1),
(3093, 203, 'U', 'V&auml;stmanland', 1),
(3094, 203, 'O', 'V&auml;stra G&ouml;taland', 1),
(3095, 204, 'AG', 'Aargau', 1),
(3096, 204, 'AR', 'Appenzell Ausserrhoden', 1),
(3097, 204, 'AI', 'Appenzell Innerrhoden', 1),
(3098, 204, 'BS', 'Basel-Stadt', 1),
(3099, 204, 'BL', 'Basel-Landschaft', 1),
(3100, 204, 'BE', 'Bern', 1),
(3101, 204, 'FR', 'Fribourg', 1),
(3102, 204, 'GE', 'Gen&egrave;ve', 1),
(3103, 204, 'GL', 'Glarus', 1),
(3104, 204, 'GR', 'Graub&uuml;nden', 1),
(3105, 204, 'JU', 'Jura', 1),
(3106, 204, 'LU', 'Luzern', 1),
(3107, 204, 'NE', 'Neuch&acirc;tel', 1),
(3108, 204, 'NW', 'Nidwald', 1),
(3109, 204, 'OW', 'Obwald', 1),
(3110, 204, 'SG', 'St. Gallen', 1),
(3111, 204, 'SH', 'Schaffhausen', 1),
(3112, 204, 'SZ', 'Schwyz', 1),
(3113, 204, 'SO', 'Solothurn', 1),
(3114, 204, 'TG', 'Thurgau', 1),
(3115, 204, 'TI', 'Ticino', 1),
(3116, 204, 'UR', 'Uri', 1),
(3117, 204, 'VS', 'Valais', 1),
(3118, 204, 'VD', 'Vaud', 1),
(3119, 204, 'ZG', 'Zug', 1),
(3120, 204, 'ZH', 'Z&uuml;rich', 1),
(3121, 205, 'HA', 'Al Hasakah', 1),
(3122, 205, 'LA', 'Al Ladhiqiyah', 1),
(3123, 205, 'QU', 'Al Qunaytirah', 1),
(3124, 205, 'RQ', 'Ar Raqqah', 1),
(3125, 205, 'SU', 'As Suwayda', 1),
(3126, 205, 'DA', 'Dara', 1),
(3127, 205, 'DZ', 'Dayr az Zawr', 1),
(3128, 205, 'DI', 'Dimashq', 1),
(3129, 205, 'HL', 'Halab', 1),
(3130, 205, 'HM', 'Hamah', 1),
(3131, 205, 'HI', 'Hims', 1),
(3132, 205, 'ID', 'Idlib', 1),
(3133, 205, 'RD', 'Rif Dimashq', 1),
(3134, 205, 'TA', 'Tartus', 1),
(3135, 206, 'CH', 'Chang-hua', 1),
(3136, 206, 'CI', 'Chia-i', 1),
(3137, 206, 'HS', 'Hsin-chu', 1),
(3138, 206, 'HL', 'Hua-lien', 1),
(3139, 206, 'IL', 'I-lan', 1),
(3140, 206, 'KH', 'Kao-hsiung county', 1),
(3141, 206, 'KM', 'Kin-men', 1),
(3142, 206, 'LC', 'Lien-chiang', 1),
(3143, 206, 'ML', 'Miao-li', 1),
(3144, 206, 'NT', 'Nan-t''ou', 1),
(3145, 206, 'PH', 'P''eng-hu', 1),
(3146, 206, 'PT', 'P''ing-tung', 1),
(3147, 206, 'TG', 'T''ai-chung', 1),
(3148, 206, 'TA', 'T''ai-nan', 1),
(3149, 206, 'TP', 'T''ai-pei county', 1),
(3150, 206, 'TT', 'T''ai-tung', 1),
(3151, 206, 'TY', 'T''ao-yuan', 1),
(3152, 206, 'YL', 'Yun-lin', 1),
(3153, 206, 'CC', 'Chia-i city', 1),
(3154, 206, 'CL', 'Chi-lung', 1),
(3155, 206, 'HC', 'Hsin-chu', 1),
(3156, 206, 'TH', 'T''ai-chung', 1),
(3157, 206, 'TN', 'T''ai-nan', 1),
(3158, 206, 'KC', 'Kao-hsiung city', 1),
(3159, 206, 'TC', 'T''ai-pei city', 1),
(3160, 207, 'GB', 'Gorno-Badakhstan', 1),
(3161, 207, 'KT', 'Khatlon', 1),
(3162, 207, 'SU', 'Sughd', 1),
(3163, 208, 'AR', 'Arusha', 1),
(3164, 208, 'DS', 'Dar es Salaam', 1),
(3165, 208, 'DO', 'Dodoma', 1),
(3166, 208, 'IR', 'Iringa', 1),
(3167, 208, 'KA', 'Kagera', 1),
(3168, 208, 'KI', 'Kigoma', 1),
(3169, 208, 'KJ', 'Kilimanjaro', 1),
(3170, 208, 'LN', 'Lindi', 1),
(3171, 208, 'MY', 'Manyara', 1),
(3172, 208, 'MR', 'Mara', 1),
(3173, 208, 'MB', 'Mbeya', 1),
(3174, 208, 'MO', 'Morogoro', 1),
(3175, 208, 'MT', 'Mtwara', 1),
(3176, 208, 'MW', 'Mwanza', 1),
(3177, 208, 'PN', 'Pemba North', 1),
(3178, 208, 'PS', 'Pemba South', 1),
(3179, 208, 'PW', 'Pwani', 1),
(3180, 208, 'RK', 'Rukwa', 1),
(3181, 208, 'RV', 'Ruvuma', 1),
(3182, 208, 'SH', 'Shinyanga', 1),
(3183, 208, 'SI', 'Singida', 1),
(3184, 208, 'TB', 'Tabora', 1),
(3185, 208, 'TN', 'Tanga', 1),
(3186, 208, 'ZC', 'Zanzibar Central/South', 1),
(3187, 208, 'ZN', 'Zanzibar North', 1),
(3188, 208, 'ZU', 'Zanzibar Urban/West', 1),
(3189, 209, 'Amnat Charoen', 'Amnat Charoen', 1),
(3190, 209, 'Ang Thong', 'Ang Thong', 1),
(3191, 209, 'Ayutthaya', 'Ayutthaya', 1),
(3192, 209, 'Bangkok', 'Bangkok', 1),
(3193, 209, 'Buriram', 'Buriram', 1),
(3194, 209, 'Chachoengsao', 'Chachoengsao', 1),
(3195, 209, 'Chai Nat', 'Chai Nat', 1),
(3196, 209, 'Chaiyaphum', 'Chaiyaphum', 1),
(3197, 209, 'Chanthaburi', 'Chanthaburi', 1),
(3198, 209, 'Chiang Mai', 'Chiang Mai', 1),
(3199, 209, 'Chiang Rai', 'Chiang Rai', 1),
(3200, 209, 'Chon Buri', 'Chon Buri', 1),
(3201, 209, 'Chumphon', 'Chumphon', 1),
(3202, 209, 'Kalasin', 'Kalasin', 1),
(3203, 209, 'Kamphaeng Phet', 'Kamphaeng Phet', 1),
(3204, 209, 'Kanchanaburi', 'Kanchanaburi', 1),
(3205, 209, 'Khon Kaen', 'Khon Kaen', 1),
(3206, 209, 'Krabi', 'Krabi', 1),
(3207, 209, 'Lampang', 'Lampang', 1),
(3208, 209, 'Lamphun', 'Lamphun', 1),
(3209, 209, 'Loei', 'Loei', 1),
(3210, 209, 'Lop Buri', 'Lop Buri', 1),
(3211, 209, 'Mae Hong Son', 'Mae Hong Son', 1),
(3212, 209, 'Maha Sarakham', 'Maha Sarakham', 1),
(3213, 209, 'Mukdahan', 'Mukdahan', 1),
(3214, 209, 'Nakhon Nayok', 'Nakhon Nayok', 1),
(3215, 209, 'Nakhon Pathom', 'Nakhon Pathom', 1),
(3216, 209, 'Nakhon Phanom', 'Nakhon Phanom', 1),
(3217, 209, 'Nakhon Ratchasima', 'Nakhon Ratchasima', 1),
(3218, 209, 'Nakhon Sawan', 'Nakhon Sawan', 1),
(3219, 209, 'Nakhon Si Thammarat', 'Nakhon Si Thammarat', 1),
(3220, 209, 'Nan', 'Nan', 1),
(3221, 209, 'Narathiwat', 'Narathiwat', 1),
(3222, 209, 'Nong Bua Lamphu', 'Nong Bua Lamphu', 1),
(3223, 209, 'Nong Khai', 'Nong Khai', 1),
(3224, 209, 'Nonthaburi', 'Nonthaburi', 1),
(3225, 209, 'Pathum Thani', 'Pathum Thani', 1),
(3226, 209, 'Pattani', 'Pattani', 1),
(3227, 209, 'Phangnga', 'Phangnga', 1),
(3228, 209, 'Phatthalung', 'Phatthalung', 1),
(3229, 209, 'Phayao', 'Phayao', 1),
(3230, 209, 'Phetchabun', 'Phetchabun', 1),
(3231, 209, 'Phetchaburi', 'Phetchaburi', 1),
(3232, 209, 'Phichit', 'Phichit', 1),
(3233, 209, 'Phitsanulok', 'Phitsanulok', 1),
(3234, 209, 'Phrae', 'Phrae', 1),
(3235, 209, 'Phuket', 'Phuket', 1),
(3236, 209, 'Prachin Buri', 'Prachin Buri', 1),
(3237, 209, 'Prachuap Khiri Khan', 'Prachuap Khiri Khan', 1),
(3238, 209, 'Ranong', 'Ranong', 1),
(3239, 209, 'Ratchaburi', 'Ratchaburi', 1),
(3240, 209, 'Rayong', 'Rayong', 1),
(3241, 209, 'Roi Et', 'Roi Et', 1),
(3242, 209, 'Sa Kaeo', 'Sa Kaeo', 1),
(3243, 209, 'Sakon Nakhon', 'Sakon Nakhon', 1),
(3244, 209, 'Samut Prakan', 'Samut Prakan', 1),
(3245, 209, 'Samut Sakhon', 'Samut Sakhon', 1),
(3246, 209, 'Samut Songkhram', 'Samut Songkhram', 1),
(3247, 209, 'Sara Buri', 'Sara Buri', 1),
(3248, 209, 'Satun', 'Satun', 1),
(3249, 209, 'Sing Buri', 'Sing Buri', 1),
(3250, 209, 'Sisaket', 'Sisaket', 1),
(3251, 209, 'Songkhla', 'Songkhla', 1),
(3252, 209, 'Sukhothai', 'Sukhothai', 1),
(3253, 209, 'Suphan Buri', 'Suphan Buri', 1),
(3254, 209, 'Surat Thani', 'Surat Thani', 1),
(3255, 209, 'Surin', 'Surin', 1),
(3256, 209, 'Tak', 'Tak', 1),
(3257, 209, 'Trang', 'Trang', 1),
(3258, 209, 'Trat', 'Trat', 1),
(3259, 209, 'Ubon Ratchathani', 'Ubon Ratchathani', 1),
(3260, 209, 'Udon Thani', 'Udon Thani', 1),
(3261, 209, 'Uthai Thani', 'Uthai Thani', 1),
(3262, 209, 'Uttaradit', 'Uttaradit', 1),
(3263, 209, 'Yala', 'Yala', 1),
(3264, 209, 'Yasothon', 'Yasothon', 1),
(3265, 210, 'K', 'Kara', 1),
(3266, 210, 'P', 'Plateaux', 1),
(3267, 210, 'S', 'Savanes', 1),
(3268, 210, 'C', 'Centrale', 1),
(3269, 210, 'M', 'Maritime', 1),
(3270, 211, 'A', 'Atafu', 1),
(3271, 211, 'F', 'Fakaofo', 1),
(3272, 211, 'N', 'Nukunonu', 1),
(3273, 212, 'H', 'Ha''apai', 1),
(3274, 212, 'T', 'Tongatapu', 1),
(3275, 212, 'V', 'Vava''u', 1),
(3276, 213, 'CT', 'Couva/Tabaquite/Talparo', 1),
(3277, 213, 'DM', 'Diego Martin', 1),
(3278, 213, 'MR', 'Mayaro/Rio Claro', 1),
(3279, 213, 'PD', 'Penal/Debe', 1),
(3280, 213, 'PT', 'Princes Town', 1),
(3281, 213, 'SG', 'Sangre Grande', 1),
(3282, 213, 'SL', 'San Juan/Laventille', 1),
(3283, 213, 'SI', 'Siparia', 1),
(3284, 213, 'TP', 'Tunapuna/Piarco', 1),
(3285, 213, 'PS', 'Port of Spain', 1),
(3286, 213, 'SF', 'San Fernando', 1),
(3287, 213, 'AR', 'Arima', 1);
INSERT INTO `zone` (`zone_id`, `country_id`, `code`, `name`, `status`) VALUES
(3288, 213, 'PF', 'Point Fortin', 1),
(3289, 213, 'CH', 'Chaguanas', 1),
(3290, 213, 'TO', 'Tobago', 1),
(3291, 214, 'AR', 'Ariana', 1),
(3292, 214, 'BJ', 'Beja', 1),
(3293, 214, 'BA', 'Ben Arous', 1),
(3294, 214, 'BI', 'Bizerte', 1),
(3295, 214, 'GB', 'Gabes', 1),
(3296, 214, 'GF', 'Gafsa', 1),
(3297, 214, 'JE', 'Jendouba', 1),
(3298, 214, 'KR', 'Kairouan', 1),
(3299, 214, 'KS', 'Kasserine', 1),
(3300, 214, 'KB', 'Kebili', 1),
(3301, 214, 'KF', 'Kef', 1),
(3302, 214, 'MH', 'Mahdia', 1),
(3303, 214, 'MN', 'Manouba', 1),
(3304, 214, 'ME', 'Medenine', 1),
(3305, 214, 'MO', 'Monastir', 1),
(3306, 214, 'NA', 'Nabeul', 1),
(3307, 214, 'SF', 'Sfax', 1),
(3308, 214, 'SD', 'Sidi', 1),
(3309, 214, 'SL', 'Siliana', 1),
(3310, 214, 'SO', 'Sousse', 1),
(3311, 214, 'TA', 'Tataouine', 1),
(3312, 214, 'TO', 'Tozeur', 1),
(3313, 214, 'TU', 'Tunis', 1),
(3314, 214, 'ZA', 'Zaghouan', 1),
(3315, 215, 'ADA', 'Adana', 1),
(3316, 215, 'ADI', 'Adıyaman', 1),
(3317, 215, 'AFY', 'Afyonkarahisar', 1),
(3318, 215, 'AGR', 'Ağrı', 1),
(3319, 215, 'AKS', 'Aksaray', 1),
(3320, 215, 'AMA', 'Amasya', 1),
(3321, 215, 'ANK', 'Ankara', 1),
(3322, 215, 'ANT', 'Antalya', 1),
(3323, 215, 'ARD', 'Ardahan', 1),
(3324, 215, 'ART', 'Artvin', 1),
(3325, 215, 'AYI', 'Aydın', 1),
(3326, 215, 'BAL', 'Balıkesir', 1),
(3327, 215, 'BAR', 'Bartın', 1),
(3328, 215, 'BAT', 'Batman', 1),
(3329, 215, 'BAY', 'Bayburt', 1),
(3330, 215, 'BIL', 'Bilecik', 1),
(3331, 215, 'BIN', 'Bingöl', 1),
(3332, 215, 'BIT', 'Bitlis', 1),
(3333, 215, 'BOL', 'Bolu', 1),
(3334, 215, 'BRD', 'Burdur', 1),
(3335, 215, 'BRS', 'Bursa', 1),
(3336, 215, 'CKL', 'Çanakkale', 1),
(3337, 215, 'CKR', 'Çankırı', 1),
(3338, 215, 'COR', 'Çorum', 1),
(3339, 215, 'DEN', 'Denizli', 1),
(3340, 215, 'DIY', 'Diyarbakir', 1),
(3341, 215, 'DUZ', 'Düzce', 1),
(3342, 215, 'EDI', 'Edirne', 1),
(3343, 215, 'ELA', 'Elazig', 1),
(3344, 215, 'EZC', 'Erzincan', 1),
(3345, 215, 'EZR', 'Erzurum', 1),
(3346, 215, 'ESK', 'Eskişehir', 1),
(3347, 215, 'GAZ', 'Gaziantep', 1),
(3348, 215, 'GIR', 'Giresun', 1),
(3349, 215, 'GMS', 'Gümüşhane', 1),
(3350, 215, 'HKR', 'Hakkari', 1),
(3351, 215, 'HTY', 'Hatay', 1),
(3352, 215, 'IGD', 'Iğdır', 1),
(3353, 215, 'ISP', 'Isparta', 1),
(3354, 215, 'IST', 'İstanbul', 1),
(3355, 215, 'IZM', 'İzmir', 1),
(3356, 215, 'KAH', 'Kahramanmaraş', 1),
(3357, 215, 'KRB', 'Karabük', 1),
(3358, 215, 'KRM', 'Karaman', 1),
(3359, 215, 'KRS', 'Kars', 1),
(3360, 215, 'KAS', 'Kastamonu', 1),
(3361, 215, 'KAY', 'Kayseri', 1),
(3362, 215, 'KLS', 'Kilis', 1),
(3363, 215, 'KRK', 'Kirikkale', 1),
(3364, 215, 'KLR', 'Kirklareli', 1),
(3365, 215, 'KRH', 'Kirsehir', 1),
(3366, 215, 'KOC', 'Kocaeli', 1),
(3367, 215, 'KON', 'Konya', 1),
(3368, 215, 'KUT', 'Kütahya', 1),
(3369, 215, 'MAL', 'Malatya', 1),
(3370, 215, 'MAN', 'Manisa', 1),
(3371, 215, 'MAR', 'Mardin', 1),
(3372, 215, 'MER', 'Mersin', 1),
(3373, 215, 'MUG', 'Muğla', 1),
(3374, 215, 'MUS', 'Muş', 1),
(3375, 215, 'NEV', 'Nevşehir', 1),
(3376, 215, 'NIG', 'Niğde', 1),
(3377, 215, 'ORD', 'Ordu', 1),
(3378, 215, 'OSM', 'Osmaniye', 1),
(3379, 215, 'RIZ', 'Rize', 1),
(3380, 215, 'SAK', 'Sakarya', 1),
(3381, 215, 'SAM', 'Samsun', 1),
(3382, 215, 'SAN', 'Şanlıurfa', 1),
(3383, 215, 'SII', 'Siirt', 1),
(3384, 215, 'SIN', 'Sinop', 1),
(3385, 215, 'SIR', 'Şırnak', 1),
(3386, 215, 'SIV', 'Sivas', 1),
(3387, 215, 'TEL', 'Tekirdağ', 1),
(3388, 215, 'TOK', 'Tokat', 1),
(3389, 215, 'TRA', 'Trabzon', 1),
(3390, 215, 'TUN', 'Tunceli', 1),
(3391, 215, 'USK', 'Uşak', 1),
(3392, 215, 'VAN', 'Van', 1),
(3393, 215, 'YAL', 'Yalova', 1),
(3394, 215, 'YOZ', 'Yozgat', 1),
(3395, 215, 'ZON', 'Zonguldak', 1),
(3396, 216, 'A', 'Ahal Welayaty', 1),
(3397, 216, 'B', 'Balkan Welayaty', 1),
(3398, 216, 'D', 'Dashhowuz Welayaty', 1),
(3399, 216, 'L', 'Lebap Welayaty', 1),
(3400, 216, 'M', 'Mary Welayaty', 1),
(3401, 217, 'AC', 'Ambergris Cays', 1),
(3402, 217, 'DC', 'Dellis Cay', 1),
(3403, 217, 'FC', 'French Cay', 1),
(3404, 217, 'LW', 'Little Water Cay', 1),
(3405, 217, 'RC', 'Parrot Cay', 1),
(3406, 217, 'PN', 'Pine Cay', 1),
(3407, 217, 'SL', 'Salt Cay', 1),
(3408, 217, 'GT', 'Grand Turk', 1),
(3409, 217, 'SC', 'South Caicos', 1),
(3410, 217, 'EC', 'East Caicos', 1),
(3411, 217, 'MC', 'Middle Caicos', 1),
(3412, 217, 'NC', 'North Caicos', 1),
(3413, 217, 'PR', 'Providenciales', 1),
(3414, 217, 'WC', 'West Caicos', 1),
(3415, 218, 'NMG', 'Nanumanga', 1),
(3416, 218, 'NLK', 'Niulakita', 1),
(3417, 218, 'NTO', 'Niutao', 1),
(3418, 218, 'FUN', 'Funafuti', 1),
(3419, 218, 'NME', 'Nanumea', 1),
(3420, 218, 'NUI', 'Nui', 1),
(3421, 218, 'NFT', 'Nukufetau', 1),
(3422, 218, 'NLL', 'Nukulaelae', 1),
(3423, 218, 'VAI', 'Vaitupu', 1),
(3424, 219, 'KAL', 'Kalangala', 1),
(3425, 219, 'KMP', 'Kampala', 1),
(3426, 219, 'KAY', 'Kayunga', 1),
(3427, 219, 'KIB', 'Kiboga', 1),
(3428, 219, 'LUW', 'Luwero', 1),
(3429, 219, 'MAS', 'Masaka', 1),
(3430, 219, 'MPI', 'Mpigi', 1),
(3431, 219, 'MUB', 'Mubende', 1),
(3432, 219, 'MUK', 'Mukono', 1),
(3433, 219, 'NKS', 'Nakasongola', 1),
(3434, 219, 'RAK', 'Rakai', 1),
(3435, 219, 'SEM', 'Sembabule', 1),
(3436, 219, 'WAK', 'Wakiso', 1),
(3437, 219, 'BUG', 'Bugiri', 1),
(3438, 219, 'BUS', 'Busia', 1),
(3439, 219, 'IGA', 'Iganga', 1),
(3440, 219, 'JIN', 'Jinja', 1),
(3441, 219, 'KAB', 'Kaberamaido', 1),
(3442, 219, 'KML', 'Kamuli', 1),
(3443, 219, 'KPC', 'Kapchorwa', 1),
(3444, 219, 'KTK', 'Katakwi', 1),
(3445, 219, 'KUM', 'Kumi', 1),
(3446, 219, 'MAY', 'Mayuge', 1),
(3447, 219, 'MBA', 'Mbale', 1),
(3448, 219, 'PAL', 'Pallisa', 1),
(3449, 219, 'SIR', 'Sironko', 1),
(3450, 219, 'SOR', 'Soroti', 1),
(3451, 219, 'TOR', 'Tororo', 1),
(3452, 219, 'ADJ', 'Adjumani', 1),
(3453, 219, 'APC', 'Apac', 1),
(3454, 219, 'ARU', 'Arua', 1),
(3455, 219, 'GUL', 'Gulu', 1),
(3456, 219, 'KIT', 'Kitgum', 1),
(3457, 219, 'KOT', 'Kotido', 1),
(3458, 219, 'LIR', 'Lira', 1),
(3459, 219, 'MRT', 'Moroto', 1),
(3460, 219, 'MOY', 'Moyo', 1),
(3461, 219, 'NAK', 'Nakapiripirit', 1),
(3462, 219, 'NEB', 'Nebbi', 1),
(3463, 219, 'PAD', 'Pader', 1),
(3464, 219, 'YUM', 'Yumbe', 1),
(3465, 219, 'BUN', 'Bundibugyo', 1),
(3466, 219, 'BSH', 'Bushenyi', 1),
(3467, 219, 'HOI', 'Hoima', 1),
(3468, 219, 'KBL', 'Kabale', 1),
(3469, 219, 'KAR', 'Kabarole', 1),
(3470, 219, 'KAM', 'Kamwenge', 1),
(3471, 219, 'KAN', 'Kanungu', 1),
(3472, 219, 'KAS', 'Kasese', 1),
(3473, 219, 'KBA', 'Kibaale', 1),
(3474, 219, 'KIS', 'Kisoro', 1),
(3475, 219, 'KYE', 'Kyenjojo', 1),
(3476, 219, 'MSN', 'Masindi', 1),
(3477, 219, 'MBR', 'Mbarara', 1),
(3478, 219, 'NTU', 'Ntungamo', 1),
(3479, 219, 'RUK', 'Rukungiri', 1),
(3480, 220, 'CK', 'Черкаська область', 1),
(3481, 220, 'CH', 'Чернігівська область', 1),
(3482, 220, 'CV', 'Чернівецька  область', 1),
(3483, 220, 'CR', 'АР Крим', 1),
(3484, 220, 'DN', 'Дніпропетровська область', 1),
(3485, 220, 'DO', 'Донецька  область', 1),
(3486, 220, 'IV', 'Івано-Франківська область', 1),
(3487, 220, 'KL', 'Харківська  область', 1),
(3488, 220, 'KM', 'Хмельницька область', 1),
(3489, 220, 'KR', 'Кіровоградська область', 1),
(3490, 220, 'KV', 'Київська область', 1),
(3491, 220, 'Hr', 'Херсонська область', 1),
(3492, 220, 'LU', 'Луганська область', 1),
(3493, 220, 'LV', 'Львівська  область', 1),
(3494, 220, 'MY', 'Миколаївська область', 1),
(3495, 220, 'OD', 'Одеська область', 1),
(3496, 220, 'PO', 'Полтавська область', 1),
(3497, 220, 'RI', 'Рівненська область', 1),
(3498, 220, 'SE', 'Севастополь', 1),
(3499, 220, 'SU', 'Сумська область', 1),
(3500, 220, 'TE', 'Тернопільська область', 1),
(3501, 220, 'VI', 'Вінницька область', 1),
(3502, 220, 'VO', 'Волинська область', 1),
(3503, 220, 'ZK', 'Закарпатська область', 1),
(3504, 220, 'ZA', 'Запорізька область', 1),
(3505, 220, 'ZH', 'Житомирська область', 1),
(3506, 221, 'AZ', 'Abu Zaby', 1),
(3507, 221, 'AJ', '''Ajman', 1),
(3508, 221, 'FU', 'Al Fujayrah', 1),
(3509, 221, 'SH', 'Ash Shariqah', 1),
(3510, 221, 'DU', 'Dubayy', 1),
(3511, 221, 'RK', 'R''as al Khaymah', 1),
(3512, 221, 'UQ', 'Umm al Qaywayn', 1),
(3513, 222, 'ABN', 'Aberdeen', 1),
(3514, 222, 'ABNS', 'Aberdeenshire', 1),
(3515, 222, 'ANG', 'Anglesey', 1),
(3516, 222, 'AGS', 'Angus', 1),
(3517, 222, 'ARY', 'Argyll and Bute', 1),
(3518, 222, 'BEDS', 'Bedfordshire', 1),
(3519, 222, 'BERKS', 'Berkshire', 1),
(3520, 222, 'BLA', 'Blaenau Gwent', 1),
(3521, 222, 'BRI', 'Bridgend', 1),
(3522, 222, 'BSTL', 'Bristol', 1),
(3523, 222, 'BUCKS', 'Buckinghamshire', 1),
(3524, 222, 'CAE', 'Caerphilly', 1),
(3525, 222, 'CAMBS', 'Cambridgeshire', 1),
(3526, 222, 'CDF', 'Cardiff', 1),
(3527, 222, 'CARM', 'Carmarthenshire', 1),
(3528, 222, 'CDGN', 'Ceredigion', 1),
(3529, 222, 'CHES', 'Cheshire', 1),
(3530, 222, 'CLACK', 'Clackmannanshire', 1),
(3531, 222, 'CON', 'Conwy', 1),
(3532, 222, 'CORN', 'Cornwall', 1),
(3533, 222, 'DNBG', 'Denbighshire', 1),
(3534, 222, 'DERBY', 'Derbyshire', 1),
(3535, 222, 'DVN', 'Devon', 1),
(3536, 222, 'DOR', 'Dorset', 1),
(3537, 222, 'DGL', 'Dumfries and Galloway', 1),
(3538, 222, 'DUND', 'Dundee', 1),
(3539, 222, 'DHM', 'Durham', 1),
(3540, 222, 'ARYE', 'East Ayrshire', 1),
(3541, 222, 'DUNBE', 'East Dunbartonshire', 1),
(3542, 222, 'LOTE', 'East Lothian', 1),
(3543, 222, 'RENE', 'East Renfrewshire', 1),
(3544, 222, 'ERYS', 'East Riding of Yorkshire', 1),
(3545, 222, 'SXE', 'East Sussex', 1),
(3546, 222, 'EDIN', 'Edinburgh', 1),
(3547, 222, 'ESX', 'Essex', 1),
(3548, 222, 'FALK', 'Falkirk', 1),
(3549, 222, 'FFE', 'Fife', 1),
(3550, 222, 'FLINT', 'Flintshire', 1),
(3551, 222, 'GLAS', 'Glasgow', 1),
(3552, 222, 'GLOS', 'Gloucestershire', 1),
(3553, 222, 'LDN', 'Greater London', 1),
(3554, 222, 'MCH', 'Greater Manchester', 1),
(3555, 222, 'GDD', 'Gwynedd', 1),
(3556, 222, 'HANTS', 'Hampshire', 1),
(3557, 222, 'HWR', 'Herefordshire', 1),
(3558, 222, 'HERTS', 'Hertfordshire', 1),
(3559, 222, 'HLD', 'Highlands', 1),
(3560, 222, 'IVER', 'Inverclyde', 1),
(3561, 222, 'IOW', 'Isle of Wight', 1),
(3562, 222, 'KNT', 'Kent', 1),
(3563, 222, 'LANCS', 'Lancashire', 1),
(3564, 222, 'LEICS', 'Leicestershire', 1),
(3565, 222, 'LINCS', 'Lincolnshire', 1),
(3566, 222, 'MSY', 'Merseyside', 1),
(3567, 222, 'MERT', 'Merthyr Tydfil', 1),
(3568, 222, 'MLOT', 'Midlothian', 1),
(3569, 222, 'MMOUTH', 'Monmouthshire', 1),
(3570, 222, 'MORAY', 'Moray', 1),
(3571, 222, 'NPRTAL', 'Neath Port Talbot', 1),
(3572, 222, 'NEWPT', 'Newport', 1),
(3573, 222, 'NOR', 'Norfolk', 1),
(3574, 222, 'ARYN', 'North Ayrshire', 1),
(3575, 222, 'LANN', 'North Lanarkshire', 1),
(3576, 222, 'YSN', 'North Yorkshire', 1),
(3577, 222, 'NHM', 'Northamptonshire', 1),
(3578, 222, 'NLD', 'Northumberland', 1),
(3579, 222, 'NOT', 'Nottinghamshire', 1),
(3580, 222, 'ORK', 'Orkney Islands', 1),
(3581, 222, 'OFE', 'Oxfordshire', 1),
(3582, 222, 'PEM', 'Pembrokeshire', 1),
(3583, 222, 'PERTH', 'Perth and Kinross', 1),
(3584, 222, 'PWS', 'Powys', 1),
(3585, 222, 'REN', 'Renfrewshire', 1),
(3586, 222, 'RHON', 'Rhondda Cynon Taff', 1),
(3587, 222, 'RUT', 'Rutland', 1),
(3588, 222, 'BOR', 'Scottish Borders', 1),
(3589, 222, 'SHET', 'Shetland Islands', 1),
(3590, 222, 'SPE', 'Shropshire', 1),
(3591, 222, 'SOM', 'Somerset', 1),
(3592, 222, 'ARYS', 'South Ayrshire', 1),
(3593, 222, 'LANS', 'South Lanarkshire', 1),
(3594, 222, 'YSS', 'South Yorkshire', 1),
(3595, 222, 'SFD', 'Staffordshire', 1),
(3596, 222, 'STIR', 'Stirling', 1),
(3597, 222, 'SFK', 'Suffolk', 1),
(3598, 222, 'SRY', 'Surrey', 1),
(3599, 222, 'SWAN', 'Swansea', 1),
(3600, 222, 'TORF', 'Torfaen', 1),
(3601, 222, 'TWR', 'Tyne and Wear', 1),
(3602, 222, 'VGLAM', 'Vale of Glamorgan', 1),
(3603, 222, 'WARKS', 'Warwickshire', 1),
(3604, 222, 'WDUN', 'West Dunbartonshire', 1),
(3605, 222, 'WLOT', 'West Lothian', 1),
(3606, 222, 'WMD', 'West Midlands', 1),
(3607, 222, 'SXW', 'West Sussex', 1),
(3608, 222, 'YSW', 'West Yorkshire', 1),
(3609, 222, 'WIL', 'Western Isles', 1),
(3610, 222, 'WLT', 'Wiltshire', 1),
(3611, 222, 'WORCS', 'Worcestershire', 1),
(3612, 222, 'WRX', 'Wrexham', 1),
(3613, 223, 'AL', 'Alabama', 1),
(3614, 223, 'AK', 'Alaska', 1),
(3615, 223, 'AS', 'American Samoa', 1),
(3616, 223, 'AZ', 'Arizona', 1),
(3617, 223, 'AR', 'Arkansas', 1),
(3618, 223, 'AF', 'Armed Forces Africa', 1),
(3619, 223, 'AA', 'Armed Forces Americas', 1),
(3620, 223, 'AC', 'Armed Forces Canada', 1),
(3621, 223, 'AE', 'Armed Forces Europe', 1),
(3622, 223, 'AM', 'Armed Forces Middle East', 1),
(3623, 223, 'AP', 'Armed Forces Pacific', 1),
(3624, 223, 'CA', 'California', 1),
(3625, 223, 'CO', 'Colorado', 1),
(3626, 223, 'CT', 'Connecticut', 1),
(3627, 223, 'DE', 'Delaware', 1),
(3628, 223, 'DC', 'District of Columbia', 1),
(3629, 223, 'FM', 'Federated States Of Micronesia', 1),
(3630, 223, 'FL', 'Florida', 1),
(3631, 223, 'GA', 'Georgia', 1),
(3632, 223, 'GU', 'Guam', 1),
(3633, 223, 'HI', 'Hawaii', 1),
(3634, 223, 'ID', 'Idaho', 1),
(3635, 223, 'IL', 'Illinois', 1),
(3636, 223, 'IN', 'Indiana', 1),
(3637, 223, 'IA', 'Iowa', 1),
(3638, 223, 'KS', 'Kansas', 1),
(3639, 223, 'KY', 'Kentucky', 1),
(3640, 223, 'LA', 'Louisiana', 1),
(3641, 223, 'ME', 'Maine', 1),
(3642, 223, 'MH', 'Marshall Islands', 1),
(3643, 223, 'MD', 'Maryland', 1),
(3644, 223, 'MA', 'Massachusetts', 1),
(3645, 223, 'MI', 'Michigan', 1),
(3646, 223, 'MN', 'Minnesota', 1),
(3647, 223, 'MS', 'Mississippi', 1),
(3648, 223, 'MO', 'Missouri', 1),
(3649, 223, 'MT', 'Montana', 1),
(3650, 223, 'NE', 'Nebraska', 1),
(3651, 223, 'NV', 'Nevada', 1),
(3652, 223, 'NH', 'New Hampshire', 1),
(3653, 223, 'NJ', 'New Jersey', 1),
(3654, 223, 'NM', 'New Mexico', 1),
(3655, 223, 'NY', 'New York', 1),
(3656, 223, 'NC', 'North Carolina', 1),
(3657, 223, 'ND', 'North Dakota', 1),
(3658, 223, 'MP', 'Northern Mariana Islands', 1),
(3659, 223, 'OH', 'Ohio', 1),
(3660, 223, 'OK', 'Oklahoma', 1),
(3661, 223, 'OR', 'Oregon', 1),
(3662, 223, 'PW', 'Palau', 1),
(3663, 223, 'PA', 'Pennsylvania', 1),
(3664, 223, 'PR', 'Puerto Rico', 1),
(3665, 223, 'RI', 'Rhode Island', 1),
(3666, 223, 'SC', 'South Carolina', 1),
(3667, 223, 'SD', 'South Dakota', 1),
(3668, 223, 'TN', 'Tennessee', 1),
(3669, 223, 'TX', 'Texas', 1),
(3670, 223, 'UT', 'Utah', 1),
(3671, 223, 'VT', 'Vermont', 1),
(3672, 223, 'VI', 'Virgin Islands', 1),
(3673, 223, 'VA', 'Virginia', 1),
(3674, 223, 'WA', 'Washington', 1),
(3675, 223, 'WV', 'West Virginia', 1),
(3676, 223, 'WI', 'Wisconsin', 1),
(3677, 223, 'WY', 'Wyoming', 1),
(3678, 224, 'BI', 'Baker Island', 1),
(3679, 224, 'HI', 'Howland Island', 1),
(3680, 224, 'JI', 'Jarvis Island', 1),
(3681, 224, 'JA', 'Johnston Atoll', 1),
(3682, 224, 'KR', 'Kingman Reef', 1),
(3683, 224, 'MA', 'Midway Atoll', 1),
(3684, 224, 'NI', 'Navassa Island', 1),
(3685, 224, 'PA', 'Palmyra Atoll', 1),
(3686, 224, 'WI', 'Wake Island', 1),
(3687, 225, 'AR', 'Artigas', 1),
(3688, 225, 'CA', 'Canelones', 1),
(3689, 225, 'CL', 'Cerro Largo', 1),
(3690, 225, 'CO', 'Colonia', 1),
(3691, 225, 'DU', 'Durazno', 1),
(3692, 225, 'FS', 'Flores', 1),
(3693, 225, 'FA', 'Florida', 1),
(3694, 225, 'LA', 'Lavalleja', 1),
(3695, 225, 'MA', 'Maldonado', 1),
(3696, 225, 'MO', 'Montevideo', 1),
(3697, 225, 'PA', 'Paysandu', 1),
(3698, 225, 'RN', 'Rio Negro', 1),
(3699, 225, 'RV', 'Rivera', 1),
(3700, 225, 'RO', 'Rocha', 1),
(3701, 225, 'SL', 'Salto', 1),
(3702, 225, 'SJ', 'San Jose', 1),
(3703, 225, 'SO', 'Soriano', 1),
(3704, 225, 'TA', 'Tacuarembo', 1),
(3705, 225, 'TT', 'Treinta y Tres', 1),
(3706, 226, 'AN', 'Andijon', 1),
(3707, 226, 'BU', 'Buxoro', 1),
(3708, 226, 'FA', 'Farg''ona', 1),
(3709, 226, 'JI', 'Jizzax', 1),
(3710, 226, 'NG', 'Namangan', 1),
(3711, 226, 'NW', 'Navoiy', 1),
(3712, 226, 'QA', 'Qashqadaryo', 1),
(3713, 226, 'QR', 'Qoraqalpog''iston Republikasi', 1),
(3714, 226, 'SA', 'Samarqand', 1),
(3715, 226, 'SI', 'Sirdaryo', 1),
(3716, 226, 'SU', 'Surxondaryo', 1),
(3717, 226, 'TK', 'Toshkent City', 1),
(3718, 226, 'TO', 'Toshkent Region', 1),
(3719, 226, 'XO', 'Xorazm', 1),
(3720, 227, 'MA', 'Malampa', 1),
(3721, 227, 'PE', 'Penama', 1),
(3722, 227, 'SA', 'Sanma', 1),
(3723, 227, 'SH', 'Shefa', 1),
(3724, 227, 'TA', 'Tafea', 1),
(3725, 227, 'TO', 'Torba', 1),
(3726, 229, 'AM', 'Amazonas', 1),
(3727, 229, 'AN', 'Anzoategui', 1),
(3728, 229, 'AP', 'Apure', 1),
(3729, 229, 'AR', 'Aragua', 1),
(3730, 229, 'BA', 'Barinas', 1),
(3731, 229, 'BO', 'Bolivar', 1),
(3732, 229, 'CA', 'Carabobo', 1),
(3733, 229, 'CO', 'Cojedes', 1),
(3734, 229, 'DA', 'Delta Amacuro', 1),
(3735, 229, 'DF', 'Dependencias Federales', 1),
(3736, 229, 'DI', 'Distrito Federal', 1),
(3737, 229, 'FA', 'Falcon', 1),
(3738, 229, 'GU', 'Guarico', 1),
(3739, 229, 'LA', 'Lara', 1),
(3740, 229, 'ME', 'Merida', 1),
(3741, 229, 'MI', 'Miranda', 1),
(3742, 229, 'MO', 'Monagas', 1),
(3743, 229, 'NE', 'Nueva Esparta', 1),
(3744, 229, 'PO', 'Portuguesa', 1),
(3745, 229, 'SU', 'Sucre', 1),
(3746, 229, 'TA', 'Tachira', 1),
(3747, 229, 'TR', 'Trujillo', 1),
(3748, 229, 'VA', 'Vargas', 1),
(3749, 229, 'YA', 'Yaracuy', 1),
(3750, 229, 'ZU', 'Zulia', 1),
(3751, 230, 'AG', 'An Giang', 1),
(3752, 230, 'BG', 'Bac Giang', 1),
(3753, 230, 'BK', 'Bac Kan', 1),
(3754, 230, 'BL', 'Bac Lieu', 1),
(3755, 230, 'BC', 'Bac Ninh', 1),
(3756, 230, 'BR', 'Ba Ria-Vung Tau', 1),
(3757, 230, 'BN', 'Ben Tre', 1),
(3758, 230, 'BH', 'Binh Dinh', 1),
(3759, 230, 'BU', 'Binh Duong', 1),
(3760, 230, 'BP', 'Binh Phuoc', 1),
(3761, 230, 'BT', 'Binh Thuan', 1),
(3762, 230, 'CM', 'Ca Mau', 1),
(3763, 230, 'CT', 'Can Tho', 1),
(3764, 230, 'CB', 'Cao Bang', 1),
(3765, 230, 'DL', 'Dak Lak', 1),
(3766, 230, 'DG', 'Dak Nong', 1),
(3767, 230, 'DN', 'Da Nang', 1),
(3768, 230, 'DB', 'Dien Bien', 1),
(3769, 230, 'DI', 'Dong Nai', 1),
(3770, 230, 'DT', 'Dong Thap', 1),
(3771, 230, 'GL', 'Gia Lai', 1),
(3772, 230, 'HG', 'Ha Giang', 1),
(3773, 230, 'HD', 'Hai Duong', 1),
(3774, 230, 'HP', 'Hai Phong', 1),
(3775, 230, 'HM', 'Ha Nam', 1),
(3776, 230, 'HI', 'Ha Noi', 1),
(3777, 230, 'HT', 'Ha Tay', 1),
(3778, 230, 'HH', 'Ha Tinh', 1),
(3779, 230, 'HB', 'Hoa Binh', 1),
(3780, 230, 'HC', 'Ho Chi Minh City', 1),
(3781, 230, 'HU', 'Hau Giang', 1),
(3782, 230, 'HY', 'Hung Yen', 1),
(3783, 232, 'C', 'Saint Croix', 1),
(3784, 232, 'J', 'Saint John', 1),
(3785, 232, 'T', 'Saint Thomas', 1),
(3786, 233, 'A', 'Alo', 1),
(3787, 233, 'S', 'Sigave', 1),
(3788, 233, 'W', 'Wallis', 1),
(3789, 235, 'AB', 'Abyan', 1),
(3790, 235, 'AD', 'Adan', 1),
(3791, 235, 'AM', 'Amran', 1),
(3792, 235, 'BA', 'Al Bayda', 1),
(3793, 235, 'DA', 'Ad Dali', 1),
(3794, 235, 'DH', 'Dhamar', 1),
(3795, 235, 'HD', 'Hadramawt', 1),
(3796, 235, 'HJ', 'Hajjah', 1),
(3797, 235, 'HU', 'Al Hudaydah', 1),
(3798, 235, 'IB', 'Ibb', 1),
(3799, 235, 'JA', 'Al Jawf', 1),
(3800, 235, 'LA', 'Lahij', 1),
(3801, 235, 'MA', 'Ma''rib', 1),
(3802, 235, 'MR', 'Al Mahrah', 1),
(3803, 235, 'MW', 'Al Mahwit', 1),
(3804, 235, 'SD', 'Sa''dah', 1),
(3805, 235, 'SN', 'San''a', 1),
(3806, 235, 'SH', 'Shabwah', 1),
(3807, 235, 'TA', 'Ta''izz', 1),
(3808, 236, 'KOS', 'Kosovo', 1),
(3809, 236, 'MON', 'Montenegro', 1),
(3810, 236, 'SER', 'Serbia', 1),
(3811, 236, 'VOJ', 'Vojvodina', 1),
(3812, 237, 'BC', 'Bas-Congo', 1),
(3813, 237, 'BN', 'Bandundu', 1),
(3814, 237, 'EQ', 'Equateur', 1),
(3815, 237, 'KA', 'Katanga', 1),
(3816, 237, 'KE', 'Kasai-Oriental', 1),
(3817, 237, 'KN', 'Kinshasa', 1),
(3818, 237, 'KW', 'Kasai-Occidental', 1),
(3819, 237, 'MA', 'Maniema', 1),
(3820, 237, 'NK', 'Nord-Kivu', 1),
(3821, 237, 'OR', 'Orientale', 1),
(3822, 237, 'SK', 'Sud-Kivu', 1),
(3823, 238, 'CE', 'Central', 1),
(3824, 238, 'CB', 'Copperbelt', 1),
(3825, 238, 'EA', 'Eastern', 1),
(3826, 238, 'LP', 'Luapula', 1),
(3827, 238, 'LK', 'Lusaka', 1),
(3828, 238, 'NO', 'Northern', 1),
(3829, 238, 'NW', 'North-Western', 1),
(3830, 238, 'SO', 'Southern', 1),
(3831, 238, 'WE', 'Western', 1),
(3832, 239, 'BU', 'Bulawayo', 1),
(3833, 239, 'HA', 'Harare', 1),
(3834, 239, 'ML', 'Manicaland', 1),
(3835, 239, 'MC', 'Mashonaland Central', 1),
(3836, 239, 'ME', 'Mashonaland East', 1),
(3837, 239, 'MW', 'Mashonaland West', 1),
(3838, 239, 'MV', 'Masvingo', 1),
(3839, 239, 'MN', 'Matabeleland North', 1),
(3840, 239, 'MS', 'Matabeleland South', 1),
(3841, 239, 'MD', 'Midlands', 1),
(3861, 105, 'CB', 'Campobasso', 1),
(3862, 105, 'CI', 'Carbonia-Iglesias', 1),
(3863, 105, 'CE', 'Caserta', 1),
(3864, 105, 'CT', 'Catania', 1),
(3865, 105, 'CZ', 'Catanzaro', 1),
(3866, 105, 'CH', 'Chieti', 1),
(3867, 105, 'CO', 'Como', 1),
(3868, 105, 'CS', 'Cosenza', 1),
(3869, 105, 'CR', 'Cremona', 1),
(3870, 105, 'KR', 'Crotone', 1),
(3871, 105, 'CN', 'Cuneo', 1),
(3872, 105, 'EN', 'Enna', 1),
(3873, 105, 'FE', 'Ferrara', 1),
(3874, 105, 'FI', 'Firenze', 1),
(3875, 105, 'FG', 'Foggia', 1),
(3876, 105, 'FC', 'Forli-Cesena', 1),
(3877, 105, 'FR', 'Frosinone', 1),
(3878, 105, 'GE', 'Genova', 1),
(3879, 105, 'GO', 'Gorizia', 1),
(3880, 105, 'GR', 'Grosseto', 1),
(3881, 105, 'IM', 'Imperia', 1),
(3882, 105, 'IS', 'Isernia', 1),
(3883, 105, 'AQ', 'L&#39;Aquila', 1),
(3884, 105, 'SP', 'La Spezia', 1),
(3885, 105, 'LT', 'Latina', 1),
(3886, 105, 'LE', 'Lecce', 1),
(3887, 105, 'LC', 'Lecco', 1),
(3888, 105, 'LI', 'Livorno', 1),
(3889, 105, 'LO', 'Lodi', 1),
(3890, 105, 'LU', 'Lucca', 1),
(3891, 105, 'MC', 'Macerata', 1),
(3892, 105, 'MN', 'Mantova', 1),
(3893, 105, 'MS', 'Massa-Carrara', 1),
(3894, 105, 'MT', 'Matera', 1),
(3895, 105, 'VS', 'Medio Campidano', 1),
(3896, 105, 'ME', 'Messina', 1),
(3897, 105, 'MI', 'Milano', 1),
(3898, 105, 'MO', 'Modena', 1),
(3899, 105, 'NA', 'Napoli', 1),
(3900, 105, 'NO', 'Novara', 1),
(3901, 105, 'NU', 'Nuoro', 1),
(3902, 105, 'OG', 'Ogliastra', 1),
(3903, 105, 'OT', 'Olbia-Tempio', 1),
(3904, 105, 'OR', 'Oristano', 1),
(3905, 105, 'PD', 'Padova', 1),
(3906, 105, 'PA', 'Palermo', 1),
(3907, 105, 'PR', 'Parma', 1),
(3908, 105, 'PV', 'Pavia', 1),
(3909, 105, 'PG', 'Perugia', 1),
(3910, 105, 'PU', 'Pesaro e Urbino', 1),
(3911, 105, 'PE', 'Pescara', 1),
(3912, 105, 'PC', 'Piacenza', 1),
(3913, 105, 'PI', 'Pisa', 1),
(3914, 105, 'PT', 'Pistoia', 1),
(3915, 105, 'PN', 'Pordenone', 1),
(3916, 105, 'PZ', 'Potenza', 1),
(3917, 105, 'PO', 'Prato', 1),
(3918, 105, 'RG', 'Ragusa', 1),
(3919, 105, 'RA', 'Ravenna', 1),
(3920, 105, 'RC', 'Reggio Calabria', 1),
(3921, 105, 'RE', 'Reggio Emilia', 1),
(3922, 105, 'RI', 'Rieti', 1),
(3923, 105, 'RN', 'Rimini', 1),
(3924, 105, 'RM', 'Roma', 1),
(3925, 105, 'RO', 'Rovigo', 1),
(3926, 105, 'SA', 'Salerno', 1),
(3927, 105, 'SS', 'Sassari', 1),
(3928, 105, 'SV', 'Savona', 1),
(3929, 105, 'SI', 'Siena', 1),
(3930, 105, 'SR', 'Siracusa', 1),
(3931, 105, 'SO', 'Sondrio', 1),
(3932, 105, 'TA', 'Taranto', 1),
(3933, 105, 'TE', 'Teramo', 1),
(3934, 105, 'TR', 'Terni', 1),
(3935, 105, 'TO', 'Torino', 1),
(3936, 105, 'TP', 'Trapani', 1),
(3937, 105, 'TN', 'Trento', 1),
(3938, 105, 'TV', 'Treviso', 1),
(3939, 105, 'TS', 'Trieste', 1),
(3940, 105, 'UD', 'Udine', 1),
(3941, 105, 'VA', 'Varese', 1),
(3942, 105, 'VE', 'Venezia', 1),
(3943, 105, 'VB', 'Verbano-Cusio-Ossola', 1),
(3944, 105, 'VC', 'Vercelli', 1),
(3945, 105, 'VR', 'Verona', 1),
(3946, 105, 'VV', 'Vibo Valentia', 1),
(3947, 105, 'VI', 'Vicenza', 1),
(3948, 105, 'VT', 'Viterbo', 1),
(3949, 222, 'ANT', 'County Antrim', 1),
(3950, 222, 'ARM', 'County Armagh', 1),
(3951, 222, 'DOW', 'County Down', 1),
(3952, 222, 'FER', 'County Fermanagh', 1),
(3953, 222, 'LDY', 'County Londonderry', 1),
(3954, 222, 'TYR', 'County Tyrone', 1),
(3955, 222, 'CMA', 'Cumbria', 1),
(3956, 190, '1', 'Pomurska', 1),
(3957, 190, '2', 'Podravska', 1),
(3958, 190, '3', 'Koroška', 1),
(3959, 190, '4', 'Savinjska', 1),
(3960, 190, '5', 'Zasavska', 1),
(3961, 190, '6', 'Spodnjeposavska', 1),
(3962, 190, '7', 'Jugovzhodna Slovenija', 1),
(3963, 190, '8', 'Osrednjeslovenska', 1),
(3964, 190, '9', 'Gorenjska', 1),
(3965, 190, '10', 'Notranjsko-kraška', 1),
(3966, 190, '11', 'Goriška', 1),
(3967, 190, '12', 'Obalno-kraška', 1);

-- --------------------------------------------------------

--
-- Структура таблиці `zone_to_geo_zone`
--

CREATE TABLE IF NOT EXISTS `zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`zone_to_geo_zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=66 ;

--
-- Дамп даних таблиці `zone_to_geo_zone`
--

INSERT INTO `zone_to_geo_zone` (`zone_to_geo_zone_id`, `country_id`, `zone_id`, `geo_zone_id`, `date_added`, `date_modified`) VALUES
(57, 222, 0, 3, '2010-02-26 22:33:24', '0000-00-00 00:00:00'),
(65, 222, 0, 4, '2010-12-15 15:18:13', '0000-00-00 00:00:00');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
