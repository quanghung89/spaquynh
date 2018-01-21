-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 09, 2018 lúc 10:25 SA
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
-- Cấu trúc bảng cho bảng `sma_books`
--

CREATE TABLE `sma_books` (
  `sma_books_id` int(11) NOT NULL,
  `sma_books_customername` varchar(255) NOT NULL COMMENT 'Tên khách hàng',
  `sma_books_customerid` int(11) NOT NULL COMMENT 'ID khách hàng',
  `sma_books_staffid` int(11) NOT NULL COMMENT 'ID nhân viên',
  `sma_books_starttime` int(11) NOT NULL COMMENT 'Thời gian bắt đầu làm',
  `sma_books_endtime` int(11) NOT NULL COMMENT 'Thời gian kết thúc làm',
  `sma_books_endtime1` int(11) DEFAULT NULL COMMENT 'Thời gian kết thúc thực tế',
  `sma_books_categoryparentid` int(11) NOT NULL COMMENT 'ID dịch vụ cha',
  `sma_books_categoryparentname` varchar(255) NOT NULL COMMENT 'Tên dịch vụ cha',
  `sma_books_categorychildid` int(11) DEFAULT NULL COMMENT 'ID dịch vụ thêm',
  `sma_books_categorychildname` varchar(255) DEFAULT NULL COMMENT 'Tên dịch vụ thêm',
  `sma_books_createby` int(11) NOT NULL COMMENT 'Người tạo',
  `sma_books_createtime` int(11) NOT NULL COMMENT 'Thời gian tạo',
  `sma_books_price` double(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Số tiền cần thanh toán',
  `sma_books_status` int(11) NOT NULL DEFAULT '0' COMMENT 'Trạng thái',
  `sma_books_warehouseid` int(11) NOT NULL COMMENT 'ID chi nháh'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_books`
--

INSERT INTO `sma_books` (`sma_books_id`, `sma_books_customername`, `sma_books_customerid`, `sma_books_staffid`, `sma_books_starttime`, `sma_books_endtime`, `sma_books_endtime1`, `sma_books_categoryparentid`, `sma_books_categoryparentname`, `sma_books_categorychildid`, `sma_books_categorychildname`, `sma_books_createby`, `sma_books_createtime`, `sma_books_price`, `sma_books_status`, `sma_books_warehouseid`) VALUES
(9, '21321', 8, 4, 1515206340, 1515206340, 1515214800, 1, 'Nối mi', 0, NULL, 1, 1515210008, 1500000.0000, 1, 1),
(13, '123test', 30, 5, 1515480660, 1515480660, 1515481320, 8, 'ttest12', 0, NULL, 1, 1515484300, 150000.0000, 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_bouns`
--

CREATE TABLE `sma_bouns` (
  `sma_bouns_id` int(11) NOT NULL,
  `sma_bouns_userid` int(11) NOT NULL COMMENT 'ID user',
  `sma_bouns_bouns` double(20,4) NOT NULL COMMENT 'Tiền thưởng',
  `sma_bouns_note` varchar(255) DEFAULT NULL COMMENT 'Ghi chú',
  `sma_bouns_month` int(11) NOT NULL COMMENT 'Tháng',
  `sma_bouns_year` int(11) DEFAULT NULL COMMENT 'Năm',
  `sma_bouns_createby` int(11) NOT NULL COMMENT 'Người tạo',
  `sma_bouns_creattime` int(11) NOT NULL COMMENT 'Ngày tạo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_bouns`
--

INSERT INTO `sma_bouns` (`sma_bouns_id`, `sma_bouns_userid`, `sma_bouns_bouns`, `sma_bouns_note`, `sma_bouns_month`, `sma_bouns_year`, `sma_bouns_createby`, `sma_bouns_creattime`) VALUES
(1, 1, 100000.0000, 'test', 12, 2017, 1, 1512503574);

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
  `time` int(11) NOT NULL DEFAULT '0' COMMENT 'Thời gian làm của dịch vụ',
  `id_parent` int(11) DEFAULT NULL COMMENT 'Danh mục cha',
  `name_parent` varchar(255) DEFAULT NULL COMMENT 'Tên danh mục cha'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_categories`
--

INSERT INTO `sma_categories` (`id`, `code`, `name`, `image`, `price`, `time`, `id_parent`, `name_parent`) VALUES
(1, 'Nối mi', 'Nối mi', '32975a6f16f29f9327be835905e77816.jpg', 0.0000, 0, NULL, NULL),
(4, 'Uốn mi', 'Uốn mi', NULL, 0.0000, 0, 0, NULL),
(5, 'Phun mày', 'Phun mày', NULL, 0.0000, 0, 0, NULL),
(6, 'Phun môi', 'Phun môi', NULL, 0.0000, 0, 0, NULL),
(7, 'Khác', 'Khác', NULL, 0.0000, 0, 0, NULL),
(8, 'test32', 'ttest12', NULL, 0.0000, 0, 0, NULL),
(9, 'testcon', 'testcon', NULL, 0.0000, 0, 8, 'ttest12'),
(10, 'testcon1', 'testcon1', NULL, 0.0000, 0, 8, 'ttest12'),
(11, 'test thời gian', 'test thời gian', NULL, 150000.0000, 30, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_category_assign`
--

CREATE TABLE `sma_category_assign` (
  `sma_category_assign_id` int(11) NOT NULL,
  `sma_category_assign_categoryid` int(11) NOT NULL COMMENT 'ID dịch vụ',
  `sma_category_assign_userid` int(11) NOT NULL COMMENT 'ID user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_category_assign`
--

INSERT INTO `sma_category_assign` (`sma_category_assign_id`, `sma_category_assign_categoryid`, `sma_category_assign_userid`) VALUES
(1, 8, 1),
(5, 8, 2),
(6, 10, 3),
(7, 11, 2);

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
(8, 3, 'customer', 1, 'Khách hàng đang hoạt động', '21321', 'no_image.png', '', NULL, '123', '', NULL, NULL, NULL, '123', '12321@yahoo.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'logo.png', 0, '<p>Nối mi 123</p>', NULL),
(9, 3, 'customer', 1, 'Khách hàng đang hoạt động', '123', '5cf3b5969c79aa4acbc2c6af94ada732.jpg', '', NULL, '123', '', NULL, NULL, NULL, '321', '123@yahoo.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'logo.png', 0, NULL, NULL),
(12, 3, 'customer', 1, 'Khách hàng đang hoạt động', '3123211333', '45b4f844431166326a9a888c697f311b.jpg', '', NULL, '123', '', NULL, NULL, NULL, '12345677', 'test@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'logo.png', 0, NULL, NULL),
(16, 3, 'customer', 1, 'Khách hàng đang hoạt động', '21321', 'no_image.png', '', NULL, '', '', NULL, NULL, NULL, '123', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'logo.png', 0, '<p>123</p>', NULL),
(18, 3, 'customer', 1, 'Khách hàng đang hoạt động', '21321', 'no_image.png', '', NULL, '', '', NULL, NULL, NULL, '123', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'logo.png', 0, '<p>123</p>', NULL),
(19, 3, 'customer', 1, 'Khách hàng đang hoạt động', 'tyhuy', 'no_image.png', '', NULL, '', '', NULL, NULL, NULL, '012164779974', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'logo.png', 0, '', NULL),
(20, 3, 'customer', 1, 'Khách hàng đang hoạt động', 'tên mới', 'no_image.png', '', NULL, '', '', NULL, NULL, NULL, '135678', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'logo.png', 0, '', NULL),
(21, 3, 'customer', 1, 'Khách hàng đang hoạt động', 'tên mới', 'no_image.png', '', NULL, '', '', NULL, NULL, NULL, '135678', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'logo.png', 0, '', NULL),
(22, 3, 'customer', 1, 'Khách hàng đang hoạt động', 'tên mới', 'no_image.png', '', NULL, '', '', NULL, NULL, NULL, '135678', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'logo.png', 0, '', NULL),
(23, 3, 'customer', 1, 'Khách hàng đang hoạt động', 'tên mới', 'no_image.png', '', NULL, '', '', NULL, NULL, NULL, '135678', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'logo.png', 0, '', NULL),
(24, 3, 'customer', 1, 'Khách hàng đang hoạt động', 'test', 'no_image.png', '', NULL, '', '', NULL, NULL, NULL, '232', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'logo.png', 0, '', NULL),
(25, 3, 'customer', 1, 'Khách hàng đang hoạt động', 'test', 'no_image.png', '', NULL, '', '', NULL, NULL, NULL, '232', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'logo.png', 0, '', NULL),
(26, 3, 'customer', 1, 'Khách hàng đang hoạt động', 'test', 'no_image.png', '', NULL, '', '', NULL, NULL, NULL, '232', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'logo.png', 0, '', NULL),
(27, 3, 'customer', 1, 'Khách hàng đang hoạt động', 'test', 'no_image.png', '', NULL, '', '', NULL, NULL, NULL, '232', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'logo.png', 0, '', NULL),
(28, 3, 'customer', 1, 'Khách hàng đang hoạt động', '123', 'no_image.png', '', NULL, '', '', NULL, NULL, NULL, '1234', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'logo.png', 0, '', NULL),
(29, 3, 'customer', 1, 'Khách hàng đang hoạt động', '121231', 'no_image.png', '', NULL, '', '', NULL, NULL, NULL, '3333', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'logo.png', 0, '', NULL),
(30, 3, 'customer', 1, 'Khách hàng đang hoạt động', '123test', 'no_image.png', '', NULL, '', '', NULL, NULL, NULL, '44566', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'logo.png', 0, '', NULL);

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
-- Cấu trúc bảng cho bảng `sma_fine`
--

CREATE TABLE `sma_fine` (
  `sma_fine_id` int(11) NOT NULL,
  `sma_fine_userid` int(11) NOT NULL COMMENT 'ID user',
  `sma_fine_fine` double(20,4) NOT NULL COMMENT 'Tiền phát',
  `sma_fine_note` varchar(255) DEFAULT NULL COMMENT 'Ghi chú',
  `sma_fine_month` int(11) NOT NULL COMMENT 'Tháng',
  `sma_fine_year` int(11) DEFAULT NULL COMMENT 'Năm',
  `sma_fine_createby` int(11) NOT NULL COMMENT 'Người tạo',
  `sma_fine_creattime` int(11) NOT NULL COMMENT 'Ngày tạo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_fine`
--

INSERT INTO `sma_fine` (`sma_fine_id`, `sma_fine_userid`, `sma_fine_fine`, `sma_fine_note`, `sma_fine_month`, `sma_fine_year`, `sma_fine_createby`, `sma_fine_creattime`) VALUES
(1, 1, 150000.0000, '1', 12, 2017, 1, 1512962081);

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
-- Cấu trúc bảng cho bảng `sma_history_book`
--

CREATE TABLE `sma_history_book` (
  `sma_history_book_id` int(11) NOT NULL,
  `sma_history_book_bookid` int(11) DEFAULT NULL COMMENT 'ID book',
  `sma_history_book_staffid` int(11) DEFAULT NULL COMMENT 'ID nhân viên',
  `sma_history_book_status` varchar(255) DEFAULT NULL COMMENT 'Trạng thái',
  `sma_history_book_statusStaff` varchar(255) DEFAULT NULL COMMENT 'Admin đã thực hiện lệnh pending:đang xử lý'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_history_book`
--

INSERT INTO `sma_history_book` (`sma_history_book_id`, `sma_history_book_bookid`, `sma_history_book_staffid`, `sma_history_book_status`, `sma_history_book_statusStaff`) VALUES
(4, 9, 4, 'cancel', 'peding'),
(8, 13, 5, 'appect', 'complete');

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
-- Cấu trúc bảng cho bảng `sma_notice`
--

CREATE TABLE `sma_notice` (
  `sma_notice_id` int(11) NOT NULL,
  `sma_notice_descriptiontitle` varchar(255) DEFAULT NULL COMMENT 'Tiêu đề mô tả',
  `sma_notice_descriptionname` varchar(255) DEFAULT NULL COMMENT 'Tên mô tả',
  `sma_notice_typeid` int(11) DEFAULT NULL COMMENT 'id loại',
  `sma_notice_type` varchar(255) DEFAULT NULL COMMENT 'Loại',
  `sma_notice_staffid` int(11) DEFAULT NULL COMMENT 'ID người thực hiện hành động',
  `sma_notice_staffname` varchar(255) DEFAULT NULL COMMENT 'Tên người thực hiện hành động',
  `sma_notice_date` int(11) DEFAULT NULL COMMENT 'Ngày thực hiện hành động	',
  `sma_notice_slug` varchar(255) DEFAULT NULL COMMENT 'Đường dẫn',
  `sma_notice_read` tinyint(1) DEFAULT '0' COMMENT 'Trạng thái đọc'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_notice`
--

INSERT INTO `sma_notice` (`sma_notice_id`, `sma_notice_descriptiontitle`, `sma_notice_descriptionname`, `sma_notice_typeid`, `sma_notice_type`, `sma_notice_staffid`, `sma_notice_staffname`, `sma_notice_date`, `sma_notice_slug`, `sma_notice_read`) VALUES
(1, 'Theo dõi book lịch', 'Khách hàng: 21321 đặt lịch nối mi thời gian 07/01/2018 08:40', 6, 'book_asgin', 1, 'Owner', 1515285600, 'customers/modal_book/6', 1),
(2, 'Theo dõi book lịch', 'Khách hàng: 21321 đặt lịch nối mi thời gian 07/01/2018 08:40', 6, 'book_asgin', 2, 'xyz', 1515285600, 'customers/modal_book/6', 0),
(3, 'Book lịch', 'Khách hàng: 21321 đặt lịch nối mi thời gian 07/01/2018 08:40', 6, 'book', 4, 'test mới', 1515285600, 'customers/modal_book/6', 0),
(4, 'Theo dõi book lịch', 'Khách hàng: 21321<br> Thời gian: 06/01/2018 08:30', 6, 'book_asgin', 1, 'Owner', 1515198600, 'customers/modal_book/6', 1),
(5, 'Book lịch', 'Khách hàng: 21321đặt lịch: Nối mi thời gian: 06/01/2018 08:30', 6, 'book', 4, 'test mới', 1515198600, 'customers/modal_book/6', 0),
(6, 'Theo dõi book lịch', 'Khách hàng: 21321đặt lịch: Nối mi thời gian: 06/01/2018 08:36', 7, 'book_asgin', 1, 'Owner', 1515198960, 'customers/modal_book/7', 1),
(7, 'Book lịch', 'Khách hàng: 21321đặt lịch: Nối mi thời gian: 06/01/2018 08:36', 7, 'book', 4, 'test mới', 1515198960, 'customers/modal_book/7', 0),
(8, 'Theo dõi book lịch', 'Khách hàng 21321 đặt lịch Khác thời gian 06/01/2018 08:40', 8, 'book_asgin', 1, 'Owner', 1515199200, 'customers/modal_book/8', 0),
(9, 'Book lịch', 'Khách hàng 21321 đặt lịch Khác thời gian 06/01/2018 08:40', 8, 'book', 4, 'test mới', 1515199200, 'customers/modal_book/8', 0),
(10, 'Hủy book lịch', 'Khách hàng 21321 đặt lịch Khác thời gian 06/01/2018 08:40', 8, 'book_cancel', NULL, 'Owner', 1515199200, 'customers/modal_book/8', 0),
(11, 'Hủy book lịch', 'Khách hàng 21321 đặt lịch Khác thời gian 06/01/2018 08:40', 8, 'book_cancel', 4, 'test mới', 1515199200, 'customers/modal_book/8', 0),
(12, 'Theo dõi book lịch', 'Khách hàng 21321 đặt lịch Nối mi thời gian 06/01/2018 10:39', 9, 'book_asgin', 2, 'xyz', 1515206340, 'customers/modal_book/9', 0),
(13, 'Book lịch', 'Khách hàng 21321 đặt lịch Nối mi thời gian 06/01/2018 10:39', 9, 'book', 4, 'test mới', 1515206340, 'customers/modal_book/9', 0),
(14, 'Theo dõi book lịch', 'Khách hàng test đặt lịch test thời gian thời gian 09/01/2018 14:36', 10, 'book_asgin', 2, 'xyz', 1515479760, 'customers/book/10/view', 0),
(15, 'Book lịch', 'Khách hàng test đặt lịch test thời gian thời gian 09/01/2018 14:36', 10, 'book', 5, 'Testfoso', 1515479760, 'customers/book/10/view', 0),
(16, 'Book lịch', 'Khách hàng 123 đặt lịch Phun mày thời gian 09/01/2018 14:46', 11, 'book', 1, 'Owner', 1515480360, 'customers/book/11/view', 0),
(17, 'Book lịch', 'Khách hàng 121231 đặt lịch Nối mi thời gian 09/01/2018 14:48', 12, 'book', 5, 'Testfoso', 1515480480, 'customers/book/12/view', 0),
(18, 'Theo dõi book lịch', 'Khách hàng 123test đặt lịch ttest12 thời gian 09/01/2018 14:51', 13, 'book_asgin', 1, 'Owner', 1515480660, 'customers/book/13/view', 0),
(19, 'Theo dõi book lịch', 'Khách hàng 123test đặt lịch ttest12 thời gian 09/01/2018 14:51', 13, 'book_asgin', 2, 'xyz', 1515480660, 'customers/book/13/view', 0),
(20, 'Book lịch', 'Khách hàng 123test đặt lịch ttest12 thời gian 09/01/2018 14:51', 13, 'book', 5, 'Testfoso', 1515480660, 'customers/book/13/view', 0);

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
-- Cấu trúc bảng cho bảng `sma_otex`
--

CREATE TABLE `sma_otex` (
  `sma_otex_id` int(11) NOT NULL,
  `sma_otex_userid` int(11) NOT NULL COMMENT 'ID user',
  `sma_otex_pay` double(20,4) NOT NULL COMMENT 'Tiền ăn trưa',
  `sma_otex_note` varchar(255) DEFAULT NULL COMMENT 'Ghi chú',
  `sma_otex_month` int(11) NOT NULL COMMENT 'Tháng',
  `sma_otex_year` int(11) DEFAULT NULL COMMENT 'Năm',
  `sma_otex_createby` int(11) NOT NULL COMMENT 'Người tạo',
  `sma_otex_creattime` int(11) NOT NULL COMMENT 'Ngày tạo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_otex`
--

INSERT INTO `sma_otex` (`sma_otex_id`, `sma_otex_userid`, `sma_otex_pay`, `sma_otex_note`, `sma_otex_month`, `sma_otex_year`, `sma_otex_createby`, `sma_otex_creattime`) VALUES
(1, 1, 3000000.0000, 'test', 12, 2017, 1, 1513044562);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_pay`
--

CREATE TABLE `sma_pay` (
  `sma_pay_id` int(11) NOT NULL COMMENT 'ID',
  `sma_pay_userid` int(11) DEFAULT NULL COMMENT 'User ID',
  `sma_pay_pay` double(20,4) DEFAULT NULL COMMENT 'Số tiền',
  `sma_pay_startdate` int(255) DEFAULT NULL COMMENT 'Ngày kích hoạt',
  `sma_pay_createby` int(11) DEFAULT NULL COMMENT 'Người tạo',
  `sma_pay_createtime` int(11) DEFAULT NULL COMMENT 'Ngày tạo',
  `sma_pay_enddate` int(11) DEFAULT NULL COMMENT 'Ngày tắt kích hoạt',
  `sma_pay_note` int(11) DEFAULT NULL COMMENT 'Ghi chú'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_pay`
--

INSERT INTO `sma_pay` (`sma_pay_id`, `sma_pay_userid`, `sma_pay_pay`, `sma_pay_startdate`, `sma_pay_createby`, `sma_pay_createtime`, `sma_pay_enddate`, `sma_pay_note`) VALUES
(5, 1, 150000.0000, 1513008000, 1, 1513049089, 1513094400, NULL),
(6, 1, 200000.0000, 1513094400, 1, 1513052649, NULL, 1000),
(7, 5, 230000.0000, 1515427200, 1, 1515461791, NULL, NULL);

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
(63, '1', '1223456', 'cais', '0.0000', '0.0000', '20.0000', 'no_image.png', 0, NULL, '', '', '', NULL, NULL, NULL, '0.0000', 0, 1, NULL, NULL, 'code128', NULL, '', 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-12-21 03:10:41', '2017-11-16 03:01:52', 1),
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
('0051f8f9d57a4dd464c71d735dafcf662d0a9445', '192.168.50.19', 1515393460, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353339333036333b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135323031333834223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('0071d4bd7ae9bc297279249bb9293b7758775b44', '192.168.50.19', 1515487960, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353438373636393b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135343631373032223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('032818a6d9745c0ec44b4d256633ed4f4d9128b6', '192.168.50.19', 1515203859, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353230333835383b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135313338363137223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('038dbf82e9e210d28c7b5918fa9f0fe891dae04f', '192.168.50.19', 1515374327, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353337343038343b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135323031333834223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('039d10916b56fcd6de6c566659a4a951fa1cb412', '192.168.50.136', 1515486547, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353438363534363b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135343832393831223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('054ac99307e098af86bea2889c122853e0f440ee', '192.168.50.136', 1515487950, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353438373931373b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135343832393831223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('0751af2566ab0b250e1add921c41aa81308ab03a', '192.168.50.19', 1515403267, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353430303737393b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135323031333834223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('0a9f7083dccdc18554bf00cabea30e53c89c0e1b', '192.168.50.136', 1515484946, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353438343739323b7265717565737465645f706167657c733a31393a22637573746f6d6572732f6c6973745f626f6f6b223b6964656e746974797c733a31383a2274657374666f736f40676d61696c2e636f6d223b757365726e616d657c733a383a2274657374666f736f223b656d61696c7c733a31383a2274657374666f736f40676d61696c2e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135343631373931223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c4e3b67726f75705f69647c733a313a2235223b77617265686f7573655f69647c733a303a22223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2231223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b68696464656e317c693a313b),
('0beee3d1ecc30126923bd2d8c9397a544432f4b1', '192.168.50.136', 1515486149, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353438353936363b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135343832393831223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('123aa952037559fd783bb36db4e2f50808941771', '192.168.50.19', 1515209473, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353230393138303b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135313338363137223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('15d60b723f05b88b31736144cec3b582043ba161', '192.168.50.19', 1515385692, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353338353630323b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135323031333834223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('1d78eca65bf342b3af84782aae3429b21865af90', '192.168.50.19', 1515488214, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353438373937393b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135343631373032223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('1e70bb84863b9f16a5924d69b0d0f732eb25116f', '192.168.50.19', 1515489433, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353438393238303b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135343834373736223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('21a9ac506a892e5b761ade5862e6178e97ab7424', '192.168.50.19', 1515377041, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353337363830313b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135323031333834223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('26dbef660460b2fcc058f6b85f47d12e2ec76470', '192.168.50.19', 1515214923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353231343638353b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135313338363137223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('29a1b24c89e8f65a64fdb19200e5bada45a0a208', '192.168.50.136', 1515485005, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353438343737313b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135343832393831223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('328372f49710e56c23cb9ca4138b35d93aeed5c1', '192.168.50.19', 1515395328, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353339353331343b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135323031333834223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('331d8334602bdafa78302f71c92d82d1b33f1dcf', '192.168.50.19', 1515483963, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353438333634383b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135343631373032223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('3379e8e298678cf7335ec830567424f18b155fc3', '192.168.50.19', 1515211600, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353231313239343b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135313338363137223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('3553a074e1bb7a92ca391abac7b753ab948a6064', '192.168.50.19', 1515484279, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353438333936343b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135343631373032223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('3746447828f805bb4a06d6e1f3499155547a32b2', '192.168.50.19', 1515208480, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353230383438303b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135313338363137223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('38900663621c8daa456795d9d7f5dd45142ce6f3', '192.168.50.19', 1515489863, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353438393830333b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135343834373736223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('393d207eaa052395c7f80f49d36987ce17042973', '192.168.50.19', 1515205013, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353230343731393b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135313338363137223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('3d6b8d9522955aaa8ad56b3e48b8d7180ee5cf78', '192.168.50.19', 1515487138, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353438363931323b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135343631373032223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('410ceb51bb972cdb8ce5a36173d201eebc6490a7', '192.168.50.19', 1515487564, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353438373330333b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135343631373032223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('417c027500e529f82a3c5827273473ea84cd760e', '192.168.50.19', 1515398239, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353339383037333b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135323031333834223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('4380a825d2b6d2e9ba1f63f33215ecde04f1d743', '192.168.50.19', 1515377357, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353337373134363b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135323031333834223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('46c719c4f0ad54de64f698d96d5400ccc84e050d', '192.168.50.19', 1515394150, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353339333436303b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135323031333834223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('4aae8d251f01a0c9d561e60cb6ced6696ab04e08', '192.168.50.19', 1515214313, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353231343032393b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135313338363137223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('4bbfc557fe5910ef2d1d3d49c8875dcb6124aa80', '192.168.50.19', 1515207728, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353230373638333b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135313338363137223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('52212c8a3bb80499b6ead024071bd77936783fd1', '192.168.50.19', 1515205246, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353230353034393b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135313338363137223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('557142f49f71cbb9036b0845f1286ef3946613fb', '192.168.50.19', 1515213371, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353231333030323b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135313338363137223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('571f57dd4eb1897a8aef1ce0e323f197a7752b39', '192.168.50.136', 1515462490, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353436323438393b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135343032393839223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('5b3c6a691afe8117dda6f25308dfd95a0d2fb925', '192.168.50.19', 1515203546, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353230333531353b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135313338363137223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('6345ca7f8ab0d4e962040b1382846e08c542be53', '192.168.50.19', 1515403926, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353430333433373b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135323031333834223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('64a47d91695eab85c33f1c5ac00062f927d53fe2', '192.168.50.19', 1515213999, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353231333337313b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135313338363137223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('68e9317a661ca51fdd836ebd5d9655cb351b9175', '192.168.50.19', 1515485894, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353438353737393b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135343631373032223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('68f3c0b0898ddcddab602c9b94e3984dc51ede22', '192.168.50.19', 1515378101, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353337373739343b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135323031333834223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b7761726e696e677c733a32343a224b68c3b46e67207468e1bb83207468616e6820746fc3a16e223b5f5f63695f766172737c613a313a7b733a373a227761726e696e67223b733a333a226e6577223b7d),
('6c026a3e83b83ad9aa87ab4fc277b621a7a2a700', '192.168.50.19', 1515202646, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353230323432383b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135313338363137223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('6d078eaa906350c0c8f7bc7e6a55113e07b7a471', '192.168.50.19', 1515213001, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353231323730313b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135313338363137223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('7007581e791c1c0fe39ec6f05426f6e04116bc12', '192.168.50.19', 1515394446, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353339343135303b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135323031333834223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('7082d4743fd65ce2b78f780b4d0e0a9f138f693a', '192.168.50.19', 1515385590, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353338353330303b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135323031333834223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('75f18015a60e4b5531a6459c832e47932cc4eab9', '192.168.50.19', 1515386316, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353338363234373b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135323031333834223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('79a079b269be3aa478fb48f2a4aaf49580daffb0', '192.168.50.19', 1515210009, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353230393938363b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135313338363137223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('7d29caf4b0342c6f5f8e5e0d924aa2c8ae010c8f', '192.168.50.19', 1515483281, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353438323937353b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135343631373032223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('7e81c70056bb5176740643828f8320c3a2fd975d', '192.168.50.19', 1515399237, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353339393230333b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135323031333834223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('8426184acf3022c7d53bfab4620311bbcfd6640a', '192.168.50.19', 1515488656, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353438383630303b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135343834373736223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('8b5092caac4f040aaed9c220d5562d407224db49', '192.168.50.19', 1515486888, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353438363538383b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135343631373032223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('8c4bec93f86287a5f5ece6c9fcb01e4258887dd0', '192.168.50.19', 1515384460, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353338343337323b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135323031333834223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('90560c14917d1a0b5f80403bd635f95763c3271b', '192.168.50.19', 1515387074, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353338363931363b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135323031333834223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('9994daddfcb1aebdbae43f77c2688265a4bc875a', '192.168.50.19', 1515395314, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353339343435353b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135323031333834223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('99aa9a2d394db9707ea33c7958037fc4ccf9debc', '192.168.50.19', 1515212126, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353231313639353b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135313338363137223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('9e61d880779c54f9cacf241c78dd43196ca4417e', '192.168.50.19', 1515386851, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353338363536343b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135323031333834223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('a9cc65532d44b8860b616fa3b5661fcb35d1677a', '192.168.50.19', 1515484845, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353438343634323b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135343631373032223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('b02fc0cb0a938567cd6e0b747077f8cd7afbf46e', '192.168.50.19', 1515398601, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353339383535393b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135323031333834223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('b14bf885d46cdeaa61e6cd91e5809d2393532298', '192.168.50.19', 1515378298, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353337383130313b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135323031333834223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('b188036d9bfc939ffe3e5fc56da14f96d9cd1401', '192.168.50.19', 1515206038, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353230353832333b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135313338363137223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('b2646cb94b0dde6dcb85c502df5f74cb1e6cef0a', '192.168.50.19', 1515203483, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353230333136323b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135313338363137223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('b478dfd042d441ffaf8d3cb1773da4e2ef9afa0b', '192.168.50.19', 1515404046, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353430333937343b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135323031333834223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('b7de5b13a846eb37910d1332bf0cfd9ebf6ee8d6', '192.168.50.136', 1515403011, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353430323938343b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135333734303839223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('b7f841efdf57ff2121427495ad3b9947a29ba781', '192.168.50.19', 1515206264, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353230363236333b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135313338363137223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('be8e3f46e22e1b0c044d0c78484f5b12971ca277', '192.168.50.19', 1515203161, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353230323830373b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135313338363137223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('c38239d8fec06870a03b95f65c2e270841899436', '192.168.50.19', 1515202390, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353230323036393b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135313338363137223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b);
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('c58e9fd25a42f501883152c531f8232aa83dcfe0', '192.168.50.136', 1515461876, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353436313639373b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135343032393839223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('c5a90a0304b454bb35706b93f9cad3ff370ddf4e', '192.168.50.19', 1515400353, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353430303136353b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135323031333834223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('ce5b0a1ad493d685b95d059d22a8b683f8b14765', '192.168.50.19', 1515210710, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353231303338343b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135313338363137223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('d32673e2b683bf95852fc98516bce8b33247f0e2', '192.168.50.19', 1515397991, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353339373736353b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135323031333834223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('d34ee719952a961521e2fb99aefa1985ce1e68c5', '192.168.50.19', 1515208137, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353230383033323b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135313338363137223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('dcfffbeeae70f8f061fbbebf91490a329e502d5f', '192.168.50.19', 1515214680, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353231343338303b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135313338363137223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('dd9d3408e28ea4e227d21d672c9defbc606a8e65', '192.168.50.136', 1515485328, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353438353038333b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135343832393831223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('df2a2a083c399898d6bf36075d9efef9b46ddcd7', '192.168.50.19', 1515205382, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353230353335313b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135313338363137223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('e4692b549336baa9da64e1fd57282a961398fd0e', '192.168.50.19', 1515484624, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353438343238303b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135343631373032223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('e57e04dac4734b38e47e9f31d4a82216b6090f23', '192.168.50.19', 1515375670, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353337343933333b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135323031333834223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('eca73ced0098925f527967b104f66a87dafa42a5', '192.168.50.19', 1515483399, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353438333238373b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135343631373032223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('ef415a54a9c4fa0b311675b369192e4b1de5d606', '192.168.50.19', 1515486337, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353438363138393b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135343631373032223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('f7c667eee0962fe9d4865f462c9f6712f7893adb', '192.168.50.19', 1515212665, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353231323135383b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135313338363137223b6c6173745f69707c733a31333a223139322e3136382e35302e3139223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('fc30cb688de8ece707bff2a440d1f0920d48638d', '192.168.50.136', 1515484452, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353438343435313b7265717565737465645f706167657c733a303a22223b),
('fd91a6dd9f988118c8c862f85bf096bfa7f5c2c1', '192.168.50.19', 1515485644, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353438353334333b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31363a226f776e657240676f6f676c652e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31363a226f776e657240676f6f676c652e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353135343631373032223b6c6173745f69707c733a31343a223139322e3136382e35302e313336223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a333a22616c6c223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2232223b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b);

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
  `time_notice` int(11) NOT NULL COMMENT 'Thời gian hiện thông báo',
  `then_day` int(11) NOT NULL COMMENT 'Sau số ngày',
  `pay_multiplication` int(11) NOT NULL COMMENT 'Lương nhân hệ số'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_settings`
--

INSERT INTO `sma_settings` (`setting_id`, `logo`, `logo2`, `site_name`, `company_name`, `language`, `default_warehouse`, `accounting_method`, `default_currency`, `default_tax_rate`, `rows_per_page`, `version`, `default_tax_rate2`, `dateformat`, `sales_prefix`, `quote_prefix`, `purchase_prefix`, `transfer_prefix`, `delivery_prefix`, `payment_prefix`, `return_prefix`, `expense_prefix`, `item_addition`, `theme`, `product_serial`, `default_discount`, `product_discount`, `discount_method`, `tax1`, `tax2`, `overselling`, `restrict_user`, `restrict_calendar`, `timezone`, `iwidth`, `iheight`, `twidth`, `theight`, `watermark`, `reg_ver`, `allow_reg`, `reg_notification`, `auto_reg`, `protocol`, `mailpath`, `smtp_host`, `smtp_user`, `smtp_pass`, `smtp_port`, `smtp_crypto`, `corn`, `customer_group`, `default_email`, `mmode`, `bc_fix`, `auto_detect_barcode`, `captcha`, `reference_format`, `racks`, `attributes`, `product_expiry`, `decimals`, `decimals_sep`, `thousands_sep`, `invoice_view`, `default_biller`, `envato_username`, `purchase_code`, `rtl`, `each_spent`, `ca_point`, `each_sale`, `sa_point`, `update`, `sac`, `time_notice`, `then_day`, `pay_multiplication`) VALUES
(1, 'logo2.png', 'logo4.png', 'PHẦN MỀM BÁN HÀNG FOSO', 'CompanyName', 'vietnamese', 1, 0, 'VNĐ', 0, 10, '3.0.1.13', 1, 5, 'SALE', 'QUOTE', 'PO', 'TR', 'DO', 'IPAY', 'RETURNSL', '', 0, 'default', 1, 1, 1, 1, 0, 1, 0, 1, 0, 'Asia/Singapore', 800, 800, 60, 60, 0, 0, 0, 0, NULL, 'mail', '/usr/sbin/sendmail', 'pop.gmail.com', 'contact@google.com', 'jEFTM4T63AiQ9dsidxhPKt9CIg4HQjCN58n/RW9vmdC/UDXCzRLR469ziZ0jjpFlbOg43LyoSmpJLBkcAHh0Yw==', '25', NULL, NULL, 1, 'contact@google.com', 0, 4, 1, 0, 2, 0, 0, 0, 0, '.', ',', 0, 3, 'StockManager', '3', 0, NULL, NULL, NULL, NULL, 0, 0, 60, 28, 2);

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
-- Cấu trúc bảng cho bảng `sma_staffasgin`
--

CREATE TABLE `sma_staffasgin` (
  `sma_staffasgin_id` int(11) NOT NULL,
  `sma_staffasgin_idbook` int(11) NOT NULL COMMENT 'ID book lịch',
  `sma_staffasgin_staffid` int(11) NOT NULL COMMENT 'ID nhân viên',
  `sma_staffasgin_createby` int(11) NOT NULL COMMENT 'Người tạo',
  `sma_staffasgin_createtime` int(11) NOT NULL COMMENT 'Thời gian tạo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_staffasgin`
--

INSERT INTO `sma_staffasgin` (`sma_staffasgin_id`, `sma_staffasgin_idbook`, `sma_staffasgin_staffid`, `sma_staffasgin_createby`, `sma_staffasgin_createtime`) VALUES
(9, 9, 2, 1, 1515210008),
(11, 13, 1, 1, 1515484300),
(12, 13, 2, 1, 1515484300);

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
  `sma_timeout_year` int(11) DEFAULT NULL COMMENT 'Năm nghỉ',
  `sma_timeout_createby` int(11) NOT NULL COMMENT 'Người tạo',
  `sma_timeout_createtime` int(11) NOT NULL COMMENT 'Ngày tạo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `warehouse_id` varchar(10) DEFAULT NULL,
  `biller_id` int(10) UNSIGNED DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `show_cost` tinyint(1) DEFAULT '0',
  `show_price` tinyint(1) DEFAULT '0',
  `award_points` int(11) DEFAULT '0',
  `start_date` int(11) DEFAULT NULL COMMENT 'Ngày vào làm'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_users`
--

INSERT INTO `sma_users` (`id`, `last_ip_address`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `avatar`, `gender`, `group_id`, `warehouse_id`, `biller_id`, `company_id`, `show_cost`, `show_price`, `award_points`, `start_date`) VALUES
(1, 0x3139322e3136382e35302e3139, 0x0000, 'owner', '2c8ab736b2ccab4f50e72d5fd7d21020cbb77ae7', NULL, 'owner@google.com', NULL, NULL, NULL, '6e5e2f4c47ba10736e92891840965955f42f6f45', 1351661704, 1515488611, 1, 'Owner', 'Owner', 'Stock Manager', '012345678', NULL, 'male', 1, 'all', NULL, 2, 0, 0, 0, 1513008000),
(2, 0x3132372e302e302e31, 0x3132372e302e302e31, 'admin', 'cddf1c1443af50c9528f1116b5a146ef61b36e5f', NULL, '123@gmail.com', NULL, NULL, NULL, NULL, 1497324546, 1497324558, 1, 'abc', 'xyz', '123', '123', NULL, 'male', 5, '1', 3, 2, 0, 0, 0, NULL),
(3, 0x3139322e3136382e35302e3139, 0x3139322e3136382e35302e3139, '1231', 'ed9330ecc93ca8530c90b1f409c79f64a20c6e0b', NULL, 'test@gmail.com', NULL, NULL, NULL, NULL, 1511159987, 1511163527, 1, NULL, 'test thủ kho', NULL, '123', NULL, NULL, 6, '1', NULL, 1, NULL, NULL, 0, NULL),
(4, NULL, 0x3139322e3136382e35302e3139, 'test', 'c0c9c94d526ccc7744a61e9d75f77c7f6f97abf1', NULL, 'testluong@gmail.com', NULL, NULL, NULL, NULL, 1513049089, 1513049089, 1, NULL, 'test mới', NULL, '123', NULL, NULL, 1, '0', NULL, 1, 0, 0, 0, 1513008000),
(5, 0x3139322e3136382e35302e3139, 0x3139322e3136382e35302e313336, 'testfoso', '4296239cb439ab4b1d2c721e6467273ac1c4fbe9', NULL, 'testfoso@gmail.com', NULL, NULL, NULL, NULL, 1515461791, 1515488542, 1, '', 'Testfoso', NULL, '01216479974', NULL, 'male', 5, NULL, NULL, 1, 0, 0, 0, 1515427200);

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
(168, 1, 'monday', 2, 'full', 1, 1513591655),
(169, 1, 'tuesday', 2, 'full', 1, 1513591655),
(170, 1, 'tuesday', 11, 'full', 1, 1513591655),
(171, 1, 'thursday', 11, 'full', 1, 1513591655),
(172, 1, 'saturday', 2, 'full', 1, 1513591655),
(173, 1, 'saturday', 11, 'full', 1, 1513591655),
(174, 1, 'sunday', 2, 'full', 1, 1513591655),
(175, 1, 'sunday', 11, 'full', 1, 1513591655),
(229, 4, 'monday', 2, 'full', 1, 1515461836),
(230, 4, 'monday', 11, 'full', 1, 1515461836),
(231, 4, 'tuesday', 2, 'full', 1, 1515461836),
(232, 4, 'tuesday', 11, 'full', 1, 1515461836),
(233, 4, 'wednesday', 2, 'full', 1, 1515461836),
(234, 4, 'wednesday', 11, 'full', 1, 1515461836),
(235, 4, 'thursday', 2, 'full', 1, 1515461836),
(236, 4, 'friday', 2, 'full', 1, 1515461836),
(237, 4, 'friday', 11, 'full', 1, 1515461836),
(238, 4, 'saturday', 2, 'full', 1, 1515461836),
(239, 4, 'saturday', 11, 'full', 1, 1515461836),
(240, 4, 'sunday', 2, 'full', 1, 1515461836),
(241, 4, 'sunday', 11, 'full', 1, 1515461836),
(242, 5, 'monday', 2, 'full', 1, 1515483018),
(243, 5, 'monday', 11, 'full', 1, 1515483018),
(244, 5, 'tuesday', 2, 'full', 1, 1515483018),
(245, 5, 'tuesday', 11, 'full', 1, 1515483018),
(246, 5, 'wednesday', 2, 'full', 1, 1515483018),
(247, 5, 'wednesday', 11, 'full', 1, 1515483018),
(248, 5, 'thursday', 2, 'full', 1, 1515483018),
(249, 5, 'thursday', 11, 'full', 1, 1515483018),
(250, 5, 'friday', 2, 'full', 1, 1515483018),
(251, 5, 'friday', 11, 'full', 1, 1515483018),
(252, 5, 'saturday', 2, 'full', 1, 1515483018),
(253, 5, 'saturday', 11, 'full', 1, 1515483018),
(254, 5, 'sunday', 2, 'full', 1, 1515483018),
(255, 5, 'sunday', 11, 'full', 1, 1515483018);

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
(156, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-11-29 01:30:19'),
(157, 1, NULL, 0x3139322e3136382e35302e313638, 'owner@google.com', '2017-12-01 09:38:57'),
(158, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-12-06 02:09:22'),
(159, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-12-06 07:01:42'),
(160, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-12-11 01:24:16'),
(161, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-12-12 01:10:28'),
(162, 1, NULL, 0x3139322e3136382e35302e313336, 'owner@google.com', '2017-12-12 02:01:21'),
(163, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-12-14 04:16:25'),
(164, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-12-12 08:26:00'),
(165, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-12-13 01:18:21'),
(166, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-12-14 06:53:43'),
(167, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-12-14 01:25:23'),
(168, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-12-15 01:30:09'),
(169, 1, NULL, 0x3139322e3136382e35302e313336, 'owner@google.com', '2017-12-15 02:35:43'),
(170, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-12-15 07:34:19'),
(171, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-12-16 01:32:27'),
(172, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-12-18 01:24:52'),
(173, 1, NULL, 0x3139322e3136382e35302e313336, 'owner@google.com', '2017-12-18 02:42:18'),
(174, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-12-19 01:34:08'),
(175, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-12-20 08:00:49'),
(176, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-12-21 01:29:41'),
(177, 1, NULL, 0x3139322e3136382e35302e313336, 'owner@google.com', '2017-12-21 02:58:48'),
(178, 1, NULL, 0x3139322e3136382e35302e313336, 'owner@google.com', '2017-12-21 07:15:39'),
(179, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2017-12-22 01:19:55'),
(180, 1, NULL, 0x3139322e3136382e35302e313336, 'owner@google.com', '2017-12-22 09:05:33'),
(181, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2018-01-05 01:14:10'),
(182, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2018-01-05 07:50:17'),
(183, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2018-01-06 01:16:24'),
(184, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2018-01-08 01:14:50'),
(185, 1, NULL, 0x3139322e3136382e35302e313336, 'owner@google.com', '2018-01-08 09:16:29'),
(186, 1, NULL, 0x3139322e3136382e35302e313336, 'owner@google.com', '2018-01-09 01:35:02'),
(187, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2018-01-09 07:29:41'),
(188, 1, NULL, 0x3139322e3136382e35302e313336, 'owner@google.com', '2018-01-09 07:59:36'),
(189, 5, NULL, 0x3139322e3136382e35302e313336, 'testfoso@gmail.com', '2018-01-09 08:01:37'),
(190, 5, NULL, 0x3139322e3136382e35302e3139, 'testfoso@gmail.com', '2018-01-09 09:02:23'),
(191, 1, NULL, 0x3139322e3136382e35302e3139, 'owner@google.com', '2018-01-09 09:03:31');

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
-- Chỉ mục cho bảng `sma_books`
--
ALTER TABLE `sma_books`
  ADD PRIMARY KEY (`sma_books_id`);

--
-- Chỉ mục cho bảng `sma_bouns`
--
ALTER TABLE `sma_bouns`
  ADD PRIMARY KEY (`sma_bouns_id`);

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
-- Chỉ mục cho bảng `sma_category_assign`
--
ALTER TABLE `sma_category_assign`
  ADD PRIMARY KEY (`sma_category_assign_id`);

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
-- Chỉ mục cho bảng `sma_fine`
--
ALTER TABLE `sma_fine`
  ADD PRIMARY KEY (`sma_fine_id`);

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
-- Chỉ mục cho bảng `sma_history_book`
--
ALTER TABLE `sma_history_book`
  ADD PRIMARY KEY (`sma_history_book_id`);

--
-- Chỉ mục cho bảng `sma_login_attempts`
--
ALTER TABLE `sma_login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_notice`
--
ALTER TABLE `sma_notice`
  ADD PRIMARY KEY (`sma_notice_id`);

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
-- Chỉ mục cho bảng `sma_otex`
--
ALTER TABLE `sma_otex`
  ADD PRIMARY KEY (`sma_otex_id`);

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
-- Chỉ mục cho bảng `sma_staffasgin`
--
ALTER TABLE `sma_staffasgin`
  ADD PRIMARY KEY (`sma_staffasgin_id`);

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
-- AUTO_INCREMENT cho bảng `sma_books`
--
ALTER TABLE `sma_books`
  MODIFY `sma_books_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT cho bảng `sma_bouns`
--
ALTER TABLE `sma_bouns`
  MODIFY `sma_bouns_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT cho bảng `sma_captcha`
--
ALTER TABLE `sma_captcha`
  MODIFY `captcha_id` bigint(13) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `sma_categories`
--
ALTER TABLE `sma_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT cho bảng `sma_category_assign`
--
ALTER TABLE `sma_category_assign`
  MODIFY `sma_category_assign_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT cho bảng `sma_combo_items`
--
ALTER TABLE `sma_combo_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `sma_companies`
--
ALTER TABLE `sma_companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
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
-- AUTO_INCREMENT cho bảng `sma_fine`
--
ALTER TABLE `sma_fine`
  MODIFY `sma_fine_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
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
-- AUTO_INCREMENT cho bảng `sma_history_book`
--
ALTER TABLE `sma_history_book`
  MODIFY `sma_history_book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT cho bảng `sma_login_attempts`
--
ALTER TABLE `sma_login_attempts`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT cho bảng `sma_notice`
--
ALTER TABLE `sma_notice`
  MODIFY `sma_notice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
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
-- AUTO_INCREMENT cho bảng `sma_otex`
--
ALTER TABLE `sma_otex`
  MODIFY `sma_otex_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT cho bảng `sma_pay`
--
ALTER TABLE `sma_pay`
  MODIFY `sma_pay_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=8;
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
-- AUTO_INCREMENT cho bảng `sma_staffasgin`
--
ALTER TABLE `sma_staffasgin`
  MODIFY `sma_staffasgin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
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
  MODIFY `sma_timeout_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id';
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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT cho bảng `sma_usertimework`
--
ALTER TABLE `sma_usertimework`
  MODIFY `sma_usertimework_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=256;
--
-- AUTO_INCREMENT cho bảng `sma_user_logins`
--
ALTER TABLE `sma_user_logins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=192;
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
