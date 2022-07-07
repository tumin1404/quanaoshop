-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 05, 2022 lúc 01:26 PM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `1011912`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bills_ban`
--

CREATE TABLE `bills_ban` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_kh` int(11) DEFAULT NULL,
  `date_order` date DEFAULT NULL,
  `tong_tien` float DEFAULT NULL COMMENT 'tổng tiền',
  `payment` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'hình thức thanh toán',
  `status` varchar(20) NOT NULL,
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `bills_ban`
--

INSERT INTO `bills_ban` (`id`, `id_kh`, `date_order`, `tong_tien`, `payment`, `status`, `note`, `created_at`, `updated_at`) VALUES
(22, 34, '2019-05-09', 35000, 'on', '1', NULL, '2019-05-09 01:27:05', '2019-05-09 01:27:05'),
(15, 27, '2019-04-19', 17000, 'on', '1', NULL, '2019-04-22 08:17:54', '2019-04-18 22:48:32'),
(16, 28, '2019-04-19', 70000, 'on', '0', NULL, '2019-04-22 08:21:23', '2019-04-22 01:21:23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bills_nhap`
--

CREATE TABLE `bills_nhap` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_ncc` int(11) DEFAULT NULL,
  `id_nhanvien` int(10) NOT NULL,
  `date_order` date DEFAULT NULL,
  `tong_tien` float DEFAULT NULL COMMENT 'tổng tiền',
  `thanh_toan` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'hình thức thanh toán',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `bills_nhap`
--

INSERT INTO `bills_nhap` (`id`, `id_ncc`, `id_nhanvien`, `date_order`, `tong_tien`, `thanh_toan`, `note`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2019-04-15', 1500000, 'on', NULL, '2019-04-15 06:35:40', '2019-04-15 05:39:45');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill_detail_ban`
--

CREATE TABLE `bill_detail_ban` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_bill_ban` int(10) NOT NULL,
  `id_sp` int(10) NOT NULL,
  `sl` int(11) NOT NULL COMMENT 'số lượng',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `bill_detail_ban`
--

INSERT INTO `bill_detail_ban` (`id`, `id_bill_ban`, `id_sp`, `sl`, `created_at`, `updated_at`) VALUES
(12, 16, 6, 1, '2019-04-18 22:50:19', '2019-04-18 22:50:19'),
(11, 15, 4, 1, '2019-04-18 22:48:32', '2019-04-18 22:48:32'),
(13, 16, 7, 2, '2019-04-18 22:50:19', '2019-04-18 22:50:19'),
(19, 22, 2, 1, '2019-05-09 01:27:05', '2019-05-09 01:27:05'),
(17, 20, 6, 1, '2019-05-05 18:19:04', '2019-05-05 18:19:04');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill_detail_nhap`
--

CREATE TABLE `bill_detail_nhap` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_bill_nhap` int(10) NOT NULL,
  `id_sp` int(10) NOT NULL,
  `sl` int(11) NOT NULL COMMENT 'số lượng',
  `don_vi` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `bill_detail_nhap`
--

INSERT INTO `bill_detail_nhap` (`id`, `id_bill_nhap`, `id_sp`, `sl`, `don_vi`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 10, 'kg', '2019-04-15 06:35:52', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khach_hang`
--

CREATE TABLE `khach_hang` (
  `id` int(10) UNSIGNED NOT NULL,
  `ten_kh` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dia_chi` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sdt` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `note` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `khach_hang`
--

INSERT INTO `khach_hang` (`id`, `ten_kh`, `email`, `dia_chi`, `sdt`, `note`, `created_at`, `updated_at`) VALUES
(39, 'trần ngọc tú', 'trantu1404@gmail.com', 'Trung Hưng - Yên Mỹ - Hưng Yên', '0372082758', 'nấd', '2022-05-30 14:13:42', '2022-05-30 07:13:42'),
(32, 'Dương Vũ Hoàng Việt', 'tuan@gmail.com', 'Trung Hoà - Yên Mỹ - Hưng Yên', '0983756482', NULL, '2022-05-30 14:14:19', '2022-05-30 07:14:19'),
(34, 'Đoàn Linh', 'doanlinh@gmail.com', 'Đa Lộc- Ân Thi-Hưng Yên', '01628470872', NULL, '2019-05-09 01:27:05', '2019-05-09 01:27:05'),
(27, 'Nguyễn Văn Hùng', 'hung@gmail.com', 'Nguyễn Xá- Nhân Hòa-Mỹ Hào-Hưng yên', '0983017763', NULL, '2022-04-13 08:17:02', '2022-04-13 01:17:02'),
(38, 'Vũ Đăng Thắng', 'thang@gmail.com', 'hung yen-yên mỹ', '0353866145', NULL, '2022-04-18 01:23:36', '2022-04-17 18:23:36'),
(40, 'Hà Tài Anh', 'taianh@gmail.com', 'Dạ Trạch, Khoái Châu, Hưng Yên', '0366434183', NULL, '2022-05-30 07:41:14', '2022-05-30 07:41:14'),
(41, 'Hoàng Trung Anh', 'trungang@gmail.com', 'Tiên Tiến-Phù Cừ-Hưng Yên', '0826963666', NULL, '2022-05-30 07:42:09', '2022-05-30 07:42:09'),
(42, 'Lê Thị Mai Anh', 'maianh@gmail.com', 'Dạ Trạch -Khoái Châu -Hưng Yên', '0348445200', NULL, '2022-05-30 07:42:43', '2022-05-30 07:42:43'),
(43, 'Trương Văn Dũng', 'truongdung@gmail.com', 'Yên Bắc - Duy Tiên - Hà Nam', '0365902380', NULL, '2022-05-30 07:43:20', '2022-05-30 07:43:20'),
(44, 'Trần Thanh Dương', 'thanhduong@gmail.com', 'Toàn Tháng- Kim Động - Hưng Yên', '0989593817', NULL, '2022-05-30 07:43:52', '2022-05-30 07:43:52'),
(45, 'Đặng Tuấn Đạt', 'tuandat@gmail.com', 'Trung Hòa - Yên Mỹ - Hưng Yên', '0965082762', NULL, '2022-05-30 07:44:23', '2022-05-30 07:44:23'),
(46, 'Nguyễn Quang Đạt', 'quangdat@gmail.com', 'Tân Dân - Khoái Châu - Hưng Yên', '0969173620', NULL, '2022-05-30 07:44:50', '2022-05-30 07:44:50'),
(47, 'Nguyễn Thị Hảo', 'nguyenhao@gmail.com', 'Hoàn Long -Yên Mỹ -Hưng Yên', '0985508902', NULL, '2022-05-30 07:45:27', '2022-05-30 07:45:27'),
(48, 'Đoàn Trung Hiếu', 'doanhieu@gmail.com', 'Lương Bằng - Kim Động - Hưng Yên', '0931526774', NULL, '2022-05-30 07:46:33', '2022-05-30 07:46:33'),
(49, 'Lê Trọng Mạnh', 'trongmanh@gmail.com', 'Đông Kết - Khoái Châu - Hưng Yên', '0354937919', NULL, '2022-05-30 07:47:05', '2022-05-30 07:47:05');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `kho`
--

CREATE TABLE `kho` (
  `id` int(11) NOT NULL,
  `id_sp` int(11) NOT NULL,
  `sl` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lien_he`
--

CREATE TABLE `lien_he` (
  `id` int(11) NOT NULL,
  `name_kh` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email_kh` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vande` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `noidung` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loai_sp`
--

CREATE TABLE `loai_sp` (
  `id` int(10) UNSIGNED NOT NULL,
  `tenloai` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Delet` int(11) NOT NULL COMMENT '0:hien,1:an',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `loai_sp`
--

INSERT INTO `loai_sp` (`id`, `tenloai`, `Delet`, `created_at`, `updated_at`) VALUES
(9, 'Váy dài', 1, '2019-04-17 03:41:45', '2022-05-16 04:30:16'),
(14, 'Váy hai dây', 1, '2022-04-27 01:54:15', '2022-05-16 04:30:27'),
(17, 'Váy ngắn', 1, '2022-05-16 04:30:40', '2022-05-16 04:30:40'),
(18, 'Váy trễ vai', 1, '2022-05-16 04:30:49', '2022-05-16 04:30:49'),
(19, 'Chân váy', 1, '2022-05-16 04:31:00', '2022-05-16 04:31:00'),
(20, 'Đồ bộ nam', 1, '2022-05-16 04:31:15', '2022-05-16 04:31:15'),
(21, 'Đồ bộ nữ', 1, '2022-05-25 08:32:43', '2022-05-25 08:32:43');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news`
--

CREATE TABLE `news` (
  `id_new` int(10) NOT NULL,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'tiêu đề',
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'nội dung',
  `image` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'hình',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `news`
--

INSERT INTO `news` (`id_new`, `title`, `content`, `image`, `created_at`, `updated_at`) VALUES
(7, 'redrs', 'toàn yêu  AHHH', 'blackfriday.png', '2022-05-16 02:20:54', '2022-05-15 19:20:54');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhan_vien`
--

CREATE TABLE `nhan_vien` (
  `id` int(11) NOT NULL,
  `ten_nhanvien` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gioitinh` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `ngaysinh` date NOT NULL,
  `quequan` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sdt` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `capbac` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `nhan_vien`
--

INSERT INTO `nhan_vien` (`id`, `ten_nhanvien`, `gioitinh`, `ngaysinh`, `quequan`, `sdt`, `email`, `capbac`, `created_at`, `updated_at`) VALUES
(6, 'Dương Đạt Huê', 'Nam', '2001-05-16', 'trung hòa - yên mỹ - Hưng Yên1', '0965082762', 'dathue@gmail.com', '1', '2022-05-12 07:05:59', '2022-05-12 00:05:59'),
(7, 'Dương Quang Thắng', 'Nu', '2001-05-04', 'Thị Trấn - Yên Mỹ - Hưng Yên', '0379114366', 'thanghue@gmail.com', '1', '2022-04-13 18:20:48', '2022-04-13 18:20:48'),
(8, 'nguyen tran anh thang', 'Nam', '2001-10-06', 'thi tran yen mi - hung yen', '0311213214', 'thanghym321@gmail.com', '2', '2022-04-17 06:07:35', '2022-04-17 06:07:35'),
(9, 'dat', 'Nam', '2001-12-02', 'trung hoa', '3213213321', 'dathue@gmail.com', '1', '2022-05-07 22:48:56', '2022-05-07 22:48:56'),
(10, 'Vô  Tình', 'Nu', '2001-12-01', 'Kim Động - Hưng Yên', '023123412', 'votinh@gmail.com', '1', '2022-05-12 00:06:52', '2022-05-12 00:06:52'),
(11, 'Đoàn trung hiếu', 'Nu', '2001-12-01', 'Kim Động - Hưng Yên', '03213124', 'hiuiuhue@gmail.com', '1', '2022-05-12 00:07:36', '2022-05-12 00:07:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nha_cung_cap`
--

CREATE TABLE `nha_cung_cap` (
  `id` int(11) NOT NULL,
  `ten_ncc` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `diachi_ncc` text COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sdt` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `Delet` int(11) NOT NULL COMMENT '0:hien,1:an',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `nha_cung_cap`
--

INSERT INTO `nha_cung_cap` (`id`, `ten_ncc`, `diachi_ncc`, `email`, `sdt`, `Delet`, `created_at`, `updated_at`) VALUES
(9, 'Lâm Thu Fashion Shop', 'Liêu Trung - Liêu Xá - Yên Mỹ - Hưng Yên', 'lamthufashion@gmail.com', '0372561428', 1, '2022-05-16 04:32:57', '2022-05-16 04:32:57'),
(10, 'Tú Min Fashion Shop', 'Trung Hưng - Yên Mỹ - Hưng Yên', 'trantu143444@gmail.com', '0372082758', 1, '2022-05-16 04:33:57', '2022-05-16 04:33:57'),
(11, 'Min Music shop', 'Hà Nội', 'minmusic@gmail.com', '0362124689', 1, '2022-05-16 04:35:17', '2022-05-16 04:35:17');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phan_hoi`
--

CREATE TABLE `phan_hoi` (
  `id_phan_hoi` int(11) NOT NULL,
  `id_tk` int(10) NOT NULL,
  `id_sp` int(10) NOT NULL,
  `level` int(10) NOT NULL,
  `note` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `phan_hoi`
--

INSERT INTO `phan_hoi` (`id_phan_hoi`, `id_tk`, `id_sp`, `level`, `note`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 4, 'Nếu mua nhiều có được chiết khấu không vậy?', '2019-04-15 05:27:42', '0000-00-00 00:00:00'),
(2, 1, 7, 5, 'Mình đã mua hoa quả đúng chất lượng.', '2019-04-15 05:27:43', '0000-00-00 00:00:00'),
(3, 1, 2, 3, 'Ngon.Ngon', '2019-04-15 05:27:43', '0000-00-00 00:00:00'),
(4, 1, 1, 0, 'Quả này đẻ', '2019-04-15 05:27:43', '2019-04-10 02:20:29'),
(5, 1, 1, 0, 'uk', '2019-04-15 05:27:43', '2019-04-10 02:21:01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `quang_cao`
--

CREATE TABLE `quang_cao` (
  `id` int(11) NOT NULL,
  `tittle` text COLLATE utf8_unicode_ci NOT NULL,
  `image` text COLLATE utf8_unicode_ci NOT NULL,
  `note` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `san_pham`
--

CREATE TABLE `san_pham` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_loai_sp` int(10) UNSIGNED DEFAULT NULL,
  `id_ncc` int(11) NOT NULL,
  `mota_sp` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_price` float DEFAULT NULL,
  `gia_km` float DEFAULT NULL,
  `so_luong` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `don_vi_tinh` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `san_pham`
--

INSERT INTO `san_pham` (`id`, `name`, `id_loai_sp`, `id_ncc`, `mota_sp`, `unit_price`, `gia_km`, `so_luong`, `image`, `don_vi_tinh`, `new`, `created_at`, `updated_at`) VALUES
(52, 'Váy dài thướt tha - Vàng', 9, 9, '⭐Kích thước / (CM)\nS: Chiều dài: 80  Ngực: 88  Vai: 32 Tay áo: 20\nM: Chiều dài: 82 Ngực: 92 Vai: 33.5 Tay áo: 20.5     \nL: Chiều dài: 84 Ngực: 96 Vai: 35 Tay áo: 21    \nXL: Chiều dài: 86 Ngực: 100 Vai: 36.5 Tay áo: 21.5    \n2XL: Chiều dài: 88 Ngực: 104 Vai: 38 Tay áo: 22    \n⭐Do đo lường thủ công, sai số 1-3cm là hoàn toàn bình thường    \n⭐Kính chào quý khách. Chào mừng bạn đến với cửa hàng của chúng tôi  \n⭐Các loại vải được sử dụng trong trang phục này có chất lượng tốt và gia công tỉ mỉ  \n⭐Nếu thích phong cách của cửa hàng chúng tôi nhớ theo dõi cửa hàng   \n⭐Nếu thích bộ trang phục này hãy nhanh chóng đặt mua. Khi giá nhân công chất liệu ngày càng chênh lệch, sản phẩm sẽ phải tăng giá thành và làm cho giá cả tăng lên. Nên bạn đặt mua ở thời điểm hiện tại sẽ có giá tốt nhất  \n⭐Nếu bạn có bất kỳ câu hỏi nào, vui lòng liên hệ với chúng tôi', 990000, 799000, 7, '0d20ff4fde161f484607.jpg', 'vnd', 0, '2022-05-30 08:29:17', '2022-05-30 08:29:17'),
(65, 'Đồ bộ nam 1', 20, 10, '✔THÔNG TIN SẢN PHẨM  \nBộ quần áo thun nam in 3D được thiết kế theo phong cách Hàn Quốc Hot Trend phù hợp với các bạn trẻ năng động.  \n✔ Chất liệu thun lạnh cao cấp có độ lì vừa phải, đặc biệt THOÁNG KHÍ, CO DÃN, THẤM HÚT mồ hôi \n✔ Thiết kế cơ bản phù hợp nhiều hoàn cảnh: mặc nhà, đi học, đi chơi, du lịch, thể thao, Gym, làm quà tặng... \n✔ Họa tiết, logo được in nhiệt dễ giặt, mau khô, không bong tróc\n ✔ Sản phẩm được may cẩn thận, tỉ mỉ đến từng đường kim mũi chỉ  \n✔ Đủ size, Đủ ảnh, Video thực tế, Đảm bảo sản phẩm y hình 100%  HƯỚNG DẪN LỰA CHỌN SIZE SỐ  Với những khách có dáng người đặc biệt quá gầy hoặc đang tăng cân nên nhắn tin để shop tư vấn size trước khi đặt, shop rất sẵn lòng phục vụ 24/7. \n✔ Xs 20kg hàng có lỗi \n✔ M: 35-55kg \n✔ L:  55-65kg \n✔ XL : 65-75kg \n✔ XXL 75-85kg Khách lưu ý chọn đúng size để tránh mất thời gian đổi trả sản phẩm ạ <3 CHÍNH SÁCH BÁN HÀNG \n✔ Tất cả các sản phẩm đều được shop bảo hành, đổi trả trong vòng 3 ngày kể từ ngày nhận hàng.  \n✔ Đối với sản phẩm lỗi/đơn hàng thiếu sản phẩm, quý khách vui lòng nhắn tin/gọi ngay cho shop trong giờ hành chính để được hỗ trợ kịp thời \n✔ Shop không chấp nhận hoàn trả với lý do cá nhận: không thích nữa, không hợp, đặt nhầm mã, nhầm màu, nhầm size... Trường hợp này shop chỉ có thể hỗ trợ đổi lại thôi nhé ạ! VÌ SAO NÊN MUA HÀNG Ở SHOP? \n1. Chúng tôi cam 100% như đúng nội dung và ảnh sản phẩm được mô tả. \n2. Mẫu mã đa dạng - Chất liệu tốt nhất - Giá cả hợp lý nhất. \n3. Thời gian giao hàng: nhanh chóng, chuẩn bị hàng trong chưa đầy 24h. \n4. Phí vận chuyển:  Shop hỗ trợ tiền Ship 20K cho đơn hàng 50K, 70K cho đơn hàng trên 300K. (Anh chị khi thanh toán nhớ tích chọn Mã voucher hỗ trợ tiền Ship nhé) \n5.  Slogan của Shop: \"Hãy tự tin mua sắm theo phong cách của bạn\" \nLƯU Ý: \n✔ Khách nhớ kiểm tra lại SĐT và Địa Chỉ nhận thật chính xác để tránh Giao đi rồi quay về ạ ! \n✔ Để sản phẩm giữ được độ bền lâu ở lần giặt đầu tiên khách KHÔNG NÊN sử dụng chất tẩy rửa mạnh', 599000, 500000, 4, '1ab86efe4ba78af9d3b6.jpg', 'vnd', 0, '2022-05-30 08:32:52', '2022-05-30 08:32:52'),
(66, 'Set váy trễ vai 1', 18, 9, 'THÔNG TIN SẢN PHẨM : - Hàng đẹp chuẩn mẫu - Váy chất LỤA SATIN - Váy có khoá sau - Form đẹp chuẩn mẫu - Màu như ảnh shop chụp nha ảnh trải sàn  - Free size 46 - 52kg tùy chiều cao - Váy có Mút   Nhanh tay đặt hàng để nhận nhiều ưu đãi của shop các nàng ơi ❤ ----------------------------------------------------------- Đổi trả theo đúng quy định của Shopee  1. Điều kiện áp dụng (trong vòng 03 ngày kể từ khi nhận sản phẩm):  - Hàng hoá vẫn còn mới, chưa qua sử dụng  - Hàng hóa hư hỏng do vận chuyển hoặc do nhà sản xuất.  2. Trường hợp được chấp nhận:  - Hàng không đúng size, kiểu dáng như quý khách đặt hàng  - Không đủ số lượng, không đủ bộ như trong đơn hàng 3. Trường hợp không đủ điều kiện áp dụng chính sách:  - Quá 03 ngày kể từ khi Quý khách nhận hàng   - Gửi lại hàng không đúng mẫu mã, không phải hàng của shop  - Đặt nhầm sản phẩm, chủng loại, không thích, không hợp,. =>> LƯU Ý: + Khách đặt hàng online sẽ nhận được hàng sau khoảng 1-5 ngày làm việc tùy theo khoảng cách và đơn vị vận chuyển.  + Mọi thắc mắc, góp ý về sản phẩm, giao hàng vui lòng liên hệ với Hotline để được hỗ trợ trực tiếp và nhanh nhất.  + Đối với các mặt hàng đổi trả, vui lòng liên hệ và cung cấp hình ảnh cũng như chi tiết lỗi để chuyên viên bên shop đánh giá, khắc phục đảm bảo quyền lợi cho quý khách. + Các mặt hàng bị lỗi hoặc không ưng , khách vui lòng CHAT hoặc liên hệ Hotline với shop, trước khi đánh giá shop nhé! Shop sẽ hỗ trợ đổi trả hàng cho khách ạ', 888000, 799000, 4, '0dfd336c1035d16b8824.jpg', 'vnd', 0, '2022-05-28 00:29:24', '2022-05-28 00:29:24'),
(67, 'Váy ngắn hai dây 1', 14, 11, 'váy trắng dài trễ vai 2 dây tay bồng, đầm trắng tiểu thư dự tiệc xinh xắn kèm ảnh thật phía sau  Váy được thiết kế với điểm nhấn là phần bo tay và phần chun ngực ạ  Váy với màu trắng  duy nhất , một màu sắc lạ mắt. From rộng nên bầu bì bon chen được ạ.  Các nàng có thể mặc đi chơi, đi dạo, đi du lịch ạ  Thông số sản phẩm :   chất liệu: lụa  màu sắc: trắng  Free size < 58kg Tất cả các sản phẩm shop đều còn hàng và sẵn hàng với số lượng lớn ạ', 759000, 699000, 8, '1b389869bf307e6e2721.jpg', 'vnd', 0, '2022-05-28 00:26:18', '2022-05-28 00:26:18'),
(68, 'Váy dài 2', 9, 9, 'Thông tin sản phẩm Váy hoa nhí trễ vai, đầm voan hoa tầng tay dài dáng xoè buộc nơ tay xixeoshop - v131  - Váy hoa chất voan cao cấp 2 lớp - Kiểu dáng: Váy dáng ngắn xoè trễ vai  - Sản phẩm 100% giống mô tả. Hình ảnh sản phẩm là ảnh thật do shop tự chụp và giữ bản quyền hình ảnh - Xuất xứ: Váy được thiết kế và gia công bởi xixeoshop.  Thông tin sản phẩm Váy hoa nhí trễ vai, đầm voan hoa tầng tay dài dáng xoè buộc nơ tay xixeoshop - v131  - Hàng có sẵn nên thời gian giao hàng sẽ là tối ưu nhất - Do màn hình và điều kiện ánh sáng khác nhau, màu sắc thực tế của sản phẩm có thể chênh lệch khoảng 3-5%  xixeoshop xin cam kết với khách hàng:  - Váy đầm hoa nhí vintage dáng dài được đảm bảo chất lượng, dịch vụ tốt nhất, hàng được giao từ 1-3 ngày kể từ ngày đặt hàng - Váy đầm hoa nhí vintage dáng dài giao hàng trên toàn quốc – ship COD - Váy đầm hoa nhí vintage đổi trả theo đúng quy định của Shopee.', 799000, 699000, 6, '02a95aff7ba6baf8e3b7.jpg', 'vnd', 0, '2022-05-28 00:32:50', '2022-05-28 00:32:50'),
(69, 'Váy dài 3', 9, 9, 'Vải / chất liệu: Khác / Polyester (Sợi Polyester) Hàm lượng thành phần: 91% (bao gồm) -95% (bao gồm) Phong cách: văn học retro / nhỏ và tươi Các yếu tố / hàng thủ công phổ biến: màu đặc, hoa Kiểu dáng: Một mảnh Kiểu dáng: đầm chữ A Chiều dài tay áo: Tay ngắn Chiều dài váy: váy dài giữa Kiểu cổ áo: đường viền cổ vuông Độ tuổi áp dụng: Thanh niên (18-35 tuổi) Có thêm nhung: không lót nhung Mùa niêm yết: Mùa hè năm 2022 Loại tay áo: Tay áo phồng', 799000, 699000, 7, '2a351907385ef900a04f.jpg', 'vnd', 0, '2022-05-28 00:35:23', '2022-05-28 00:35:23'),
(70, 'Váy dài 4', 9, 10, 'Váy Babydoll Nữ 3 Màu Tay Phồng , Đầm Nữ Dáng Xoè Siêu Xinh LỜI HỨA CỦA PTP STORE – BÁN HÀNG VÌ CHỮ TÍN    - Luôn đặt chữ tín lên hàng đầu    - Gía rẻ nhất đến tay khách hàng     - Bao đổi trả nếu hàng lỗi hoặc sai mẫu     - Đảm bảo form đẹp như hình  ✔️Shop chuyên sỉ, lẻ quần áo giá tận xưởng không qua trung gian ... ✔️Cập nhập mẫu mã liên tục giá tốt nhất ✔️Liên tục tuyển sỉ CTV toàn quốc - LẤY CÀNG NHIỀU - GIÁ CÀNG YÊU ✔️Shop up ảnh thật tự chụp ----------------------------------------------------------- THÔNG TIN SẢN PHẨM : - Hàng đẹp chuẩn mẫu l1 - Váy chất voan xịn sò mát  - Form đẹp chuẩn mẫu - Váy có mút ngực - Màu như ảnh shop chụp nha ảnh trải sàn  - Size S 45 - 50kg ( tùy chiều cao các bạn nha) - Size M 50- 55kg ( tùy chiều cao các bạn nha) Nhanh tay đặ--------------------------------- Đổi trả theo đúng quy định của Shopee  1. Điều kiện áp dụng (trong vòng 03 ngày kể từ khi nhận sản phẩm):  - Hàng hoá vẫn còn mới, chưa qua sử dụng  - Hàng hóa hư hỏng do t hàng để nhận nhiều ưu đãi của shop các nàng ơi  --------------------------vận chuyển hoặc do nhà sản xuất.  2. Trường hợp được chấp nhận:  - Hàng không đúng size, kiểu dáng như quý khách đặt hàng  - Không đủ số lượng, không đủ bộ như trong đơn hàng 3. Trường hợp không đủ điều kiện áp dụng chính sách:  - Quá 03 ngày kể từ khi Quý khách nhận hàng   - Gửi lại hàng không đúng mẫu mã, không phải hàng của shop  - Đặt nhầm sản phẩm, chủng loại, không thích, không hợp,. =>> LƯU Ý: + Khách đặt hàng online sẽ nhận được hàng sau khoảng 1-3 ngày làm việc tùy theo khoảng cách và đơn vị vận chuyển.  + Mọi thắc mắc, góp ý về sản phẩm, giao hàng vui lòng liên hệ với Hotline để được hỗ trợ trực tiếp và nhanh nhất.  + Đối với các mặt hàng đổi trả, vui lòng liên hệ và cung cấp hình ảnh cũng như chi tiết lỗi để chuyên viên bên shop đánh giá, khắc phục đảm bảo quyền lợi cho quý khách. + Các mặt hàng bị lỗi hoặc không ưng , khách vui lòng CHAT hoặc liên hệ HotlX  Ấn Like và theo dõi để ủng hộ shop và tham khảo các sản phẩm mới của shop,Shop rất hân hạnh được phục vụ quý khách.', 759000, 699000, 7, '3e4e1a7e3b27fa79a336.jpg', 'vnd', 0, '2022-05-28 00:41:30', '2022-05-28 00:41:30'),
(74, 'Váy dài 5', 9, 9, 'THÔNG TIN SẢN PHẨM - Tên sản phẩm: Váy Nữ Hoa Xanh Ngọc Khoét Vai Chất Liệu Voan Lụa  Váy 2 Lớp LINSTORE Thiết Kế - Mã sản phẩm: 111 - Thương hiệu: LINSTORE   - Xuất xứ: Việt Nam - Chất liệu: chất voan lụa mềm mát  - Màu sắc: xanh ngọc , hồng pastel , xanh biển - Họa tiết: hoa  - Size: S - M - L    M             L              Vòng 1:              86            90           94             Vòng 2:              66 BẢNG QUY ĐỔI KÍCH CỠ  Bảng size theo số đo 3 vòng SIZE                   S                        70           74             Vòng 3:              90            94           98             Bảng size theo cân nặng - chiều cao SIZE                             S                    M                   L                     Cân nặng (Kg):       40- 46            47- 53           54-59             Chiều cao (cm):     148 - 160        148 - 160       151 -168           MÔ TẢ SẢN PHẨM - Váy chất voan lụa cao cấp chất vải mềm mại, mát mịn  . Đường may cao cấp, không bai, không xù, không dão.    HƯỚNG DẪN SỬ DỤNG VÀ BẢO QUẢN - Giặt máy nhẹ nhàng, ở nhiệt độ thường - Không nên chà xát mạnh bằng bàn chải, tránh phơi dưới ánh nắng gắt trực tiếp. - Không sử dụng hóa chất tẩy - Khi ủi sản phẩm, nên ủi bằng bàn là sử dụng chế độ hơi nước sẽ làm cho sản phẩm dễ ủi phẳng, mặt vải không bị cháy, bóng lỳ do sức nóng của nhiệt và giữ vải cũng như mầu vải của sản phẩm được đẹp và bền lâu hơn. Để nhiệt độ bàn là tùy theo từng chất liệu vải.   CAM KẾT VÀ BẢO HÀNH - Đảm bảo hàng chính hãng, cam kết sản phẩm đúng với mô tả và hình ảnh của shop - Đổi trả sản phẩm, size trong vòng 3 ngày nếu do lỗi sản xuất.  - Nếu có bất kì khiếu nại cần Shop hỗ trợ về sản phẩm, khi nhận được sản phẩm Quý Khách hàng vui lòng quay lại video quá trình mở sản phẩm để được đảm bảo 100% đổi lại sản phẩm mới nếu Shop giao bị lỗi.  --------------LINSTORE--------------  Phương châm \"Bán Hàng Có Tâm - Khách hàng khi nhận hàng phải ưng ý nhất.\"  Thiết kế những sản phẩm đẹp nhất, lung linh nhất.   Cập nhật xu hướng Phong cách & Thời thượng cùng chất liệu', 455000, 429000, 9, '3fae7aed5bb49aeac3a5.jpg', 'vnd', 0, '2022-05-28 00:45:03', '2022-05-28 00:45:03'),
(75, 'Váy trễ vai 2', 18, 11, 'Váy Baby Doll nơ cổ mau trắng các bạn mặc nhiều kiểu xinh nha Hướng dẫn ĐẶT HÀNG được FREESHIP Nếu các bạn mua 1 sản phẩm, vui lòng ấn mua ngay   Nếu các bạn mua từ 2 sản phẩm trở lên, vui lòng ấn thêm vào giỏ hàng, và lần lượt thêm các sản phẩm bạn muốn mua vào giỏ trước khi đặt hàng và thanh toán. Các bạn nên tận dụng mã giảm giá vận chuyển của shopee bằng cách đặt đơn hàng trên 50k  điều này sẽ giúp mình tiết kiệm được kha khá tiền đó ạ.  Shop CAM KẾT Về sản phẩm: Shop cam kết cả về CHẤT LIỆU cũng như HÌNH DÁNG (đúng với những gì được nêu bật trong phần mô tả sản phẩm). Về giá cả : Shop nhập với số lượng nhiều và trực tiếp nên chi phí sẽ là RẺ NHẤT với chất lượng sản phẩm bạn nhận được. Về dịch vụ: Shop sẽ cố gắng trả lời hết những thắc mắc xoay quanh sản phẩm nhé. Thời gian chuẩn bị hàng: Hàng có sẵn, thời gian chuẩn bị tối ưu nhất. Quyền Lợi của Khách Hàng Nếu sản phẩm khách nhận được không đúng với sản phẩm khách đặt, hoặc khác với mô tả sản phẩm, khách hàng đừng vội đánh giá 1s mà hãy inb ngay cho shop để được shop hỗ trợ khách hàng đổi trả sản phẩm. Shop không hi vọng trường hợp này xảy ra, và sẽ cố gắng hết sức đê bạn không có một trải nghiệm mua hàng không tốt tại shop, nhưng nếu có, shop cũng sẽ giải quyết mọi chuyện sao cho thỏa đáng nhất.  10 khách hàng đánh giá 5s kèm kình ảnh ấn tượng nhất tháng sẽ được gửi kèm QUÀ TẶNG TO TO và MÃ GIẢM GIÁ trong lần mua hàng ở tháng kế tiếp.  LƯU Ý KHI SỬ DỤNG CÁC SẢN PHẨM CỦA SHOP - Đối vơi sản phẩm đa dạng về chất liệu, kiểu dáng, màu sắc, cách bảo quản sản phẩm tốt nhất là phân loại và giặt các sản phẩm cùng màu để giữ được độ bền và màu sắc của vải, tránh bị phai màu từ các loại quần áo khác. - Đối với những sản phẩm có thể giặt máy, chỉ nên để ở chế độ giặt nhẹ, hoặc mức trung bình  - Nên lộn áo sang mặt trái trước khi phơi sản phẩm ở nơi thoáng mát, tránh ánh nắng trực tiếp dễ bị phai bạc màu, nên làm khô quần áo bằng cách phơi ở những điểm đón gió sẽ giữ được màu vải tốt hơn. <3 Chúng tôi biết bạn có nhiều sự lựa chọn, cảm ơn vì đã lựa chọn chúng tôi <3', 599000, 499000, 7, '04ab1f4c3915f84ba104.jpg', 'vnd', 0, '2022-05-28 00:57:28', '2022-05-28 00:57:28'),
(76, 'Váy dài 6', 9, 10, 'Chất xốp Size <58kg Gồm 2 màu đen trắng  Có kèm ảnh thật và video ạ Đến với shop các chị có thể trải nghiệm sản phẩm hợp với phong cách và giá thành phải chăng Shop luôn mong muốn khách hàng có thể hài lòng khi đến với shop Shop có những chính giải quyết khi hàng gặp vấn đề Mọi thắc mắc của bạn hãy liên hệ qua shop để được tư vấn nhé cảm ơn các bác đã ghé shop', 1000000, 899000, 3, '5a8aff41dc181d464409.jpg', 'vnd', 0, '2022-05-28 01:01:33', '2022-05-28 01:01:33'),
(77, 'Váy hai dây 2 bó sát sexy', 14, 9, 'mô tả Váy hai dây 2 bó sát sexy', 999000, 799000, 3, '6ecaa0ab81f240ac19e3.jpg', 'vnd', 0, '2022-05-25 08:27:46', '2022-05-25 08:27:46'),
(78, 'Váy dài 7', 9, 11, 'mô tả váy dài 7', 955000, 899000, 5, '07cfeb5bc802095c5013.jpg', 'vnd', 0, '2022-05-25 08:30:01', '2022-05-25 08:30:01'),
(79, 'Đồ bộ nữ 1', 21, 10, 'mô tả đồ bộ nữ 1', 500000, 450000, 4, '8e25104f3716f648af07.jpg', 'vnd', 0, '2022-05-25 08:34:24', '2022-05-25 08:34:25'),
(80, 'Váy hai dây 3', 14, 9, 'mô tả váy hai dây 3', 799000, 750000, 5, '8ec49631b56874362d79.jpg', 'vnd', 0, '2022-05-25 08:36:25', '2022-05-25 08:36:25'),
(81, 'váy dài 8', 9, 10, 'mô tả váy dài 8', 599000, 450000, 5, '9ac3d1e3f1ba30e469ab.jpg', 'vnd', 0, '2022-05-26 00:41:53', '2022-05-26 00:41:53'),
(82, 'váy dài 9', 9, 10, 'mô tả váy dài 9', 499999, 100000, 5, '9f2d9e48b911784f2100.jpg', 'vnd', 0, '2022-05-26 00:44:44', '2022-05-26 00:44:44'),
(83, 'váy dài 10', 9, 10, 'mô tả váy dài 10', 499000, 100000, 5, '2a351907385ef900a04f.jpg', 'vnd', 0, '2022-05-26 00:47:24', '2022-05-26 00:47:24'),
(84, 'váy trễ vai 5', 18, 10, 'mô tả váy trễ vai 5', 450000, 100000, 5, '13f8236d0034c16a9825.jpg', 'vnd', 0, '2022-05-26 00:49:55', '2022-05-26 00:49:55'),
(85, 'váy dài 11', 9, 11, 'mô tả váy dài 11', 499000, 100000, 5, '18b609ff28a6e9f8b0b7.jpg', 'vnd', 0, '2022-05-26 00:52:19', '2022-05-26 00:52:19'),
(86, 'váy dài thiết tha', 9, 10, 'mô tả váy dài thiết tha', 499000, 100000, 5, '34dc3cb81be1dabf83f0.jpg', 'vnd', 0, '2022-05-27 00:31:15', '2022-05-27 00:31:15'),
(87, 'áo cá sấu', 20, 10, 'Áo thun nữ dáng polo phong cách trẻ phong cá sấu phối màu xanh trắng hot hit 2022 JOLIVO M1.142.S  -Áo thun nữ dáng polo phong cách trẻ trung phông cá sấu phối màu xanh trắng chất cotton cao cấp chất vải mềm mịn thoánh mát rất phù hợp với thời tiết nóng bức của mùa hè .Với phong cách trẻ trung chiếc áo polo này phối đc với rất nhiều đồ mặc thế nào cũng sang chảnh  -Đây sẽ là một chiếc áo cực hot trong năm 2022 sẽ đc các chị e săn đón  THÔNG TIN SẢN PHẨM -Chất liệu cotton thoáng mát  -SIZE: S,M,L -Mầu sắc: trắng xanh  HƯỚNG DẪN VỆ SINH VÀ BẢO QUẢN ÁO:   Phơi ở nơi khô thoáng, có gió, tránh ánh nắng trực tiếp làm bạc màu màu áo  Giặt bằng nước lạnh để giữ độ bền của chất liệu.   Vào mùa ẩm ướt nên đặt viên chống ẩm vào tủ áo để tránh ẩm mốc Do màn hình và điều kiện ánh sáng khác nhau, màu sắc thực tế của sản phẩm có thể chênh lệch khoảng 3-5%.   HƯỚNG DẪN CÁCH ĐẶT HÀNG - Bước 1: Cách chọn size, shop có bảng size mẫu. Bạn NÊN INBOX, cung cấp chiều cao, cân nặng để SHOP TƯ VẤN SIZE - Bước 2: Cách đặt hàng: Nếu bạn muốn mua 2 sản phẩm khác nhau hoặc 2 size khác nhau, để được freeship + Bạn chọn từng sản phẩm rồi thêm vào giỏ hàng + Khi giỏ hàng đã có đầy đủ các sản phẩm cần mua, bạn mới tiến hành ấn nút “ Thanh toán” ---------------------------- Shop Xin Cam Kết Như Sau : - Đảm bảo sản phẩm giống ảnh 100%  - Giao hàng toàn quốc, nhận hàng thanh toán - Tất cả sản phẩm đều sẵn kho khách cứ đặt đơn là shop giao hàng luôn ạ  - Hoàn tiền 100% hoặc 1 đổi 1 cho các sản phẩm vỡ/thiếu/lỗi hoàn toàn miễn phí  - Liên tục cập nhật những mặt hàng mới nhất với giá cả rẻ nhất để khách hàng lựa chọ - Mọi vấn đề về đơn hàng khiếu nại khách vui lòng chat trực tiếp với shop để shop giải quyết nhanh nhất', 250000, 50000, 10, '49bd6ccf4b968ac8d387.jpg', 'vnd', 0, '2022-05-28 01:06:00', '2022-05-28 01:06:00'),
(88, 'váy dài hoa', 9, 9, 'Váy hoa nhí công sở cao cấp cổ đức eo nhấn đai cúc ngọc chất liệu mềm mịn 2 lớp thiết kế Váy thiết kế công sở cao cấp cổ đức eo nhấn đai cúc Ngọc đẹp xuất sắc, đầm công sở  Màu sắc: trẻ trung, thời thượng, tôn dáng LƯU Ý: - Màu sắc sp bên ngoài có thể chênh lệch khoảng 5% do hiệu ứng ánh sáng (có thể đậm hoặc nhạt hơn một chút)   Ưu điểm SP:  - Chất vải lụa mềm mịn, thấm hút mồ hôi, không bai, không xù, không dão. Đủ 3 size:  Sz S: từ 40kg-49kg Sz M: từ 49kg-54kg Sz L: từ 54kg-62kg  (Tùy thuộc vào chiều cao) Vòng eo:  Size S: 64 -68 Size M: 69-73 Size L: 74 - 76  Hướng dẫn SD: Giặt máy ở chế độ máy nhẹ nhàng hoặc giặt tay', 499000, 300000, 5, '60b9478e66d7a789fec6.jpg', 'vnd', 0, '2022-05-28 01:09:36', '2022-05-28 01:09:36'),
(89, 'váy dài hoa hướng dương', 9, 10, 'Chất vải mềm mịn, thiết kế viền bèo + dáng dài che bụng cực tốt, tạo hiệu ứng chiều cao Mẫu này các nàng mặc đi làm đi chơi đều xinh hết xẩy nhaaa  Đặc biệt bên trong có lót nên form dâng dày dặn Váy dáng dài với tone vàng nên nhìn thanh lịch lắm! Hàng em đủ size SM', 499000, 100000, 5, '67d9f3b3d2ea13b44afb.jpg', 'vnd', 0, '2022-05-28 01:10:53', '2022-05-28 01:10:53'),
(90, 'váy ngắn kẻ', 17, 10, 'Vải Thô dày đẹp, váy cạp chun sau béo gầy mặc vô tư, có lót quần mix cùng thể thao cực xinh.Chân váy thiết kế khóa siết sườn. Set siêu xinh mặc đi làm đi chơi đều đẹp.  Form 53kg đổ lại mặc ok nhé các nàng. Màu: kẻ đen, kẻ xám; kẻ be, kẻ cam. Sản xuất tại Việt Nam.', 650000, 499000, 10, '89cc0e762d2fec71b53e.jpg', 'vnd', 0, '2022-05-28 01:14:43', '2022-05-28 01:14:43'),
(91, 'váy dài thiên nhiên', 9, 10, '#THÔNG_TIN_SẢN_PHẨM 1 màu vàng nghệ Freesize dưới 55kg Chất liệu: chéo thái Vòng ngực: 90cm Vòng eo: 70cm có thun co dãn Chiều dài: 115cm', 599000, 300000, 10, '94f151a870f1b1afe8e0.jpg', 'vnd', 0, '2022-05-28 01:17:47', '2022-05-28 01:17:47'),
(92, 'bộ đồ hồng', 17, 10, 'Bộ đồ bộ Pijama màu HỒNG tay ngắn quần ngắn lụa Pháp - Thoải Mái Nhẹ Nhàng Sản phẩm được may từ chất liệu lụa pháp cho người mặc cảm giác thoải mái và mát mẻ Sản phẩm nằm trong bộ sưu tập mặc nhà của hãng thời trang NKK. Bộ đồ ngủ pyjama thương hiệu NKK sẽ mang lại cho quý khách những giờ phút thoải mái bên gia đình và những giấc ngủ ngon để phục hồi năng lượng sau một ngày dài làm việc  Pyjama, còn được viết và/hoặc gọi là pi-gia-ma, pi-da-ma, bi-da-ma, bi-gia-ma (bắt nguồn từ từ tiếng Pháp pyjama /piʒama/), là một từ mượn dùng để chỉ một loại quần áo ngủ. Từ gốc paijama chỉ loại quần dài nhẹ, rộng, thường kèm theo dải rút ở ngang hông, được mặc ở Nam và Tây Á bởi cả nam và nữ giới.  BẢNG SIZE Size S: Từ 40 đến 45 kg Size M: Từ 46 đến 52 kg Size L: Từ 53 đến 60 kg Size XL: Từ 61 đến 68 kg ➡ LƯU Ý KHI SỬ DỤNG CÁC SẢN PHẨM CỦA SHOP - Đối vơi sản phẩm đa dạng về chất liệu, kiểu dáng, màu sắc, cách bảo quản sản phẩm tốt nhất là phân loại và giặt các sản phẩm cùng màu để giữ được độ bền và màu sắc của vải, tránh bị phai màu từ các loại quần áo khác. - Đối với những sản phẩm có thể giặt máy, chỉ nên để ở chế độ giặt nhẹ, hoặc mức trung bình  - Nên lộn áo sang mặt trái trước khi phơi sản phẩm ở nơi thoáng mát, tránh ánh nắng trực tiếp dễ bị phai bạc màu, nên làm khô quần áo bằng cách phơi ở những điểm đón gió sẽ giữ được màu vải tốt hơn.  - Xưởng sx: Phường Khánh Xuân, TP Buôn Ma Thuột, Tỉnh Đăk Lăk -  Sản Xuất  tại VIỆT  NAM không qua trung gian      ------------------------------------   SHOP CAM KẾT  -------------------------------  ✔Về giá cả : Shop trực tiếp sản xuất nên chi phí sẽ là RẺ NHẤT với chất lượng sản phẩm bạn nhận được. ✔Về dịch vụ: Shop sẽ cố gắng trả lời hết những thắc mắc xoay quanh sản phẩm nhé. ✔Thời gian chuẩn bị hàng: Hàng có sẵn, thời gian chuẩn bị tối ưu nhất.', 500000, 250000, 7, '95ab10fc37a5f6fbafb4.jpg', 'vnd', 0, '2022-05-28 01:19:11', '2022-05-28 01:19:11'),
(93, 'bộ đồ nam hot trend', 20, 10, 'QUẦN SHORT TẬP GYM NAM Bộ Quần + Áo Chất Vải xin Mịn ,  - Quần được thiết kế 2 lớp - Hàng nhập khẩu chất lượng cao - Chất liệu: thun mè, lớp trong thun lạnh - Thoáng mát, thấm hút tốt - Form chuẩn đẹp cho Gymer - Thích hợp mặc đi chơi, tập gym  HƯỚNG DẪN CHỌN SIZE + Size M: 55 - 65kg | 165 - 170cm + Size L: 65 - 73kg | 170 - 175cm + Size XL: 73 - 80kg | 175 - 180cm', 450000, 250000, 10, '95d7aa8a8fd34e8d17c2.jpg', 'vnd', 0, '2022-05-28 01:20:47', '2022-05-28 01:20:47'),
(94, 'váy dài thiên nga', 9, 10, '----------------------------------------------------------- THÔNG TIN SẢN PHẨM : - Hàng đẹp chuẩn mẫu l1 - Váy chất xốp nhăn xịn sò mát  - Váy co dãn mặc thoải mái - Form đẹp chuẩn mẫu - Màu như ảnh shop chụp nha ảnh trải sàn  - Size S 40- 50kg ( tùy chiều cao các bạn nha) - Size M 50- 57kg( tùy chiều cao các bạn nha) Nhanh tay đặt hàng để nhận nhiều ưu đãi của shop các nàng ơi ❤ ----------------------------------------------------------- Đổi trả theo đúng quy định của Shopee  1. Điều kiện áp dụng (trong vòng 03 ngày kể từ khi nhận sản phẩm):  - Hàng hoá vẫn còn mới, chưa qua sử dụng  - Hàng hóa hư hỏng do vận chuyển hoặc do nhà sản xuất.  2. Trường hợp được chấp nhận:  - Hàng không đúng size, kiểu dáng như quý khách đặt hàng  - Không đủ số lượng, không đủ bộ như trong đơn hàng 3. Trường hợp không đủ điều kiện áp dụng chính sách:  - Quá 03 ngày kể từ khi Quý khách nhận hàng   - Gửi lại hàng không đúng mẫu mã, không phải hàng của shop  - Đặt nhầm sản phẩm, chủng loại, không thích, không hợp,. =>> LƯU Ý: + Khách đặt hàng online sẽ nhận được hàng sau khoảng 1-3 ngày làm việc tùy theo khoảng cách và đơn vị vận chuyển.  + Mọi thắc mắc, góp ý về sản phẩm, giao hàng vui lòng liên hệ với Hotline để được hỗ trợ trực tiếp và nhanh nhất.  + Đối với các mặt hàng đổi trả, vui lòng liên hệ và cung cấp hình ảnh cũng như chi tiết lỗi để chuyên viên bên shop đánh giá, khắc phục đảm bảo quyền lợi cho quý khách. + Các mặt hàng bị lỗi hoặc không ưng , khách vui lòng CHAT hoặc liên hệ Hotline với shop, trước khi đánh giá shop nhé! Shop sẽ hỗ trợ đổi trả hàng cho khách ạ', 500000, 400000, 10, '143b3355120cd3528a1d.jpg', 'vnd', 0, '2022-05-28 01:24:16', '2022-05-28 01:24:16'),
(95, 'váy dài hoa cúc', 9, 10, 'mô tả váy dài hoa cúc', 500000, 400000, 8, '232ca08383da42841bcb.jpg', 'vnd', 0, '2022-05-27 10:13:35', '2022-05-27 10:13:35'),
(96, 'váy ngắn đen trắng', 17, 10, '[Set 2 món] Set áo len tăm màu trắng cổ tròn + quần giả chân váy chữ A xẻ tà cực xinh thời trang ulzzang mùa hè đi chơi basic dành cho nữ (ĐỘC QUYỀN KHÔNG SHOP NÀO CÓ)  THÔNG TIN SẢN PHẨM - Áo FREESIZE màu trắng, co dãn tốt. Chất liệu len tăm mỏng, mềm mịn, không quá dày phù hợp cho mùa hè. Tuy vậy nhưng không hề lộ áo trong và mặc cực mát nhee - Quần giả chân váy chữ A xẻ tà màu đen, dài 37cm. Chất liệu dày dặn, mặc siêu đứng form.  THÔNG SỐ VÁY Size S: eo váy từ 64-66cm Size M: eo váy từ 67-70cm Size L: eo váy từ 71-77cm  Nhẹ nhàng diện cho bản thân thật xinh đẹp tuyệt zời nàoooo các bạn iuuu!', 450000, 300000, 9, '501b4e75692ca872f13d.jpg', 'vnd', 0, '2022-05-28 01:28:32', '2022-05-28 01:28:32'),
(97, 'váy ngắn gucci', 17, 10, 'mô tả váy ngắn gucci', 500000, 400000, 10, '502ce6b0c5e904b75df8.jpg', 'vnd', 0, '2022-05-27 10:14:17', '2022-05-27 10:14:17'),
(98, 'váy ngắn nữ xanh matcha', 17, 10, 'mô tả váy ngắn nữ xanh matcha', 500000, 350000, 9, '703d2b6b0c32cd6c9423.jpg', 'vnd', 0, '2022-05-27 10:16:41', '2022-05-27 10:16:41'),
(99, 'váy dài xanh chuối', 9, 10, 'mô tả váy dài xanh chuối', 500000, 400000, 11, '723fa09583cc42921bdd.jpg', 'vnd', 0, '2022-05-27 10:17:00', '2022-05-27 10:17:00'),
(100, 'váy dài hoa hồng xanh', 9, 10, 'váy dài hoa hồng xanh', 500000, 400000, 7, '818e04dd2584e4dabd95.jpg', 'vnd', 0, '2022-05-27 10:17:18', '2022-05-27 10:17:18'),
(101, 'váy ngắn hoa ly', 19, 10, 'mô tả váy ngắn hoa ly', 500000, 400000, 9, '823c5bbe78e7b9b9e0f6.jpg', 'vnd', 0, '2022-05-27 10:24:38', '2022-05-27 10:24:38'),
(102, 'váy ngắn bó eo', 17, 10, 'mô tả váy ngắn bó eo', 500000, 400000, 8, '980a3b9c18c5d99b80d4.jpg', 'vnd', 0, '2022-05-27 10:26:21', '2022-05-27 10:26:21'),
(103, 'váy ngắn hoa hồng trắng', 9, 10, 'mô tả váy ngắn hoa hồng trắng', 500000, 400000, 7, '1046bd139c4a5d14045b.jpg', 'vnd', 0, '2022-05-27 10:28:47', '2022-05-27 10:28:47'),
(104, 'váy dài hoa', 9, 10, 'mô tả váy dài hoa', 500000, 400000, 8, '2670fb3bda621b3c4273.jpg', 'vnd', 0, '2022-05-27 10:29:32', '2022-05-27 10:29:32'),
(105, 'váy dài vàng hoa', 9, 10, 'mô tả váy dài vàng hoa', 500000, 400000, 9, '3727f296d4cf15914cde.jpg', 'vnd', 0, '2022-05-27 10:29:44', '2022-05-27 10:29:44'),
(106, 'váy ngắn trắng hoa', 17, 10, 'mô tả váy ngắn trắng hoa', 500000, 400000, 9, '5207db21fa783b266269.jpg', 'vnd', 0, '2022-05-27 10:30:00', '2022-05-27 10:30:00'),
(107, 'chân váy trắng sang trọng', 19, 10, 'mô tả chân váy trắng sang trọng', 399000, 500000, 9, '6791c06be132206c7923.jpg', 'vnd', 0, '2022-05-27 10:30:19', '2022-05-27 10:30:19'),
(108, 'váy dài hồng sang trọng', 9, 10, 'mô tả váy dài hông sang trọng', 500000, 400000, 11, '7865e66cc635076b5e24.jpg', 'vnd', 0, '2022-05-27 10:30:45', '2022-05-27 10:30:45'),
(109, 'váy dài hoa bạch mai', 9, 10, 'mô tả váy dài hoa bạch mai', 500000, 400000, 9, '66822eb40fedceb397fc.jpg', 'vnd', 0, '2022-05-27 10:30:57', '2022-05-27 10:30:57'),
(110, 'váy ngắn vàng bó eo', 17, 10, 'mô tả váy ngắn bó eo', 400000, 300000, 8, '95669bf4b8ad79f320bc.jpg', 'vnd', 0, '2022-05-27 10:31:12', '2022-05-27 10:31:12'),
(111, 'váy dài hoa hồng', 9, 10, 'mô tả váy dài hoa hồng', 500000, 400000, 9, '207527400619c7479e08.jpg', 'vnd', 0, '2022-05-27 10:31:29', '2022-05-27 10:31:29'),
(112, 'váy dài đen nhật bản', 9, 10, 'mô tả váy dài đen nhật bản', 500000, 400000, 8, 'a703a67b8122407c1933.jpg', 'vnd', 0, '2022-05-27 10:31:45', '2022-05-27 10:31:45'),
(113, 'váy ngắn hoạ tiết nổi', 17, 10, 'mô tả váy ngắn hoạ tiết nổi', 500000, 400000, 12, 'a2816d864ddf8c81d5ce.jpg', 'vnd', 0, '2022-05-27 10:31:59', '2022-05-27 10:31:59'),
(114, 'váy dài xanh lá mạ', 9, 10, 'mô tả váy dài xanh lá mạ', 500000, 400000, 9, 'b0deba289b715a2f0360.jpg', 'vnd', 0, '2022-05-27 10:32:12', '2022-05-27 10:32:12'),
(115, 'váy hồng quý phái', 18, 10, 'mô tả váy hồng quý phái', 500000, 400000, 10, 'b70ef0eed6b717e94ea6.jpg', 'vnd', 0, '2022-05-27 10:32:24', '2022-05-27 10:32:24'),
(116, 'váy ngắn hồng trắng', 17, 10, 'mô tả váy ngắn hồng trắng', 500000, 400000, 13, 'bae188bfafe66eb837f7.jpg', 'vnd', 0, '2022-05-27 10:32:45', '2022-05-27 10:32:45'),
(117, 'váy dài lá phong', 9, 10, 'mô tả váy dài lá phong', 500000, 400000, 10, 'bb64d339f260333e6a71.jpg', 'vnd', 0, '2022-05-27 10:33:08', '2022-05-27 10:33:08'),
(118, 'váy dài hoa nhài', 9, 10, 'mô tả váy dài hoa nhài', 500000, 400000, 9, 'bc32207e0127c0799936.jpg', 'vnd', 0, '2022-05-27 10:33:19', '2022-05-27 10:33:19'),
(119, 'váy hai dây quyến rũ', 14, 10, 'mô tả váy hai dây quyến rũ', 500000, 400000, 8, 'c6a0c026e37f22217b6e.jpg', 'vnd', 0, '2022-05-27 10:33:33', '2022-05-27 10:33:33'),
(120, 'Chân váy 1', 19, 11, 'MÔ TẢ SẢN PHẨM : \nTÊN  : Chân váy tennis ngắn xếp ly  thời trang nữ hàng Quảng Châu cao cấp\nChất liệu chân váy : Chất vải tuyết mưa\nSize chân váy : S/M/L/XL\nMàu sắc : Đen, trắng, nâu\nBẢNG SIZE THAM KHẢO :\n- S (Dưới 47kg)\n- M(47-50kg)\n- L(51-53kg)\n- XL (53-56kg)\n  Bảng kích thước / đơn vị cm:\n  S Chiều dài chân váy 39cm/14.56\" Vòng eo 66cm\n  M Chiều dài chân váy 39cm/14.96\" Vòng eo 68cm\n  L Chiều dài chân váy 40cm/15.35\" Vòng eo 70cm\n XL Chiều dài khoảng 40cm .Vòng eo 74cm\n\nChân váy là một trong những items kinh điển trong tủ đồ của tất cả chị em phụ nữ. Thiếu đi chân váy là thiếu đi sự điệu đà nữ tính, thiếu đi một nét đặc trưng của con gái. \nChân váy có nhiều loại: chân váy chữ A mang màu sắc retro basic đơn giản, chân váy midi điệu đà duyên dáng, chân váy xòe đỏng đảnh đáng yêu, chân váy maxi chạm gót thướt tha quyến rũ, chân váy xếp ly dịu dàng, chân váy tầng ngắn thướt tha, chân váy dài công sở lịch sự mà vẫn không kém phần cá tính…. \nMỗi chiếc chân váy mang trong mình một nét đẹp riêng biệt không trộn lẫn.\nChân váy tennis lại mang lại sự thanh lịch, dịu dàng mà trang nhã tới lại kỳ. Bạn có thể mặc đi làm. đi chơi, đi biển đều xinh lắm nha. Kiếm tìm đâu nữa bạn ơi, nhanh tay đặt hàng thôi !\nLƯU Ý : \n⚡️Khách hàng mua chân váy nếu có thắc mắc thêm về sản phẩm vui lòng inbox với shop để được tư vấn và chọn màu đúng ý nhé!\n⚡️Tất cả sản phẩm chân váy chữ A ở shop đều là hàng CÓ SẴN.\n⚡️Tất cả chân váy xếp ly mà shop đưa ra đều là hàng chuẩn ảnh, chuẩn form, dáng, thiết kế, chất liệu.\n⚡️Shop luôn có NHIỀU ƯU ĐÃI dành cho khách hàng, luôn kiểm tra kĩ sản phẩm trước khi giao.\n⚡️Khách không ưng cứ back lại cho em nha', 350000, 300000, 6, 'chanvay1.jpg', 'vnd', 0, '2022-05-30 08:24:30', '2022-05-30 08:24:30');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slide`
--

CREATE TABLE `slide` (
  `id_slide` int(10) NOT NULL,
  `link` varchar(100) NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `slide`
--

INSERT INTO `slide` (`id_slide`, `link`, `image`) VALUES
(4, '', 'slide1.jpg'),
(5, '', 'slide2.jpg'),
(6, '', 'slide3.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `full_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `users_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `full_name`, `users_name`, `email`, `password`, `phone`, `address`, `image`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Đoàn Linh122', 'DoanLinh', 'doanlinh@gmail.com', '$2y$10$qwkACRebVrq1PxDhpFQTUeof.5.Qr1lVayiJrXx8NgfLYdoWQH4m6', '01628470872', 'Đa Lộc- Ân Thi-Hưng Yên', '', NULL, '2022-04-17 14:57:41', '2022-04-17 07:57:41'),
(5, 'DoanThiLinh', 'LinhD', 'vinh@gmail.com', '$2y$10$9nFyWml4BRW1seMuzicLqOz9/EP5BeHSi9j.TxR.vdR.GEVB6VaIi', '983715373', 'Ân Thi', '', NULL, '2019-05-09 06:50:25', '2019-05-08 23:50:25'),
(7, 'Đoàn Thị Thùy Linh', 'LinhDoan', 'doanlinh101998@gmail.com', '$2y$10$TE8Q0ak2lz3W7.pWUQMW7.Li5O7KkGFwlI/ci8McxtPtKpLkWybbK', '0983017992', 'Đa Lộc -Ân Thi-Hưng Yên', '', NULL, '2019-04-22 01:52:34', '2019-04-22 01:52:34'),
(8, 'Đoàn Thị Linh', 'Linh', 'doanlinh1098@gmail.com', '$2y$10$E2tUqHVotdoL8T9d2DhBlepbHod5zuTTVYVafvLl1caMG2t67NYrS', '0983017991', 'Bình Nguyên-Đa Lộc-Ân Thi-Hưng Yên', '', 'bWKdka3a0UR3Qu8Iu2wGYZrqafQnlzhk9O82dcsUlILBO0vIXS0zvog62m51', '2019-05-08 08:36:19', '2019-05-04 22:23:48'),
(10, 'toan', 'toan', 'toan@utehy.com', 'toan@utehy.com', '0356964919', 'van giang - hung yen', NULL, NULL, '2022-04-17 06:01:20', '2022-04-17 06:01:20');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bills_ban`
--
ALTER TABLE `bills_ban`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `bills_nhap`
--
ALTER TABLE `bills_nhap`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `bill_detail_ban`
--
ALTER TABLE `bill_detail_ban`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `bill_detail_nhap`
--
ALTER TABLE `bill_detail_nhap`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `khach_hang`
--
ALTER TABLE `khach_hang`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `kho`
--
ALTER TABLE `kho`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `lien_he`
--
ALTER TABLE `lien_he`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `loai_sp`
--
ALTER TABLE `loai_sp`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tenloai` (`tenloai`);

--
-- Chỉ mục cho bảng `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id_new`);

--
-- Chỉ mục cho bảng `nhan_vien`
--
ALTER TABLE `nhan_vien`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `nha_cung_cap`
--
ALTER TABLE `nha_cung_cap`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `phan_hoi`
--
ALTER TABLE `phan_hoi`
  ADD PRIMARY KEY (`id_phan_hoi`);

--
-- Chỉ mục cho bảng `quang_cao`
--
ALTER TABLE `quang_cao`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `san_pham`
--
ALTER TABLE `san_pham`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id_slide`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `full_name` (`full_name`),
  ADD UNIQUE KEY `users_name` (`users_name`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bills_ban`
--
ALTER TABLE `bills_ban`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `bills_nhap`
--
ALTER TABLE `bills_nhap`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `bill_detail_ban`
--
ALTER TABLE `bill_detail_ban`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `bill_detail_nhap`
--
ALTER TABLE `bill_detail_nhap`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `khach_hang`
--
ALTER TABLE `khach_hang`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT cho bảng `kho`
--
ALTER TABLE `kho`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `lien_he`
--
ALTER TABLE `lien_he`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `loai_sp`
--
ALTER TABLE `loai_sp`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `news`
--
ALTER TABLE `news`
  MODIFY `id_new` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `nhan_vien`
--
ALTER TABLE `nhan_vien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `nha_cung_cap`
--
ALTER TABLE `nha_cung_cap`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `phan_hoi`
--
ALTER TABLE `phan_hoi`
  MODIFY `id_phan_hoi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `quang_cao`
--
ALTER TABLE `quang_cao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `san_pham`
--
ALTER TABLE `san_pham`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT cho bảng `slide`
--
ALTER TABLE `slide`
  MODIFY `id_slide` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
