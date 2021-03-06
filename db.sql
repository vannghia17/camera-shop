CREATE DATABASE  IF NOT EXISTS `camera_shop` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `camera_shop`;
-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: localhost    Database: camera_shop
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `donhang`
--

DROP TABLE IF EXISTS `donhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `donhang` (
  `madonhang` varchar(10) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `ngay` datetime DEFAULT NULL,
  `thanhtien` int(11) DEFAULT NULL,
  `trangthai` tinyint(4) DEFAULT '0' COMMENT '0 (chua giao), 1 (dang giao), 2 (da giao)',
  `diachi` varchar(200) DEFAULT NULL,
  `hoten` varchar(30) DEFAULT NULL,
  `sdt` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`madonhang`),
  KEY `FK_donhang_taikhoan_idx` (`email`),
  CONSTRAINT `FK_donhang_taikhoan` FOREIGN KEY (`email`) REFERENCES `taikhoan` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donhang`
--

LOCK TABLES `donhang` WRITE;
/*!40000 ALTER TABLE `donhang` DISABLE KEYS */;
/*!40000 ALTER TABLE `donhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donhang_sub`
--

DROP TABLE IF EXISTS `donhang_sub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `donhang_sub` (
  `madonhang` varchar(10) NOT NULL,
  `idsanpham` char(5) NOT NULL,
  `soluong` int(11) DEFAULT NULL,
  PRIMARY KEY (`madonhang`,`idsanpham`),
  KEY `FK_sub_sanpham_idx` (`idsanpham`),
  CONSTRAINT `FK_sub_donhang` FOREIGN KEY (`madonhang`) REFERENCES `donhang` (`madonhang`),
  CONSTRAINT `FK_sub_sanpham` FOREIGN KEY (`idsanpham`) REFERENCES `sanpham` (`idsanpham`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donhang_sub`
--

LOCK TABLES `donhang_sub` WRITE;
/*!40000 ALTER TABLE `donhang_sub` DISABLE KEYS */;
/*!40000 ALTER TABLE `donhang_sub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loaisanpham`
--

DROP TABLE IF EXISTS `loaisanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `loaisanpham` (
  `loai` varchar(20) NOT NULL,
  `tenloai` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`loai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loaisanpham`
--

LOCK TABLES `loaisanpham` WRITE;
/*!40000 ALTER TABLE `loaisanpham` DISABLE KEYS */;
INSERT INTO `loaisanpham` VALUES ('360degree','360 độ'),('compact','Compact'),('dslr','DSLR'),('mirrorless','Không gương lật');
/*!40000 ALTER TABLE `loaisanpham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sanpham`
--

DROP TABLE IF EXISTS `sanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sanpham` (
  `idsanpham` char(5) NOT NULL,
  `gia` int(11) DEFAULT NULL,
  `luotxem` int(11) DEFAULT '0',
  `luotban` int(11) DEFAULT '0',
  `mota` varchar(3000) DEFAULT '<p>Không có mô tả<p>',
  `xuatxu` varchar(20) DEFAULT NULL,
  `loai` varchar(20) DEFAULT NULL,
  `nhasanxuat` varchar(20) DEFAULT NULL,
  `img` varchar(200) DEFAULT NULL,
  `tensanpham` varchar(100) DEFAULT NULL,
  `ngaytiepnhan` datetime DEFAULT NULL,
  `soluong` int(11) DEFAULT '30',
  PRIMARY KEY (`idsanpham`),
  KEY `FK_sanpham_loaisanpham_idx` (`loai`),
  KEY `FK_sanpham_thuonghieu_idx` (`nhasanxuat`),
  CONSTRAINT `FK_sanpham_loaisanpham` FOREIGN KEY (`loai`) REFERENCES `loaisanpham` (`loai`),
  CONSTRAINT `FK_sanpham_thuonghieu` FOREIGN KEY (`nhasanxuat`) REFERENCES `thuonghieu` (`nhasanxuat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanpham`
--

LOCK TABLES `sanpham` WRITE;
/*!40000 ALTER TABLE `sanpham` DISABLE KEYS */;
INSERT INTO `sanpham` VALUES ('c0001',13625000,36,0,'GoPro Fusion là mẫu action cam 360 độ mới nhất của GoPro, hỗ trợ quay video 5.2K tốc độ 30fps hoặc 3K 60fps. Máy cũng có thể chụp ảnh tĩnh với độ phân giải 18MP, tính năng ổn định và chống rung kỹ thuật số. Đặc biệt nhờ hỗ trợ âm thanh 360 độ, máy sẽ tạo trải nghiệm video liền mạch và ấn tượng hơn.','china','360degree','GoPro','360-GOPRO-gopro fusion.jpg','GoPro Fusion','2018-06-22 00:00:00',30),('c0002',8620000,33,2,'Chỉ nhỏ bằng một quả bóng chày, như những chiếc camera 360 độ khác, bạn có thể mang chiếc Orbit360 đi bất cứ đâu. Nó mang nét tương đồng bí ẩn của Nikon KeyMission 360, có 2 lens bán cầu ở 2 mặt, thân nhựa.','america','360degree','Kodak','360-KODAK-kodak pixpro orbit360 4k.jpg','Kodak Pixpro Orbit 360 4K','2018-06-18 00:00:00',28),('c0003',7620000,4,0,'Phần camera hình cầu độ phân giải 12MP này có thể quay video 360 độ chất lượng 4K (2028 × 2028 pixel) tại 50fps, nhanh hơn nhiều so với hầu hết các camera VR khác. Ngoài ra, SP360 4K cũng có thể ghi lại cảnh quay slow motion 120fps ở độ phân giải HD 720p.','america','360degree','Kodak','360-KODAK-kodak pixpro sp360 4k.jpg','Kodak Pixpro SP360 4K','2018-06-18 00:00:00',30),('c0004',2025000,1,1,'LG 360 Cam là chiếc camera dùng để chụp hình/quay phim 360 độ và sau đó xem trên những loại kính thực tế ảo VR hoặc trên điện thoại. Nó được trang bị tổng cộng 2 camera xếp đối lập nhau, mỗi cái có độ phân giải 13 MP và đều có thể quay góc siêu rộng 200 độ. Video từ 2 camera này sau đó sẽ được gộp lại thành 1 video duy nhất có độ phân giải 2K (2.560 x 1.280) với cái nhìn toàn cảnh đủ 360 độ.','south-korea','360degree','LG','360-LG-lg 360 cam.jpg','LG G5 Friend 360','2018-06-12 00:00:00',30),('c0005',11280000,2,5,'KeyMission 360 là phiên bản chống va đập, có thể quay/chụp ảnh 4K 360 độ, công nghệ chống rung điện tử VR giúp giảm rung máy khi xem lại video thông qua các ứng dụng Nikon, có đầy đủ kết nối Wifi, Bluetooth, NFC... Chiếc máy này có thể chống thấm nước với độ sâu đến 100 feet (~ 30m) và có khả năng chống bụi, chống sốc, và thích ứng được khi ở nhiệt độ thấp.','japan','360degree','Nikon','360-NIKON-nikon keymission 360 4k.jpg','Nikon KeyMission 360','2018-06-13 00:00:00',25),('c0006',7710000,4,0,'những nâng cấp đáng giá trên chiếc Theta V này là khả năng quay video 360° 4K, live stream 4K 360° với khả năng ghi âm hiệu ứng âm thanh vòm sống động, ngoài ra, về camera chụp ảnh 360° của Theta V cũng được nâng cấp với nhiều thuật toán và sức mạnh cao hơn, giúp máy chụp nhanh hơn, dãi ISO lớn hơn và ảnh ra trong trẻo, sắc nét hơn so với đời trước.','japan','360degree','Ricoh','360-RICOH-ricoh theta v.jpg','Ricoh Theta V 4K','2018-06-17 00:00:00',30),('c0007',1135000,3,0,'Samsung Gear 360 có thiết kế nhỏ gọn, thời trang, tương thích tốt với các thiết bị di động. Máy cũng cho khả năng ghi hình 360 ấn tượng và dễ dàng chia sẻ lên các mạng xã hội.','south-korea','360degree','Samsung','360-SAMSUNG-samsung gear 360.jpg','Samsung Gear 360','2018-06-15 00:00:00',30),('c0008',11350000,17,0,'Là một chiếc máy ảnh du lịch “nồi đồng cối đá” chống nước với khả năng chịu đựng thời tiết khắc nghiệt và va đập, có thiết kế khá độc đáo cùng tính năng chụp ảnh 12MP đẹp rực rỡ, canon powershot d30 dường như hội tụ tất cả những gì mà một người mê phượt cần ở một chiếc máy ảnh du lịch nhỏ gọn.','china','compact','Canon','compact-CANON-canon powershot d30.jpg','Canon PowerShot D30','2018-06-11 00:00:00',30),('c0009',7230000,1,0,'Canon PowerShot N nằm trong phân khúc máy ảnh loại nhỏ, thiết kế hình vuông với ống kính 8x f3.0-5.9 28-224 mm và màn hình cảm ứng LCD nghiêng 2,8 inch. Tuy nhiên màn hình của PowerShot N chỉ có thể nghiêng đến 90 độ mà thôi. Màn hình này thích hợp để chụp các bức ảnh ở vị trí thấp, bạn cũng có thể lật máy ảnh và chụp ảnh ở vị trí cao.','japan','compact','Canon','compact-CANON-canon powershot n2.jpg','Canon PowerShot N2','2018-06-11 00:00:00',30),('c0010',5890000,2,2,'Nếu mua máy ảnh canon powershot sx420 này, bạn sẽ nhận ra được nhiều cái lợi. Đầu tiên là về quay phim chụp hình, khả năng lấy nét của máy là tuyệt hơn smartphone. Ngoài ra máy còn chống rung rất tốt. Điểm yếu gặp hầu hết ở các máy là chụp trong tối còn lòe mờ, dùng Flash màu cũng còn xấu.','japan','compact','Canon','compact-CANON-canon powershot sx420.jpg','Canon PowerShot SX420','2018-06-06 00:00:00',30),('c0011',6800000,1,0,'Canon PowerShot SX420\',\'2018-06-06 00:00:00\'),(\'c0011\',6800000,0,0,\'Canon PowerShot SX530 kế thừa thiết kế và khả năng zoom 50x quang học tương đương 24-1200mm F3.4-6.5 trên máy với cảm biến Full-frame của đàn anh SX530, nâng cấp thêm cảm biến 20MP BSI CMOS, bộ xử lý hình ảnh mới DIGIC 6 mang lại hình ảnh độ phân giải cao kết hợp với khả năng chụp thiếu sáng, khả năng chống rung và khả năng quay video 1080/60p.','china','compact','Canon','compact-CANON-canon powershot sx530.jpg','Canon PowerShot SX530','2018-06-08 00:00:00',30),('c0012',5890000,16,0,'Đây là loại máy ảnh compact siêu zoom vừa được Canon chính thức ra mắt như là một bản nâng cấp nhẹ từ mẫu PowerShot SX610 HS, có dải zoom cao hơn','japan','compact','Canon','compact-CANON-canon powershot sx620.jpg','Canon PowerShot SX620','2018-06-02 00:00:00',30),('c0013',28180000,1,8,'Fujifilm X100F là chiếc máy ảnh compact cao cấp nhất của Fujifilm trên thị trường hiện tại, thế hệ thứ 4 của dòng X100 được ra đời từ năm 2011. Nhà sản xuất Nhật Bản cũng ưu ái trang bị cho X100F các thông số phần cứng khá ấn tượng như cảm biến ảnh X-Trans CMOS III tương tự trên X-Pro2, độ phân giải 24,3MP và ống kính tiêu cự 23mm f/2 (tương đương 35 mm trên khổ Full-frame). Thiết kế nhỏ nhắn, cổ điển kết hợp hiện đại cùng với cảm biến ảnh chất lượng của X100F đem lại cảm hứng chụp ảnh cho bất cứ ai lần đầu trải nghiệm.','america','compact','Fujifilm','compact-FUJIFILM-fujifilm x100f.jpg','Fujifilm X100F','2018-05-30 00:00:00',27),('c0014',20490000,0,0,'Khi cầm Fujifilm X70 lên, nếu không nói chắc cũng không nhiều người hình dung ra nó sử dụng cảm biến APC-C lớn, đơn giản vì máy quá nhỏ gọn và dễ dàng đặt trong bất cứ chiếc áo sơ mi nào. Fujifilm cũng đã phải hy sinh sử dụng ống kính 18.5mm (góc nhìn tương đương 28mm trên fullframe) f2.8 trên X70 để ống kính chỉ nhô lên rất ít so với thân máy, nhắm đến đặc tính nhỏ gọn bỏ túi này. Nếu X70 dùng ống kính f2.0 giống dòng X100 thì sẽ tuyệt vời hơn rất nhiều nhưng khi đó máy sẽ lớn, cụm thấu kính lồi lên cao và khó lòng bỏ túi áo sơ mi được nữa.','japan','compact','Fujifilm','compact-FUJIFILM-fujifilm x70.jpg','Fujifilm X70','2018-05-29 00:00:00',30),('c0015',2250000,0,0,'Kodak  pixpro FZ151 là mẫu máy ảnh compact đầu tiên được trang bị màn hình lật xoay đa hướng vừa được Nikon giới thiệu tháng trước. Tuy là dòng sản phẩm phổ thông, nhưng Kodak  pixpro FZ151 vẫn hấp dẫn người dùng bởi nhiều chi tiết nâng cấp mạnh mẽ như cảm biến BSI-CMOS (16 megapixel), bộ xử lý hình ảnh EXPEED C2, cụm ống kính zoom quang 12x (tương đương dải tiêu cự 25-300 mm trên máy phim) hỗ trợ chống rung quang học.','america','compact','Kodak','compact-KODAK-kodak pixpro fz151.jpg','Kodak Pixpro FZ151','2018-05-24 00:00:00',30),('c0016',2050000,0,0,'Kodak pixpro FZ51 là mẫu máy ảnh mang hình dáng của một chiếc ống kính, và từ đó người dùng kết nối với điện thoại chạy Android và iOS để làm màn hình hiển thị cũng như tiếp nhận hình ảnh. Pixpro Smart Lens có hai phiên bản bao gồm SL10 sở hữu ống kính 28-280mm và SL25 với ống kính zoom 25X 24-600mm.','america','compact','Kodak','compact-KODAK-kodak pixpro fz51.jpg','Kodak Pixpro FZ51','2018-05-27 00:00:00',30),('c0017',2150000,1,0,'Kodak pixpro WP1 Sport có thiết kế tròn, ít cạnh vát, thân thiện với trẻ em. Vỏ ngoài của máy làm từ vật liệu nhựa composite với 3 màu Xanh, Hồng, vàng và 1 phiên bản hoạ tiết \\\"màu mè\\\". Lớp vỏ này giúp Kodak pixpro WP1 Sport chống nước ở độ sâu 10m, chống sốc khi rơi ở độ cao 1,8m và chịu được nhiệt độ -10°C.','america','compact','Kodak','compact-KODAK-kodak pixpro wp1 sport.jpg','Kodak pixpro WP1 Sport','2018-05-27 00:00:00',30),('c0018',4030000,0,10,'Nếu bạn đang tìm kiếm một chiếc máy ảnh có khả năng tạo ra chất lượng ảnh ngang ngửa một chiếc máy ảnh DSLR entry-level thì Nikon Coolpix A300 đáp ứng chính xác tất cả những gì bạn cần. nhờ vào cảm biến hình ảnh CMOS kích thước APS-C , Coolpix A300 sở hữu chất lượng hình ảnh cực ấn tượng dù là bạn chụp trong điều kiện ánh sáng tốt hay kém.','south-korea','compact','Nikon','compact-NIKON-nikon coolpix a300.jpg','Nikon Coolpix A300','2018-05-22 00:00:00',30),('c0019',1910000,12,2,'Nikon Coolpix L32, ngoài ống kính zoom quang 42x còn có một màn hình LCD nghiêng lật được với độ phân giải 921.000 điểm ảnh, quay được video full HD với âm thanh stereo.','japan','compact','Nikon','compact-NIKON-nikon coolpix l32.jpg','Nikon Coolpix L32','2018-05-23 00:00:00',28),('c0020',4420000,0,0,'Nikon vừa giới thiệu máy ảnh Coolpix W100 với khả năng chụp ảnh 13MP, zoom 3X, chống sốc, chống nước, ... Đây là phiên bản cho thị trường châu á và châu âu, là biến thể của chiếc máy ảnh chống nước NIkon S33 dành riêng cho thị trường Mỹ. Với ngoại hình \\\"màu mè hoa lá\\\", đây sẽ là chiếc máy ảnh thời trang, mang tính vui vẻ để người dùng ghi lại những hoạt động hằng ngày trong đời sống, kể cả khi đi bơi, chụp trong mưa...','japan','compact','Nikon','compact-NIKON-nikon coolpix w100.jpg','Nikon Coolpix W100','2018-05-18 00:00:00',30),('c0021',31790000,2,5,' RX10 III hỗ Ống kính siêu zooom dải tiêu cự chạy từ 24 - 600mm (FF) được hỗ trợ rất nhiều khi chụp ở tiêu cự tele là khả năng chống rung quang học của ống kính hiệu quả. Tất cả ảnh mình đều cầm tay chụp trên đường đi. Ở tiêu cự 24mm đến trung bình 50mm chụp đời thường đủ dùng tiếp cận với ý tưởng kiểu đường phố.','japan','compact','Sony','compact-SONY-sony cybershot rx10 iii.jpg','Sony Cybershot RX10 III','2018-05-19 00:00:00',30),('c0022',38620000,0,0,'RX10 IV là chiếc máy thuộc dòng máy ảnh tích hợp ống kính siêu zoom của Sony. Nâng cấp lớn nhất của phiên bản RX10 IV này so với RX10 III là tăng tốc độ chụp liên tục từ 14fps lên 24fps với bộ đệm về lý thuyết là 249 ảnh JPG cho một lần bấm chụp, điểm lấy nét từ 25 điểm lên 315 điểm lấy nét lai theo pha, màn hình LCD cảm ứng chạm chụp...','japan','compact','Sony','compact-SONY-sony cybershot rx10 iv.jpg','Sony Cybershot RX10 IV','2018-05-20 00:00:00',30),('c0023',2290000,0,0,'Sony WX220 với ấn tượng lớn nhất là tốc độ chụp liên tục 24fps với bộ đệm 249 ảnh JPG. và độ sắc nét được bảo toàn nhờ sự nâng cấp điểm lấy nét từ 25 điểm của bản III lên 315 điểm và lấy nét theo pha nhanh 0.03 giây.','japan','compact','Sony','compact-SONY-sony cybershot wx220.jpg','Sony Cubershot WX220','2018-05-20 00:00:00',30),('c0024',8390000,59,3,'Canon EOS 1300D KIT chỉ nhỏ gọn như một chiếc máy compact. Máy có lựa chọn màu đen hoặc trắng, chiếc màu trắng có vẻ ngoài khá dễ thương nên phù hợp với người dùng là nữ. Khi lắp thêm ống kính 15 – 45 mm vào thì máy vẫn nhỏ gọn và có thể bỏ vào túi xách. Ngoài ra, Canon còn cung cấp phụ kiện vỏ ốp nhiều màu sắc để tùy biến vẻ ngoài cho máy (bán rời).','japan','dslr','Canon','dslr-CANON-canon eos 1300d Kit.jpg','Canon EOS 1300D','2018-06-21 00:00:00',27),('c0025',13190000,1,0,'Chiếc Canon EOS 1500D cho một dáng vẻ khỏe khoắn với gù ngắm trông ngầu, màn hình xoay lật nhiều góc. Điểm trừ duy nhất về ngoại hình cũng như là khả năng sử dụng chính là việc có quá ít bánh xe điều chỉnh (1 bánh xe duy nhất, so với M5 là 4), ở trên một thân máy mirrorless, sẽ là sai lầm nếu nhét quá nhiều nút bấm vào, thay vào đó thì phải nhiều bánh xe mới thật sự tiện dụng với người sử dụng.','china','dslr','Canon','dslr-CANON-canon eos 1500d.jpg','Canon EOS 1500D','2018-05-13 00:00:00',30),('c0026',36190000,0,0,'Là sản phẩm thấp nhất trong những chiếc máy DSLR, nên Canon cũng phải thực hiện cắt giảm giá thành trên 3000D. Máy được làm bằng nhựa, và cả ngàm gắn ống kính cũng làm bằng nhựa. Với những ống kính nhẹ như kit, hoặc 35mm f2, 50mm f1.8 thì đây không phải là vấn đề, nhưng khi gắn ống kính nặng trong một thời gian dài thì ngàm này có thể sẽ yếu đi.','japan','dslr','Canon','dslr-CANON-canon eos 3000d.jpg','Canon EOS 3000D','2018-05-15 00:00:00',30),('c0027',65990000,1,0,'Nhưng cảm biến trên Canon 5D Mark III không những có độ phân giải cao hơn (24mpx), mà được sản xuất trên công nghệ mới nên cũng được khắc phục nhiều về vấn đề Dynamic range. Khả năng khử nhiễu hạt của 2 máy dừng lại ở mức ổn, nhưng với cảm biến có độ phân giải cao của Canon 5D Mark III  có thể sử dụng tính năng khử nhiễu của Lightroom để làm sạch ảnh hơn mà không sợ mất chi tiết như ở 3000D.','america','dslr','Canon','dslr-CANON-canon eos 5d mark iii.jpg','Canon EOS 5D Mark III','2018-05-16 00:00:00',30),('c0028',67990000,1,0,'5D Mark III là thế hệ kế tiếp của 5D Mark II trong dòng máy huyền thoại 5D. 5D Mark III ra đời năm 2012 theo truyền thống là để phục vụ Olympic mùa hè tại London. Mỗi kỳ Olympic là nơi để các hãng máy ảnh và máy quay trổ hết khả năng thi thố của mình. Và trong lĩnh vực máy ảnh thì nói chung chỉ là sự đấm đá giữa Canon và Nikon là chính. Nhìn vào các phòng viên toàn thấy lens trắng của Canon và dây đeo vàng của Nikon. Sony, Fujifilm hay Olympus khá hụt hơi ở sân chơi chuyên nghiệp này. Năm 2012 đó, Canon mang đến cho các phóng viên dùng trước cả một rừng máy 1DX và 5D Mark III. Những tấm hình siêu nét siêu ấn tượng trên các báo, trên TV, hay thậm chí là các ấn phẩm in ấn lớn đều là tác phẩm của 2 chiếc máy bá đạo này.','america','dslr','Canon','dslr-CANON-canon eos 5d mark-iii-1.jpg','Canon EOS 5D Mark III-1','2018-05-24 00:00:00',30),('c0029',64990000,15,0,'So với các model tiền nhiệm trong dòng Canon 5D, Canon 5D Mark III có một số cải tiến đang kể về hiệu suất tổng thể, từ tốc độ chụp liên tiếp cho đến khả năng lấy nét tự động, trong khi độ phân giải chỉ tăng nhẹ so với 5D Mark II (22.3 megapixel so với 21.1 megapixel của Mark II). ','china','dslr','Canon','dslr-CANON-canon eos 5d mark-iii-2.jpg','Canon EOS 5D Mark III-2','2018-06-03 00:00:00',30),('c0030',62990000,0,0,'Một cải tiến lớn khác của Mark III là bộ vi xử lý DIGIC 5 +, được tuyên bố là mạnh hơn 17 lần so với bộ vi xử lý DIGIC 4 của 5D Mark II. Hệ thống đo sáng hai lớp với 63 vùng đo sáng của model Canon 7D cũng xuất hiện trở lại trong Canon 5D Mark III, thay vì cảm biến RGB 100.000 pixel của 1D X. Máy còn có một màn trập 150.000 lượt chụp, một chế độ HDR mới, khả năng quay video Full HD 1080p ở tốc độ 24, 25, và 30 khung hình mỗi giây','china','dslr','Canon','dslr-CANON-canon eos 5d mark-iii-3.jpg','Canon EOS 5D Mark III-3','2018-06-02 00:00:00',30),('c0031',49950000,5,0,'6D là chiếc máy ảnh full-frame nhỏ nhất, nhẹ nhất của Canon tính đến thời điểm 2015. 6D cho màu sắc tuyệt vời, sống động, phù hợp gần như mọi thể loại chụp ảnh, đáp ứng hầu hết mọi nhu cầu của người dùng bình thường. Ngoài ra, 6D còn có những tính năng rất vượt trội như cho hình ảnh đẹp ngay cả ở ISO cực cao 25600, tính năng WIFI... Ở hầu hết các mặt, 6D đều khá hơn 5D Mark II, 1D Mark III, và chỉ thua kém 5D Mark III một chút. Vì vậy không phải ngẫu nhiên mà 6D được dùng rất rộng rãi trong giới chụp ảnh cưới, ảnh dịch vụ.','japan','dslr','Canon','dslr-CANON-canon eos 6d.jpg','Canon EOS 6D','2018-05-03 00:00:00',30),('c0032',25750000,1,0,'Tiếp bước thành công của đàn anh 40D, các máy 50D, 60D, 70D lần lượt ra đời. Không như dòng 3, 4 số cho hẳn người chập chững mới chơi, dòng 1 số cho dân chuyên nghiệp - dòng 2 số của Canon dành cho tất cả mọi người, ai cũng thể dùng, từ thượng vàng hạ cám, từ biết đủ thứ đến không biết gì, chiếc máy 2 số vẫn là dành cho bạn. Nó giống hệt như chiếc lens đa dụng ai cũng có thể dùng và dùng vào mục đích nào cũng được.','japan','dslr','Canon','dslr-CANON-canon eos 70d.jpg','Canon EOS 70D','2018-05-02 00:00:00',30),('c0033',18500000,0,0,'Kodak Pixpro AZ365 là 1 trong 2 chiếc crop tốt nhất vào thời điểm 2016. Không cần biết trình độ bạn như thế nào, bạn vẫn có thể sử dụng Kodak Pixpro AZ365 vì Kodak Pixpro AZ365 có đủ chế độ hỗ trợ: từ chụp hoàn toàn tự động cho đến setup hoàn toàn bằng tay. Bạn cũng có thể dùng chụp Kodak Pixpro AZ365 cho mọi nội dung, từ chân dung, phong cảnh, cho đến thể thao, chim chóc. Siêu tốc độ 8 khung hình/giây của 7D bỗng nhiên không còn là ưu thế nữa, khi Kodak Pixpro AZ365 bám sát nút với 7 khung hình/giây. Kodak Pixpro AZ365 cũng có 19 điểm lấy nét như 7D.','america','dslr','Kodak','dslr-KODAK-kodak pixpro az365.jpg','Kodak Pixpro AZ365','2018-05-01 00:00:00',30),('c0034',16450000,0,0,'PIXPRO AZ421 còn hỗ trợ ghi hình Full HD và được trang bị cụm ống kính dải zoom siêu rộng với thành phần thấu kính phi cầu bên trong. AZ421 là một đại diện thuộc dòng máy ảnh Astro Zoom Series. Điểm đặc biệt của máy là cụm ống kính tiêu cự góc rộng hỗ trợ dải zoom quang lên đến 52x','america','dslr','Kodak','dslr-KODAK-kodak pixpro az421.jpg','Kodak Pixpro AZ421','2018-05-08 00:00:00',30),('c0035',19500000,0,0,'Nội lực của máy là bộ cảm biến CMOS độ phân giải 16 Mpx hỗ trợ dải nhạy sáng từ ISO 100 đến ISO 3.200. Tốc độ màn trập của máy trải rộng từ mức chậm nhất 30 giây đến nhanh nhất đạt 1/2.000 giây. Bên cạnh các chế độ chụp ảnh với các thiết lập hoàn toàn tự động, AZ525 còn hỗ trợ đầy đủ các chế độ chụp ảnh sáng tạo như P/A/S/M.','america','dslr','Kodak','dslr-KODAK-kodak pixpro az525.jpg','Kodak Pixpro AZ525','2018-05-08 00:00:00',30),('c0036',23500000,0,0,'Dòng máy ảnh Kodak Pixpro Astro Zoom AZ651 năm nay ấn tượng với tỷ lệ zoom quang lên tới 65x, sử dụng ống kính góc rộng 24mm, khả năng quay phim Full HD, hệ thống ổn định hình ảnh OIS và màn hình 3.0” LCD. Dòng máy này sẽ đưa ra thị trường vào mùa xuân năm nay. Thêm vào đó 1 số bản model khác ví dụ như AZ251, AZ362 (25x, 36x zoom quang), AZ421 (42x zoom quang), AZ525 (52x zoom quang với khả năng Wi-Fi).','america','dslr','Kodak','dslr-KODAK-kodak pixpro az651.jpg','Kodak Pixpro AZ651','2018-06-13 00:00:00',30),('c0037',14490000,1,0,'Nikon D3400  được trang bị tính năng chụp toàn cảnh Panoramic, chế độ chụp ảnh HDR cùng khả năng quay phim Full HD 1080/30p với chất lượng âm thanh stereo hay ghi hình hiệu ứng slow motion ở độ phân giải VGA với tốc độ 120 khung hình/giây.','south-korea','dslr','Nikon','dslr-NIKON-nikon d3400.jpg','Nikon D3400','2018-06-07 00:00:00',30),('c0038',17490000,0,0,'Nikon D5500 là phiên bản nâng cấp của dòng máy DSLR entry-level D5300 trước đây. Phiên bản D5500 cũng là chiếc máy DSLR đầu tiên của Nikon được trang bị màn hình cảm ứng. Ngoài ra thì nó chỉ được làm gọn hơn và nhẹ hơn so với phiên bản trước, chứ cấu hình thì vẫn được giữ nguyên.','america','dslr','Nikon','dslr-NIKON-nikon d5500.jpg','Nikon D5500','2018-05-14 00:00:00',30),('c0039',19490000,0,0,'Chiếc D7100 thuộc dòng bán chuyên tầm trung. Nó là chiếc máy crop DX, với tỉ lệ 1.5x (khác Canon là 1.6x). D7100 được ấn định là đối trọng của Canon 70D. Và như thường lệ, Nikon luôn luôn ra đời trước. D7100 ra mắt thị trường vào tháng 2/2013, trước 3, 4 tháng so với Canon 70D.','japan','dslr','Nikon','dslr-NIKON-nikon d7100.jpg','Nikon D7100','2018-05-27 00:00:00',30),('c0040',20490000,0,0,'Nikon D7500 là chiếc máy ảnh DX (cảm biến crop 1.5x) thay thế cho chiếc D7200 đã ra mắt cách đây 2 năm. Là sản phẩm thuộc phân khúc bán chuyên và được thừa hưởng một phần thông số cấu hình của chiếc D500 mạnh mẽ nên có thể xem D7500 là một rút gọn của D500. Tuy nhiên bên cạnh những nâng cấp về cấu hình cũng như có một số thay đổi nhỏ về thiết kế so với đời trước thì chiếc máy mới cũng đã bị cắt giảm một số tính năng nhỏ không đáng kể khi xem xét ở phân khúc này.','japan','dslr','Nikon','dslr-NIKON-nikon d7500.jpg','Nikon D7500','2018-05-29 00:00:00',30),('c0041',24490000,0,0,' Nikon D850, một chiếc máy ảnh được Nikon ấp ủ với nhiều công nghệ mới tối ưu giữa độ phân giải cao của cảm biến và hiệu suất hoạt động của máy, có thể nói đây là chiếc DSLR Fullframe thu gọn của chú khủng long D5 hiện tại. Nikon D850 chính thức là người thay thế cho người anh em Nikon D810 đã ra mắt đã 03 năm nay vào ngày 26 tháng 06 năm 2014 với nhiều cải tiến cao cấp hơn nhiều.','japan','dslr','Nikon','dslr-NIKON-nikon d850.jpg','Nikon D850','2018-05-25 00:00:00',30),('c0042',14390000,0,0,'Sony A58 gây được sự chú ý nhờ cảm biến ảnh CMOS 20.1 MP mới và hệ thống lấy nét thông minh, nắm bắt chủ thể tốt hơn cũng như tích hợp những chế độ tự động cắt hình ảnh thông minh.','japan','dslr','Sony','dslr-SONY-sony a58.jpg','Sony A58','2018-05-24 00:00:00',30),('c0043',16390000,0,0,'Sony Alpha A68 được trang bị màn hình LCD 2.7\\\" độ phân giải 460,000 điểm ảnh. Đây là kích thước màn hình của mẫu máy phổ thông A68 và mật độ điểm ảnh ở mức vừa phải, không cao cấp như màn hình của SLT-A57 (921,600 điểm ảnh). \',\'china\',\'dslr\',\'Sony\',\'dslr-SONY-sony a68.jpg\',\'Sony A68\',\'2018-05-19 00:00:00\'),(\'c0044\',16990000,0,0,\'Máy được trang bị cảm biến CMOS Exmor APS HD độ phân giải 20.1 MP với bộ xử lý hình ảnh BIONZ mới. Sony vẫn giữ lại hệ thống lấy nét 15 điểm tuỳ chọn (bao gồm 3 điểm cross-type). Hãng đã nâng cao khả năng tuỳ biến chế độ lấy nét liên tục của máy bằng việc bổ sung chế độ Lock-on AF. Trong chế độ này, khi bạn nhấn 1 nửa nút chụp, vùng lấy nét sẽ được \\\'khoá\\\' lại và nắm bắt theo chuyển động. ','china','dslr','Sony','dslr-SONY-sony a68.jpg','Sony A68','2018-05-19 00:00:00',30),('c0044',16990000,1,0,'M10 chỉ nhỏ gọn như một chiếc máy compact. Máy có lựa chọn màu đen hoặc trắng, chiếc màu trắng có vẻ ngoài khá dễ thương nên phù hợp với người dùng là nữ. Khi lắp thêm ống kính 15 – 45 mm vào thì máy vẫn nhỏ gọn và có thể bỏ vào túi xách. Ngoài ra, Canon còn cung cấp phụ kiện vỏ ốp nhiều màu sắc để tùy biến vẻ ngoài cho máy (bán rời).','japan','dslr','Sony','dslr-SONY-sony a7s.JPG','Sony A7S','2018-05-22 00:00:00',30),('c0045',11990000,2,0,'Canon EOS M6 là chiếc máy ảnh không gương lật thế hệ tiếp sau M5 được hãng máy ảnh nổi tiếng đến từ Nhật Bản giới thiệu trong nửa đầu năm nay, Canon EOS M6 phù hợp cho các đối tượng thích nhỏ gọn và mang đi du lịch nhiều hơn.','japan','mirrorless','Canon','mirrorless-CANON-canon eos m100.jpg','Canon EOS M100','2018-05-28 00:00:00',30),('c0046',14990000,4,2,'X-E3 là mẫu máy ảnh không gương lật có kích thước khá nhỏ và nhẹ (11,6 x 66,9 x 40,4mm, 339g). Cấu trúc của X-E3 được nâng cấp so với X-E2 nhờ sử dụng nhôm ở mặt trước và đỉnh máy, tăng cường sự chắc chắn, bền bỉ và cảm giác tin cậy khi sử dụng.','japan','mirrorless','Canon','mirrorless-CANON-canon eos m6.jpg','Canon EOS M6','2018-06-17 00:00:00',28),('c0047',24990000,0,0,'Mặc dù thuộc phân khúc máy ảnh giá rẻ, nhưng cũng giống những mẫu máy đắt tiền của Fujifilm, mặt trước của X-H1 được bố trí lẫy gạt các chế độ lấy nét M/C/S (M: bằng tay, C: liên tục, S: một shot). Đây là một cải tiến giúp người dùng dễ dàng chuyển nhanh chế độ lấy nét khi chụp ảnh. Ở mặt sau máy là màn hình cảm ứng 3 inch có khả năng lật 180 độ thích hợp cho việc selfie','japan','mirrorless','Fujifilm','mirrorless-FUJIFILM-fujifilm x-e3.jpg','Fujifilm X-E3','2018-06-08 00:00:00',30),('c0048',27990000,0,0,'X-T2 là chiếc máy ảnh gọn nhẹ và thân thiện với người dùng, thích hợp đem theo hàng ngày. Những thay đổi trên X-T2 không làm mất đi dáng vẻ hoài cổ của Fujifilm. Hai phiên bản màu hồng và nâu là những lựa chọn rất phù hợp với người phụ nữ.','japan','mirrorless','Fujifilm','mirrorless-FUJIFILM-fujifilm x-h1.jpg','Fujifilm X-H1','2018-06-14 00:00:00',30),('c0049',42990000,15,12,'Panasoni q80 là một máy ảnh cầu nối (bridge camera) có chất lượng thiết kế và hiệu năng khá tốt so với các máy ảnh cùng loại. Máy cho bạn cảm giác đang sử dụng một máy ảnh DSLR chuyên nghiệp, ống kính zoom quang 16x khá linh hoạt sẽ giúp bạn không phải bỏ cả núi tiền cho việc mua ống kính.','japan','mirrorless','Fujifilm','mirrorless-FUJIFILM-fujifilm x-t2.jpg','Fujifilm X-T2','2018-06-20 00:00:00',18),('c0050',12490000,1,0,'Máy ảnh Panasonic Lumix Q7 là một máy ảnh Micro Four Thirds không gương lật mới nhất của Panasonic mang nét thiết kế retro hầu như không thay đổi trên các phiên bản gần đây của mình như GF6, GF7 và GF8, tức là nó vẫn giữ nguyên với kiểu thiết kế nhỏ gọn và thời trang, không kính ngắm tích hợp, sở hữu màn hình lật 180°, nhưng riêng đến chiếc Q7 này, nó đã được nâng cấp khá mạnh về phần cứng với những cải tiến hơn như khả năng quay 4K/30fps, chụp liên tục 30fps với độ phân giải 4K và nhiều tính năng vui vẻ khác.','japan','mirrorless','Panasonic','mirrorless-PANASONIC-panasonic g80.jpg','Panasonic G80','2018-06-08 00:00:00',30),('c0051',12290000,0,0,'Máy ảnh Panasonic Lumix Q7 là một máy ảnh Micro Four Thirds không gương lật mới nhất của Panasonic mang nét thiết kế retro hầu như không thay đổi trên các phiên bản gần đây của mình như GF6, GF7 và GF8, tức là nó vẫn giữ nguyên với kiểu thiết kế nhỏ gọn và thời trang, không kính ngắm tích hợp, sở hữu màn hình lật 180°, nhưng riêng đến chiếc Q7 này, nó đã được nâng cấp khá mạnh về phần cứng với những cải tiến hơn như khả năng quay 4K/30fps, chụp liên tục 30fps với độ phân giải 4K và nhiều tính năng vui vẻ khác.','japan','mirrorless','Panasonic','mirrorless-PANASONIC-panasonic lumix g7.jpg','Panasonic G7','2018-06-16 00:00:00',30),('c0052',43490000,0,0,'Chiếc Lumix  được nhiều người chú ý vì dòng máy Mirrorless cao cấp của hãng này từng được đánh giá cao cả về thiết kế và tính năng. Máy có kích cỡ cảm biến nhỏ nhưng chụp tốt trong điều kiện thiếu sáng, khẩu độ rộng, tốc độ chụp nhanh...','japan','mirrorless','Panasonic','mirrorless-PANASONIC-panasonic lumix gh5.jpg','Panasonic Lumix GH5','2018-05-03 00:00:00',30),('c0053',36490000,0,0,'Sony A6500 là chiếc máy ảnh cao cấp nhất trong dòng mirrorless cảm biến Crop của Sony. Đây không phải sản phẩm thay thế cho A6300 và Sony sẽ bán 2 chiếc máy này song song với nhau. A6500 có cảm biến APS-C 24MP, bộ xử lý ảnh được nâng cấp cho tốc độ hoạt động nhanh hơn và đặc biệt có thể chống rung 5 trục như đàn anh Sony A7R II hay A7 II. Ngoài ra Sony A6500 còn có nhiều đổi mới để phục vụ những tay máy chuyên nghiệp tốt hơn như bộ nhớ đệm lớn hay màn hình cảm ứng.','china','mirrorless','Sony','mirrorless-SONY-sony a6500.jpg','Sony A6500','2018-05-11 00:00:00',30),('c0054',72490000,0,0,'Nâng cấp quan trọng nhất của A7r III so với thế hệ cũ là tốc độ chụp và tốc độ xử lý ảnh. Chip BionzX của A7r III nhanh hơn thế hệ cũ 1.8 lần nhờ bổ sung chip ngoại vi front-end LSI tăng khả năng đọc/ghi dữ liệu lớn. Từ đó ISO hữu dụng tối đa cũng tăng lên 32.000 và mở rộng 102.400, dải dynamic range lên 15-stop.','america','mirrorless','Sony','mirrorless-SONY-sony a7r iii.jpg','Sony A7R III','2018-05-12 00:00:00',30),('c0055',89490000,2,0,'Thiết kế thân máy vẫn gọn gàng như dòng A7, Sony A9 mang trong mình một phần cứng rất mạnh và khả năng sử dụng dễ dàng, giúp cho người dùng nghiệp dư mới cầm vô máy vẫn có thể nắm bắt được những khoảnh khắc nhanh chóng nhờ khả năng chụp ảnh 20 fps với màn trập điện tử. Tất nhiên đây mới chỉ là sản phẩm mở đầu mà họ mong muốn đối đầu cùng các đối thủ DSLR như Canon EOS-1D X Mark II hay Nikon D5 nên cũng rất khó để làm hài lòng những người dùng chuyên nghiệp.','america','mirrorless','Sony','mirrorless-SONY-sony a9.jpeg','Sony A9','2018-06-17 00:00:00',30);
/*!40000 ALTER TABLE `sanpham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) unsigned NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('853apKzxJFmgtio5UX7pcBBptGTOUuX7',1530301742,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isAdmin\":true,\"isLogged\":true,\"user\":{\"email\":\"admin@gmail.com\",\"matkhau\":\"f5bb0c8de146c67b44babbf4e6584cc0\",\"hoten\":\"admin\",\"sdt\":null,\"admin\":1},\"cart\":[]}'),('lUaTTIJrPTNdQWeF-WGCDz4XuUnkW_M7',1530333617,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isAdmin\":false,\"isLogged\":false,\"user\":null,\"cart\":[]}'),('nWdOh5fLIit6ZfAXOHKiPVpKk3bE49wh',1530339776,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isLogged\":false,\"user\":null,\"cart\":[],\"isAdmin\":false}'),('xb_whVP56a_gXrhrS7yE2YrqZOmB6bf5',1530273794,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isLogged\":false,\"user\":null,\"cart\":[],\"isAdmin\":false}');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taikhoan`
--

DROP TABLE IF EXISTS `taikhoan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `taikhoan` (
  `email` varchar(50) NOT NULL,
  `matkhau` varchar(128) DEFAULT NULL,
  `hoten` varchar(50) DEFAULT NULL,
  `sdt` char(15) DEFAULT NULL,
  `admin` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taikhoan`
--

LOCK TABLES `taikhoan` WRITE;
/*!40000 ALTER TABLE `taikhoan` DISABLE KEYS */;
INSERT INTO `taikhoan` VALUES ('admin@gmail.com','f5bb0c8de146c67b44babbf4e6584cc0','admin',NULL,0),('vannghia@gmail.com','f5bb0c8de146c67b44babbf4e6584cc0','vannghia',NULL,0);
/*!40000 ALTER TABLE `taikhoan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thuonghieu`
--

DROP TABLE IF EXISTS `thuonghieu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `thuonghieu` (
  `nhasanxuat` varchar(20) NOT NULL,
  `quocgia` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`nhasanxuat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thuonghieu`
--

LOCK TABLES `thuonghieu` WRITE;
/*!40000 ALTER TABLE `thuonghieu` DISABLE KEYS */;
INSERT INTO `thuonghieu` VALUES ('Canon','Nhật Bản'),('Fujifilm','Nhật Bản'),('GoPro','Mỹ'),('Kodak','Mỹ'),('LG','Hàn Quốc'),('Nikon','Nhật Bản'),('Panasonic','Nhật Bản'),('Ricoh','Mỹ'),('Samsung','Hàn Quốc'),('Sony','Nhật bản');
/*!40000 ALTER TABLE `thuonghieu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'camera_shop'
--

--
-- Dumping routines for database 'camera_shop'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-29 13:45:26
