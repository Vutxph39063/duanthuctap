-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2023 at 06:04 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `duanthuctap`
--

-- --------------------------------------------------------

--
-- Table structure for table `binhluan`
--

CREATE TABLE `binhluan` (
  `id` int(10) NOT NULL,
  `content` varchar(255) NOT NULL,
  `id_user` int(10) NOT NULL,
  `id_pro` int(10) NOT NULL,
  `ngaybinhluan` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `binhluan`
--

INSERT INTO `binhluan` (`id`, `content`, `id_user`, `id_pro`, `ngaybinhluan`) VALUES
(1, 'sản phẩm đẹp', 13, 4, '2023-12-10'),
(2, 'đẹp', 13, 4, '2023-12-10'),
(4, 'gudd', 13, 4, '2023-12-10'),
(16, 'moi ne', 13, 4, '2023-12-10'),
(17, 'deppp', 16, 9, '2023-12-11'),
(18, 'deppp', 16, 9, '2023-12-11'),
(19, 'dep', 16, 4, '2023-12-11');

-- --------------------------------------------------------

--
-- Table structure for table `danhmuc`
--

CREATE TABLE `danhmuc` (
  `id` int(11) NOT NULL,
  `ten` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `danhmuc`
--

INSERT INTO `danhmuc` (`id`, `ten`) VALUES
(1, 'Văn Học'),
(2, 'Thiếu Nhi'),
(3, 'Tâm Lí - Kĩ Năng Sống'),
(4, 'Nuôi Dạy Con'),
(5, 'Sách Thiếu Nhi'),
(6, 'Giáo Khoa - Tham Khảo'),
(7, 'Sách Học Ngoại Ngữ');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id_order_detail` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `id_pro` int(11) NOT NULL,
  `giamua` int(11) NOT NULL,
  `soluong` int(11) NOT NULL,
  `thanhtien` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id_order_detail`, `id_order`, `id_pro`, `giamua`, `soluong`, `thanhtien`) VALUES
(57, 30, 9, 100000, 2, 200000),
(58, 30, 4, 150000, 1, 150000),
(73, 41, 29, 50000, 1, 50000),
(74, 42, 29, 50000, 1, 50000),
(75, 43, 29, 50000, 1, 50000),
(76, 44, 29, 50000, 1, 50000),
(77, 45, 29, 50000, 1, 50000),
(78, 46, 29, 50000, 1, 50000),
(79, 46, 9, 100000, 1, 100000),
(80, 46, 27, 50000, 1, 50000);

-- --------------------------------------------------------

--
-- Table structure for table `sanpham`
--

CREATE TABLE `sanpham` (
  `id` int(11) NOT NULL,
  `ten` varchar(255) NOT NULL,
  `id_danh_muc` int(11) NOT NULL,
  `gia_niem_yet` decimal(11,0) NOT NULL,
  `gia_ban` decimal(11,0) NOT NULL,
  `so_luong` int(11) NOT NULL,
  `anh` varchar(255) DEFAULT NULL,
  `mo_ta` text NOT NULL,
  `trangthai` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sanpham`
--

INSERT INTO `sanpham` (`id`, `ten`, `id_danh_muc`, `gia_niem_yet`, `gia_ban`, `so_luong`, `anh`, `mo_ta`, `trangthai`) VALUES
(1, 'Conan', 2, 100000, 50000, 100, '713a5a459c93379d57cc7f24c038b153.jpg', '', 0),
(2, 'Doraemon', 2, 100000, 50000, 100, 'download.jpg', 'Mô tả sản phẩm', 0),
(3, 'Shin', 2, 100000, 50000, 100, 'download (1).jpg', '', 0),
(4, 'Nuôi dạy con thời 4.0', 4, 200000, 150000, 100, '2022_09_16_15_46_06_1-390x510.jpg', '', 0),
(5, 'Tuân thủ đúng thời gian đã định', 5, 50000, 310000, 100, 'image_195509_1_44257.jpg', '', 0),
(6, 'Em sẽ nuôi con chúng ta', 5, 100000, 188000, 100, 'image_183244_thanh_ly.jpg', '', 0),
(8, 'Bước Đội phá', 5, 100000, 155000, 100, 'image_195509_1_24475_thanh_ly.jpg', '', 0),
(9, 'Giúp con thành công', 5, 150000, 100000, 100, 'image_200755_thanh_ly.jpg', '', 0),
(10, 'Giao tiếp thông minh, Nói đâu trúng đó', 3, 100000, 150000, 100, 'anh-bia-1-cang-cam-tinh-cang-that-bai.png', '', 0),
(11, 'Tư duy nhanh và chậm', 3, 200000, 150000, 100, 'Tu_Duy_Nhanh_Va_Cham_Daniel_Kahneman_d023ac6ba1.jpg', 'Được viết bởi một trong những nhà tâm lý học vĩ đại nhất thế giới - Daniel Kahneman, cuốn sách Tư Duy Nhanh Và Chậm đã giành được rất nhiều giải thưởng danh giá. Sách chỉ ra cho người đọc thấy tâm trí của con người gồm hai hệ thống: Hệ thống 1 vận hành theo bản năng và không cần nhiều nỗ lực; Hệ thống 2 vận hành tỉ mỉ hơn và đòi hỏi nhiều sự tập trung hơn.', 0),
(12, 'Phi lý trí', 3, 200000, 50000, 100, 'Phi_Ly_Tri_Dan_Ariely_b96027a158.jpg', 'Cuốn sách Phi Lý Trí là tập hợp những nghiên cứu và thí nghiệm của một giáo sư tâm lý học và kinh tế học hành vi - Dan Ariely, với mục đích chung là chứng minh sự thiếu sáng suốt của con người trong cách ra quyết định đồng thời khai mở những hiện tượng tâm lý mới mẻ thú vị. ', 0),
(13, 'Daily Expression ', 7, 200000, 100000, 100, '8935309503810.jpg', '', 0),
(14, 'Chinh Phục Cụm Động Từ Tiếng Anh ', 7, 200000, 50000, 100, 'bia_chinhphuccumdongtutienganh_b1.jpg', '', 0),
(15, 'Tiếng Anh Giao Tiếp ', 7, 200000, 50000, 100, 'image_195509_1_12390_1.jpg', '', 0),
(16, 'IELTS Writing Navigator', 7, 200000, 50000, 100, '8935309504008.jpg', 'IELTS Writing Navigator là cuốn sách dành cho người muốn tự học IELTS và đặt mục tiêu chinh phục band điểm 7.0 IELTS Writing Task 2. Có thể coi đây là cuốn “cửu âm chân kinh” giúp người học hiểu được những kỳ vọng của người ra đề đối với thí sinh, đồng thời biết cách tự tìm và sửa lỗi để có thể viết được một bài luận hoàn toàn “sạch lỗi”.\r\n\r\nViết luôn là kỹ năng khó nhất trong 4 kỹ năng mà bài thi IELTS đánh giá. Viết thế nào mới là hay, chẳng phải hay hay dở chỉ là quan điểm cá nhân thôi sao? Làm sao tôi biết được mình mắc lỗi gì và cần sửa thế nào? Có phải từ khó mới là từ “đắt”?.... Có vô vàn thắc mắc khiến người học hoang mang, bối rối khi đã thử đủ cách mà vẫn chưa thể cải thiện điểm số của bài thi viết. Với IELTS Writing Navigator, bạn sẽ được giải đáp gần như đầy đủ những thắc mắc như thế, từ đó xác định cho mình một lộ trình đỡ “rắc rối” nhất để đạt mức điểm kỳ vọng.', 0),
(17, '500 Bài Tập Vật Lí Trung Học Cơ Sở', 6, 200000, 50000, 100, '8935083581509.jpg', 'Là tài liệu tham khảo cần thiết cho những học sinh muốn tìm hiểu kĩ về môn khoa học thú vị này. Đây là tài liệu dùng để ôn tập, chuẩn bị cho các kì thi học sinh giỏi, tuyển sinh vào các trường chuyên.', 0),
(18, 'Tập Bản Đồ Địa Lí 11', 6, 200000, 50000, 100, '9786040382184.jpg', '', 0),
(19, 'Tuyển Tập 10.000 Câu Hỏi Trắc Nghiệm ', 6, 200000, 50000, 100, '9786043697155.jpg', '', 0),
(20, 'Tăng Tốc Luyện Đề Thi ', 6, 200000, 50000, 100, '9786043964103.jpg', '', 0),
(21, 'Để Con Được Ốm (Tái Bản 2022)', 4, 200000, 50000, 100, '8935235235168.jpg', '“Để con được ốm cần có sự kiên nhẫn giải thích hay thuyết phục của bác sĩ cùng sự thông hiểu và hợp tác từ phía gia đình bé. Đôi khi, sự hợp tác và hiểu biết của phụ huynh còn quan trọng hơn nỗ lực (hay thời gian) của bác sĩ giải thích nữa. Quyết định không dùng kháng sinh hay ‘quay đầu lại’ hay không là tuỳ thuộc ở phụ huynh của các bé, tuỳ thuộc vào sự hiểu biết, kiên nhẫn và quan trọng nhất là sự hợp tác chặt chẽ với bác sĩ của con mình. Đã có nhiều trường hợp ‘quay đầu lại’ thành công, nhiều trường hợp không cần thuốc đắng vẫn dã tật thành công trong suốt 12 năm chúng tôi cùng nhau thực hành y khoa theo đúng chuẩn quốc tế: thực hành dựa trên chứng cứ y khoa tốt nhất cho bệnh nhi, dành thời gian để giải thích, tư vấn và theo dõi sát sao diễn tiến bệnh của bệnh nhi. Việc lo lắng là không thể tránh khỏi, tuy nhiên, sự lo lắng không giúp ích được gì cho bệnh của trẻ, chỉ có kiến thức chăm sóc bệnh đúng mới giúp ích cho trẻ. Và hẳn là các bé sẽ hạnh phúc biết bao khi được tôn trọng ‘quyền được bệnh’.   ', 0),
(22, 'Những Trò Chơi Giúp Trẻ 0-2 Tuổi Phát Triển ', 4, 200000, 50000, 100, '8936218410008.jpg', '', 0),
(23, 'Bé Học IQ - Chữ Số Thần Kỳ (2018)', 4, 200000, 50000, 100, 'image_226908.jpg', 'Nếu bố mẹ cần tìm một bộ sách giúp bé phát triển các kỹ năng và giác quan một cách toàn diện, thì Bé học IQ chính là một lựa chọn tuyệt vời. Dành cho các bé từ 3- 6 tuổi, bộ sách hướng tới việc giúp bé hình thành và củng cố các kỹ năng thông qua việc vừa học vừa chơi các trò chơi và phát huy tối đa khả năng, nhận thức, tưởng tượng, phán đoán và suy luận. Đây đều là những yếu tố quan trọng hình thành và phát triển trí thông minh cho bé. \r\n\r\nCác bài tập trong sách rất đa dạng, phong phú, kết hợp giữa các hoạt động quan sát và tưởng tượng, vẽ, chơi, sẽ giúp trẻ vừa học vừa chơi thật thoải mái mà vẫn tự động tiếp thu tri thức. Cũng thông qua các bài tập này, bố mẹ biết được những điểm mạnh, điểm yếu của các bé để có hướng điều chỉnh thích hợp. ', 0),
(24, 'Một Đời Được Mất', 3, 200000, 50000, 100, 'b_a-1_m_t-_i-_c-m_t---copy.jpg', '- Mọi vấn đề khó quyết định trong cuộc đời này, đều có thể suy xét dưới góc nhìn “Được” và “Mất”.\r\n\r\n- Có những thứ bạn nghĩ mình “được”, nhưng thực chất chỉ là ảo mộng hão huyền. Cũng có những thứ bạn nghĩ mình “mất”, nhưng cuộc sống chắc chắn sẽ “trả lại” cho bạn dưới một hình thức khác.\r\n\r\n- Tất cả những điều ấy – đều không thể đoán trước được.\r\n\r\nBạn chỉ cần sống hiên ngang, tự tin – không thẹn với lòng mà thôi!\r\n\r\nĐó là những lời nhắn gửi chân thành và tinh túy được đúc rút từ cuốn sách mới nhất của Vãn Tình – Một đời được mất. Đây là cuốn sách thứ chín của cô xuất bản tại thị trường Việt Nam bởi thương hiệu Bloom Books, đánh dấu son rực rỡ trên hành trình phấn đấu và trưởng thành của nữ tác giả đầu sách best seller Bạn đắt giá bao nhiêu? và Khí chất bao nhiêu, hạnh phúc bấy nhiêu.\r\n\r\nNăm tháng không lấy đi nhiệt huyết của cô mà còn ban tặng cho cô những kinh nghiệm vô cùng quý giá - dưới góc nhìn của một người phụ nữ đã đi qua bóng tối cuộc đời, cũng đã chạm đến đỉnh cao danh vọng, sống một đời phong phú, viên mãn. Những câu chuyện trong Một đời được mất vẫn được “mổ xẻ” một cách sắc bén, trực diện – nhưng có sự suy xét tinh tế hơn cả về lý lẽ và tình cảm, điều mà hiếm ai có thể làm được nếu chưa trải qua đủ những cung bậc thăng trầm của cuộc đời, gặp đủ nhiều người và trò chuyện đủ lâu với họ để soi thấu những điều cần tỏ tường.\r\n\r\nLần trở lại này, Một đời được mất đem đến hơn bốn mươi câu chuyện xoay quanh những vấn đề cơ bản của cuộc sống: đi làm, thăng tiến, hôn nhân, gia đình, quan hệ mẹ chồng – nàng dâu, quan hệ bạn bè,... với tâm thế:\r\n\r\nPhụ nữ mạnh mẽ, là người có khả năng cầm lên được, bỏ xuống được\r\n\r\nTrích dẫn hay của Vãn Tình trong Một đời được mất:\r\n\r\n1. Con người ta sống trên đời, nhiều khi chỉ muốn “nhận được”, mà không nỡ “bỏ đi” – thực ra cũng là lẽ thường tình, nhưng sự đời thường là: Phải có dũng khí “bỏ đi” thì mới “nhận được” thành quả. Người cái gì cũng muốn, cuối cùng lại thường mất đi tất cả. Khi bạn đã hiểu được đạo lý này, bạn sẽ biết mình nên lựa chọn ra sao.\r\n\r\n2. Nỗi đau mà đàn ông gây ra không phải là đau khổ thực sự mà chỉ là cảm xúc nhất thời. Phụ nữ mà không có khả năng nuôi sống bản thân mới thực sự là đau khổ. Phụ nữ không có tiền mà ly hôn mới gọi là “ly hôn”, phụ nữ có tiền mà ly hôn thì được gọi là “trở lại trạng thái độc thân”. Phụ nữ không có tiền kết hôn gọi là tìm kiếm “phiếu cơm dài hạn”, phụ nữ có tiền kết hôn gọi là “theo đuổi tình yêu đích thực”.\r\n\r\n3. Khi một mối quan hệ cần bạn nhẫn nhịn chịu đựng để duy trì, buộc bạn không ngừng hy sinh lợi ích của mình để gìn giữ, thì thực ra nó nên chấm dứt từ lâu lắm rồi.\r\n\r\n4. Những cô gái sống có cá tính thường nghe theo tiếng gọi của trái tim, nên luôn tạo cho người ta cảm giác chân thực, không làm bộ, không giả dối. Thế nên chúng ta hãy cứ sống thật với chính mình, những người có tư tưởng tương đồng sẽ dần dần tới bên chúng ta.\r\n\r\n5. Khi bước qua tuổi ba mươi, tôi thấy phụ nữ nên sống thế này:\r\n\r\nCó người thương biết chở che ấm lạnh, không có phản bội và lừa dối, xứng đáng để chúng ta trao gửi tấm chân tình, nếu không, cứ sống độc thân vui vẻ cũng chẳng sao. Ít nhất chúng ta không phải sống trong đau khổ và dằn vặt.\r\n\r\nCó sự nghiệp mà mình yêu quý, dù không kiếm ra nhiều tiền, thậm chí vô cùng cực khổ, nhưng còn tốt hơn là ngày ngày đi làm mà như đi “thăm mả”. Đừng ép bản thân phải làm những chuyện mà mình không thích, nếu không bạn sẽ thấy mình ngày càng u uất chán nản, mệt mỏi ủ ê.\r\n\r\nCó vài người bạn tâm giao, không cần “tám” chuyện suốt ngày, không cần tụ tập mọi lúc, nhưng tâm ý luôn tương thông, quan trọng là không thấy mệt mỏi khi ở bên nhau. Đừng ép bản thân phải giao du với những người có tư tưởng khác mình, nếu không người chịu khổ là chính bạn đấy.\r\n\r\nVề tác giả:\r\n\r\nVãn Tình là nhà biên kịch - tác giả của những đầu sách bán chạy tại Trung Quốc. Các tác phẩm của cô đều thẳng thắn, trực diện, đánh trúng tâm lý các cô gái.\r\n\r\nỞ Việt Nam, Vãn Tình được coi như “nữ hoàng” của dòng sách cảm hứng sống dành cho phái nữ. Cuốn sách Bạn đắt giá bao nhiêu? của cô trở thành cuốn sách Bán chạy nhất trên nền tảng Tiki (2019), tạo nên một làn sóng mạnh mẽ nhằm cổ vũ tinh thần, thay đổi quan điểm hạnh phúc của bất kỳ ai từng đọc cuốn sách.\r\n\r\nMã hàng	8935325017353\r\nTên Nhà Cung Cấp	AZ Việt Nam\r\nTác giả	Vãn Tình\r\nNgười Dịch	Mỹ Linh\r\nNXB	Thế Giới\r\nNăm XB	2023\r\nNgôn Ngữ	Tiếng Việt\r\nTrọng lượng (gr)	340\r\nKích Thước Bao Bì	20 x 14.5 x 1.6 cm\r\nSố trang	322\r\nHình thức	Bìa Mềm\r\nSản phẩm bán chạy nhất	Top 100 sản phẩm Kỹ năng sống bán chạy của tháng\r\nGiá sản phẩm trên Fahasa.com đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như Phụ phí đóng gói, phí vận chuyển, phụ phí hàng cồng kềnh,...\r\nChính sách khuyến mãi trên Fahasa.com không áp dụng cho Hệ thống Nhà sách Fahasa trên toàn quốc\r\nMột Đời Được Mất\r\n\r\n- Mọi vấn đề khó quyết định trong cuộc đời này, đều có thể suy xét dưới góc nhìn “Được” và “Mất”.\r\n\r\n- Có những thứ bạn nghĩ mình “được”, nhưng thực chất chỉ là ảo mộng hão huyền. Cũng có những thứ bạn nghĩ mình “mất”, nhưng cuộc sống chắc chắn sẽ “trả lại” cho bạn dưới một hình thức khác.\r\n\r\n- Tất cả những điều ấy – đều không thể đoán trước được.\r\n\r\nBạn chỉ cần sống hiên ngang, tự tin – không thẹn với lòng mà thôi!\r\n\r\nĐó là những lời nhắn gửi chân thành và tinh túy được đúc rút từ cuốn sách mới nhất của Vãn Tình – Một đời được mất. Đây là cuốn sách thứ chín của cô xuất bản tại thị trường Việt Nam bởi thương hiệu Bloom Books, đánh dấu son rực rỡ trên hành trình phấn đấu và trưởng thành của nữ tác giả đầu sách best seller Bạn đắt giá bao nhiêu? và Khí chất bao nhiêu, hạnh phúc bấy nhiêu.\r\n\r\nNăm tháng không lấy đi nhiệt huyết của cô mà còn ban tặng cho cô những kinh nghiệm vô cùng quý giá - dưới góc nhìn của một người phụ nữ đã đi qua bóng tối cuộc đời, cũng đã chạm đến đỉnh cao danh vọng, sống một đời phong phú, viên mãn. Những câu chuyện trong Một đời được mất vẫn được “mổ xẻ” một cách sắc bén, trực diện – nhưng có sự suy xét tinh tế hơn cả về lý lẽ và tình cảm, điều mà hiếm ai có thể làm được nếu chưa trải qua đủ những cung bậc thăng trầm của cuộc đời, gặp đủ nhiều người và trò chuyện đủ lâu với họ để soi thấu những điều cần tỏ tường.\r\n\r\nLần trở lại này, Một đời được mất đem đến hơn bốn mươi câu chuyện xoay quanh những vấn đề cơ bản của cuộc sống: đi làm, thăng tiến, hôn nhân, gia đình, quan hệ mẹ chồng – nàng dâu, quan hệ bạn bè,... với tâm thế:\r\n\r\nPhụ nữ mạnh mẽ, là người có khả năng cầm lên được, bỏ xuống được\r\n\r\nTrích dẫn hay của Vãn Tình trong Một đời được mất:\r\n\r\n1. Con người ta sống trên đời, nhiều khi chỉ muốn “nhận được”, mà không nỡ “bỏ đi” – thực ra cũng là lẽ thường tình, nhưng sự đời thường là: Phải có dũng khí “bỏ đi” thì mới “nhận được” thành quả. Người cái gì cũng muốn, cuối cùng lại thường mất đi tất cả. Khi bạn đã hiểu được đạo lý này, bạn sẽ biết mình nên lựa chọn ra sao.\r\n\r\n2. Nỗi đau mà đàn ông gây ra không phải là đau khổ thực sự mà chỉ là cảm xúc nhất thời. Phụ nữ mà không có khả năng nuôi sống bản thân mới thực sự là đau khổ. Phụ nữ không có tiền mà ly hôn mới gọi là “ly hôn”, phụ nữ có tiền mà ly hôn thì được gọi là “trở lại trạng thái độc thân”. Phụ nữ không có tiền kết hôn gọi là tìm kiếm “phiếu cơm dài hạn”, phụ nữ có tiền kết hôn gọi là “theo đuổi tình yêu đích thực”.\r\n\r\n3. Khi một mối quan hệ cần bạn nhẫn nhịn chịu đựng để duy trì, buộc bạn không ngừng hy sinh lợi ích của mình để gìn giữ, thì thực ra nó nên chấm dứt từ lâu lắm rồi.\r\n\r\n4. Những cô gái sống có cá tính thường nghe theo tiếng gọi của trái tim, nên luôn tạo cho người ta cảm giác chân thực, không làm bộ, không giả dối. Thế nên chúng ta hãy cứ sống thật với chính mình, những người có tư tưởng tương đồng sẽ dần dần tới bên chúng ta.\r\n\r\n5. Khi bước qua tuổi ba mươi, tôi thấy phụ nữ nên sống thế này:\r\n\r\nCó người thương biết chở che ấm lạnh, không có phản bội và lừa dối, xứng đáng để chúng ta trao gửi tấm chân tình, nếu không, cứ sống độc thân vui vẻ cũng chẳng sao. Ít nhất chúng ta không phải sống trong đau khổ và dằn vặt.\r\n\r\nCó sự nghiệp mà mình yêu quý, dù không kiếm ra nhiều tiền, thậm chí vô cùng cực khổ, nhưng còn tốt hơn là ngày ngày đi làm mà như đi “thăm mả”. Đừng ép bản thân phải làm những chuyện mà mình không thích, nếu không bạn sẽ thấy mình ngày càng u uất chán nản, mệt mỏi ủ ê.\r\n\r\nCó vài người bạn tâm giao, không cần “tám” chuyện suốt ngày, không cần tụ tập mọi lúc, nhưng tâm ý luôn tương thông, quan trọng là không thấy mệt mỏi khi ở bên nhau. Đừng ép bản thân phải giao du với những người có tư tưởng khác mình, nếu không người chịu khổ là chính bạn đấy.\r\n\r\n', 0),
(25, 'Không Phải Sói Nhưng Cũng Đừng Là Cừu', 3, 200000, 50000, 100, '_khong-phai-soi-nhung-cung-dung-la-cuu.jpg', 'Không Phải Sói Nhưng Cũng Đừng Là Cừu\r\n\r\nSÓI VÀ CỪU - BẠN KHÔNG TỐT NHƯ BẠN NGHĨ ĐÂU!\r\n\r\nLàn ranh của việc ngây thơ hay xấu xa đôi khi mỏng manh hơn bạn nghĩ.\r\n\r\nBạn làm một việc mà mình cho là đúng, kết quả lại bị mọi người khiển trách.\r\n\r\nBạn ủng hộ một quan điểm của ai đó, và số đông khác lại ủng hộ một quan điểm trái chiều.\r\n\r\nRốt cuộc thì bạn sai hay họ sai?\r\n\r\nCuốn sách “Không phải sói nhưng cũng đừng là cừu” đến từ tác giả Lê Bảo Ngọc sẽ giúp bạn hiểu rõ hơn những khía cạnh sắc sảo phía sau những nhận định đúng, sai đơn thuần của mỗi người.\r\n\r\nNhững câu hỏi đầy tính tranh cãi như “Cứu người hay cứu chó?”, “Một kẻ thô lỗ trong lớp vỏ “thẳng tính” khác với người EQ thấp như thế nào?”, “Vì sao một bộ phận nữ giới lại victim blaming đối với nạn nhân bị xâm hại?”,... được tác giả đưa ra trong “Không phải sói nhưng cũng đừng là cừu”. Bằng từng chương sách của mình, tác giả vạch rõ cho bạn rằng “thật sự thế nào mới là người tốt”, ngây thơ và xấu xa có ranh giới rõ ràng như thế không, rốt cuộc bạn có là người tốt như mình vẫn luôn nghĩ?\r\n\r\nTrong thời đại mà mọi thứ đều rất chóng vánh này, ranh giới giữa tốt và xấu, đúng và sai đôi lúc là không tồn tại.\r\n\r\nCái tốt mà chúng ta nghĩ, hóa ra lại là xấu trong mắt kẻ khác.\r\n\r\nCái đúng ở thời điểm này, đến một thời điểm khác lại trở thành sai.\r\n\r\nTốt đẹp hay xấu xa, thật khó phân định.\r\n\r\nCuốn sách “Không phải sói nhưng cũng đừng là cừu” của tác giả Lê Bảo Ngọc - admin Tâm Lý Học Tổ Kén đồng thời là Giám đốc Trung tâm Pháp Luật và Văn hóa sẽ là câu trả lời thấu suốt và khiến bạn phải đặt ra câu hỏi cho lối tư duy bấy lâu bạn luôn nghĩ là đúng. Bạn sẽ là người giải phóng chính mình, khỏi gông xiềng của định kiến, quy chuẩn cũ kĩ vốn được thiết lập lên để mang lại lợi ích cho kẻ khác. Và bạn sẽ không còn phải lăn tăn giữa tốt và xấu, sói hay cừu, vì điều đó là không quan trọng. Bạn sẽ tìm được chính mình và muốn là chính mình sau từng trang sách của “Không phải sói mà cũng đừng là cừu\"\r\n\r\nKhông phải sói, cũng đừng là cừu - Cuốn sách đập tan những định kiến cũ kỹ, kiến tạo tư duy và giúp bạn xây dựng lại chính mình!\r\n\r\nMã hàng	8935325006685\r\nTên Nhà Cung Cấp	Skybooks\r\nTác giả	Lê Bảo Ngọc\r\nNXB	Thế Giới\r\nNăm XB	2022\r\nNgôn Ngữ	Tiếng Việt\r\nTrọng lượng (gr)	340\r\nKích Thước Bao Bì	20.5 x 14.5 x 1 cm\r\nSố trang	296\r\nHình thức	Bìa Mềm\r\nSản phẩm bán chạy nhất	Top 100 sản phẩm Kỹ năng sống bán chạy của tháng\r\nGiá sản phẩm trên Fahasa.com đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như Phụ phí đóng gói, phí vận chuyển, phụ phí hàng cồng kềnh,...\r\nChính sách khuyến mãi trên Fahasa.com không áp dụng cho Hệ thống Nhà sách Fahasa trên toàn quốc\r\nKhông Phải Sói Nhưng Cũng Đừng Là Cừu\r\n\r\nSÓI VÀ CỪU - BẠN KHÔNG TỐT NHƯ BẠN NGHĨ ĐÂU!\r\n\r\nLàn ranh của việc ngây thơ hay xấu xa đôi khi mỏng manh hơn bạn nghĩ.\r\n\r\nBạn làm một việc mà mình cho là đúng, kết quả lại bị mọi người khiển trách.\r\n\r\nBạn ủng hộ một quan điểm của ai đó, và số đông khác lại ủng hộ một quan điểm trái chiều.\r\n\r\nRốt cuộc thì bạn sai hay họ sai?\r\n\r\nCuốn sách “Không phải sói nhưng cũng đừng là cừu” đến từ tác giả Lê Bảo Ngọc sẽ giúp bạn hiểu rõ hơn những khía cạnh sắc sảo phía sau những nhận định đúng, sai đơn thuần của mỗi người.\r\n\r\nNhững câu hỏi đầy tính tranh cãi như “Cứu người hay cứu chó?”, “Một kẻ thô lỗ trong lớp vỏ “thẳng tính” khác với người EQ thấp như thế nào?”, “Vì sao một bộ phận nữ giới lại victim blaming đối với nạn nhân bị xâm hại?”,... được tác giả đưa ra trong “Không phải sói nhưng cũng đừng là cừu”. Bằng từng chương sách của mình, tác giả vạch rõ cho bạn rằng “thật sự thế nào mới là người tốt”, ngây thơ và xấu xa có ranh giới rõ ràng như thế không, rốt cuộc bạn có là người tốt như mình vẫn luôn nghĩ?\r\n\r\nTrong thời đại mà mọi thứ đều rất chóng vánh này, ranh giới giữa tốt và xấu, đúng và sai đôi lúc là không tồn tại.\r\n\r\nCái tốt mà chúng ta nghĩ, hóa ra lại là xấu trong mắt kẻ khác.\r\n\r\nCái đúng ở thời điểm này, đến một thời điểm khác lại trở thành sai.\r\n\r\nTốt đẹp hay xấu xa, thật khó phân định.\r\n\r\nCuốn sách “Không phải sói nhưng cũng đừng là cừu” của tác giả Lê Bảo Ngọc - admin Tâm Lý Học Tổ Kén đồng thời là Giám đốc Trung tâm Pháp Luật và Văn hóa sẽ là câu trả lời thấu suốt và khiến bạn phải đặt ra câu hỏi cho lối tư duy bấy lâu bạn luôn nghĩ là đúng. Bạn sẽ là người giải phóng chính mình, khỏi gông xiềng của định kiến, quy chuẩn cũ kĩ vốn được thiết lập lên để mang lại lợi ích cho kẻ khác. Và bạn sẽ không còn phải lăn tăn giữa tốt và xấu, sói hay cừu, vì điều đó là không quan trọng. Bạn sẽ tìm được chính mình và muốn là chính mình sau từng trang sách của “Không phải sói mà cũng đừng là cừu\"\r\n\r\nKhông phải sói, cũng đừng là cừu - Cuốn sách đập tan những định kiến cũ kỹ, kiến tạo tư duy và giúp bạn xây dựng lại chính mình!', 0),
(26, 'Lớp Học Mật Ngữ', 2, 200000, 50000, 100, 'lhmn-phienbanmoi-tap2-1165_1.jpg', '', 0),
(27, 'Mùa Hè Không Tên', 1, 200000, 50000, 100, 'mua-he-khong-ten---bia-mem---qua-tang-kem-1.jpg', '', 0),
(28, 'Nhà Giả Kim (Tái Bản 2020)', 1, 200000, 50000, 100, 'image_195509_1_36793.jpg', 'Tất cả những trải nghiệm trong chuyến phiêu du theo đuổi vận mệnh của mình đã giúp Santiago thấu hiểu được ý nghĩa sâu xa nhất của hạnh phúc, hòa hợp với vũ trụ và con người. \r\n\r\nTiểu thuyết Nhà giả kim của Paulo Coelho như một câu chuyện cổ tích giản dị, nhân ái, giàu chất thơ, thấm đẫm những minh triết huyền bí của phương Đông. Trong lần xuất bản đầu tiên tại Brazil vào năm 1988, sách chỉ bán được 900 bản. Nhưng, với số phận đặc biệt của cuốn sách dành cho toàn nhân loại, vượt ra ngoài biên giới quốc gia, Nhà giả kim đã làm rung động hàng triệu tâm hồn, trở thành một trong những cuốn sách bán chạy nhất mọi thời đại, và có thể làm thay đổi cuộc đời người đọc.\r\n\r\n“Nhưng nhà luyện kim đan không quan tâm mấy đến những điều ấy. Ông đã từng thấy nhiều người đến rồi đi, trong khi ốc đảo và sa mạc vẫn là ốc đảo và sa mạc. Ông đã thấy vua chúa và kẻ ăn xin đi qua biển cát này, cái biển cát thường xuyên thay hình đổi dạng vì gió thổi nhưng vẫn mãi mãi là biển cát mà ông đã biết từ thuở nhỏ. Tuy vậy, tự đáy lòng mình, ông không thể không cảm thấy vui trước hạnh phúc của mỗi người lữ khách, sau bao ngày chỉ có cát vàng với trời xanh nay được thấy chà là xanh tươi hiện ra trước mắt. ‘Có thể Thượng đế tạo ra sa mạc chỉ để cho con người biết quý trọng cây chà là,’ ông nghĩ.”\r\n\r\n- Trích Nhà giả kim\r\n\r\nNhận định\r\n\r\n“Sau Garcia Márquez, đây là nhà văn Mỹ Latinh được đọc nhiều nhất thế giới.” - The Economist, London, Anh\r\n\r\n \r\n\r\n“Santiago có khả năng cảm nhận bằng trái tim như Hoàng tử bé của Saint-Exupéry.” - Frankfurter Allgemeine Zeitung, Đức\r\n\r\nMã hàng	8935235226272\r\nTên Nhà Cung Cấp	Nhã Nam\r\nTác giả	Paulo Coelho\r\nNgười Dịch	Lê Chu Cầu\r\nNXB	NXB Hội Nhà Văn\r\nNăm XB	2020\r\nTrọng lượng (gr)	220\r\nKích Thước Bao Bì	20.5 x 13 cm\r\nSố trang	227\r\nHình thức	Bìa Mềm\r\nSản phẩm hiển thị trong	\r\nĐồ Chơi Cho Bé - Giá Cực Tốt\r\nNhã Nam\r\nTop sách được phiên dịch nhiều nhất\r\nRƯỚC DEAL LINH ĐÌNH VUI ĐÓN TRUNG THU\r\nSản phẩm bán chạy nhất	Top 100 sản phẩm Tiểu thuyết bán chạy của tháng\r\nGiá sản phẩm trên Fahasa.com đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như Phụ phí đóng gói, phí vận chuyển, phụ phí hàng cồng kềnh,...\r\nChính sách khuyến mãi trên Fahasa.com không áp dụng cho Hệ thống Nhà sách Fahasa trên toàn quốc\r\nTất cả những trải nghiệm trong chuyến phiêu du theo đuổi vận mệnh của mình đã giúp Santiago thấu hiểu được ý nghĩa sâu xa nhất của hạnh phúc, hòa hợp với vũ trụ và con người. \r\n\r\nTiểu thuyết Nhà giả kim của Paulo Coelho như một câu chuyện cổ tích giản dị, nhân ái, giàu chất thơ, thấm đẫm những minh triết huyền bí của phương Đông. Trong lần xuất bản đầu tiên tại Brazil vào năm 1988, sách chỉ bán được 900 bản. Nhưng, với số phận đặc biệt của cuốn sách dành cho toàn nhân loại, vượt ra ngoài biên giới quốc gia, Nhà giả kim đã làm rung động hàng triệu tâm hồn, trở thành một trong những cuốn sách bán chạy nhất mọi thời đại, và có thể làm thay đổi cuộc đời người đọc.\r\n\r\n“Nhưng nhà luyện kim đan không quan tâm mấy đến những điều ấy. Ông đã từng thấy nhiều người đến rồi đi, trong khi ốc đảo và sa mạc vẫn là ốc đảo và sa mạc. Ông đã thấy vua chúa và kẻ ăn xin đi qua biển cát này, cái biển cát thường xuyên thay hình đổi dạng vì gió thổi nhưng vẫn mãi mãi là biển cát mà ông đã biết từ thuở nhỏ. Tuy vậy, tự đáy lòng mình, ông không thể không cảm thấy vui trước hạnh phúc của mỗi người lữ khách, sau bao ngày chỉ có cát vàng với trời xanh nay được thấy chà là xanh tươi hiện ra trước mắt. ‘Có thể Thượng đế tạo ra sa mạc chỉ để cho con người biết quý trọng cây chà là,’ ông nghĩ.”', 0),
(29, 'Cuối Con Đường Sẽ Gặp Một Người Thương ', 1, 200000, 50000, 100, '021123-8.jpg', '', 0),
(30, 'Như Sao Trời Ôm Lấy Đại Dương', 1, 200000, 50000, 100, 'bia1-nh_-sao.jpg', '“Tớ gửi chiếc ôm đi đâu đó\r\n\r\nBay đến bên cạnh một bé yêu\r\n\r\nĐang bật khóc giữa bầu trời đêm nhỏ\r\n\r\nĐể tớ ôm, tớ thương em rất nhiều.”\r\n\r\nThân gửi đến người bạn nhỏ một chiếc ôm đầy ấm áp qua tập thơ “Như sao trời ôm lấy đại dương”.\r\n\r\nChắc hẳn thế giới ngoài kia đã không ít lần làm xây xát trái tim vốn yếu mềm của bạn.\r\n\r\nHai chữ “trưởng thành” thật sự không dễ dàng, cuộc sống dù cho đã cố hết sức cũng không được như ý nguyện. Thế nhưng hy vọng bạn, cho dù có nhìn thấy những điều không hay vẫn tiếp tục tin tưởng vào những điều tốt đẹp sẽ xảy ra, giữ cho mình một trái tim lương thiện, sáng ngời.\r\n\r\nĐôi mắt bạn xứng đáng được nhìn thấy những khung cảnh xinh đẹp, đôi tai bạn xứng đáng được lắng nghe những thanh âm dịu dàng và trái tim bạn xứng đáng được yêu thương.\r\n\r\n“Như sao trời ôm lấy đại dương” là tác phẩm đầu tay của nhà thơ trẻ Hngoc. Tập thơ được chia làm hai phần: Yêu mình - Yêu người. Dù là phần nào thì bằng câu từ đẹp đẽ và lấp lánh, Hngoc sẽ khơi gợi khát khao yêu và được yêu trong mỗi chúng ta.\r\n\r\nCó lẽ trên chặng đường học làm “người lớn”, chúng ta sẽ không tránh khỏi những va vấp trong tình yêu. Nhưng giống như biển cả phải có những con sóng thì biển mới trở nên sống động, cũng như trái tim, đôi lúc cần những vết thương để trở nên dạn dĩ, trưởng thành. Từ giây phút bạn học được cách chấp nhận những nỗi đau cũng là lúc bạn học được cách chữa lành cho chính mình. Bởi suy cho cùng chỉ khi ta tự yêu lấy bản thân mình thì mới có khả năng để yêu thương một ai đó khác.\r\n\r\nSau cuối, vẫn mong rằng bạn sẽ tìm được ánh sao trời của riêng mình. Người đó sẽ nguyện ở lại yêu thương, che chở và đưa bạn qua những tháng năm thăng trầm tựa sao trời ôm lấy đại dương.\r\n\r\n“Như bầu trời ôm lấy biển xanh ngát\r\n\r\nMình ôm em thật sát ở trong lòng”\r\n\r\nBất luận thế nào, cũng hy vọng bạn sẽ luôn cảm thấy hạnh phúc với mỗi ngày mình đang sống.\r\n\r\nMã hàng	8935325015137\r\nTên Nhà Cung Cấp	Skybooks\r\nTác giả	hngoc\r\nNXB	Dân Trí\r\nNăm XB	2023\r\nNgôn Ngữ	Tiếng Việt\r\nTrọng lượng (gr)	210\r\nKích Thước Bao Bì	17 x 11 x 0.9 cm\r\nSố trang	192\r\nHình thức	Bìa Mềm\r\nSản phẩm bán chạy nhất	Top 100 sản phẩm Thơ ca, tục ngữ, ca dao, thành ngữ bán chạy của tháng\r\nGiá sản phẩm trên Fahasa.com đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như Phụ phí đóng gói, phí vận chuyển, phụ phí hàng cồng kềnh,...\r\nChính sách khuyến mãi trên Fahasa.com không áp dụng cho Hệ thống Nhà sách Fahasa trên toàn quốc\r\nNhư Sao Trời Ôm Lấy Đại Dương\r\n\r\n“Tớ gửi chiếc ôm đi đâu đó\r\n\r\nBay đến bên cạnh một bé yêu\r\n\r\nĐang bật khóc giữa bầu trời đêm nhỏ\r\n\r\nĐể tớ ôm, tớ thương em rất nhiều.”\r\n\r\nThân gửi đến người bạn nhỏ một chiếc ôm đầy ấm áp qua tập thơ “Như sao trời ôm lấy đại dương”.\r\n\r\nChắc hẳn thế giới ngoài kia đã không ít lần làm xây xát trái tim vốn yếu mềm của bạn.\r\n\r\nHai chữ “trưởng thành” thật sự không dễ dàng, cuộc sống dù cho đã cố hết sức cũng không được như ý nguyện. Thế nhưng hy vọng bạn, cho dù có nhìn thấy những điều không hay vẫn tiếp tục tin tưởng vào những điều tốt đẹp sẽ xảy ra, giữ cho mình một trái tim lương thiện, sáng ngời.\r\n\r\nĐôi mắt bạn xứng đáng được nhìn thấy những khung cảnh xinh đẹp, đôi tai bạn xứng đáng được lắng nghe những thanh âm dịu dàng và trái tim bạn xứng đáng được yêu thương.\r\n\r\n“Như sao trời ôm lấy đại dương” là tác phẩm đầu tay của nhà thơ trẻ Hngoc. Tập thơ được chia làm hai phần: Yêu mình - Yêu người. Dù là phần nào thì bằng câu từ đẹp đẽ và lấp lánh, Hngoc sẽ khơi gợi khát khao yêu và được yêu trong mỗi chúng ta.\r\n\r\nCó lẽ trên chặng đường học làm “người lớn”, chúng ta sẽ không tránh khỏi những va vấp trong tình yêu. Nhưng giống như biển cả phải có những con sóng thì biển mới trở nên sống động, cũng như trái tim, đôi lúc cần những vết thương để trở nên dạn dĩ, trưởng thành. Từ giây phút bạn học được cách chấp nhận những nỗi đau cũng là lúc bạn học được cách chữa lành cho chính mình. Bởi suy cho cùng chỉ khi ta tự yêu lấy bản thân mình thì mới có khả năng để yêu thương một ai đó khác.\r\n\r\nSau cuối, vẫn mong rằng bạn sẽ tìm được ánh sao trời của riêng mình. Người đó sẽ nguyện ở lại yêu thương, che chở và đưa bạn qua những tháng năm thăng trầm tựa sao trời ôm lấy đại dương.\r\n\r\n“Như bầu trời ôm lấy biển xanh ngát\r\n\r\nMình ôm em thật sát ở trong lòng”\r\n\r\nBất luận thế nào, cũng hy vọng bạn sẽ luôn cảm thấy hạnh phúc với mỗi ngày mình đang sống.', 0);

-- --------------------------------------------------------

--
-- Table structure for table `taikhoan`
--

CREATE TABLE `taikhoan` (
  `id` int(11) NOT NULL,
  `user` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `role` tinyint(1) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taikhoan`
--

INSERT INTO `taikhoan` (`id`, `user`, `pass`, `email`, `tel`, `role`, `status`) VALUES
(13, 'hieu', '123', 'nguyenminhhieust10@gmail.com', '0988697904', 1, 1),
(16, 'Rachel', '123', 'hangntkookie97@gmail.com', '0988697902', 0, 1),
(17, 'phuong', '2345', 'phuongnvph33554@fpt.edu.vn', '035565456566', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `id_order` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `hoten` varchar(250) NOT NULL,
  `sdt` varchar(255) NOT NULL,
  `email` varchar(250) NOT NULL,
  `diachi` varchar(250) NOT NULL,
  `tongtien` int(11) NOT NULL,
  `pttt` tinyint(4) NOT NULL COMMENT '1.Thanh toán trực tiếp\r\n2.Chuyển khoản',
  `ngaydathang` datetime NOT NULL,
  `trangthai` tinyint(4) NOT NULL COMMENT '0: Đơn hàng mới\r\n1.Đang xử lý\r\n2.Đang giao hàng\r\n3.Đã giao hàng'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`id_order`, `id_user`, `hoten`, `sdt`, `email`, `diachi`, `tongtien`, `pttt`, `ngaydathang`, `trangthai`) VALUES
(30, 16, 'Thai', '0869902817', 'tbt2632004@gmail.com', 'Ha Long', 350000, 2, '2023-11-12 12:23:07', 3),
(41, 13, 'Thai', '0869902817', 'tbt2632004@gmail.com', 'Ha Long', 50000, 2, '2023-11-12 17:08:45', 0),
(42, 13, 'Thai', '0869902817', 'tbt2632004@gmail.com', 'Ha Long', 50000, 2, '2023-11-12 17:09:18', 0),
(43, 13, 'Thai', '0869902817', 'tbt2632004@gmail.com', 'Ha Long', 50000, 2, '2023-11-12 17:09:43', 0),
(44, 13, 'Thai', '0869902817', 'tbt2632004@gmail.com', 'Ha Long', 50000, 2, '2023-11-12 17:29:52', 0),
(45, 13, 'Thai', '0869902817', 'tbt2632004@gmail.com', 'Ha Long', 50000, 2, '2023-11-12 17:30:29', 0),
(46, 13, 'Thai', '0869902817', 'tbt2632004@gmail.com', 'Ha Long', 200000, 1, '2023-11-12 17:37:41', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `binhluan`
--
ALTER TABLE `binhluan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `danhmuc`
--
ALTER TABLE `danhmuc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id_order_detail`),
  ADD KEY `id_order` (`id_order`);

--
-- Indexes for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_san_pham_danh_muc` (`id_danh_muc`);

--
-- Indexes for table `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`id_order`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `binhluan`
--
ALTER TABLE `binhluan`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `danhmuc`
--
ALTER TABLE `danhmuc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id_order_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `taikhoan`
--
ALTER TABLE `taikhoan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `tbl_order` (`id_order`);

--
-- Constraints for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `fk_san_pham_danh_muc` FOREIGN KEY (`id_danh_muc`) REFERENCES `danhmuc` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
