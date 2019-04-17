-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 12, 2017 lúc 04:39 CH
-- Phiên bản máy phục vụ: 10.1.21-MariaDB
-- Phiên bản PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `laptop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `accessories`
--

CREATE TABLE `accessories` (
  `id_accessories` int(255) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(255) NOT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `preview` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cat` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_product` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `accessories`
--

INSERT INTO `accessories` (`id_accessories`, `name`, `price`, `picture`, `preview`, `cat`, `id_product`) VALUES
(2, 'Mouse Newmen NHT370', 290000, 'mouse1-78672693455556.jpg', '<p>3 chế độ DPI 800/1600/2400</p>\r\n', 'Mouse', 2001),
(3, 'Mouse Newmen N1', 190000, 'newmen-78689428494235.jpg', '<p>3 chế độ DPI 800/1600/2400</p>\r\n', 'Mouse', 2002),
(4, 'Mouse Razer x1', 560000, 'mouse3-78656791384641.jpg', '<p>3 chế độ DPI 800/1600/2400</p>\r\n', 'Mouse', 2003),
(5, 'Mouse Razer H1', 999000, 'mouse2-78740553893840.jpg', '<p>3 chế độ DPI 800/1600/2400</p>\r\n', 'Mouse', 2004),
(6, 'Mouse Logitech 1X', 570000, 'mouse2-78762382236897.jpg', '<p>3 chế độ DPI 800/1600/2400</p>\r\n', 'Mouse', 2005),
(7, 'Mouse Dell None', 345000, 'newmen-78786185893917.jpg', '<p>3 chế độ DPI 800/1600/2400</p>\r\n', 'Mouse', 2006),
(8, 'Mouse Newmen Gaming', 690000, 'mouse1-78811473735465.jpg', '<p>3 chế độ DPI 800/1600/2400</p>\r\n', 'Mouse', 2007),
(9, 'Mouse Razer Gaming', 780000, 'mouse3-78839711872879.jpg', '<p>3 chế độ DPI 800/1600/2400</p>\r\n', 'Mouse', 2008),
(10, 'Headphone NB319', 400000, '', 'Âm thanh sống động', 'Headphone', 2009),
(11, 'Headphone NB319', 350000, 'headphone-78449956155238.png', '<p>&Acirc;m thanh chuẩn</p>\r\n', 'Headphone', 20010),
(12, 'Headphone Sony Price', 190000, 'headphone1-78465085681459.jpg', '<p>&Acirc;m thanh chuẩn hay</p>\r\n', 'Headphone', 20011),
(13, 'Headphone Beat Price', 399000, 'headphone4-78422546552268.jpg', '<p>&Acirc;m thanh chuẩn</p>\r\n\r\n<p>Gi&aacute; ph&ugrave; hợp với sinh vi&ecirc;n</p>\r\n', 'Headphone', 20012),
(14, 'Headphone Beat SSS', 1790000, 'headphone5-78507438789944.jpg', '<p>&Acirc;m thanh chuẩn</p>\r\n\r\n<p>Đẹp sang trọng</p>\r\n', 'Headphone', 20013),
(15, 'Mouse Newmen NX3N', 90000, 'newmen-78865129839566.jpg', '<p>3 chế độ DPI 800/1600/2400</p>\r\n', 'Mouse', 20014),
(18, 'Headphone X1', 660000, 'headphone3-78555838115317.jpg', '<p>&Acirc;m thanh chuẩn</p>\r\n\r\n<p>Chất lượng gaming</p>\r\n', 'Headphone', 20016),
(19, 'Mouse Newmen NHT370', 290000, '', '3 chế độ DPI 800/1600/2400', 'Mouse', 200043545),
(20, 'Headphone Sony X1', 590000, 'headphone1-77568108633531.jpg', '<p>&Acirc;m thanh chuẩn 5.0</p>\r\n\r\n<p>Tr&ecirc;n cả tuyệt vời</p>\r\n', 'Headphone', 20001433),
(21, 'Keyboard Razer X1234', 1190000, 'keyboard2-77695171317637.jpg', '<p>B&agrave;n ph&iacute;m tốt</p>\r\n\r\n<p>Bền với thời gian</p>\r\n\r\n<p>Chống nước</p>\r\n', 'Keyboard', 20012344),
(22, 'Keyboard Dell X1S', 750000, 'keyboard-77771478096335.jpg', '<p>Đẹp, sang trong</p>\r\n\r\n<p>Bền, th&iacute;ch hợp với văn ph&ograve;ng</p>\r\n', 'Keyboard', 20012346),
(23, 'Keyboard Gaming H4', 460000, 'keyboard1-77838331568578.jpg', '<p>Đ&egrave;n led 7 m&agrave;u</p>\r\n\r\n<p>Ph&iacute;m cơ linh hoạt</p>\r\n', 'Keyboard', 20012347),
(24, 'Keyboard Gaming 3', 210000, 'keyboard1-77900371749799.jpg', '<p>Đ&egrave;n led 3 m&agrave;u</p>\r\n\r\n<p>Gi&aacute; rẻ ph&ugrave; hợp với sinh vi&ecirc;n</p>\r\n', 'Keyboard', 20012348),
(25, 'Headphone Sony F1', 560000, 'headphone2-77958115478823.jpg', '<p>&Acirc;m thanh chuẩn</p>\r\n\r\n<p>Hợp thời trang</p>\r\n', 'Headphone', 20004356),
(26, 'Headphone X457', 350000, 'headphone3-78115937475284.jpg', '<p>&Acirc;m thanh chuẩn</p>\r\n\r\n<p>Ph&ugrave; hợp với thể thao</p>\r\n', 'Headphone', 20020010);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brand`
--

