-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 01, 2017 lúc 04:00 SA
-- Phiên bản máy phục vụ: 10.1.21-MariaDB
-- Phiên bản PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `spaquynh`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_adjustments`
--

CREATE TABLE `sma_adjustments` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_calendar`
--

CREATE TABLE `sma_calendar` (
  `date` date NOT NULL,
  `data` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_captcha`
--

CREATE TABLE `sma_captcha` (
  `captcha_id` bigint(13) UNSIGNED NOT NULL,
  `captcha_time` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(16) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `word` varchar(20) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_categories`
--

CREATE TABLE `sma_categories` (
  `id` int(11) NOT NULL,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL,
  `image` varchar(55) DEFAULT NULL,
  `price` double(20,4) DEFAULT '0.0000' COMMENT 'Giá dịch vụ',
  `id_parent` int(11) DEFAULT NULL COMMENT 'Danh mục cha',
  `name_parent` varchar(255) DEFAULT NULL COMMENT 'Tên danh mục cha'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_categories`
--

INSERT INTO `sma_categories` (`id`, `code`, `name`, `image`, `price`, `id_parent`, `name_parent`) VALUES
(1, 'Nối mi', 'Nối mi', '32975a6f16f29f9327be835905e77816.jpg', 0.0000, NULL, NULL),
(4, 'Uốn mi', 'Uốn mi', NULL, 0.0000, 0, NULL),
(5, 'Phun mày', 'Phun mày', NULL, 0.0000, 0, NULL),
(6, 'Phun môi', 'Phun môi', NULL, 0.0000, 0, NULL),
(7, 'Khác', 'Khác', NULL, 0.0000, 0, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_combo_items`
--

CREATE TABLE `sma_combo_items` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `item_code` varchar(20) NOT NULL,
  `quantity` decimal(12,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_companies`
--

CREATE TABLE `sma_companies` (
  `id` int(11) NOT NULL,
  `group_id` int(10) UNSIGNED DEFAULT NULL,
  `group_name` varchar(20) NOT NULL,
  `customer_group_id` int(11) DEFAULT NULL,
  `customer_group_name` varchar(100) DEFAULT NULL,
  `name` varchar(55) NOT NULL,
  `image` varchar(255) DEFAULT 'no_image.png' COMMENT 'Hình ảnh',
  `company` varchar(255) NOT NULL,
  `vat_no` varchar(100) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(55) NOT NULL,
  `state` varchar(55) DEFAULT NULL,
  `postal_code` varchar(8) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `cf1` varchar(100) DEFAULT NULL,
  `cf2` varchar(100) DEFAULT NULL,
  `cf3` varchar(100) DEFAULT NULL,
  `cf4` varchar(100) DEFAULT NULL,
  `cf5` varchar(100) DEFAULT NULL,
  `cf6` varchar(100) DEFAULT NULL,
  `invoice_footer` text,
  `payment_term` int(11) DEFAULT '0',
  `logo` varchar(255) DEFAULT 'logo.png',
  `award_points` int(11) DEFAULT '0',
  `note` varchar(255) DEFAULT NULL COMMENT 'Ghi chú',
  `service` varchar(255) DEFAULT NULL COMMENT 'Dịch vụ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_companies`
--

INSERT INTO `sma_companies` (`id`, `group_id`, `group_name`, `customer_group_id`, `customer_group_name`, `name`, `image`, `company`, `vat_no`, `address`, `city`, `state`, `postal_code`, `country`, `phone`, `email`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `invoice_footer`, `payment_term`, `logo`, `award_points`, `note`, `service`) VALUES
(1, 3, 'customer', 1, 'General', 'Walk-in Customer', 'no_image.png', 'Walk-in Customer', '', 'Customer Address', 'Petaling Jaya', 'Selangor', '46000', 'Malaysia', '0123456789', 'customer@google.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL),
(2, 4, 'supplier', NULL, NULL, 'Quần Áo Thời Trang Trực Tuyến', 'no_image.png', 'Yanstore', '', '12 bàu cát 3, phường 14', 'Hồ Chí Minh', 'Tân Bình', '', 'VietNam', '0123456789', 'supplier@google.com', '-', '-', '-', '-', '-', '-', NULL, 0, 'logo.png', 0, NULL, NULL),
(3, NULL, 'biller', NULL, NULL, 'Mian Saleem', 'no_image.png', 'Test Biller', '5555', 'Biller adddress', 'City', '', '', 'Country', '012345678', 'saleem@google.com', '', '', '', '', '', '', ' Thank you for shopping with us. Please come again', 0, 'logo1.png', 0, NULL, NULL),
(4, 3, 'customer', 1, 'General', 'hà', 'no_image.png', 'tư nhân', '', 'ha noi', 'Hà Nội', '', '', '', '0901122432', 'phamthuha@gmail.com', '', '', '', '0969337365', '', 'phamthuha@gmail.com', NULL, 0, 'logo.png', 0, NULL, NULL),
(5, 3, 'customer', 1, 'General', '1', 'no_image.png', '', NULL, '1', '1', NULL, NULL, NULL, '1', '1@yahoo.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL),
(6, 3, 'customer', 1, 'General', '123555', 'no_image.png', '', NULL, '1', '1', NULL, NULL, NULL, '1', '12213@yahoo.com', '', '', '', '4', '3', '2', NULL, 0, 'logo.png', 0, NULL, NULL),
(7, 3, 'customer', 1, 'General', '2434', 'no_image.png', '', NULL, '543543', '43543', NULL, NULL, NULL, '345345', '43543534@xn--gsad-8na.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL),
(8, 3, 'customer', 1, 'Khách hàng đang hoạt động', '21321', 'no_image.png', '', NULL, '123', '', NULL, NULL, NULL, '123', '12321@yahoo.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'logo.png', 0, NULL, NULL),
(9, 3, 'customer', 1, 'Khách hàng đang hoạt động', '123', '5cf3b5969c79aa4acbc2c6af94ada732.jpg', '', NULL, '123', '', NULL, NULL, NULL, '321', '123@yahoo.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'logo.png', 0, NULL, NULL),
(12, 3, 'customer', 1, 'Khách hàng đang hoạt động', '3123211333', '45b4f844431166326a9a888c697f311b.jpg', '', NULL, '123', '', NULL, NULL, NULL, '12345677', 'test@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'logo.png', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_costing`
--

CREATE TABLE `sma_costing` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `sale_item_id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `purchase_item_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `purchase_net_unit_cost` decimal(25,4) DEFAULT NULL,
  `purchase_unit_cost` decimal(25,4) DEFAULT NULL,
  `sale_net_unit_price` decimal(25,4) NOT NULL,
  `sale_unit_price` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT NULL,
  `inventory` tinyint(1) DEFAULT '0',
  `overselling` tinyint(1) DEFAULT '0',
  `option_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_costing`
--

INSERT INTO `sma_costing` (`id`, `date`, `product_id`, `sale_item_id`, `sale_id`, `purchase_item_id`, `quantity`, `purchase_net_unit_cost`, `purchase_unit_cost`, `sale_net_unit_price`, `sale_unit_price`, `quantity_balance`, `inventory`, `overselling`, `option_id`) VALUES
(1, '2017-03-21', 3, 1, 1, 3, '1.0000', '12000.0000', '12000.0000', '12000.0000', '12000.0000', '99.0000', 1, 0, 0),
(2, '2017-03-21', 2, 2, 1, 2, '1.0000', '20000.0000', '20000.0000', '20000.0000', '20000.0000', '59.0000', 1, 0, 0),
(3, '2017-03-21', 2, 3, 1, 2, '1.0000', '20000.0000', '20000.0000', '20000.0000', '20000.0000', '59.0000', 1, 0, 0),
(4, '2017-03-23', 2, 4, 2, 2, '1.0000', '20000.0000', '20000.0000', '20000.0000', '20000.0000', '57.0000', 1, 0, 0),
(5, '2017-03-23', 2, 5, 2, 2, '1.0000', '20000.0000', '20000.0000', '20000.0000', '20000.0000', '57.0000', 1, 0, 0),
(6, '2017-03-23', 4, 6, 2, 4, '1.0000', '15000.0000', '15000.0000', '15000.0000', '15000.0000', '99.0000', 1, 0, 0),
(7, '2017-03-23', 3, 7, 2, 3, '1.0000', '12000.0000', '12000.0000', '12000.0000', '12000.0000', '98.0000', 1, 0, 0),
(8, '2017-03-23', 5, 8, 2, 5, '1.0000', '25000.0000', '25000.0000', '25000.0000', '25000.0000', '99.0000', 1, 0, 0),
(9, '2017-03-23', 3, 9, 2, 3, '1.0000', '12000.0000', '12000.0000', '12000.0000', '12000.0000', '98.0000', 1, 0, 0),
(10, '2017-03-23', 1, 10, 2, 1, '1.0000', '5000.0000', '5000.0000', '5000.0000', '5000.0000', '49.0000', 1, 0, 0),
(11, '2017-03-23', 7, 12, 4, 6, '1.0000', '162000.0000', '162000.0000', '445000.0000', '445000.0000', '99.0000', 1, 0, NULL),
(12, '2017-03-23', 8, 13, 4, 7, '1.0000', '42000.0000', '42000.0000', '70000.0000', '70000.0000', '99.0000', 1, 0, NULL),
(13, '2017-04-09', 9, 14, 5, NULL, '9.0000', '0.0000', '0.0000', '30000.0000', '30000.0000', NULL, NULL, 0, NULL),
(14, '2017-04-09', 9, 15, 6, NULL, '10.0000', '0.0000', '0.0000', '30000.0000', '30000.0000', NULL, NULL, 0, NULL),
(15, '2017-04-09', 9, 16, 7, NULL, '1.0000', '0.0000', '0.0000', '30000.0000', '30000.0000', NULL, NULL, 0, NULL),
(16, '2017-04-09', 9, 17, 7, NULL, '1.0000', '0.0000', '0.0000', '30000.0000', '30000.0000', NULL, NULL, 0, NULL),
(17, '2017-04-09', 9, 18, 8, NULL, '1.0000', '0.0000', '0.0000', '30000.0000', '30000.0000', NULL, NULL, 0, NULL),
(18, '2017-04-09', 9, 19, 8, NULL, '1.0000', '0.0000', '0.0000', '30000.0000', '30000.0000', NULL, NULL, 0, NULL),
(19, '2017-04-09', 9, 20, 9, NULL, '1.0000', '0.0000', '0.0000', '30000.0000', '30000.0000', NULL, NULL, 0, NULL),
(20, '2017-04-09', 9, 21, 9, NULL, '1.0000', '0.0000', '0.0000', '30000.0000', '30000.0000', NULL, NULL, 0, NULL),
(21, '2017-04-09', 9, 22, 10, NULL, '1.0000', '0.0000', '0.0000', '30000.0000', '30000.0000', NULL, NULL, 0, NULL),
(22, '2017-11-17', 68, 36, 22, 21, '2.0000', '1234.0000', '1234.0000', '0.0000', '0.0000', '6.0000', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_currencies`
--

CREATE TABLE `sma_currencies` (
  `id` int(11) NOT NULL,
  `code` varchar(5) NOT NULL,
  `name` varchar(55) NOT NULL,
  `rate` decimal(12,4) NOT NULL,
  `auto_update` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_currencies`
--

INSERT INTO `sma_currencies` (`id`, `code`, `name`, `rate`, `auto_update`) VALUES
(1, 'USD', 'US Dollar', '1.0000', 0),
(2, 'ERU', 'EURO', '0.7340', 0),
(3, 'VNĐ', 'Việt Nam Đồng', '1.0000', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_customer_groups`
--

CREATE TABLE `sma_customer_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `percent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_customer_groups`
--

INSERT INTO `sma_customer_groups` (`id`, `name`, `percent`) VALUES
(1, 'Khách hàng đang hoạt động', 0),
(2, 'Khách hàng không hoạt động', 0),
(3, 'Khách hàng sắp đạt chỉ tiêu', 0),
(4, 'Khách hàng đạt chỉ tiêu', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_date_format`
--

CREATE TABLE `sma_date_format` (
  `id` int(11) NOT NULL,
  `js` varchar(20) NOT NULL,
  `php` varchar(20) NOT NULL,
  `sql` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_date_format`
--

INSERT INTO `sma_date_format` (`id`, `js`, `php`, `sql`) VALUES
(1, 'mm-dd-yyyy', 'm-d-Y', '%m-%d-%Y'),
(2, 'mm/dd/yyyy', 'm/d/Y', '%m/%d/%Y'),
(3, 'mm.dd.yyyy', 'm.d.Y', '%m.%d.%Y'),
(4, 'dd-mm-yyyy', 'd-m-Y', '%d-%m-%Y'),
(5, 'dd/mm/yyyy', 'd/m/Y', '%d/%m/%Y'),
(6, 'dd.mm.yyyy', 'd.m.Y', '%d.%m.%Y');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_deliveries`
--

CREATE TABLE `sma_deliveries` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_id` int(11) NOT NULL,
  `do_reference_no` varchar(50) NOT NULL,
  `sale_reference_no` varchar(50) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_expenses`
--

CREATE TABLE `sma_expenses` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference` varchar(50) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_by` varchar(55) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_gift_cards`
--

CREATE TABLE `sma_gift_cards` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `card_no` varchar(20) NOT NULL,
  `value` decimal(25,4) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer` varchar(255) DEFAULT NULL,
  `balance` decimal(25,4) NOT NULL,
  `expiry` date DEFAULT NULL,
  `created_by` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_groups`
--

CREATE TABLE `sma_groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_groups`
--

INSERT INTO `sma_groups` (`id`, `name`, `description`) VALUES
(1, 'owner', 'Owner'),
(2, 'admin', 'Administrator'),
(3, 'customer', 'Customer'),
(4, 'supplier', 'Supplier'),
(5, 'sales', 'Sales Staff'),
(6, 'kho', 'Thủ kho');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_history`
--

CREATE TABLE `sma_history` (
  `id` int(11) NOT NULL,
  `sma_history_description_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Tiêu đề mô tả',
  `sma_history_description_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Tên mô tả',
  `sma_history_id_staff` int(11) DEFAULT NULL COMMENT 'ID người thực hiện hành động',
  `sma_history_name_staff` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Tên người thực hiện hành động',
  `sma_history_date` datetime DEFAULT NULL COMMENT 'Ngày thực hiện hành động',
  `sma_history_slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Đường dẫn'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sma_history`
--

INSERT INTO `sma_history` (`id`, `sma_history_description_title`, `sma_history_description_name`, `sma_history_id_staff`, `sma_history_name_staff`, `sma_history_date`, `sma_history_slug`) VALUES
(81, 'Cập nhật trạng thái cảnh báo', 'Dự án đất nền khu Bình Chánh', 1, 'Owner Owner', '2017-09-08 13:21:59', 'project/view/5');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_login_attempts`
--

CREATE TABLE `sma_login_attempts` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_migrations`
--

CREATE TABLE `sma_migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_migrations`
--

INSERT INTO `sma_migrations` (`version`) VALUES
(306);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_notifications`
--

CREATE TABLE `sma_notifications` (
  `id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `from_date` datetime DEFAULT NULL,
  `till_date` datetime DEFAULT NULL,
  `scope` tinyint(1) NOT NULL DEFAULT '3'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_notifications`
--

INSERT INTO `sma_notifications` (`id`, `comment`, `date`, `from_date`, `till_date`, `scope`) VALUES
(1, '<p>Thank you for purchasing Stock Manager Advance.</p>', '2014-08-15 10:00:57', '2015-01-01 00:00:00', '2017-01-01 00:00:00', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_order_ref`
--

CREATE TABLE `sma_order_ref` (
  `ref_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `so` int(11) NOT NULL DEFAULT '1',
  `qu` int(11) NOT NULL DEFAULT '1',
  `po` int(11) NOT NULL DEFAULT '1',
  `to` int(11) NOT NULL DEFAULT '1',
  `pos` int(11) NOT NULL DEFAULT '1',
  `do` int(11) NOT NULL DEFAULT '1',
  `pay` int(11) NOT NULL DEFAULT '1',
  `re` int(11) NOT NULL DEFAULT '1',
  `ex` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_order_ref`
--

INSERT INTO `sma_order_ref` (`ref_id`, `date`, `so`, `qu`, `po`, `to`, `pos`, `do`, `pay`, `re`, `ex`) VALUES
(1, '2015-03-01', 3, 1, 6, 2, 9, 1, 15, 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_pay`
--

CREATE TABLE `sma_pay` (
  `sma_pay_id` int(11) NOT NULL COMMENT 'ID',
  `sma_pay_userid` int(11) DEFAULT NULL COMMENT 'User ID',
  `sma_pay_pay` double(20,4) DEFAULT NULL COMMENT 'Số tiền',
  `sma_pay_dactive` int(255) DEFAULT NULL COMMENT 'Ngày kích hoạt',
  `sma_pay_createby` int(11) DEFAULT NULL COMMENT 'Người tạo',
  `sma_pay_createtime` int(11) DEFAULT NULL COMMENT 'Ngày tạo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_pay`
--

INSERT INTO `sma_pay` (`sma_pay_id`, `sma_pay_userid`, `sma_pay_pay`, `sma_pay_dactive`, `sma_pay_createby`, `sma_pay_createtime`) VALUES
(1, 1, 15000000.0000, NULL, 1, 1511586833),
(2, 3, 120000.0000, NULL, 1, 1511587577),
(3, 3, 120000.0000, NULL, 1, 1511587596);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_payments`
--

CREATE TABLE `sma_payments` (
  `id` int(11) NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_id` int(11) DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `reference_no` varchar(50) NOT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `paid_by` varchar(20) NOT NULL,
  `cheque_no` varchar(20) DEFAULT NULL,
  `cc_no` varchar(20) DEFAULT NULL,
  `cc_holder` varchar(25) DEFAULT NULL,
  `cc_month` varchar(2) DEFAULT NULL,
  `cc_year` varchar(4) DEFAULT NULL,
  `cc_type` varchar(20) DEFAULT NULL,
  `amount` decimal(25,4) NOT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `pos_paid` decimal(25,4) DEFAULT '0.0000',
  `pos_balance` decimal(25,4) DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_payments`
--

INSERT INTO `sma_payments` (`id`, `date`, `sale_id`, `return_id`, `purchase_id`, `reference_no`, `transaction_id`, `paid_by`, `cheque_no`, `cc_no`, `cc_holder`, `cc_month`, `cc_year`, `cc_type`, `amount`, `currency`, `created_by`, `attachment`, `type`, `note`, `pos_paid`, `pos_balance`) VALUES
(1, '2017-03-21 19:04:22', 1, NULL, NULL, 'IPAY/2017/03/0001', NULL, 'cash', '', '', '', '', '', '', '52000.0000', NULL, 1, NULL, 'received', '', '52000.0000', '0.0000'),
(2, '2017-03-23 21:23:28', 2, NULL, NULL, 'IPAY/2017/03/0003', NULL, 'cash', '', '', '', '', '', '', '109000.0000', NULL, 1, NULL, 'received', '', '218000.0000', '109000.0000'),
(3, '2017-03-23 20:38:00', 4, NULL, NULL, 'IPAY/2017/03/0005', NULL, 'cash', '', '', '', '', '', 'Visa', '515000.0000', NULL, 1, NULL, 'received', '', '0.0000', '0.0000'),
(4, '2017-04-09 20:55:13', 5, NULL, NULL, 'IPAY/2017/04/0006', NULL, 'cash', '', '', '', '', '', '', '270000.0000', NULL, 1, NULL, 'received', '', '817650.0000', '547650.0000'),
(5, '2017-04-09 21:01:18', 6, NULL, NULL, 'IPAY/2017/04/0008', NULL, 'cash', '', '', '', '', '', '', '240000.0000', NULL, 1, NULL, 'received', '', '5000000.0000', '4760000.0000'),
(6, '2017-04-09 21:08:16', 9, NULL, NULL, 'IPAY/2017/04/0010', NULL, 'cash', '', '', '', '', '', '', '60000.0000', NULL, 1, NULL, 'received', '', '65000.0000', '5000.0000'),
(7, '2017-04-09 21:10:32', 10, NULL, NULL, 'IPAY/2017/04/0012', NULL, 'cash', '', '', '', '', '', '', '33000.0000', NULL, 1, NULL, 'received', '', '65000.0000', '32000.0000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_paypal`
--

CREATE TABLE `sma_paypal` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) NOT NULL,
  `paypal_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT '2.0000',
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT '3.9000',
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT '4.4000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_paypal`
--

INSERT INTO `sma_paypal` (`id`, `active`, `account_email`, `paypal_currency`, `fixed_charges`, `extra_charges_my`, `extra_charges_other`) VALUES
(1, 1, 'mypaypal@paypal.com', 'USD', '0.0000', '0.0000', '0.0000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_permissions`
--

CREATE TABLE `sma_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `products-index` tinyint(1) DEFAULT '0',
  `products-add` tinyint(1) DEFAULT '0',
  `products-edit` tinyint(1) DEFAULT '0',
  `products-delete` tinyint(1) DEFAULT '0',
  `products-cost` tinyint(1) DEFAULT '0',
  `products-price` tinyint(1) DEFAULT '0',
  `quotes-index` tinyint(1) DEFAULT '0',
  `quotes-add` tinyint(1) DEFAULT '0',
  `quotes-edit` tinyint(1) DEFAULT '0',
  `quotes-pdf` tinyint(1) DEFAULT '0',
  `quotes-email` tinyint(1) DEFAULT '0',
  `quotes-delete` tinyint(1) DEFAULT '0',
  `sales-index` tinyint(1) DEFAULT '0',
  `sales-add` tinyint(1) DEFAULT '0',
  `sales-edit` tinyint(1) DEFAULT '0',
  `sales-pdf` tinyint(1) DEFAULT '0',
  `sales-email` tinyint(1) DEFAULT '0',
  `sales-delete` tinyint(1) DEFAULT '0',
  `purchases-index` tinyint(1) DEFAULT '0',
  `purchases-add` tinyint(1) DEFAULT '0',
  `purchases-edit` tinyint(1) DEFAULT '0',
  `purchases-pdf` tinyint(1) DEFAULT '0',
  `purchases-email` tinyint(1) DEFAULT '0',
  `purchases-delete` tinyint(1) DEFAULT '0',
  `transfers-index` tinyint(1) DEFAULT '0',
  `transfers-add` tinyint(1) DEFAULT '0',
  `transfers-edit` tinyint(1) DEFAULT '0',
  `transfers-pdf` tinyint(1) DEFAULT '0',
  `transfers-email` tinyint(1) DEFAULT '0',
  `transfers-delete` tinyint(1) DEFAULT '0',
  `customers-index` tinyint(1) DEFAULT '0',
  `customers-add` tinyint(1) DEFAULT '0',
  `customers-edit` tinyint(1) DEFAULT '0',
  `customers-delete` tinyint(1) DEFAULT '0',
  `suppliers-index` tinyint(1) DEFAULT '0',
  `suppliers-add` tinyint(1) DEFAULT '0',
  `suppliers-edit` tinyint(1) DEFAULT '0',
  `suppliers-delete` tinyint(1) DEFAULT '0',
  `sales-deliveries` tinyint(1) DEFAULT '0',
  `sales-add_delivery` tinyint(1) DEFAULT '0',
  `sales-edit_delivery` tinyint(1) DEFAULT '0',
  `sales-delete_delivery` tinyint(1) DEFAULT '0',
  `sales-email_delivery` tinyint(1) DEFAULT '0',
  `sales-pdf_delivery` tinyint(1) DEFAULT '0',
  `sales-gift_cards` tinyint(1) DEFAULT '0',
  `sales-add_gift_card` tinyint(1) DEFAULT '0',
  `sales-edit_gift_card` tinyint(1) DEFAULT '0',
  `sales-delete_gift_card` tinyint(1) DEFAULT '0',
  `pos-index` tinyint(1) DEFAULT '0',
  `sales-return_sales` tinyint(1) DEFAULT '0',
  `reports-index` tinyint(1) DEFAULT '0',
  `reports-warehouse_stock` tinyint(1) DEFAULT '0',
  `reports-quantity_alerts` tinyint(1) DEFAULT '0',
  `reports-expiry_alerts` tinyint(1) DEFAULT '0',
  `reports-products` tinyint(1) DEFAULT '0',
  `reports-daily_sales` tinyint(1) DEFAULT '0',
  `reports-monthly_sales` tinyint(1) DEFAULT '0',
  `reports-sales` tinyint(1) DEFAULT '0',
  `reports-payments` tinyint(1) DEFAULT '0',
  `reports-purchases` tinyint(1) DEFAULT '0',
  `reports-profit_loss` tinyint(1) DEFAULT '0',
  `reports-customers` tinyint(1) DEFAULT '0',
  `reports-suppliers` tinyint(1) DEFAULT '0',
  `reports-staff` tinyint(1) DEFAULT '0',
  `reports-register` tinyint(1) DEFAULT '0',
  `sales-payments` tinyint(1) DEFAULT '0',
  `purchases-payments` tinyint(1) DEFAULT '0',
  `purchases-expenses` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_permissions`
--

INSERT INTO `sma_permissions` (`id`, `group_id`, `products-index`, `products-add`, `products-edit`, `products-delete`, `products-cost`, `products-price`, `quotes-index`, `quotes-add`, `quotes-edit`, `quotes-pdf`, `quotes-email`, `quotes-delete`, `sales-index`, `sales-add`, `sales-edit`, `sales-pdf`, `sales-email`, `sales-delete`, `purchases-index`, `purchases-add`, `purchases-edit`, `purchases-pdf`, `purchases-email`, `purchases-delete`, `transfers-index`, `transfers-add`, `transfers-edit`, `transfers-pdf`, `transfers-email`, `transfers-delete`, `customers-index`, `customers-add`, `customers-edit`, `customers-delete`, `suppliers-index`, `suppliers-add`, `suppliers-edit`, `suppliers-delete`, `sales-deliveries`, `sales-add_delivery`, `sales-edit_delivery`, `sales-delete_delivery`, `sales-email_delivery`, `sales-pdf_delivery`, `sales-gift_cards`, `sales-add_gift_card`, `sales-edit_gift_card`, `sales-delete_gift_card`, `pos-index`, `sales-return_sales`, `reports-index`, `reports-warehouse_stock`, `reports-quantity_alerts`, `reports-expiry_alerts`, `reports-products`, `reports-daily_sales`, `reports-monthly_sales`, `reports-sales`, `reports-payments`, `reports-purchases`, `reports-profit_loss`, `reports-customers`, `reports-suppliers`, `reports-staff`, `reports-register`, `sales-payments`, `purchases-payments`, `purchases-expenses`) VALUES
(1, 5, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 6, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_pos_register`
--

CREATE TABLE `sma_pos_register` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `cash_in_hand` decimal(25,4) NOT NULL,
  `status` varchar(10) NOT NULL,
  `total_cash` decimal(25,4) DEFAULT NULL,
  `total_cheques` int(11) DEFAULT NULL,
  `total_cc_slips` int(11) DEFAULT NULL,
  `total_cash_submitted` decimal(25,4) NOT NULL,
  `total_cheques_submitted` int(11) NOT NULL,
  `total_cc_slips_submitted` int(11) NOT NULL,
  `note` text,
  `closed_at` timestamp NULL DEFAULT NULL,
  `transfer_opened_bills` varchar(50) DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_pos_register`
--

INSERT INTO `sma_pos_register` (`id`, `date`, `user_id`, `cash_in_hand`, `status`, `total_cash`, `total_cheques`, `total_cc_slips`, `total_cash_submitted`, `total_cheques_submitted`, `total_cc_slips_submitted`, `note`, `closed_at`, `transfer_opened_bills`, `closed_by`) VALUES
(1, '2017-03-19 05:20:11', 1, '1222.0000', 'open', NULL, NULL, NULL, '0.0000', 0, 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_pos_settings`
--

CREATE TABLE `sma_pos_settings` (
  `pos_id` int(1) NOT NULL,
  `cat_limit` int(11) NOT NULL,
  `pro_limit` int(11) NOT NULL,
  `default_category` int(11) NOT NULL,
  `default_customer` int(11) NOT NULL,
  `default_biller` int(11) NOT NULL,
  `display_time` varchar(3) NOT NULL DEFAULT 'yes',
  `cf_title1` varchar(255) DEFAULT NULL,
  `cf_title2` varchar(255) DEFAULT NULL,
  `cf_value1` varchar(255) DEFAULT NULL,
  `cf_value2` varchar(255) DEFAULT NULL,
  `receipt_printer` varchar(55) DEFAULT NULL,
  `cash_drawer_codes` varchar(55) DEFAULT NULL,
  `focus_add_item` varchar(55) DEFAULT NULL,
  `add_manual_product` varchar(55) DEFAULT NULL,
  `customer_selection` varchar(55) DEFAULT NULL,
  `add_customer` varchar(55) DEFAULT NULL,
  `toggle_category_slider` varchar(55) DEFAULT NULL,
  `toggle_subcategory_slider` varchar(55) DEFAULT NULL,
  `cancel_sale` varchar(55) DEFAULT NULL,
  `suspend_sale` varchar(55) DEFAULT NULL,
  `print_items_list` varchar(55) DEFAULT NULL,
  `finalize_sale` varchar(55) DEFAULT NULL,
  `today_sale` varchar(55) DEFAULT NULL,
  `open_hold_bills` varchar(55) DEFAULT NULL,
  `close_register` varchar(55) DEFAULT NULL,
  `keyboard` tinyint(1) NOT NULL,
  `pos_printers` varchar(255) DEFAULT NULL,
  `java_applet` tinyint(1) NOT NULL,
  `product_button_color` varchar(20) NOT NULL DEFAULT 'default',
  `tooltips` tinyint(1) DEFAULT '1',
  `paypal_pro` tinyint(1) DEFAULT '0',
  `stripe` tinyint(1) DEFAULT '0',
  `rounding` tinyint(1) DEFAULT '0',
  `char_per_line` tinyint(4) DEFAULT '42',
  `pin_code` varchar(20) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT 'purchase_code',
  `envato_username` varchar(50) DEFAULT 'envato_username',
  `version` varchar(10) DEFAULT '3.0.1.13'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_pos_settings`
--

INSERT INTO `sma_pos_settings` (`pos_id`, `cat_limit`, `pro_limit`, `default_category`, `default_customer`, `default_biller`, `display_time`, `cf_title1`, `cf_title2`, `cf_value1`, `cf_value2`, `receipt_printer`, `cash_drawer_codes`, `focus_add_item`, `add_manual_product`, `customer_selection`, `add_customer`, `toggle_category_slider`, `toggle_subcategory_slider`, `cancel_sale`, `suspend_sale`, `print_items_list`, `finalize_sale`, `today_sale`, `open_hold_bills`, `close_register`, `keyboard`, `pos_printers`, `java_applet`, `product_button_color`, `tooltips`, `paypal_pro`, `stripe`, `rounding`, `char_per_line`, `pin_code`, `purchase_code`, `envato_username`, `version`) VALUES
(1, 22, 20, 1, 1, 3, '1', 'GST Reg', 'VAT Reg', '123456789', '987654321', 'BIXOLON SRP-350II', 'x1C', 'Ctrl+F3', 'Ctrl+Shift+M', 'Ctrl+Shift+C', 'Ctrl+Shift+A', 'Ctrl+F11', 'Ctrl+F12', 'F4', 'F7', 'F9', 'F8', 'Ctrl+F1', 'Ctrl+F2', 'Ctrl+F10', 1, 'BIXOLON SRP-350II, BIXOLON SRP-350II', 0, 'default', 1, 0, 0, 0, 42, NULL, 'purchase_code', 'envato_username', '3.0.1.13');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_products`
--

CREATE TABLE `sma_products` (
  `id` int(11) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` char(255) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) DEFAULT NULL,
  `alert_quantity` decimal(15,4) DEFAULT '20.0000',
  `image` varchar(255) DEFAULT 'no_image.png',
  `category_id` int(11) DEFAULT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `cf1` varchar(255) DEFAULT NULL,
  `cf2` varchar(255) DEFAULT NULL,
  `cf3` varchar(255) DEFAULT NULL,
  `cf4` varchar(255) DEFAULT NULL,
  `cf5` varchar(255) DEFAULT NULL,
  `cf6` varchar(255) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `tax_rate` int(11) DEFAULT NULL,
  `track_quantity` tinyint(1) DEFAULT '1',
  `details` varchar(1000) DEFAULT NULL,
  `warehouse` int(11) DEFAULT NULL,
  `barcode_symbology` varchar(55) DEFAULT 'code128',
  `file` varchar(100) DEFAULT NULL,
  `product_details` text,
  `tax_method` tinyint(1) DEFAULT '0',
  `type` varchar(55) DEFAULT 'standard',
  `supplier1` int(11) DEFAULT NULL,
  `supplier1price` decimal(25,4) DEFAULT NULL,
  `supplier2` int(11) DEFAULT NULL,
  `supplier2price` decimal(25,4) DEFAULT NULL,
  `supplier3` int(11) DEFAULT NULL,
  `supplier3price` decimal(25,4) DEFAULT NULL,
  `supplier4` int(11) DEFAULT NULL,
  `supplier4price` decimal(25,4) DEFAULT NULL,
  `supplier5` int(11) DEFAULT NULL,
  `supplier5price` decimal(25,4) DEFAULT NULL,
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Ngày tạo',
  `date_create_end` timestamp NULL DEFAULT NULL COMMENT 'Ngày sửa',
  `disable` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Vô hiệu'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_products`
--

INSERT INTO `sma_products` (`id`, `code`, `name`, `unit`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`, `date_create`, `date_create_end`, `disable`) VALUES
(36, '1234', 'ww', 't', '222.0000', '22.0000', '33.0000', 'no_image.png', 1, 0, '22', '22', '22', '', '', '', '1.0000', 3, 1, '', 1, 'code128', NULL, '22', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-11-22 10:23:38', NULL, 1),
(63, '1', '1223456', 'cais', '0.0000', '0.0000', '20.0000', 'no_image.png', 0, NULL, '', '', '', NULL, NULL, NULL, '0.0000', 0, 1, NULL, NULL, 'code128', NULL, '', 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-11-23 04:45:40', '2017-11-16 03:01:52', 1),
(64, NULL, 'test', 'cái', '1234.0000', NULL, '0.0000', 'no_image.png', 1, 0, '', '', '', NULL, NULL, NULL, NULL, 1, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-11-22 10:23:33', NULL, 1),
(68, 'test1234', 'test1234', '1', '1234.0000', NULL, '10.0000', 'no_image.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '7.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-11-25 05:28:30', NULL, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_product_photos`
--

CREATE TABLE `sma_product_photos` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_product_variants`
--

CREATE TABLE `sma_product_variants` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_purchases`
--

CREATE TABLE `sma_purchases` (
  `id` int(11) NOT NULL,
  `reference_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_1` date DEFAULT NULL COMMENT 'Ngày lập phiếu',
  `supplier_id` int(11) DEFAULT NULL,
  `supplier` varchar(55) DEFAULT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` varchar(1000) NOT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `product_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT NULL,
  `product_tax` decimal(25,4) DEFAULT NULL,
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `paid` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `status` varchar(55) DEFAULT '',
  `payment_status` varchar(20) DEFAULT 'pending',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_purchases`
--

INSERT INTO `sma_purchases` (`id`, `reference_no`, `date`, `date_1`, `supplier_id`, `supplier`, `warehouse_id`, `note`, `total`, `product_discount`, `order_discount_id`, `order_discount`, `total_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `shipping`, `grand_total`, `paid`, `status`, `payment_status`, `created_by`, `updated_by`, `updated_at`, `attachment`) VALUES
(3, 'PO/2017/09/0003', '2017-09-12 04:18:00', NULL, 2, 'Yanstore', 1, '', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', 'received', 'pending', 1, NULL, NULL, NULL),
(5, 'PO/2017/11/0004', '2017-11-16 07:41:00', '2017-11-16', 0, NULL, 1, '', '9872.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '9872.0000', '0.0000', 'received', 'pending', 1, 1, '2017-11-16 09:02:26', NULL),
(6, '1232131', '2017-11-16 09:19:00', '2017-11-16', NULL, NULL, 1, '', '222.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '222.0000', '0.0000', 'received', 'pending', 1, NULL, NULL, NULL),
(7, 'PO/2017/11/0005', '2017-11-25 05:27:00', '2017-11-25', NULL, NULL, 1, '', '2468.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '2468.0000', '0.0000', 'received', 'pending', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_purchase_items`
--

CREATE TABLE `sma_purchase_items` (
  `id` int(11) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `transfer_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(20) DEFAULT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT '0.0000',
  `date` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_purchase_items`
--

INSERT INTO `sma_purchase_items` (`id`, `purchase_id`, `transfer_id`, `product_id`, `product_code`, `product_name`, `option_id`, `net_unit_cost`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `expiry`, `subtotal`, `quantity_balance`, `date`, `status`, `unit_cost`, `real_unit_cost`) VALUES
(1, NULL, NULL, 1, 'CT', 'Cải Thìa', NULL, '5000.0000', '50.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '250000.0000', '49.0000', '2017-03-19', 'received', '5000.0000', NULL),
(2, NULL, NULL, 2, 'CC', 'Cà chua', NULL, '20000.0000', '60.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '1200000.0000', '56.0000', '2017-03-19', 'received', '20000.0000', NULL),
(3, NULL, NULL, 3, 'BC', 'Bông Cải', NULL, '12000.0000', '100.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '1200000.0000', '97.0000', '2017-03-19', 'received', '12000.0000', NULL),
(4, NULL, NULL, 4, 'KT', 'Khoai Tây', NULL, '15000.0000', '100.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '1500000.0000', '99.0000', '2017-03-19', 'received', '15000.0000', NULL),
(5, NULL, NULL, 5, 'ODL', 'Ớt Đà Lạt', NULL, '25000.0000', '100.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '2500000.0000', '99.0000', '2017-03-19', 'received', '25000.0000', NULL),
(6, NULL, NULL, 7, 'Tinh s', 'tinh sen', NULL, '162000.0000', '100.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '16200000.0000', '99.0000', '2017-03-23', 'received', '162000.0000', NULL),
(7, NULL, NULL, 8, 'tra s', 'trà sen ', NULL, '42000.0000', '100.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '4200000.0000', '99.0000', '2017-03-23', 'received', '42000.0000', NULL),
(8, NULL, NULL, 17, '10', '123', NULL, '12.0000', '1.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '12.0000', '1.0000', '2017-06-07', 'received', '12.0000', NULL),
(9, NULL, NULL, 17, '10', '123', NULL, '12.0000', '10.0000', 2, '0.0000', 1, '0.0000', NULL, NULL, NULL, '120.0000', '10.0000', '2017-06-07', 'received', '12.0000', NULL),
(10, NULL, NULL, 24, '12', '12', NULL, '12.0000', '12.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '144.0000', '12.0000', '2017-06-07', 'received', '12.0000', NULL),
(11, NULL, NULL, 24, '12', '12', NULL, '12.0000', '12.0000', 2, '0.0000', 1, '0.0000', NULL, NULL, NULL, '144.0000', '12.0000', '2017-06-07', 'received', '12.0000', NULL),
(12, NULL, NULL, 27, '212121', '121', NULL, '12.0000', '121.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '1452.0000', '121.0000', '2017-06-07', 'received', '12.0000', NULL),
(13, NULL, NULL, 27, '212121', '121', NULL, '12.0000', '2121.0000', 2, '0.0000', 1, '0.0000', NULL, NULL, NULL, '25452.0000', '2121.0000', '2017-06-07', 'received', '12.0000', NULL),
(14, NULL, NULL, 28, '1212', '1212', NULL, '12.0000', '12.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '144.0000', '12.0000', '2017-06-07', 'received', '12.0000', NULL),
(15, 3, NULL, 65, 'dvcc', 'đơn vị cái', NULL, '0.0000', '10.0000', 1, '0.0000', 0, '', '0', '0.0000', NULL, '0.0000', '8.0000', '2017-09-12', 'received', '0.0000', '0.0000'),
(16, NULL, 1, 65, 'dvcc', 'đơn vị cái', NULL, '0.0000', '2.0000', 2, '0.0000', 0, '', NULL, NULL, NULL, '0.0000', '2.0000', '2017-09-12', 'received', '0.0000', '0.0000'),
(17, NULL, NULL, 68, 'test1234', 'test1234', NULL, '1234.0000', '0.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', '2017-11-15', 'received', '1234.0000', NULL),
(18, NULL, NULL, 68, 'test1234', 'test1234', NULL, '1234.0000', '0.0000', 2, '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', '2017-11-15', 'received', '1234.0000', NULL),
(21, 5, NULL, 68, 'test1234', 'test1234', 0, '1234.0000', '8.0000', 1, '0.0000', 0, '', NULL, '0.0000', NULL, '9872.0000', '6.0000', '0000-00-00', 'received', '1234.0000', '1234.0000'),
(22, 6, NULL, 36, '1234', 'ww', NULL, '222.0000', '1.0000', 1, '0.0000', 0, '', NULL, '0.0000', NULL, '222.0000', '1.0000', '2017-11-16', 'received', '222.0000', '222.0000'),
(23, 7, NULL, 68, 'test1234', 'test1234', NULL, '1234.0000', '1.0000', 1, '0.0000', 0, '', NULL, '0.0000', NULL, '1234.0000', '1.0000', '2017-11-25', 'received', '1234.0000', '1234.0000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_quotes`
--

CREATE TABLE `sma_quotes` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `internal_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_quotes`
--

INSERT INTO `sma_quotes` (`id`, `date`, `reference_no`, `customer_id`, `customer`, `warehouse_id`, `biller_id`, `biller`, `note`, `internal_note`, `total`, `product_discount`, `order_discount`, `order_discount_id`, `total_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `shipping`, `grand_total`, `status`, `created_by`, `updated_by`, `updated_at`, `attachment`) VALUES
(1, '2017-06-08 02:56:00', 'ghgh', 1, 'Walk-in Customer', 1, 3, 'Test Biller', '', NULL, '30000.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', 2, '3000.0000', '3000.0000', '0.0000', '33000.0000', 'pending', 1, NULL, NULL, NULL),
(2, '2017-06-10 04:41:00', '001_100617', 1, 'Walk-in Customer', 1, 3, 'Test Biller', '', NULL, '0.0000', '0.0000', '1212.0000', '1212', '1212.0000', '0.0000', 1, '0.0000', '0.0000', '12121.0000', '10909.0000', 'pending', 1, NULL, NULL, NULL),
(3, '2017-06-13 04:55:00', '002_100617', 1, 'Walk-in Customer', 1, 3, 'Test Biller', '', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '0.0000', 'pending', 1, 1, '2017-06-12 02:20:22', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_quote_items`
--

CREATE TABLE `sma_quote_items` (
  `id` int(11) NOT NULL,
  `quote_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_quote_items`
--

INSERT INTO `sma_quote_items` (`id`, `quote_id`, `product_id`, `product_code`, `product_name`, `product_type`, `option_id`, `net_unit_price`, `unit_price`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `subtotal`, `serial_no`, `real_unit_price`) VALUES
(1, 1, 17, '10', '123', 'standard', NULL, '30000.0000', '30000.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '30000.0000', NULL, '30000.0000'),
(2, 2, 36, 'undefined', '', 'manual', 0, '0.0000', '0.0000', '0.0000', 1, '0.0000', 0, '', '0', '0.0000', '0.0000', NULL, '0.0000'),
(5, 3, 2147483647, '', '1223456', 'manual', 0, '0.0000', '0.0000', '0.0000', 1, '0.0000', 0, '', '0', '0.0000', '0.0000', NULL, '0.0000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_return_items`
--

CREATE TABLE `sma_return_items` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) UNSIGNED NOT NULL,
  `return_id` int(11) UNSIGNED NOT NULL,
  `sale_item_id` int(11) DEFAULT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_return_sales`
--

CREATE TABLE `sma_return_sales` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT '0.0000',
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `surcharge` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_sales`
--

CREATE TABLE `sma_sales` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_1` date NOT NULL COMMENT 'Ngày lập phiếu',
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer` varchar(55) DEFAULT NULL,
  `biller_id` int(11) DEFAULT NULL,
  `biller` varchar(55) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `staff_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT '0.0000',
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `sale_status` varchar(20) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `payment_term` tinyint(4) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_items` tinyint(4) DEFAULT NULL,
  `pos` tinyint(1) NOT NULL DEFAULT '0',
  `paid` decimal(25,4) DEFAULT '0.0000',
  `return_id` int(11) DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `attachment` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_sales`
--

INSERT INTO `sma_sales` (`id`, `date`, `date_1`, `reference_no`, `customer_id`, `customer`, `biller_id`, `biller`, `warehouse_id`, `note`, `staff_note`, `total`, `product_discount`, `order_discount_id`, `total_discount`, `order_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `shipping`, `grand_total`, `sale_status`, `payment_status`, `payment_term`, `due_date`, `created_by`, `updated_by`, `updated_at`, `total_items`, `pos`, `paid`, `return_id`, `surcharge`, `attachment`) VALUES
(17, '2017-06-24 03:20:00', '0000-00-00', '001_080617', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '', '3.0000', '12.0000', NULL, '12.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '3.0000', 'completed', 'pending', 0, NULL, 1, 1, '2017-06-10 04:23:21', 3, 0, '0.0000', NULL, '0.0000', NULL),
(18, '2017-06-09 11:28:00', '2017-06-09', '001_090617', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '', '20.7500', '0.0000', NULL, '0.0000', '0.0000', '1.2500', 1, '0.0000', '1.2500', '0.0000', '22.0000', 'completed', 'pending', 127, '1970-01-01', 1, NULL, NULL, 1, 0, '0.0000', NULL, '0.0000', NULL),
(19, '2017-06-09 11:30:00', '0000-00-00', '002_090617', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '', '41.5000', '0.0000', NULL, '0.0000', '0.0000', '2.5000', 1, '0.0000', '2.5000', '0.0000', '44.0000', 'completed', 'pending', 0, NULL, 1, 1, '2017-06-10 04:05:08', 2, 0, '0.0000', NULL, '0.0000', NULL),
(20, '2017-06-30 03:05:00', '0000-00-00', '001_080617', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '', '3.0000', '12.0000', NULL, '12.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '3.0000', 'completed', 'pending', 0, NULL, 1, 1, '2017-06-10 04:25:22', 3, 0, '0.0000', NULL, '0.0000', NULL),
(21, '2017-06-17 04:21:00', '0000-00-00', '001_170617', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '0.0000', 'completed', 'pending', 0, NULL, 1, NULL, NULL, 2, 0, '0.0000', NULL, '0.0000', NULL),
(22, '2017-11-17 06:48:00', '0000-00-00', '123', 0, NULL, NULL, NULL, 1, '', '', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '0.0000', 'completed', 'due', 0, NULL, 1, NULL, NULL, 2, 0, '0.0000', NULL, '0.0000', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_sale_items`
--

CREATE TABLE `sma_sale_items` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_sale_items`
--

INSERT INTO `sma_sale_items` (`id`, `sale_id`, `product_id`, `product_code`, `product_name`, `product_type`, `option_id`, `net_unit_price`, `unit_price`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `subtotal`, `serial_no`, `real_unit_price`) VALUES
(1, 1, 3, 'BC', 'Bông Cải', 'standard', 0, '12000.0000', '12000.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '12000.0000', '', '12000.0000'),
(2, 1, 2, 'CC', 'Cà chua', 'standard', 0, '20000.0000', '20000.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '20000.0000', '', '20000.0000'),
(3, 1, 2, 'CC', 'Cà chua', 'standard', 0, '20000.0000', '20000.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '20000.0000', '', '20000.0000'),
(4, 2, 2, 'CC', 'Cà chua', 'standard', 0, '20000.0000', '20000.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '20000.0000', '', '20000.0000'),
(5, 2, 2, 'CC', 'Cà chua', 'standard', 0, '20000.0000', '20000.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '20000.0000', '', '20000.0000'),
(6, 2, 4, 'KT', 'Khoai Tây', 'standard', 0, '15000.0000', '15000.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '15000.0000', '', '15000.0000'),
(7, 2, 3, 'BC', 'Bông Cải', 'standard', 0, '12000.0000', '12000.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '12000.0000', '', '12000.0000'),
(8, 2, 5, 'ODL', 'Ớt Đà Lạt', 'standard', 0, '25000.0000', '25000.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '25000.0000', '', '25000.0000'),
(9, 2, 3, 'BC', 'Bông Cải', 'standard', 0, '12000.0000', '12000.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '12000.0000', '', '12000.0000'),
(10, 2, 1, 'CT', 'Cải Thìa', 'standard', 0, '5000.0000', '5000.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '5000.0000', '', '5000.0000'),
(11, 3, 4294967295, 'ts', 'tinh sen', 'manual', 0, '445000.0000', '445000.0000', '1.0000', 1, '0.0000', 0, '', '0', '0.0000', '445000.0000', '', '445000.0000'),
(12, 4, 7, 'Tinh s', 'tinh sen', 'standard', NULL, '445000.0000', '445000.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '445000.0000', '', '445000.0000'),
(13, 4, 8, 'tra s', 'trà sen', 'standard', NULL, '70000.0000', '70000.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '70000.0000', '', '70000.0000'),
(14, 5, 9, 'led', 'Den led', 'service', NULL, '30000.0000', '30000.0000', '9.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '270000.0000', '', '30000.0000'),
(15, 6, 9, 'led', 'Den led', 'service', NULL, '30000.0000', '30000.0000', '10.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '300000.0000', '', '30000.0000'),
(16, 7, 9, 'led', 'Den led', 'service', NULL, '30000.0000', '30000.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '30000.0000', '', '30000.0000'),
(17, 7, 9, 'led', 'Den led', 'service', NULL, '30000.0000', '30000.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '30000.0000', '', '30000.0000'),
(18, 8, 9, 'led', 'Den led', 'service', NULL, '30000.0000', '30000.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '30000.0000', '', '30000.0000'),
(19, 8, 9, 'led', 'Den led', 'service', NULL, '30000.0000', '30000.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '30000.0000', '', '30000.0000'),
(20, 9, 9, 'led', 'Den led', 'service', NULL, '30000.0000', '30000.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '30000.0000', '', '30000.0000'),
(21, 9, 9, 'led', 'Den led', 'service', NULL, '30000.0000', '30000.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '30000.0000', '', '30000.0000'),
(22, 10, 9, 'led', 'Den led', 'service', NULL, '30000.0000', '30000.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '30000.0000', '', '30000.0000'),
(23, 11, 4294967295, '1', 'test ', 'manual', 0, '0.0000', '0.0000', '23.0000', 1, '0.0000', 2, '10.0000%', '22', '506.0000', '0.0000', '51221', '22.0000'),
(26, 18, 36, '', 'ww', 'standard', NULL, '20.7500', '22.0000', '1.0000', 1, '1.2500', 3, '6.0000%', '0', '0.0000', '22.0000', '', '22.0000'),
(28, 19, 36, '', 'ww', 'standard', 0, '20.7500', '22.0000', '2.0000', 1, '2.5000', 3, '6.0000%', '0', '0.0000', '44.0000', '', '22.0000'),
(33, 17, 4294967295, '', '1', 'manual', 0, '1.0000', '1.0000', '3.0000', 1, '0.0000', 1, '0.0000', '4', '12.0000', '3.0000', '', '5.0000'),
(34, 20, 4294967295, '', '1', 'manual', 0, '1.0000', '1.0000', '3.0000', 1, '0.0000', 1, '0.0000', '4', '12.0000', '3.0000', '', '5.0000'),
(35, 21, 63, '', '1223456', 'standard', NULL, '0.0000', '0.0000', '2.0000', 1, '0.0000', 0, '', '0', '0.0000', '0.0000', '', '0.0000'),
(36, 22, 68, 'test1234', 'test1234', 'standard', NULL, '0.0000', '0.0000', '2.0000', 1, '0.0000', 0, '', NULL, '0.0000', '0.0000', '', '0.0000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_sessions`
--

CREATE TABLE `sma_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_sessions`
--

INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('03b7cb741620d9cfee6dd413bcec544f7162ac69', '192.168.50.19', 1511758039, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313735373734373b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131353837343235223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a226d356a6166585674223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6373726676616c75657c733a32303a22374757696c4a6e74506a7a59345256455354614e223b),
('055480525eef82bd0c608662ad3f24d04965bc24', '192.168.50.19', 1511857777, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313835373737363b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131383339333130223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a224b547448383646616e43586b4a7a686c594e5155223b),
('07bf10d20528ff25fade47312630081f17c2f632', '192.168.50.19', 1511852613, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313835323332343b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131383339333130223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a226934614435744567223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6373726676616c75657c733a32303a22734e534b30436e66313545424147723744576536223b),
('081ab836d90367088efdc212bdbad47486cccae5', '192.168.50.19', 1511755285, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313735343939383b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131353837343235223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a223954496330416265223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226e6577223b733a393a226373726676616c7565223b733a333a226e6577223b7d6373726676616c75657c733a32303a224c42466e576b3138514d4e4a6848437a39357645223b),
('0b6ff4ba0afe04be052e7f709686e08364562ceb', '192.168.50.19', 1511582902, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313538323630353b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131353733353432223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a224d48534265463152223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226e6577223b733a393a226373726676616c7565223b733a333a226e6577223b7d6373726676616c75657c733a32303a2256595345674d526369396a306d786c68767a3565223b),
('0b904615abeb1c4c8f7dca0bb3ec673a327d8e7a', '192.168.50.19', 1511573544, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313537333533363b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131353137363932223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('0de98ec6b5072bd1b5b0ec8df8953abbc1f660c3', '192.168.50.19', 1511863983, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313836333932323b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131383339333130223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a224b547448383646616e43586b4a7a686c594e5155223b),
('0e59a69b2e5255baf6f08648cad6626edaf0b3fc', '192.168.50.19', 1511861750, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313836313435303b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131383339333130223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a224b547448383646616e43586b4a7a686c594e5155223b637372666b65797c733a383a22756e344c42665445223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226e6577223b733a393a226373726676616c7565223b733a333a226e6577223b7d6373726676616c75657c733a32303a2246636a38316b32654c564566435351396d524e59223b),
('0f3112bad549276ffcda030a2ff52cbb61688f85', '192.168.50.19', 1511922037, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313932313733333b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131383433353138223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('0f33149085532c9f73020d7c441e886132fc2c17', '192.168.50.19', 1511750877, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313735303631323b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131353837343235223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a2247453074396f3650223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6373726676616c75657c733a32303a226469735531786f3061726771364c586d70513559223b),
('108d1997e25575c9eebbc887e02ccde21273b787', '192.168.50.19', 1511776034, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313737363032383b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131373436353534223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('1136e7c16fd0caac873d0fa638d8bf30483d5011', '192.168.50.19', 1511412556, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313431323238363b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131343030313436223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('13cc58c55c35c0cc5f522ee719b73b1b7f149fa9', '192.168.50.19', 1511490576, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313439303430353b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131343034383430223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('142055adfb9b75e34e19b30143f3671bf4575026', '192.168.50.19', 1511920665, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313932303636333b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131383433353138223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('14cd81f58ba231dce6bf1f5c3f72709f694e7b5a', '192.168.50.19', 1511578221, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313537373939333b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131353733353432223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('155ebf76e9e1ed60271d3f0527f2ef2bed7b30ef', '192.168.50.19', 1511921361, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313932313035393b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131383433353138223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('1ddb8d9e2f62a4c28934d15cf5b0a4bd9c977596', '192.168.50.19', 1511920343, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313932303034353b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131383433353138223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('1f8ec2578fa3c80764455e395c17348251f1cb38', '192.168.50.19', 1511508031, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313530383031393b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131343034383430223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('21585d8035efc535e2a782b37d3b8477b2f4111f', '192.168.50.19', 1511924970, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313932343134373b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131383433353138223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('2436eb1a87d881b6c8e953e9a5aaef2c7e090bb7', '192.168.50.19', 1511776789, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313737363635393b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131373436353534223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a226849694a3659616c223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6373726676616c75657c733a32303a22696b386e4b4d564431667a787771334276507573223b),
('26ef6e8a4faacf44e2e57f27cda39324875ccc63', '192.168.50.19', 1511858254, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313835383232343b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131383339333130223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a224b547448383646616e43586b4a7a686c594e5155223b637372666b65797c733a383a225868386d50736b4e223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226e6577223b733a393a226373726676616c7565223b733a333a226e6577223b7d6373726676616c75657c733a32303a224b787456326e356763387671736f6a72426b3666223b),
('2753b65d825912cbca4bd24bf83a8d35bb7758cc', '192.168.50.19', 1511754606, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313735343630353b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131353837343235223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a224479746142595765223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6373726676616c75657c733a32303a2262666f6d5178326e31444a495570307645423635223b),
('2c73023ceafd097991607ed88ff423a69e254982', '192.168.50.19', 1511854864, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313835343636343b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131383339333130223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a22576f445a6d683875223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6373726676616c75657c733a32303a22617472506a69376e55685739713836454c32547a223b),
('2cf4a8acb672b8f1523344b95d6844ebb6958bb4', '192.168.50.19', 1511407596, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313430373334393b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131343030313436223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('2d649e8e6d0be5c58eaf40ac9695fcb9ed3bf8c5', '192.168.50.19', 1511851577, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313835313239393b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131383339333130223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a22576b594854724d41223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6373726676616c75657c733a32303a22624b4e4c4f554452766c6d6e74385a5478657930223b),
('2e078b1c1554a634f8d8c720a36c97aa8fd29be5', '192.168.50.19', 1511493791, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313439333636313b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131343034383430223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('2e7fb0ede3a22e1183057a44acd56784bf9e551c', '192.168.50.19', 1511514315, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313531343031393b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131343034383430223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('3012af65b4151bfccdafa4b25e6f84038b41dbe2', '192.168.50.19', 1511411599, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313431313138383b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131343030313436223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('308106b2ab9041f48931e57481cb02bc2ade10f4', '192.168.50.19', 1511512476, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313531323231373b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131343034383430223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('362555c3e8fddeca921a284cc1d5841df589f5f7', '192.168.50.19', 1511586834, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313538363832353b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131353733353432223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d637372666b65797c733a383a2241473174464b6858223b6373726676616c75657c733a32303a2254327a77704f423658794873676a533069743345223b),
('370468cb5b37bc9fdfc565aac18294954d0991e5', '192.168.50.19', 1511486408, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313438363339323b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131343034383430223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('377008ad25d31f766da36a9eb8cb8088a19636c0', '192.168.50.19', 1511514568, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313531343536373b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131343034383430223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('381a781496198264e02876d431d55bbecc47a9ec', '192.168.50.19', 1511920588, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313932303335313b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131383433353138223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('38a74f241085221c3f12957ac9b943ee6275fbde', '192.168.50.19', 1511862939, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313836323634313b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131383339333130223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a224b547448383646616e43586b4a7a686c594e5155223b637372666b65797c733a383a226668676258314955223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226e6577223b733a393a226373726676616c7565223b733a333a226e6577223b7d6373726676616c75657c733a32303a227151626c3770736a434232507855476d45523935223b),
('39863819f1d8fd012d0c39172452315de4beb645', '192.168.50.19', 1511755960, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313735353638363b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131353837343235223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a22303871337068636a223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226e6577223b733a393a226373726676616c7565223b733a333a226e6577223b7d6373726676616c75657c733a32303a226e65506d4845365758384630663464374268544b223b),
('3c21f3c0372c6aac5a5bfeb06d59be5a6265b5ff', '192.168.50.19', 1511774340, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313737343231383b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131373436353534223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a2245434c7254697152223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226e6577223b733a393a226373726676616c7565223b733a333a226e6577223b7d6373726676616c75657c733a32303a225a39577869544e6f6a44766c325133454f41316b223b),
('3d08e95fe1434b955e57791c086169b73550a683', '192.168.50.19', 1511774795, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313737343630373b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131373436353534223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a2233434a78706a5a77223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226e6577223b733a393a226373726676616c7565223b733a333a226e6577223b7d6373726676616c75657c733a32303a22314f673364443936466138796c41766f57427452223b),
('3d398432ad78b9b2dc91b58d9de3f889df2a045f', '192.168.50.19', 1511410368, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313430393433303b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131343030313436223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('3fded28e9f33c4b028de47d4da627b0c880adb2f', '192.168.50.19', 1511574714, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313537343730373b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131353137363932223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a223936355a744c7152223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6373726676616c75657c733a32303a226d59714334627a58577239674d3361554b754830223b),
('42cc0c56b1b684c2ee2c5f9a149e71abfaeebbc7', '192.168.50.19', 1511772754, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313737323735333b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131373436353534223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('42d797a8a24a1f0adf89b4b0db3ef18162d44f62', '192.168.50.19', 1511862068, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313836313739303b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131383339333130223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a224b547448383646616e43586b4a7a686c594e5155223b637372666b65797c733a383a2261367150346a7869223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226e6577223b733a393a226373726676616c7565223b733a333a226e6577223b7d6373726676616c75657c733a32303a22567053596f3358454b6e3472747778504c683262223b),
('4369c6e943d698931be2083969b23289081c3cf3', '192.168.50.19', 1511757370, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313735373131313b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131353837343235223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a226632736c30553541223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6373726676616c75657c733a32303a226d356a6166585674364e526e4559793231487530223b),
('450360bbf7fe99694ca498201c6fd612b7af8467', '192.168.50.19', 1511855196, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313835343938363b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131383339333130223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a224b547448383646616e43586b4a7a686c594e5155223b637372666b65797c733a383a223377795366325644223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6373726676616c75657c733a32303a225165617644553638377a39356b46544b49637064223b),
('474e0da90dee73dbe3d9d80bdff5218f98b5c386', '192.168.50.19', 1511586429, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313538363432383b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131353733353432223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a224472617354506f77223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6373726676616c75657c733a32303a227738766b50415361304b56374462554d6a356664223b),
('47752589be15590f39a2ad35f3ab2b0866b3ad0e', '192.168.50.19', 1511585164, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313538343930313b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131353733353432223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d637372666b65797c733a383a226f6b6c7a62775647223b6373726676616c75657c733a32303a225035384f48466130516270496e72324b47667158223b),
('49ee22773b74b7f4888d6922d1729c3a1465d4b6', '192.168.50.19', 1511758072, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313735383035373b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131353837343235223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a224a65555a4c444b61223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6373726676616c75657c733a32303a22574568764b794a444d67776b4e54347139724769223b),
('4a9dbd3bfba0c93c506d2218d0d72fac7528ecf9', '192.168.50.19', 1511511684, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313531313536363b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131343034383430223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('4b994338245d080d6f353da770fe3f4e38d5352e', '192.168.50.19', 1511833862, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313833333632383b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131373732343236223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a224e33344543734276223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6373726676616c75657c733a32303a2249796158354b77443233387241657371344c5237223b),
('4bce349ed22ac8ca7ffc855c52afb914301b7b0d', '192.168.50.19', 1511925578, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313932353330333b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131383433353138223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('4ce30d6aea65385157c32a9dd9d8ec58acba96be', '192.168.50.19', 1511409217, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313430383938383b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131343030313436223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('4e0f4a7e208160dee21f3b3c0617192e04312809', '192.168.50.19', 1511510087, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313530393738393b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131343034383430223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('4f5edf15fd16fde31e4578f218621b1d835a1aae', '192.168.50.136', 1512009579, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531323030393537393b7265717565737465645f706167657c733a303a22223b),
('4f90e2f55a0ffd0b849047f4c760e28933a4e3f3', '192.168.50.136', 1511587851, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313538373732333b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131353736363039223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a224d4f4a38767a6c4537413150626e58487744356b223b72656d6f76655f706f6c737c693a313b),
('4f98b9130867136f9a519a193a7bb3cacb5bbd0f', '192.168.50.19', 1511747863, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313734373539323b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131353837343235223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('51b1fd0fffee01496b44ce77d178b5473bd2b7dc', '192.168.50.19', 1511582255, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313538313938363b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131353733353432223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a227759475764344f39223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226e6577223b733a393a226373726676616c7565223b733a333a226e6577223b7d6373726676616c75657c733a32303a22575571616f413747764b737a56357936526a5374223b),
('5508bd82e37db55c610a1a47287b5db65fcb5337', '192.168.50.19', 1511752004, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313735313735333b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131353837343235223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a226d496367685a3452223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6373726676616c75657c733a32303a227235583643747a576c4e6a4937664b5542686341223b),
('56b197be8f961b84f3e4ca592ce50c92bb1c81ff', '192.168.50.19', 1511411892, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313431313539393b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131343030313436223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b);
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('58a71dfafb6be536846bd2496740497a478376e5', '192.168.50.19', 1511853167, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313835323934353b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131383339333130223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a2251494637395a656c223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6373726676616c75657c733a32303a22564b5164446d72555365616f4d7a6c5732665075223b),
('5e4ec7a8248f468721856d5d6a3bd374aacd1729', '192.168.50.19', 1511584371, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313538343038393b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131353733353432223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a22456c70484e613130223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226e6577223b733a393a226373726676616c7565223b733a333a226e6577223b7d6373726676616c75657c733a32303a224b365142753238536c7846493069643765435859223b),
('60a80c93aa40f14d7e7088e4b786d9698bfa6c30', '192.168.50.19', 1512092922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531323039323932323b7265717565737465645f706167657c733a303a22223b),
('61e4347bcc5fc1cf3425abec0652dbea4c0b38ee', '192.168.50.19', 1511858908, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313835383630383b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131383339333130223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a224b547448383646616e43586b4a7a686c594e5155223b),
('627c78db5d96dab6fd7a6ea22cd56c42b0851c9c', '192.168.50.19', 1511517700, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313531373638393b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131343836333936223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a224735756936536c4c223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6373726676616c75657c733a32303a22316b41454b75566d7277486e587930716365427a223b),
('6387c2489a529138e2fdb5247cdda520338116ff', '192.168.50.19', 1511576615, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313537363630323b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131353733353432223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a226c73754830635979223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6373726676616c75657c733a32303a22617a766569575a74716a477543497238466c594b223b),
('642070fdc668d91b92ceba290e0f6f3df5a65fc5', '192.168.50.19', 1511749206, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313734393038303b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131353837343235223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a226850453177447158223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6373726676616c75657c733a32303a22676a396c4a48693056454f7a5063425543417947223b),
('651c07dca451f2185a177650d3f58c2af70869e2', '192.168.50.19', 1511756304, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313735363330343b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131353837343235223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a22644c727a59584150223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226e6577223b733a393a226373726676616c7565223b733a333a226e6577223b7d6373726676616c75657c733a32303a224d754f6570764237335845677363485168525369223b),
('6bb1d52a6a8faba1dddf02dddb29b667cfc276eb', '192.168.50.19', 1511832037, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313833313935383b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131373732343236223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a2272656359336c6237223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6373726676616c75657c733a32303a22663456354d69504f4e3653554c6c487237475a38223b),
('6c3112acccbae3ae1c00879d6c43739d14dbcf8e', '192.168.50.19', 1511576913, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313537363931323b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131353733353432223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a2256526e3053316538223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6373726676616c75657c733a32303a22746e41795632644c4b5a775359556d3133726568223b),
('6e2ef51700e614fe9b51c59caff9c6228b54a26e', '192.168.50.19', 1511832833, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313833323632383b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131373732343236223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a22505544425170497a223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6373726676616c75657c733a32303a224735756936536c4c6f7851395063543159614d32223b),
('71d49d2158c14f60b7280fd7eb5d8b667ab00f17', '192.168.50.19', 1511584696, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313538343430333b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131353733353432223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a22416257706f453047223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6373726676616c75657c733a32303a2259637673436a414b57494666613358455a6e507a223b),
('7765725b4463171fe6a27af5ed99754d52bdf964', '192.168.50.19', 1511852223, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313835323030373b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131383339333130223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a2238634d3236397579223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6373726676616c75657c733a32303a2270554c734d526878673958477664346b6f307779223b),
('7afefac8f7c1f11ed6c0f63a109b5c65f68a9574', '192.168.50.19', 1511581109, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313538313030303b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131353733353432223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a226c75595161453144223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6373726676616c75657c733a32303a2258706e54374f7164616d696c5a634b676b624443223b),
('84134f2ea23026339bf05f29e37e2dbd9ec24002', '192.168.50.19', 1511755626, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313735353333313b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131353837343235223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a2253554b5769734449223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226e6577223b733a393a226373726676616c7565223b733a333a226e6577223b7d6373726676616c75657c733a32303a2255565234626864546532366a536b425830784a4f223b),
('84e7f855440e2a6b51fe04b69d94532bcd8618fd', '192.168.50.19', 1511832473, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313833323332313b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131373732343236223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a2231706630764c437a223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6373726676616c75657c733a32303a226735386c71365a6b4d7741525451446534557969223b),
('85547f47103328523ad5e233a199b9b803f41053', '192.168.50.19', 1511512907, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313531323735323b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131343034383430223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a2244773272745a4e53223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226e6577223b733a393a226373726676616c7565223b733a333a226e6577223b7d6373726676616c75657c733a32303a22424b4930646d504e37386e3443576b53786f3961223b),
('857af290142ab2ca3ab7f129e3e3dfcb966dd431', '192.168.50.19', 1511407340, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313430373034373b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131343030313436223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('86d10e3a2ea10fbf73c0cf454f986c65a644b3fc', '192.168.50.19', 1511756021, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313735363030313b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131353837343235223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a22587a625464704e6c223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226e6577223b733a393a226373726676616c7565223b733a333a226e6577223b7d6373726676616c75657c733a32303a226a75694c366f70457a68413574645655326e464e223b),
('8accccbfd42833cd4f4eefb1da1599498d4346b4', '192.168.50.19', 1511775939, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313737353636383b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131373436353534223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a2252796f7865483370223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6373726676616c75657c733a32303a22494576703343794c365a384d4e6b346e4b63644a223b),
('8b6370c65eec6924f910c43eb7272b8dd615825e', '192.168.50.19', 1511863230, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313836323934333b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131383339333130223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a224b547448383646616e43586b4a7a686c594e5155223b637372666b65797c733a383a223534734e7a456b44223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226e6577223b733a393a226373726676616c7565223b733a333a226e6577223b7d6373726676616c75657c733a32303a22423370317a56397253456a4c34654e6366353854223b),
('8c7174cc135f3fb556c54bbf8e62b47767237063', '192.168.50.19', 1511490087, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313438393933363b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131343034383430223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('8f6b0dcd85efc95175d734f6bb622c64ee55c73c', '192.168.50.19', 1511833587, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313833333239313b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131373732343236223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a22356d305043615753223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6373726676616c75657c733a32303a2262554d47426c615444694e6d66727359786b3653223b),
('8f89eca20e8d5c6f1305db2230be9467011507d9', '192.168.50.19', 1511582585, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313538323239333b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131353733353432223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a22644f6244376a4958223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226e6577223b733a393a226373726676616c7565223b733a333a226e6577223b7d6373726676616c75657c733a32303a22467a31534759733678727748546e30374a583245223b),
('9294e1aaf63086ab7434114f038d4b15f13b94c9', '192.168.50.19', 1511513685, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313531333531333b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131343034383430223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('945701dbe2b56da10ab33d1fdbc4719cd9267920', '192.168.50.19', 1511922668, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313932323337353b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131383433353138223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('954f8236716c3b60f764eeb1d9f172243af01894', '192.168.50.19', 1511922354, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313932323035373b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131383433353138223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('96eaaec9c87350ec55a605ebf0333ebb5b2b622d', '192.168.50.19', 1511584080, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313538333738373b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131353733353432223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a224a675159785a4643223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226e6577223b733a393a226373726676616c7565223b733a333a226e6577223b7d6373726676616c75657c733a32303a22526f35317457706c4f516e6471667a506b674146223b),
('97c7481199a882034213bbc2df602ca5d0d88ce8', '192.168.50.19', 1511772515, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313737323430373b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131373436353534223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('9b6fb3dacdb67cd102eac52a43fc93ed763c7895', '192.168.50.19', 1511758815, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313735383735383b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131353837343235223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a22644b495470324d7a223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226e6577223b733a393a226373726676616c7565223b733a333a226e6577223b7d6373726676616c75657c733a32303a225a74486a527949574537594c47563370636e4e6f223b),
('9b80a019f5fb9e766fee3fb7cdbb72d80a87ed6d', '192.168.50.19', 1511758629, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313735383432373b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131353837343235223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a224f4d6f4a53474258223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226e6577223b733a393a226373726676616c7565223b733a333a226e6577223b7d6373726676616c75657c733a32303a2233434a78706a5a7748746c47653552514b467156223b),
('9ddcadfe525e128a463feb92ae8b578a40b22910', '192.168.50.19', 1511577568, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313537373536373b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131353733353432223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a223448706e74323136223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6373726676616c75657c733a32303a22754570574c7167636d304b5068656a3461596b51223b),
('9f9ce248b1409d230d5e9aee8a2c4bae316944d6', '192.168.50.19', 1511752276, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313735323035343b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131353837343235223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a226669734b447a3436223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6373726676616c75657c733a32303a2244536a4a67703936543156304f75636c687a3362223b),
('a00c3428d4b65a5dc633f7d4de2f4401150931de', '192.168.50.19', 1511924146, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313932333031343b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131383433353138223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('a533c9bb56a6bf4fd60ee081424816faa2badac6', '192.168.50.19', 1511411188, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313431303738333b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131343030313436223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('a6aba972a64452b3310e4719321827cd7c19a396', '192.168.50.19', 1511857134, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313835373132343b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131383339333130223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a224b547448383646616e43586b4a7a686c594e5155223b),
('a6d8199c49ec19518d2df9603143218fedafdb87', '192.168.50.19', 1511746561, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313734363535303b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131353837343235223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('a82b17708655e58d77c8b6e0196a670b865360c6', '192.168.50.19', 1511406482, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313430363139313b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131343030313436223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('ac82b6d1ca39032f08b41e87531653622d07c625', '192.168.50.19', 1511925174, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313932343937313b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131383433353138223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('ad39c788d03e76b5224ca5fd6e6fe1cb387c4a6a', '192.168.50.19', 1511855687, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313835353530383b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131383339333130223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a224b547448383646616e43586b4a7a686c594e5155223b637372666b65797c733a383a22734f473735786f48223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6373726676616c75657c733a32303a224e4a6154756d6869474b4f7053556c466f583466223b),
('adc46fa2aa218ca6d5330cc1273be28ee00d0d57', '192.168.50.19', 1511851292, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313835303939363b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131383339333130223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a225370783230336479223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6373726676616c75657c733a32303a2256706357663961727950344c787576593032317a223b),
('af5790a2096b1cbe6abca233c8e66d9799cdc8bc', '192.168.50.19', 1511413642, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313431333334393b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131343030313436223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('b13b41834473c81b1c09f14246d022d2d5e16e02', '192.168.50.19', 1511580225, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313538303036303b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131353733353432223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d637372666b65797c733a383a22556f59385339784a223b6373726676616c75657c733a32303a223135713779666351507869736d6756304d476165223b),
('b284be903e45c1bbeb4af5e389159c54f1955efd', '192.168.50.19', 1511583759, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313538333436343b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131353733353432223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a22664d746939595246223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226e6577223b733a393a226373726676616c7565223b733a333a226e6577223b7d6373726676616c75657c733a32303a22454959666f6933354f484a436d4270365a537458223b),
('b296cfd55a775793d39f015717ab7d7d115306a8', '192.168.50.19', 1511856685, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313835363637303b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131383339333130223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a224b547448383646616e43586b4a7a686c594e5155223b637372666b65797c733a383a22744352386165676c223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6373726676616c75657c733a32303a22304a356c5937773844735232475a6153684c5531223b),
('b7847372e1ce728525a908c8f851e2449cefe9e6', '192.168.50.19', 1511748525, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313734383435343b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131353837343235223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a226c4870314a6e4165223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6373726676616c75657c733a32303a2258366957484e50527841517670357a4a7375325a223b),
('be8a42dfaddabc647503b6f0d985ae0af3e651c8', '192.168.50.19', 1511516787, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313531363537393b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131343034383430223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('c37e0a5ecaa6ab26357e3f3fc05d2c7b01a623e8', '192.168.50.19', 1511844095, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313834333831303b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131383339333130223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a226679345a36735578223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6373726676616c75657c733a32303a22627151656c73457864444734484e7a684f6b5767223b),
('c4557095b57aff0871858d28aa80dad7162419e0', '192.168.50.19', 1511412198, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313431313930343b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131343030313436223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('c52594c533df4ac379a7255be085a501ce376637', '192.168.50.19', 1511413822, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313431333636373b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131343030313436223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('c5f40a2fd40fe8ccc6ea25814109abbb0292713f', '192.168.50.19', 1511863337, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313836333235393b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131383339333130223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a224b547448383646616e43586b4a7a686c594e5155223b),
('c622558570670e13f23934be8ade91171401d914', '192.168.50.19', 1511516521, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313531363232373b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131343034383430223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('c624a11a40e0fc2ca29152dab5bea497f30847de', '192.168.50.19', 1511580957, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313538303637373b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131353733353432223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a22526e57556a335143223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6373726676616c75657c733a32303a224c314174505237625856703947685961514d7233223b),
('c6ca59670c6f2b4e1580b51b07083f50deca0126', '192.168.50.19', 1511752648, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313735323432373b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131353837343235223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a224b5734326d6f3736223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6373726676616c75657c733a32303a226368304a6b4d4c4138395a4e584f517a34365547223b),
('c77a0d6ccdb022cc333dff301550a6518029f07c', '192.168.50.19', 1511851965, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313835313638353b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131383339333130223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a224f6a76426c556163223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6373726676616c75657c733a32303a2244644c4e6d6e4a5455724d477a61627679325350223b);
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('ca1df9ff83ebfc7d7756a073a7a29501b83bb1e1', '192.168.50.19', 1511490980, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313439303737303b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131343034383430223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('cedddf3e206d930f5f9ec7f0b8483a743c888968', '192.168.50.136', 1511839461, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313833393239333b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131383331393636223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('d01534f8b0b1523e35f5f4c9e8cb41f3b918c388', '192.168.50.19', 1511579072, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313537383833333b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131353733353432223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('d0f486318780242843dd27771b29fd95dab41112', '192.168.50.19', 1511833208, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313833323936333b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131373732343236223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a2254345364324e5a63223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6373726676616c75657c733a32303a225350664e38483665453741516c527072736d6361223b),
('d2dd8a2732a47f74fa2a4697a6d98dc48318f87f', '192.168.50.19', 1511921701, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313932313430323b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131383433353138223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('d4951b608f459294a3ae3d2218c9430fbeb301ed', '192.168.50.19', 1511410572, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313431303434313b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131343030313436223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('d55dff11141db3517f3a7356e673e10347c77821', '192.168.50.19', 1511753347, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313735333334303b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131353837343235223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a226831673361634946223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6373726676616c75657c733a32303a224d6659753749347a7353566e4164474272683552223b),
('d725d6964f51acd23f6719127d75e66091f033bc', '192.168.50.136', 1511587711, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313538373432303b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131353736363039223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a224d4f4a38767a6c4537413150626e58487744356b223b72656d6f76655f706f6c737c693a313b),
('d83eb66aaff0101e9bca236d42c5b4732528353b', '192.168.50.19', 1511489846, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313438393534383b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131343034383430223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('da25531021c344634c98f2728c16732fe331b9f4', '192.168.50.19', 1511843676, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313834333439373b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131383339333130223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a225958317455477149223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6373726676616c75657c733a32303a2277664d37593258556936674345536f4f42527554223b),
('e100d889d1077ed6a87e50ce459ed5f8d5dff49f', '192.168.50.19', 1511581981, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313538313638333b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131353733353432223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a22787a7573554c6a68223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226e6577223b733a393a226373726676616c7565223b733a333a226e6577223b7d6373726676616c75657c733a32303a225778504c69615230544135534d6c334a6e6a3151223b),
('e3a983d068566b829196f48aceb4a6027cee8148', '192.168.50.19', 1511862394, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313836323139353b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131383339333130223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a224b547448383646616e43586b4a7a686c594e5155223b),
('e3fa868a3b9bab0d1a327dfb5a1fe4d2fc8de6f8', '192.168.50.19', 1511923010, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313932323638343b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131383433353138223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('e72a1c309347558695fff095748a20ee785822bc', '192.168.50.19', 1511574000, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313537333939363b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131353137363932223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a227045594b47306233223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6373726676616c75657c733a32303a226c6d716e623977584c504e32515a357042414554223b),
('e749521a3ef30c08797502694d4ad661fb538799', '192.168.50.19', 1511407018, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313430363533373b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131343030313436223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('ea7eb5809f8e1f46cd1be8b94e07ec9b58c3bb88', '192.168.50.19', 1511582999, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313538323930393b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131353733353432223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a2252376135666d506b223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226e6577223b733a393a226373726676616c7565223b733a333a226e6577223b7d6373726676616c75657c733a32303a22516338466f5053304164685578433432574d494a223b),
('ebdef21d3930e28c06c4476a52e00be773edb68f', '192.168.50.19', 1511515441, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313531353134373b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131343034383430223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('ef254e2092db4fb4a73f5b196287167acc8db51b', '192.168.50.19', 1511506557, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313530363436333b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131343034383430223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('f1650d2c485a65bf9d2796135357d2b13b78e926', '192.168.50.19', 1511844408, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313834343132343b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131383339333130223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a224a5374426d517956223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6373726676616c75657c733a32303a22544d467356726e52514b6c36696875316b327635223b),
('f638bf9a1618bb069986336a9aafd3de5bb24ef0', '192.168.50.19', 1511408343, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313430383232343b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131343030313436223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('f6c97a519e24f8ad5e6065c5fb7aa242dbe61691', '192.168.50.19', 1511855895, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313835353833353b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131383339333130223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a224b547448383646616e43586b4a7a686c594e5155223b637372666b65797c733a383a2273684a7646625845223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6373726676616c75657c733a32303a22315174683046474a66334932505a6b6d63484f37223b),
('f8444dcccf485579b42f75faae0d1b3468e7e5c6', '192.168.50.19', 1511925684, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313932353631323b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131383433353138223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('f9a349646cab64f41055a771c45a2b4deaec9d62', '192.168.50.19', 1511773818, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313737333831373b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131373436353534223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('fa03072a8f8a53ca9e9c971da988a8a5b5672867', '192.168.50.19', 1511499815, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313439393739363b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131343034383430223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('faf0f2e7b3cc6f8f5bcc934cbd9eea188e7b18db', '192.168.50.19', 1511753058, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313735323835353b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131353837343235223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a22666c533679695075223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6373726676616c75657c733a32303a2268495a73724d775275434b63626d473553366770223b),
('fc4d64bee4ea630a060b505ad9f3aabd89fc7985', '192.168.50.19', 1511515645, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313531353630363b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131343034383430223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('fca4c1ec89f5c48f2c1838ca3f7804eb74fc990e', '192.168.50.19', 1511773515, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313737333531353b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131373436353534223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('fe24af416da551bbf8a634189053b96fbdd62ef4', '192.168.50.19', 1511408844, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313430383630353b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131343030313436223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('fef0363efa4a9ff2acb244b105d9b184e1229d58', '192.168.50.19', 1511775186, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313737353037373b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131373436353534223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a225a74486a52794957223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226e6577223b733a393a226373726676616c7565223b733a333a226e6577223b7d6373726676616c75657c733a32303a22486c544a366d6862704d46787a6b357569765156223b),
('ff519837c32ab8e506c1193a842bb8154dfedde7', '192.168.50.19', 1511919021, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531313931383937343b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353131383433353138223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_settings`
--

CREATE TABLE `sma_settings` (
  `setting_id` int(1) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `logo2` varchar(255) NOT NULL,
  `site_name` varchar(55) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `language` varchar(20) NOT NULL,
  `default_warehouse` int(2) NOT NULL,
  `accounting_method` tinyint(4) NOT NULL DEFAULT '0',
  `default_currency` varchar(3) NOT NULL,
  `default_tax_rate` int(2) NOT NULL,
  `rows_per_page` int(2) NOT NULL,
  `version` varchar(10) NOT NULL DEFAULT '1.0',
  `default_tax_rate2` int(11) NOT NULL DEFAULT '0',
  `dateformat` int(11) NOT NULL,
  `sales_prefix` varchar(20) DEFAULT NULL,
  `quote_prefix` varchar(20) DEFAULT NULL,
  `purchase_prefix` varchar(20) DEFAULT NULL,
  `transfer_prefix` varchar(20) DEFAULT NULL,
  `delivery_prefix` varchar(20) DEFAULT NULL,
  `payment_prefix` varchar(20) DEFAULT NULL,
  `return_prefix` varchar(20) DEFAULT NULL,
  `expense_prefix` varchar(20) DEFAULT NULL,
  `item_addition` tinyint(1) NOT NULL DEFAULT '0',
  `theme` varchar(20) NOT NULL,
  `product_serial` tinyint(4) NOT NULL,
  `default_discount` int(11) NOT NULL,
  `product_discount` tinyint(1) NOT NULL DEFAULT '0',
  `discount_method` tinyint(4) NOT NULL,
  `tax1` tinyint(4) NOT NULL,
  `tax2` tinyint(4) NOT NULL,
  `overselling` tinyint(1) NOT NULL DEFAULT '0',
  `restrict_user` tinyint(4) NOT NULL DEFAULT '0',
  `restrict_calendar` tinyint(4) NOT NULL DEFAULT '0',
  `timezone` varchar(100) DEFAULT NULL,
  `iwidth` int(11) NOT NULL DEFAULT '0',
  `iheight` int(11) NOT NULL,
  `twidth` int(11) NOT NULL,
  `theight` int(11) NOT NULL,
  `watermark` tinyint(1) DEFAULT NULL,
  `reg_ver` tinyint(1) DEFAULT NULL,
  `allow_reg` tinyint(1) DEFAULT NULL,
  `reg_notification` tinyint(1) DEFAULT NULL,
  `auto_reg` tinyint(1) DEFAULT NULL,
  `protocol` varchar(20) NOT NULL DEFAULT 'mail',
  `mailpath` varchar(55) DEFAULT '/usr/sbin/sendmail',
  `smtp_host` varchar(100) DEFAULT NULL,
  `smtp_user` varchar(100) DEFAULT NULL,
  `smtp_pass` varchar(255) DEFAULT NULL,
  `smtp_port` varchar(10) DEFAULT '25',
  `smtp_crypto` varchar(10) DEFAULT NULL,
  `corn` datetime DEFAULT NULL,
  `customer_group` int(11) NOT NULL,
  `default_email` varchar(100) NOT NULL,
  `mmode` tinyint(1) NOT NULL,
  `bc_fix` tinyint(4) NOT NULL DEFAULT '0',
  `auto_detect_barcode` tinyint(1) NOT NULL DEFAULT '0',
  `captcha` tinyint(1) NOT NULL DEFAULT '1',
  `reference_format` tinyint(1) NOT NULL DEFAULT '1',
  `racks` tinyint(1) DEFAULT '0',
  `attributes` tinyint(1) NOT NULL DEFAULT '0',
  `product_expiry` tinyint(1) NOT NULL DEFAULT '0',
  `decimals` tinyint(2) NOT NULL DEFAULT '2',
  `decimals_sep` varchar(2) NOT NULL DEFAULT '.',
  `thousands_sep` varchar(2) NOT NULL DEFAULT ',',
  `invoice_view` tinyint(1) DEFAULT '0',
  `default_biller` int(11) DEFAULT NULL,
  `envato_username` varchar(50) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT NULL,
  `rtl` tinyint(1) DEFAULT '0',
  `each_spent` decimal(15,4) DEFAULT NULL,
  `ca_point` tinyint(4) DEFAULT NULL,
  `each_sale` decimal(15,4) DEFAULT NULL,
  `sa_point` tinyint(4) DEFAULT NULL,
  `update` tinyint(1) DEFAULT '0',
  `sac` tinyint(1) DEFAULT '0',
  `time_notice` int(11) NOT NULL COMMENT 'Thời gian hiện thông báo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_settings`
--

INSERT INTO `sma_settings` (`setting_id`, `logo`, `logo2`, `site_name`, `company_name`, `language`, `default_warehouse`, `accounting_method`, `default_currency`, `default_tax_rate`, `rows_per_page`, `version`, `default_tax_rate2`, `dateformat`, `sales_prefix`, `quote_prefix`, `purchase_prefix`, `transfer_prefix`, `delivery_prefix`, `payment_prefix`, `return_prefix`, `expense_prefix`, `item_addition`, `theme`, `product_serial`, `default_discount`, `product_discount`, `discount_method`, `tax1`, `tax2`, `overselling`, `restrict_user`, `restrict_calendar`, `timezone`, `iwidth`, `iheight`, `twidth`, `theight`, `watermark`, `reg_ver`, `allow_reg`, `reg_notification`, `auto_reg`, `protocol`, `mailpath`, `smtp_host`, `smtp_user`, `smtp_pass`, `smtp_port`, `smtp_crypto`, `corn`, `customer_group`, `default_email`, `mmode`, `bc_fix`, `auto_detect_barcode`, `captcha`, `reference_format`, `racks`, `attributes`, `product_expiry`, `decimals`, `decimals_sep`, `thousands_sep`, `invoice_view`, `default_biller`, `envato_username`, `purchase_code`, `rtl`, `each_spent`, `ca_point`, `each_sale`, `sa_point`, `update`, `sac`, `time_notice`) VALUES
(1, 'logo2.png', 'logo4.png', 'PHẦN MỀM BÁN HÀNG FOSO', 'CompanyName', 'vietnamese', 1, 0, 'VNĐ', 0, 10, '3.0.1.13', 1, 5, 'SALE', 'QUOTE', 'PO', 'TR', 'DO', 'IPAY', 'RETURNSL', '', 0, 'default', 1, 1, 1, 1, 0, 1, 0, 1, 0, 'Asia/Singapore', 800, 800, 60, 60, 0, 0, 0, 0, NULL, 'mail', '/usr/sbin/sendmail', 'pop.gmail.com', 'contact@google.com', 'jEFTM4T63AiQ9dsidxhPKt9CIg4HQjCN58n/RW9vmdC/UDXCzRLR469ziZ0jjpFlbOg43LyoSmpJLBkcAHh0Yw==', '25', NULL, NULL, 1, 'contact@google.com', 0, 4, 1, 0, 2, 0, 0, 0, 0, '.', ',', 0, 3, 'StockManager', '3', 0, NULL, NULL, NULL, NULL, 0, 0, 60);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_skrill`
--

CREATE TABLE `sma_skrill` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) NOT NULL DEFAULT 'testaccount2@moneybookers.com',
  `secret_word` varchar(20) NOT NULL DEFAULT 'mbtest',
  `skrill_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_skrill`
--

INSERT INTO `sma_skrill` (`id`, `active`, `account_email`, `secret_word`, `skrill_currency`, `fixed_charges`, `extra_charges_my`, `extra_charges_other`) VALUES
(1, 1, 'testaccount2@moneybookers.com', 'mbtest', 'USD', '0.0000', '0.0000', '0.0000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_subcategories`
--

CREATE TABLE `sma_subcategories` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL,
  `image` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_suspended_bills`
--

CREATE TABLE `sma_suspended_bills` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) DEFAULT NULL,
  `count` int(11) NOT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_tax_id` int(11) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `biller_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `suspend_note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_suspended_items`
--

CREATE TABLE `sma_suspended_items` (
  `id` int(11) NOT NULL,
  `suspend_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_tax_rates`
--

CREATE TABLE `sma_tax_rates` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `rate` decimal(12,4) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_tax_rates`
--

INSERT INTO `sma_tax_rates` (`id`, `name`, `code`, `rate`, `type`) VALUES
(1, 'No Tax', 'NT', '0.0000', '2'),
(2, 'VAT @10%', 'VAT10', '10.0000', '1'),
(3, 'GST @6%', 'GST', '6.0000', '1'),
(4, 'VAT @20%', 'VT20', '20.0000', '1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_timeout`
--

CREATE TABLE `sma_timeout` (
  `sma_timeout_id` int(11) NOT NULL COMMENT 'id',
  `sma_timeout_userid` int(11) DEFAULT NULL COMMENT 'ID nhân viên',
  `sma_timeout_startdate` int(11) NOT NULL COMMENT 'Ngày bắt đầu',
  `sma_timeout_enddate` int(11) NOT NULL COMMENT 'Ngày kết thúc',
  `sma_timeout_day` int(11) DEFAULT NULL COMMENT 'Số ngày nghỉ',
  `sma_timeout_month` int(11) DEFAULT NULL COMMENT 'Tháng nghỉ',
  `sma_timeout_createby` int(11) NOT NULL COMMENT 'Người tạo',
  `sma_timeout_createtime` int(11) NOT NULL COMMENT 'Ngày tạo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_timeout`
--

INSERT INTO `sma_timeout` (`sma_timeout_id`, `sma_timeout_userid`, `sma_timeout_startdate`, `sma_timeout_enddate`, `sma_timeout_day`, `sma_timeout_month`, `sma_timeout_createby`, `sma_timeout_createtime`) VALUES
(5, 1, 1511884800, 1511884800, 1, 11, 1, 1511924147);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_timework`
--

CREATE TABLE `sma_timework` (
  `id` int(11) NOT NULL COMMENT 'id',
  `sma_timework_code` varchar(255) DEFAULT NULL COMMENT 'Mã giờ làm',
  `sma_timework_name` varchar(255) DEFAULT NULL COMMENT 'Tên giờ làm',
  `sma_timework_starttime` int(11) DEFAULT NULL COMMENT 'Giờ bắt đầu',
  `sma_timework_endtime` int(11) DEFAULT NULL COMMENT 'Giờ kết thúc'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_timework`
--

INSERT INTO `sma_timework` (`id`, `sma_timework_code`, `sma_timework_name`, `sma_timework_starttime`, `sma_timework_endtime`) VALUES
(2, 'AM', 'Ca sáng', 1511395200, 1511409600),
(11, 'PM', 'Ca tối', 1511413200, 1511427600);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_transfers`
--

CREATE TABLE `sma_transfers` (
  `id` int(11) NOT NULL,
  `transfer_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `from_warehouse_id` int(11) NOT NULL,
  `from_warehouse_code` varchar(55) NOT NULL,
  `from_warehouse_name` varchar(55) NOT NULL,
  `to_warehouse_id` int(11) NOT NULL,
  `to_warehouse_code` varchar(55) NOT NULL,
  `to_warehouse_name` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `grand_total` decimal(25,4) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `status` varchar(55) NOT NULL DEFAULT 'pending',
  `shipping` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `attachment` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_transfers`
--

INSERT INTO `sma_transfers` (`id`, `transfer_no`, `date`, `from_warehouse_id`, `from_warehouse_code`, `from_warehouse_name`, `to_warehouse_id`, `to_warehouse_code`, `to_warehouse_name`, `note`, `total`, `total_tax`, `grand_total`, `created_by`, `status`, `shipping`, `attachment`) VALUES
(1, 'TR/2017/09/0001', '2017-09-12 04:19:00', 1, 'WHI', 'Warehouse 1', 2, 'WHII', 'Warehouse 2', '', '0.0000', '0.0000', '0.0000', '1', 'completed', '0.0000', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_transfer_items`
--

CREATE TABLE `sma_transfer_items` (
  `id` int(11) NOT NULL,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) DEFAULT NULL,
  `quantity_balance` decimal(15,4) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_users`
--

CREATE TABLE `sma_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `last_ip_address` varbinary(45) DEFAULT NULL,
  `ip_address` varbinary(45) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `avatar` varchar(55) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `warehouse_id` int(10) UNSIGNED DEFAULT NULL,
  `biller_id` int(10) UNSIGNED DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `show_cost` tinyint(1) DEFAULT '0',
  `show_price` tinyint(1) DEFAULT '0',
  `award_points` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_users`
--

INSERT INTO `sma_users` (`id`, `last_ip_address`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `avatar`, `gender`, `group_id`, `warehouse_id`, `biller_id`, `company_id`, `show_cost`, `show_price`, `award_points`) VALUES
(1, 0x3139322e3136382e35302e3139, 0x0000, 'owner', '2c8ab736b2ccab4f50e72d5fd7d21020cbb77ae7', NULL, 'owner@google.com', NULL, NULL, NULL, '6e5e2f4c47ba10736e92891840965955f42f6f45', 1351661704, 1511919019, 1, 'Owner', 'Owner', 'Stock Manager', '012345678', NULL, 'male', 1, NULL, NULL, 2, 0, 0, 0),
(2, 0x3132372e302e302e31, 0x3132372e302e302e31, 'admin', 'cddf1c1443af50c9528f1116b5a146ef61b36e5f', NULL, '123@gmail.com', NULL, NULL, NULL, NULL, 1497324546, 1497324558, 1, 'abc', 'xyz', '123', '123', NULL, 'male', 5, 1, 3, 2, 0, 0, 0),
(3, 0x3139322e3136382e35302e3139, 0x3139322e3136382e35302e3139, '1231', 'ed9330ecc93ca8530c90b1f409c79f64a20c6e0b', NULL, 'test@gmail.com', NULL, NULL, NULL, NULL, 1511159987, 1511163527, 1, NULL, 'test thủ kho', NULL, '123', NULL, NULL, 6, 1, NULL, 1, NULL, NULL, 0),
(4, 0x3139322e3136382e35302e3139, 0x0000, 'owner', '2c8ab736b2ccab4f50e72d5fd7d21020cbb77ae7', NULL, 'owner@google.com', NULL, NULL, NULL, '6e5e2f4c47ba10736e92891840965955f42f6f45', 1351661704, 1511919019, 1, 'Owner', 'Owner', 'Stock Manager', '012345678', NULL, 'male', 1, NULL, NULL, 2, 0, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_usertimework`
--

CREATE TABLE `sma_usertimework` (
  `sma_usertimework_id` int(11) NOT NULL COMMENT 'ID',
  `sma_usertimework_userid` int(11) DEFAULT NULL COMMENT 'ID user',
  `sma_usertimework_dayofweek` varchar(255) DEFAULT NULL COMMENT 'Thứ trong tuần',
  `sma_usertimework_timeworkid` int(11) DEFAULT NULL COMMENT 'ID ca',
  `sma_usertimework_duty` varchar(255) DEFAULT NULL COMMENT 'Dạng giờ làm',
  `sma_usertimework_createby` int(11) DEFAULT NULL COMMENT 'Người tạo (Cập nhật)',
  `sma_usertimework_createtime` int(11) DEFAULT NULL COMMENT 'Giờ tạo (Cập nhật)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_usertimework`
--

INSERT INTO `sma_usertimework` (`sma_usertimework_id`, `sma_usertimework_userid`, `sma_usertimework_dayofweek`, `sma_usertimework_timeworkid`, `sma_usertimework_duty`, `sma_usertimework_createby`, `sma_usertimework_createtime`) VALUES
(65, 1, 'tuesday', 2, 'full', 1, 1511858826),
(66, 1, 'tuesday', 11, 'full', 1, 1511858826),
(67, 1, 'thursday', 2, 'full', 1, 1511858826),
(68, 1, 'thursday', 11, 'full', 1, 1511858826),
(69, 1, 'saturday', 2, 'full', 1, 1511858826),
(70, 1, 'saturday', 11, 'full', 1, 1511858826),
(71, 1, 'sunday', 2, 'full', 1, 1511858826),
(72, 1, 'sunday', 11, 'full', 1, 1511858826);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_user_logins`
--

CREATE TABLE `sma_user_logins` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_user_logins`
--

INSERT INTO `sma_user_logins` (`id`, `user_id`, `company_id`, `ip_address`, `login`, `time`) VALUES
(1, 1, NULL, 0x3132372e302e302e31, 'owner@google.com', '2016-10-26 08:48:42'),
(2, 1, NULL, 0x3132372e302e302e31, 'owner@google.com', '2016-11-01 12:37:11'),
(3, 1, NULL, 0x3132372e302e302e31, 'owner@google.com', '2016-11-01 12:40:30'),
(4, 1, NULL, 0x3132372e302e302e31, 'owner@google.com', '2016-11-02 20:04:13'),
(5, 1, NULL, 0x3132372e302e302e31, 'owner@google.com', '2016-11-02 20:12:23'),
(6, 1, NULL, 0x3132372e302e302e31, 'owner@google.com', '2016-11-02 20:15:46'),
(7, 1, NULL, 0x312e32332e342e36, 'owner@google.com', '2017-03-15 14:12:00'),
(8, 1, NULL, 0x3131352e37372e3138342e313338, 'owner@google.com', '2017-03-19 04:59:10'),
(9, 1, NULL, 0x3131352e37372e3138342e313338, 'owner@google.com', '2017-03-19 05:01:41'),
(10, 1, NULL, 0x3131352e37372e3138342e313338, 'owner@google.com', '2017-03-19 05:56:19'),
(11, 1, NULL, 0x3131352e37372e3138342e313338, 'owner@google.com', '2017-03-19 05:59:56'),
(12, 1, NULL, 0x3131332e3136312e37342e313939, 'owner@google.com', '2017-03-19 06:17:11'),
(13, 1, NULL, 0x3131352e37372e3138342e313338, 'owner@google.com', '2017-03-21 02:31:35'),
(14, 1, NULL, 0x3131352e37372e3138342e313338, 'owner@google.com', '2017-03-21 02:36:06'),
(15, 1, NULL, 0x3131372e362e35382e323338, 'owner@google.com', '2017-03-21 06:40:24'),
(16, 1, NULL, 0x3131352e37372e3138342e313338, 'owner@google.com', '2017-03-21 06:41:20'),
(17, 1, NULL, 0x32372e37342e3234312e3533, 'owner@google.com', '2017-03-22 04:45:49'),
(18, 1, NULL, 0x3131352e37372e3138342e313338, 'owner@google.com', '2017-03-22 04:58:48'),
(19, 1, NULL, 0x312e35322e3138302e313738, 'owner@google.com', '2017-03-23 09:16:04'),
(20, 1, NULL, 0x3131372e362e35382e323338, 'owner@google.com', '2017-03-23 09:16:25'),
(21, 1, NULL, 0x32372e36372e34312e313835, 'owner@google.com', '2017-03-24 02:53:45'),
(22, 1, NULL, 0x3138332e38312e34352e313436, 'owner@google.com', '2017-03-24 15:41:09'),
(23, 1, NULL, 0x3138332e38312e34352e313436, 'owner@google.com', '2017-03-26 03:42:54'),
(24, 1, NULL, 0x35382e3138362e32332e3234, 'owner@google.com', '2017-03-29 13:24:10'),
(25, 1, NULL, 0x3131332e3139302e3130342e323334, 'owner@google.com', '2017-03-29 13:24:54'),
(26, 1, NULL, 0x35382e3138362e32332e3234, 'owner@google.com', '2017-03-29 13:34:59'),
(27, 1, NULL, 0x35382e3138372e3233322e313936, 'owner@google.com', '2017-03-29 14:19:49'),
(28, 1, NULL, 0x35382e3138372e3233322e313936, 'owner@google.com', '2017-03-29 14:19:49'),
(29, 1, NULL, 0x3131332e3139302e3130342e323334, 'owner@google.com', '2017-03-29 18:02:36'),
(30, 1, NULL, 0x3131332e3139302e3130342e323334, 'owner@google.com', '2017-03-29 18:56:27'),
(31, 1, NULL, 0x32372e37372e3132352e323236, 'owner@google.com', '2017-03-30 12:27:43'),
(32, 1, NULL, 0x31342e3136352e3231392e3238, 'owner@google.com', '2017-03-31 07:11:48'),
(33, 1, NULL, 0x34322e3131392e3134382e323037, 'owner@google.com', '2017-03-31 09:24:06'),
(34, 1, NULL, 0x34322e3131392e3134382e323037, 'owner@google.com', '2017-04-01 07:26:41'),
(35, 1, NULL, 0x3137312e3233342e3231382e3835, 'owner@google.com', '2017-04-02 03:22:52'),
(36, 1, NULL, 0x3137312e3233342e3231382e3835, 'owner@google.com', '2017-04-02 03:23:20'),
(37, 1, NULL, 0x3137312e3233342e3231382e3835, 'owner@google.com', '2017-04-02 03:25:09'),
(38, 1, NULL, 0x312e35352e3234322e313635, 'owner@google.com', '2017-04-03 02:25:05'),
(39, 1, NULL, 0x3131372e362e3136322e38, 'owner@google.com', '2017-04-03 06:47:52'),
(40, 1, NULL, 0x3131352e37372e3138342e313338, 'owner@google.com', '2017-04-04 03:50:28'),
(41, 1, NULL, 0x3132302e37322e3130362e313134, 'owner@google.com', '2017-04-05 02:45:37'),
(42, 1, NULL, 0x3131352e37372e3138342e313338, 'owner@google.com', '2017-04-05 03:01:13'),
(43, 1, NULL, 0x3131352e37372e3138342e313338, 'owner@google.com', '2017-04-07 07:05:02'),
(44, 1, NULL, 0x3131332e3136332e3234352e313037, 'owner@google.com', '2017-04-09 08:20:54'),
(45, 1, NULL, 0x3131332e3136332e3234352e313037, 'owner@google.com', '2017-04-09 09:01:45'),
(46, 1, NULL, 0x3131352e37372e3138342e313338, 'owner@google.com', '2017-04-10 05:49:36'),
(47, 1, NULL, 0x3131352e37372e3138342e313338, 'owner@google.com', '2017-04-10 05:52:47'),
(48, 1, NULL, 0x3132332e32312e3232382e3230, 'owner@google.com', '2017-04-10 09:17:22'),
(49, 1, NULL, 0x3132332e32312e3232382e3230, 'owner@google.com', '2017-04-11 01:57:09'),
(50, 1, NULL, 0x3137312e3233342e3233362e3834, 'owner@google.com', '2017-04-11 02:10:56'),
(51, 1, NULL, 0x3132332e32312e3232382e3230, 'owner@google.com', '2017-04-11 06:20:26'),
(52, 1, NULL, 0x3132372e302e302e31, 'owner@google.com', '2017-06-07 01:47:27'),
(53, 1, NULL, 0x3132372e302e302e31, 'owner@google.com', '2017-06-07 03:19:58'),
(54, 1, NULL, 0x3132372e302e302e31, 'owner@google.com', '2017-06-08 03:31:22'),
(55, 1, NULL, 0x3132372e302e302e31, 'owner@google.com', '2017-06-11 03:31:47'),
(56, 1, NULL, 0x3132372e302e302e31, 'owner@google.com', '2017-06-08 01:20:53'),
(57, 1, NULL, 0x3132372e302e302e31, 'owner@google.com', '2017-06-08 01:39:31'),
(58, 1, NULL, 0x3132372e302e302e31, 'owner@google.com', '2017-06-08 09:43:29'),
(59, 1, NULL, 0x3132372e302e302e31, 'owner@google.com', '2017-06-09 01:29:16'),
(60, 1, NULL, 0x3132372e302e302e31, 'owner@google.com', '2017-06-09 07:21:23'),
(61, 1, NULL, 0x3132372e302e302e31, 'owner@google.com', '2017-06-09 09:22:23'),
(62, 1, NULL, 0x3132372e302e302e31, 'owner@google.com', '2017-06-09 09:46:11'),
(63, 1, NULL, 0x3132372e302e302e31, 'owner@google.com', '2017-06-10 01:20:14'),
(64, 1, NULL, 0x3132372e302e302e31, 'owner@google.com', '2017-06-12 01:13:34'),
(65, 1, NULL, 0x3132372e302e302e31, 'owner@google.com', '2017-06-12 07:55:19'),
(66, 1, NULL, 0x3132372e302e302e31, 'owner@google.com', '2017-06-12 08:19:40'),
(67, 1, NULL, 0x3132372e302e302e31, 'owner@google.com', '2017-06-13 01:19:26'),
(68, 2, NULL, 0x3132372e302e302e31, '123@gmail.com', '2017-06-13 03:29:18'),
(69, 1, NULL, 0x3132372e302e302e31, 'owner@google.com', '2017-06-13 03:37:31'),
(70, 1, NULL, 0x3132372e302e302e31, 'owner@google.com', '2017-06-14 01:17:13'),
(71, 1, NULL, 0x3132372e302e302e31, 'owner@google.com', '2017-06-17 03:43:42'),
(72, 1, NULL, 0x3132372e302e302e31, 'owner@google.com', '2017-06-19 01:13:15'),
(73, 1, NULL, 0x3a3a31, 'owner@google.com', '2017-08-02 03:06:36'),
(74, 1, NULL, 0x3a3a31, 'owner@google.com', '2017-08-03 01:36:16'),
(75, 1, NULL, 0x3a3a31, 'owner@google.com', '2017-08-03 06:38:16'),
(76, 1, NULL, 0x3a3a31, 'owner@google.com', '2017-08-22 04:22:39'),
(77, 1, NULL, 0x3a3a31, 'owner@google.com', '2017-09-08 03:50:35'),
(78, 1, NULL, 0x3a3a31, 'owner@google.com', '2017-09-08 08:01:36'),
(79, 1, NULL, 0x3a3a31, 'owner@google.com', '2017-09-08 09:29:02'),
(80, 1, NULL, 0x3139322e3136382e312e3139, 'owner@google.com', '2017-09-12 04:00:38'),
(81, 1, NULL, 0x3a3a31, 'owner@google.com', '2017-09-22 05:08:10'),
(82, 1, NULL, 0x3a3a31, 'owner@google.com', '2017-10-07 03:10:43'),
(83, 1, NULL, 0x3a3a31, 'owner@google.com', '2017-10-30 09:55:57'),
(84, 1, NULL, 0x3a3a31, 'owner@google.com', '2017-11-01 03:14:01'),
(85, 1, NULL, 0x3a3a31, 'owner@google.com', '2017-11-01 06:35:45'),
(86, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-11-07 03:38:40'),
(87, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-11-07 03:57:40'),
(88, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-11-07 04:02:38'),
(89, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-11-07 06:45:21'),
(90, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-11-07 07:21:02'),
(91, 1, NULL, 0x3139322e3136382e35302e313336, 'owner@google.com', '2017-11-07 07:35:54'),
(92, 1, NULL, 0x3139322e3136382e35302e313336, 'owner@google.com', '2017-11-07 08:36:02'),
(93, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-11-07 08:53:05'),
(94, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-11-07 09:22:32'),
(95, 1, NULL, 0x3139322e3136382e35302e313336, 'owner@google.com', '2017-11-07 09:44:32'),
(96, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-11-07 10:13:28'),
(97, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-11-08 01:22:31'),
(98, 1, NULL, 0x3139322e3136382e35302e313336, 'owner@google.com', '2017-11-08 01:58:27'),
(99, 1, NULL, 0x3139322e3136382e35302e313336, 'owner@google.com', '2017-11-08 05:00:28'),
(100, 1, NULL, 0x3139322e3136382e35302e313336, 'owner@google.com', '2017-11-08 05:37:39'),
(101, 1, NULL, 0x3139322e3136382e35302e313336, 'owner@google.com', '2017-11-08 06:45:15'),
(102, 1, NULL, 0x3139322e3136382e35302e313336, 'owner@google.com', '2017-11-08 08:51:08'),
(103, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-11-09 01:22:24'),
(104, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-11-09 08:17:41'),
(105, 1, NULL, 0x3139322e3136382e35302e3138, 'owner@google.com', '2017-11-09 17:51:05'),
(106, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-11-10 01:18:20'),
(107, 1, NULL, 0x3139322e3136382e35302e313336, 'owner@google.com', '2017-11-10 02:13:19'),
(108, 1, NULL, 0x3139322e3136382e35302e313336, 'owner@google.com', '2017-11-10 05:02:46'),
(109, 1, NULL, 0x3139322e3136382e35302e313336, 'owner@google.com', '2017-11-10 10:14:35'),
(110, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-11-11 01:19:46'),
(111, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-11-11 02:37:06'),
(112, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-11-13 01:21:11'),
(113, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-11-13 01:51:04'),
(114, 1, NULL, 0x3139322e3136382e35302e313336, 'owner@google.com', '2017-11-13 06:35:42'),
(115, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-11-13 07:48:19'),
(116, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-11-14 02:28:53'),
(117, 1, NULL, 0x3139322e3136382e35302e313336, 'owner@google.com', '2017-11-14 06:11:52'),
(118, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-11-15 01:24:24'),
(119, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-11-15 04:26:31'),
(120, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-11-16 01:21:55'),
(121, 1, NULL, 0x3139322e3136382e35302e313336, 'owner@google.com', '2017-11-16 03:45:29'),
(122, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-11-17 01:21:30'),
(123, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-11-18 01:32:57'),
(124, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-11-18 02:33:01'),
(125, 1, NULL, 0x3139322e3136382e35302e313336, 'owner@google.com', '2017-11-18 02:45:13'),
(126, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-11-18 03:30:54'),
(127, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-11-20 01:25:16'),
(128, 3, NULL, 0x3139322e3136382e35302e3139, 'test@gmail.com', '2017-11-20 06:40:02'),
(129, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-11-20 06:43:40'),
(130, 3, NULL, 0x3139322e3136382e35302e3139, 'test@gmail.com', '2017-11-20 06:46:42'),
(131, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-11-20 06:53:06'),
(132, 3, NULL, 0x3139322e3136382e35302e3139, 'test@gmail.com', '2017-11-20 06:53:45'),
(133, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-11-20 07:07:10'),
(134, 3, NULL, 0x3139322e3136382e35302e3139, 'test@gmail.com', '2017-11-20 07:14:28'),
(135, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-11-20 07:31:15'),
(136, 3, NULL, 0x3139322e3136382e35302e3139, 'test@gmail.com', '2017-11-20 07:38:47'),
(137, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-11-20 07:41:42'),
(138, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-11-21 02:51:27'),
(139, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-11-21 06:45:30'),
(140, 1, NULL, 0x3139322e3136382e35302e313336, 'owner@google.com', '2017-11-21 09:37:08'),
(141, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-11-22 01:27:42'),
(142, 1, NULL, 0x3139322e3136382e35302e313336, 'owner@google.com', '2017-11-22 04:08:07'),
(143, 1, NULL, 0x3139322e3136382e35302e313839, 'owner@google.com', '2017-11-22 10:15:03'),
(144, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-11-23 01:22:27'),
(145, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-11-23 02:40:40'),
(146, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-11-24 01:19:56'),
(147, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-11-24 10:01:32'),
(148, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-11-25 01:32:22'),
(149, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-11-25 02:23:29'),
(150, 1, NULL, 0x3139322e3136382e35302e313336, 'owner@google.com', '2017-11-25 05:23:45'),
(151, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-11-27 01:35:54'),
(152, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-11-27 08:47:07'),
(153, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-11-28 01:19:26'),
(154, 1, NULL, 0x3139322e3136382e35302e313336, 'owner@google.com', '2017-11-28 03:21:50'),
(155, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-11-28 04:31:58'),
(156, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-11-29 01:30:19');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_variants`
--

CREATE TABLE `sma_variants` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_warehouses`
--

CREATE TABLE `sma_warehouses` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `map` varchar(255) DEFAULT NULL,
  `phone` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_warehouses`
--

INSERT INTO `sma_warehouses` (`id`, `code`, `name`, `address`, `map`, `phone`, `email`) VALUES
(1, 'Hoàng Cầu', 'Hoàng Cầu', '<p>Address, City</p>', NULL, '012345678', 'whi@google.com'),
(2, 'Hạ Hồi', 'Hạ Hồi', '<p>Warehouse 2, Jalan Sultan Ismail, 54000, Kuala Lumpur</p>', NULL, '0105292122', 'whii@google.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_warehouses_products`
--

CREATE TABLE `sma_warehouses_products` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL,
  `disable` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Vô hiệu'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_warehouses_products`
--

INSERT INTO `sma_warehouses_products` (`id`, `product_id`, `warehouse_id`, `quantity`, `rack`, `disable`) VALUES
(28, 36, 1, '1.0000', NULL, 1),
(29, 36, 2, '0.0000', NULL, 1),
(36, 63, 1, '0.0000', NULL, 1),
(40, 68, 2, '0.0000', NULL, 1),
(41, 68, 1, '7.0000', NULL, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_warehouses_products_variants`
--

CREATE TABLE `sma_warehouses_products_variants` (
  `id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `sma_adjustments`
--
ALTER TABLE `sma_adjustments`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_calendar`
--
ALTER TABLE `sma_calendar`
  ADD PRIMARY KEY (`date`);

--
-- Chỉ mục cho bảng `sma_captcha`
--
ALTER TABLE `sma_captcha`
  ADD PRIMARY KEY (`captcha_id`),
  ADD KEY `word` (`word`);

--
-- Chỉ mục cho bảng `sma_categories`
--
ALTER TABLE `sma_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Chỉ mục cho bảng `sma_combo_items`
--
ALTER TABLE `sma_combo_items`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_companies`
--
ALTER TABLE `sma_companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `group_id_2` (`group_id`);

--
-- Chỉ mục cho bảng `sma_costing`
--
ALTER TABLE `sma_costing`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_currencies`
--
ALTER TABLE `sma_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_customer_groups`
--
ALTER TABLE `sma_customer_groups`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_date_format`
--
ALTER TABLE `sma_date_format`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_deliveries`
--
ALTER TABLE `sma_deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_expenses`
--
ALTER TABLE `sma_expenses`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_gift_cards`
--
ALTER TABLE `sma_gift_cards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `card_no` (`card_no`);

--
-- Chỉ mục cho bảng `sma_groups`
--
ALTER TABLE `sma_groups`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_history`
--
ALTER TABLE `sma_history`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_login_attempts`
--
ALTER TABLE `sma_login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_notifications`
--
ALTER TABLE `sma_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_order_ref`
--
ALTER TABLE `sma_order_ref`
  ADD PRIMARY KEY (`ref_id`);

--
-- Chỉ mục cho bảng `sma_pay`
--
ALTER TABLE `sma_pay`
  ADD PRIMARY KEY (`sma_pay_id`);

--
-- Chỉ mục cho bảng `sma_payments`
--
ALTER TABLE `sma_payments`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_paypal`
--
ALTER TABLE `sma_paypal`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_permissions`
--
ALTER TABLE `sma_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_pos_register`
--
ALTER TABLE `sma_pos_register`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_pos_settings`
--
ALTER TABLE `sma_pos_settings`
  ADD PRIMARY KEY (`pos_id`);

--
-- Chỉ mục cho bảng `sma_products`
--
ALTER TABLE `sma_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`),
  ADD KEY `category_id_2` (`category_id`);

--
-- Chỉ mục cho bảng `sma_product_photos`
--
ALTER TABLE `sma_product_photos`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_product_variants`
--
ALTER TABLE `sma_product_variants`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_purchases`
--
ALTER TABLE `sma_purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Chỉ mục cho bảng `sma_purchase_items`
--
ALTER TABLE `sma_purchase_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_id` (`purchase_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `sma_quotes`
--
ALTER TABLE `sma_quotes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Chỉ mục cho bảng `sma_quote_items`
--
ALTER TABLE `sma_quote_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quote_id` (`quote_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `sma_return_items`
--
ALTER TABLE `sma_return_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `product_id_2` (`product_id`,`sale_id`),
  ADD KEY `sale_id_2` (`sale_id`,`product_id`);

--
-- Chỉ mục cho bảng `sma_return_sales`
--
ALTER TABLE `sma_return_sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Chỉ mục cho bảng `sma_sales`
--
ALTER TABLE `sma_sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Chỉ mục cho bảng `sma_sale_items`
--
ALTER TABLE `sma_sale_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `product_id_2` (`product_id`,`sale_id`),
  ADD KEY `sale_id_2` (`sale_id`,`product_id`);

--
-- Chỉ mục cho bảng `sma_sessions`
--
ALTER TABLE `sma_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Chỉ mục cho bảng `sma_settings`
--
ALTER TABLE `sma_settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Chỉ mục cho bảng `sma_skrill`
--
ALTER TABLE `sma_skrill`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_subcategories`
--
ALTER TABLE `sma_subcategories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_suspended_bills`
--
ALTER TABLE `sma_suspended_bills`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_suspended_items`
--
ALTER TABLE `sma_suspended_items`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_tax_rates`
--
ALTER TABLE `sma_tax_rates`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_timeout`
--
ALTER TABLE `sma_timeout`
  ADD PRIMARY KEY (`sma_timeout_id`);

--
-- Chỉ mục cho bảng `sma_timework`
--
ALTER TABLE `sma_timework`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_transfers`
--
ALTER TABLE `sma_transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Chỉ mục cho bảng `sma_transfer_items`
--
ALTER TABLE `sma_transfer_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfer_id` (`transfer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `sma_users`
--
ALTER TABLE `sma_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`,`warehouse_id`,`biller_id`),
  ADD KEY `group_id_2` (`group_id`,`company_id`);

--
-- Chỉ mục cho bảng `sma_usertimework`
--
ALTER TABLE `sma_usertimework`
  ADD PRIMARY KEY (`sma_usertimework_id`);

--
-- Chỉ mục cho bảng `sma_user_logins`
--
ALTER TABLE `sma_user_logins`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_variants`
--
ALTER TABLE `sma_variants`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_warehouses`
--
ALTER TABLE `sma_warehouses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Chỉ mục cho bảng `sma_warehouses_products`
--
ALTER TABLE `sma_warehouses_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Chỉ mục cho bảng `sma_warehouses_products_variants`
--
ALTER TABLE `sma_warehouses_products_variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `option_id` (`option_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `sma_adjustments`
--
ALTER TABLE `sma_adjustments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `sma_captcha`
--
ALTER TABLE `sma_captcha`
  MODIFY `captcha_id` bigint(13) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `sma_categories`
--
ALTER TABLE `sma_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT cho bảng `sma_combo_items`
--
ALTER TABLE `sma_combo_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `sma_companies`
--
ALTER TABLE `sma_companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT cho bảng `sma_costing`
--
ALTER TABLE `sma_costing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT cho bảng `sma_currencies`
--
ALTER TABLE `sma_currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT cho bảng `sma_customer_groups`
--
ALTER TABLE `sma_customer_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT cho bảng `sma_date_format`
--
ALTER TABLE `sma_date_format`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT cho bảng `sma_deliveries`
--
ALTER TABLE `sma_deliveries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `sma_expenses`
--
ALTER TABLE `sma_expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `sma_gift_cards`
--
ALTER TABLE `sma_gift_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `sma_groups`
--
ALTER TABLE `sma_groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT cho bảng `sma_history`
--
ALTER TABLE `sma_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;
--
-- AUTO_INCREMENT cho bảng `sma_login_attempts`
--
ALTER TABLE `sma_login_attempts`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `sma_notifications`
--
ALTER TABLE `sma_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT cho bảng `sma_order_ref`
--
ALTER TABLE `sma_order_ref`
  MODIFY `ref_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT cho bảng `sma_pay`
--
ALTER TABLE `sma_pay`
  MODIFY `sma_pay_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT cho bảng `sma_payments`
--
ALTER TABLE `sma_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT cho bảng `sma_permissions`
--
ALTER TABLE `sma_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT cho bảng `sma_pos_register`
--
ALTER TABLE `sma_pos_register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT cho bảng `sma_products`
--
ALTER TABLE `sma_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;
--
-- AUTO_INCREMENT cho bảng `sma_product_photos`
--
ALTER TABLE `sma_product_photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `sma_product_variants`
--
ALTER TABLE `sma_product_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `sma_purchases`
--
ALTER TABLE `sma_purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT cho bảng `sma_purchase_items`
--
ALTER TABLE `sma_purchase_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT cho bảng `sma_quotes`
--
ALTER TABLE `sma_quotes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT cho bảng `sma_quote_items`
--
ALTER TABLE `sma_quote_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT cho bảng `sma_return_items`
--
ALTER TABLE `sma_return_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `sma_return_sales`
--
ALTER TABLE `sma_return_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `sma_sales`
--
ALTER TABLE `sma_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT cho bảng `sma_sale_items`
--
ALTER TABLE `sma_sale_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT cho bảng `sma_subcategories`
--
ALTER TABLE `sma_subcategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `sma_suspended_bills`
--
ALTER TABLE `sma_suspended_bills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `sma_suspended_items`
--
ALTER TABLE `sma_suspended_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `sma_tax_rates`
--
ALTER TABLE `sma_tax_rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT cho bảng `sma_timeout`
--
ALTER TABLE `sma_timeout`
  MODIFY `sma_timeout_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id', AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT cho bảng `sma_timework`
--
ALTER TABLE `sma_timework`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id', AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT cho bảng `sma_transfers`
--
ALTER TABLE `sma_transfers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT cho bảng `sma_transfer_items`
--
ALTER TABLE `sma_transfer_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `sma_users`
--
ALTER TABLE `sma_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT cho bảng `sma_usertimework`
--
ALTER TABLE `sma_usertimework`
  MODIFY `sma_usertimework_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=73;
--
-- AUTO_INCREMENT cho bảng `sma_user_logins`
--
ALTER TABLE `sma_user_logins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;
--
-- AUTO_INCREMENT cho bảng `sma_variants`
--
ALTER TABLE `sma_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `sma_warehouses`
--
ALTER TABLE `sma_warehouses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT cho bảng `sma_warehouses_products`
--
ALTER TABLE `sma_warehouses_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT cho bảng `sma_warehouses_products_variants`
--
ALTER TABLE `sma_warehouses_products_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