CREATE TABLE `brand` (
  `id_brand` int(255) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `total` int(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `brand`
--

INSERT INTO `brand` (`id_brand`, `name`, `link`, `total`) VALUES
(1, 'Dell', 'http://www1.ap.dell.com/', 12),
(2, 'Asus', 'https://www.asus.com/vn/', 4),
(3, 'HP', 'http://www8.hp.com/vn/en/home.html', 1),
(4, 'Acer', 'https://www.acer.com/ac/vi/VN/content/home', 0),
(5, 'Lenovo', 'http://www3.lenovo.com/vn/vn/', 0),
(6, 'MSI', 'https://vn.msi.com/', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `id_comment` int(255) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `id_product` int(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `role` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'USER',
  `id_parent` int(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `comment`
--

INSERT INTO `comment` (`id_comment`, `name`, `email`, `message`, `id_product`, `date`, `role`, `id_parent`) VALUES
(65, 'Nguyễn Hoàng Thuận', 'knightnit96@gmail.com', 'Sản phẩm rất tốt!', 100123456, '2017-07-12 13:22:47', 'ADMIN', 0),
(66, 'Trinh', 'knightnit962@gmail.com', 'Laptop này pin xài được trong bao lâu z ad?', 100123456, '2017-07-12 13:24:35', 'USER', 0),
(67, 'Trinh', 'knightnit962@gmail.com', 'Máy tính này nge nói mạnh lắm, sao lại rẻ thế ạ', 10012343, '2017-07-12 13:25:02', 'USER', 0),
(68, 'Knight NIT', 'knightnit961@gmail.com', 'Máy này dùng trong văn phòng nên pin rất trâu nhé\n', 100123456, '2017-07-12 13:25:47', 'MOD', 66),
(69, 'Knight User', 'knightnit963@gmail.com', 'Đang có đợt khuyến mãi, mong bạn ghé shop', 100123456, '2017-07-12 13:26:22', 'ADMIN', 66);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reply` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `contact`
--

INSERT INTO `contact` (`id`, `name`, `email`, `subject`, `message`, `date`, `reply`) VALUES
(1, 'Nguyễn Hoàng Thuận', 'timkiemtamhon@gmail.com', '123', '123', '2017-07-10 19:29:37', 1),
(2, 'Nguyễn Hoàng Thuận', 'timkiemtamhon1@gmail.com', '123', '123', '2017-07-10 19:30:36', 1),
(4, 'Kim Trinh', 'timkiemtamhon@gmail.com', 'Tuyển biên tập viên', 'Em mong muốn làm biên tập viên của shop, mong admin gửi phản hồi ạ!', '2017-07-12 13:43:52', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `laptop`
--

CREATE TABLE `laptop` (
  `id_laptop` int(255) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_brand` int(255) NOT NULL,
  `cpu` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ram` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hdd` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `graphic` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `os` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `battery` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `weight` float NOT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(255) NOT NULL,
  `id_product` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `laptop`
--

INSERT INTO `laptop` (`id_laptop`, `name`, `id_brand`, `cpu`, `ram`, `display`, `hdd`, `graphic`, `os`, `battery`, `weight`, `picture`, `price`, `id_product`) VALUES
(7, 'Dell N7566', 1, 'Intel Core i5 -6300', '8GB DDR4', '15.6 Full HD (1920x1080)', '1TB', 'Nvidia Geforce GTX960M', 'Win10 Bản quyền', '6', 2.4, '7537-2-500x500-11406791614920.jpg', 21000000, 1001),
(8, 'Dell N7566', 1, 'Intel Core i5 -6300', '8GB DDR4', '15.6 Full HD (1920x1080)', '1TB', 'Nvidia Geforce GTX960M', 'Win10 Bản quyền', '6', 2.4, 'xps13-11416666029512.jpg', 21000000, 1002),
(9, 'Asus N75661', 2, 'Intel Core i5 -6300', '8GB DDR4', '15.6 Full HD (1920x1080)', '1TB', 'Nvidia Geforce GTX960M', 'Win10 Bản quyền', '6', 2.4, 'asus2-79283265413527.jpg', 15000000, 1003),
(10, 'Dell N7566', 1, 'Intel Core i5 -6300', '8GB DDR4', '15.6 Full HD (1920x1080)', '1TB', 'Nvidia Geforce GTX960M', 'Win10 Bản quyền', '6', 2.4, 'GS60-6QE-Ghost-Pro-1-11446377365405.jpg', 21000000, 1004),
(11, 'Dell N7566', 1, 'Intel Core i5 -6300', '8GB DDR4', '15.6 Full HD (1920x1080)', '1TB', 'Nvidia Geforce GTX960M', 'Win10 Bản quyền', '6', 2.4, '7537-2-500x500-11498951326522.jpg', 21000000, 1005),
(12, 'Asus N7566', 2, 'Intel Core i5 -6300', '8GB DDR4', '15.6 Full HD (1920x1080)', '1TB', 'Nvidia Geforce GTX960M', 'Win10 Bản quyền', '6', 2.4, 'original-54086993533869.jpg', 15000000, 1006),
(13, 'Dell N7566', 1, 'Intel Core i5 -6300', '8GB DDR4', '15.6 Full HD (1920x1080)', '1TB', 'Nvidia Geforce GTX960M', 'Win10 Bản quyền', '6', 2.4, '31KQrET0BuL-54148866230801.jpg', 21000000, 1007),
(14, 'Dell N7566', 1, 'Intel Core i5 -6300', '8GB DDR4', '15.6 Full HD (1920x1080)', '1TB', 'Nvidia Geforce GTX960M', 'Win10 Bản quyền', '6', 2.4, 'Dell_Inspiron_15_5558_i5_NVIDIA_15_Inch_Laptop_Image_f955525f-9054-4de8-a5e5-75bbf12fd5ec_1024x1024-54181667784604.jpg', 21000000, 1008),
(15, 'Asus N7566', 2, 'Intel Core i5 -6300', '8GB DDR4', '15.6 Full HD (1920x1080)', '1TB', 'Nvidia Geforce GTX960M', 'Win10 Bản quyền', '6', 2.4, 'unnamed-54206967444755.jpg', 15000000, 1009),
(16, 'Dell N7566', 1, 'Intel Core i5 -6300', '8GB DDR4', '15.6 Full HD (1920x1080)', '1TB', 'Nvidia Geforce GTX960M', 'Win10 Bản quyền', '6', 2.4, 'dell_xps_m1330_core_2_duo_t7500_2-20ghz_3gb_160gb_hdd_a-54222183530627.jpg', 21000000, 10010),
(17, 'Dell N7566', 1, 'Intel Core i5 -6300', '8GB DDR4', '15.6 Full HD (1920x1080)', '1TB', 'Nvidia Geforce GTX960M', 'Win10 Bản quyền', '6', 2.4, 'Dell_Inspiron_15_5558_i5_NVIDIA_15_Inch_Laptop_Image_f955525f-9054-4de8-a5e5-75bbf12fd5ec_1024x1024-54619729046206.jpg', 21000000, 10011),
(18, 'Asus N7566', 2, 'Intel Core i5 -6300', '8GB DDR4', '15.6 Full HD (1920x1080)', '1TB', 'Nvidia Geforce GTX960M', 'Win10 Bản quyền', '6', 2.4, 'dell1-79124151553352.jpg', 15000000, 10012),
(19, 'HP N7566', 3, 'Intel Core i5 -6300', '8GB DDR4', '15.6 Full HD (1920x1080)', '1TB', 'Nvidia Geforce GTX960M', 'Win10 Bản quyền', '6', 2.4, 'acer-79230893771799.jpg', 11000000, 100123456),
(20, 'Dell N7566', 1, 'Intel Core i5 -6300', '8GB DDR4', '15.6 Full HD (1920x1080)', '1TB', 'Nvidia Geforce GTX960M', 'Win10 Bản quyền', '6', 2.4, 'dell3-79164540538941.jpg', 21000000, 10013),
(21, 'Dell N7566', 1, 'Intel Core i5 -6300', '8GB DDR4', '15.6 Full HD (1920x1080)', '1TB', 'Nvidia Geforce GTX960M', 'Win10 Bản quyền', '6', 2.4, 'dell2-79178814153778.jpg', 21000000, 10014),
(22, 'Dell N7566', 1, 'Intel Core i5 -6300', '8GB DDR4', '15.6 Full HD (1920x1080)', '1TB', 'Nvidia Geforce GTX960M', 'Win10 Bản quyền', '6', 2.4, 'dell1-79195193644227.jpg', 21000000, 10015),
(23, 'Dell N7566', 1, 'Intel Core i5 -6300', '8GB DDR4', '15.6 Full HD (1920x1080)', '1TB', 'Nvidia Geforce GTX960M', 'Win10 Bản quyền', '6', 2.4, 'dell3-79209085514824.jpg', 21000000, 10016),
(24, 'MSI Gaming X1', 6, 'Intel Core i7 -6300', '16GB DDR4', '15.6 Full HD (1920x1080)', '1TB', 'Nvidia Geforce GTX1060M', 'Win10 Bản quyền', '10', 3.2, 'msi-79611945893942.jpg', 25000000, 10012341),
(25, 'MSI Gaming F1S', 6, 'Intel Core i9 -6300', '16GB DDR4', '15.6 Full HD (1920x1080)', '500GB', 'Nvidia Geforce GTX1080', 'Win10 Bản quyền', '5', 2.5, 'mssi2-79624712768841.png', 24000000, 10012342),
(26, 'MSI Gaming Optimus', 6, 'Intel Core i3 -6300', '4GB DDR4', '15.6 Full HD (1920x1080)', '250GB', 'Nvidia Geforce GTX920M', 'Win10 Bản quyền', '3', 2.1, 'msi-79635106802968.jpg', 14000000, 10012343);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order1`
--

CREATE TABLE `order1` (
  `id_order` int(255) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_payment` int(255) NOT NULL,
  `price` int(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Pending',
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order1`
--

INSERT INTO `order1` (`id_order`, `name`, `phone`, `email`, `address`, `id_payment`, `price`, `date`, `status`, `message`) VALUES
(7, 'Nguyễn Hoàng Thuận', '986021416', 'knightnit96@gmail.com', 'ádfasdf', 1, 21000000, '2017-07-06 07:48:11', 'Pending', 'ádf'),
(22, 'Knight User', '0986021416', 'knightnit963@gmail.com', '31', 2, 11000000, '2017-07-10 15:57:51', 'Pending', 'aesfasd'),
(23, 'Trinh', '0986021416', 'knightnit962@gmail.com', '31', 2, 15000000, '2017-07-10 16:44:59', 'Pending', 'sdafsadfsad'),
(25, 'Knight User', '0986021416', 'knightnit963@gmail.com', '42 Nguyễn Lương Bằng', 2, 78500000, '2017-07-12 13:28:04', 'Pending', 'Mong gửi sớm');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order2`
--

CREATE TABLE `order2` (
  `id` int(255) NOT NULL,
  `id_order` int(255) NOT NULL,
  `id_product` int(255) NOT NULL,
  `quantity` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order2`
--

INSERT INTO `order2` (`id`, `id_order`, `id_product`, `quantity`) VALUES
(2, 2, 100123456, 1),
(3, 2, 10016, 1),
(4, 2, 20013, 1),
(5, 3, 100123456, 1),
(6, 3, 10016, 1),
(7, 4, 10016, 1),
(8, 5, 100123456, 1),
(9, 7, 10016, 1),
(10, 8, 10016, 1),
(11, 9, 10016, 1),
(12, 10, 10015, 1),
(13, 11, 10016, 1),
(14, 12, 100123456, 1),
(15, 14, 100123456, 1),
(16, 18, 10016, 2),
(17, 19, 100123456, 1),
(18, 20, 100123456, 1),
(19, 21, 10016, 1),
(20, 21, 10014, 1),
(21, 21, 20015, 1),
(22, 21, 20016, 1),
(23, 22, 100123456, 1),
(24, 23, 1006, 1),
(25, 24, 100123456, 1),
(26, 24, 10016, 1),
(27, 24, 10015, 1),
(28, 24, 10013, 1),
(29, 24, 10012, 1),
(30, 24, 20016, 1),
(31, 25, 10016, 1),
(32, 25, 10015, 1),
(33, 25, 200043545, 1),
(34, 25, 10012341, 1),
(35, 25, 100123456, 1),
(36, 25, 20012348, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payment`
--

CREATE TABLE `payment` (
  `id_payment` int(255) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `info` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `payment`
--

INSERT INTO `payment` (`id_payment`, `name`, `info`) VALUES
(1, 'Bảo kim', 'Cổng thanh toán trực tuyến, https://www.baokim.vn/trang-chu'),
(2, 'COD', 'Giao dịch trực tiếp');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slide`
--

CREATE TABLE `slide` (
  `id` int(255) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `preview` text COLLATE utf8_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_laptop` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `slide`
--

INSERT INTO `slide` (`id`, `name`, `preview`, `picture`, `id_laptop`) VALUES
(3, 'ASUS thế hệ mới', 'Sau khi Intel ra mắt bộ vi xử lý thế hệ thứ 7 là Kaby Lake, Asus cũng đã chính thức lên kệ một loạt sản phẩm mới mang bộ vi xử lý thế hệ thứ 7 này.', 'fgu-11180412580154.png', 12),
(4, 'MSI siêu khủng mới nhất', 'Mập, mạnh, mát, mắc là 4 từ mà mình có thể dùng để đánh giá chiếc laptop chơi game hạng nặng mới nhất của MSI.', 'GS60-6QE-Ghost-Pro-1-11189718739038.jpg', 23),
(6, 'DELL thế hệ 7', 'Sau khi Intel ra mắt bộ vi xử lý thế hệ thứ 7 là Kaby Lake, Dell cũng đã chính thức lên kệ một loạt sản phẩm mới mang bộ vi xử lý thế hệ thứ 7 này.', '7537-2-500x500-11203638282508.jpg', 7);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `active` int(2) NOT NULL DEFAULT '1',
  `role` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'user',
  `avatar` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '12345png-11756939355427.png',
  `linkface` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `new_order` int(255) NOT NULL DEFAULT '0',
  `new_comment` int(255) NOT NULL DEFAULT '0',
  `new_contact` int(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `fullname`, `email`, `active`, `role`, `avatar`, `linkface`, `phone`, `new_order`, `new_comment`, `new_contact`) VALUES
(1, 'admin', '0b6d0d8b36c9e81ed471d5e213ba7455', 'Nguyễn Hoàng Thuận', 'knightnit96@gmail.com', 1, 'ADMIN', '1-56660263986553.jpg', 'https://www.facebook.com/thuanha302934', '0986021416', 1, 5, 1),
(2, 'mod', '0b6d0d8b36c9e81ed471d5e213ba7455', 'Knight NIT', 'knightnit961@gmail.com', 1, 'MOD', '1-56660263986553.jpg', 'https://www.facebook.com/thuanha302934', '0986021416', 0, 5, 1),
(3, 'user', '4297f44b13955235245b2497399d7a93', 'Trinh', 'knightnit962@gmail.com', 1, 'USER', '1-56660263986553.jpg', 'https://www.facebook.com/thuanha302934', '0986021416', 0, 0, 0),
(28, 'knightnit96', '4297f44b13955235245b2497399d7a93', 'Knight User', 'knightnit963@gmail.com', 1, 'ADMIN', '1-156293334084999.jpg', 'https://www.facebook.com/thuanha30294', '0986021416', 0, 0, 1),
(36, 'user1', '0b6d0d8b36c9e81ed471d5e213ba7455', 'Văn Hoàng', 'knightnit965@gmail.com', 0, 'USER', '1-76048323030982.png', 'https://www.facebook.com/van-hoang', '01224400737', 0, 0, 0),
(37, 'kimtrinh', '4297f44b13955235245b2497399d7a93', 'Kim Trinh', 'timkiemtamhon@gmail.com', 1, 'USER', '', 'https://www.facebook.com/kim-trinh', '0972771496', 0, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `video`
--

CREATE TABLE `video` (
  `id` int(255) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `video`
--

INSERT INTO `video` (`id`, `name`, `link`, `picture`) VALUES
(1, 'Laptop Dell', 'https://www.youtube.com/watch?v=-9rMo1ZPcGA', 'asus1-78913993149878.jpg'),
(2, 'Laptop Asus', 'https://www.youtube.com/watch?v=-9rMo1ZPcGA', 'dell3-78931665700670.jpg'),
(3, 'Laptop MSI', 'https://www.youtube.com/watch?v=-9rMo1ZPcGA', 'GS60-6QE-Ghost-Pro-1-11240266196871.jpg'),
(4, 'Laptop Dell', 'https://www.youtube.com/watch?v=-9rMo1ZPcGA', 'xps13-11246079565398.jpg'),
(5, 'Laptop Dell', 'https://www.youtube.com/watch?v=-9rMo1ZPcGA', 'fgu-11256852066293.png'),
(6, 'Laptop Asus', 'https://www.youtube.com/watch?v=-9rMo1ZPcGA', '7537-2-500x500-11382518288401.jpg');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `accessories`
--
ALTER TABLE `accessories`
  ADD PRIMARY KEY (`id_accessories`),
  ADD KEY `id_product` (`id_product`);

--
-- Chỉ mục cho bảng `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id_brand`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id_comment`),
  ADD KEY `id_product` (`id_product`);

--
-- Chỉ mục cho bảng `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `laptop`
--
ALTER TABLE `laptop`
  ADD PRIMARY KEY (`id_laptop`,`id_product`),
  ADD KEY `id_brand` (`id_brand`);

--
-- Chỉ mục cho bảng `order1`
--
ALTER TABLE `order1`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `pk1` (`id_payment`);

--
-- Chỉ mục cho bảng `order2`
--
ALTER TABLE `order2`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pk` (`id_order`),
  ADD KEY `pk5` (`id_product`);

--
-- Chỉ mục cho bảng `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id_payment`);

--
-- Chỉ mục cho bảng `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_laptop` (`id_laptop`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `accessories`
--
ALTER TABLE `accessories`
  MODIFY `id_accessories` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT cho bảng `brand`
--
ALTER TABLE `brand`
  MODIFY `id_brand` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `id_comment` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;
--
-- AUTO_INCREMENT cho bảng `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT cho bảng `laptop`
--
ALTER TABLE `laptop`
  MODIFY `id_laptop` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT cho bảng `order1`
--
ALTER TABLE `order1`
  MODIFY `id_order` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT cho bảng `order2`
--
ALTER TABLE `order2`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT cho bảng `payment`
--
ALTER TABLE `payment`
  MODIFY `id_payment` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT cho bảng `slide`
--
ALTER TABLE `slide`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT cho bảng `video`
--
ALTER TABLE `video`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `laptop`
--
ALTER TABLE `laptop`
  ADD CONSTRAINT `laptop_ibfk_1` FOREIGN KEY (`id_brand`) REFERENCES `brand` (`id_brand`);

--
-- Các ràng buộc cho bảng `order1`
--
ALTER TABLE `order1`
  ADD CONSTRAINT `pk1` FOREIGN KEY (`id_payment`) REFERENCES `payment` (`id_payment`);

--
-- Các ràng buộc cho bảng `slide`
--
ALTER TABLE `slide`
  ADD CONSTRAINT `slide_ibfk_1` FOREIGN KEY (`id_laptop`) REFERENCES `laptop` (`id_laptop`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
