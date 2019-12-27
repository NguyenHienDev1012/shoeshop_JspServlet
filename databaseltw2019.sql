CREATE DATABASE ltw;
use ltw;
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`(
  `user_id` int(11) NOT NULL auto_increment,
  `username` varchar(255) collate utf8_unicode_ci NOT NULL,
  `email` varchar(255) collate utf8_unicode_ci default NULL,
   `password` varchar(255) collate utf8_unicode_ci NOT NULL,
   `role` int collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`user_id`)
);

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`(
`id`  int(11)   NOT NULL auto_increment,
`name`  varchar(255) collate utf8_unicode_ci default NULL,
`description` varchar(255) collate utf8_unicode_ci default NULL,
PRIMARY KEY(`id`)
);

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
`id` int (11) NOT NULL auto_increment,
`name` varchar(255) collate utf8_unicode_ci NOT NULL, 
`images` varchar(255) collate utf8_unicode_ci default NULL,
`price` double collate utf8_unicode_ci default NULL,
`sale` int (15) collate utf8_unicode_ci  default NULL,
`quantity` int (20) collate utf8_unicode_ci  default NULL,
`description` text collate utf8_unicode_ci  default NULL,
`tymNumber` int (20) collate utf8_unicode_ci  default NULL,
`id_category` int (20) collate utf8_unicode_ci  default NULL,
PRIMARY KEY(`id`),foreign key (`id_category`) references category(`id`)
);



DROP TABLE IF EXISTS `product_user_tym`;
create TABLE `product_user_tym`(
`user_id_tym` int(11) collate utf8_unicode_ci NOT NULL ,
`product_id_tym` int(11) collate utf8_unicode_ci NOT NULL,
PRIMary key(`user_id_tym`,`product_id_tym`), foreign key(`user_id_tym`) references user(`user_id`),
foreign key(`product_id_tym`) references product(`id`));

DROP TABLE IF EXISTS `comment`;
create table `comment`(
`id_comment` int(11) collate utf8_unicode_ci NOT NULL auto_increment,
 `name`  varchar(255) collate utf8_unicode_ci default NULL,
 `content` text collate utf8_unicode_ci default NULL,
 `id_product`   int (11) NOT NULL,
  primary key(`id_comment`),
 foreign key (`id_product`) references product(`id`)
);
INSERT INTO `comment` values ('1','tuan', 'hay','9');

DROP TABLE IF EXISTS `replycomment`;
create table `replycomment`(
`id_reply_comment` int(11) collate utf8_unicode_ci NOT NULL auto_increment,
`id_comment` int(11) collate utf8_unicode_ci NOT NULL,
 `name`  varchar(255) collate utf8_unicode_ci default NULL,
 `content` text collate utf8_unicode_ci default NULL,
  primary key(`id_reply_comment`)
) ;

DROP TABLE IF EXISTS `bill`;
create table `bill`(
`id_bill` int(11) collate utf8_unicode_ci NOT NULL,
`name_user` varchar(255) collate utf8_unicode_ci NULL,
`numberphone` varchar(255) collate utf8_unicode_ci NULL,
`email` varchar(255) collate utf8_unicode_ci NULL,
`address` varchar(255) collate utf8_unicode_ci NULL,
`note` text collate utf8_unicode_ci NULL,
`payment` int(11) collate utf8_unicode_ci NULL,
primary key(`id_bill`)) ;


DROP TABLE IF EXISTS `bill_details`;
create table `bill_details`(
`id_bill` int(11) collate utf8_unicode_ci NOT NULL,
`id_product` int(11) collate utf8_unicode_ci NOT NULL,
`quantity_product` int(11) collate utf8_unicode_ci NOT NULL,
`name_product` varchar(255) collate utf8_unicode_ci NOT NULL,
`image_product` varchar(255) collate utf8_unicode_ci NOT NULL,
`price_product` double collate utf8_unicode_ci NOT NULL,
primary key(`id_bill`,`id_product`));

INSERT INTO `category` VALUES ('1','Adidas','Giày Adidas');
INSERT INTO `category` VALUES ('2','Converse','Giày Converse');
INSERT INTO `category` VALUES ('3','Vans','Giày Vans');


INSERT INTO `product` VALUES('1','Adidas Originals - White & Green','adidas-stan-smith-xanh-replica.jpg','150000' ,null,'10','Adidas Stan Smith Originals Green & White uôn là mẫu giày được giới trẻ săn đón nhiều nhất và chưa bao giờ có dấu hiệu hạ nhiệt hay lỗi mốt. Đây không phải là dòng sản phẩm chuyên dùng trong thể thao, mà chủ yếu được sử dụng trong đời sống hàng ngày.
Nhưng với kiểu thiết kế của giày Sneaker nó vẫn mang lại cho bạn sự thoải mái, dễ chịu khi sử dụng, bạn có thể kết hợp đi chơi, dạo phố, đi học,… thích hợp cho cả nam lẫn nữ.
Đặc biệt dễ dàng phối với các kiểu trang phục, phong cách thời trang khác nhau. Nên rất được các bạn trẻ lựa chọn sắm ngay một em trong bộ sưu tập giày dép của mình. ','6','1');
INSERT INTO `product` VALUES('2','Adidas Yeezy 350 Beluga 1.0','adidas-yeezy-350v2-beluga-1-replica.jpeg','300000',null,'10','Màu xanh của đôi Yeezy Beluga 350 2.0, là một trong những đôi được lấy cảm hứng từ quân đội Mỹ. Cho đến nay, thiết kế Yeezy Beluga  được các bạn nam yêu thích các họa tiết quân đội yêu thích và mức giá không quá chênh lệch so với ban đầu.','6','1');
INSERT INTO `product` VALUES('3','Adidas Yeezy 350 Beluga 2.0','adidas-yeezy-350-v2-beluga-2-replica.jpeg','350000',null,'10','Yeezy 350 V2 Beluga 2.0 sở hữu màu xám vốn đã chinh phục người yêu sneaker từ dòng Yeezy Beluga trước đó, được tái hiện lại trên lớp vải Primeknit dệt họa tiết tinh tế hơn. Cụ thể, lớp Primeknit xám được dệt khít hơn, cùng với dãy "SPLY - 350" được thêu màu cam đậm hơn, cả hai tạo ra hiệu ứng thị giác vô cùng thú vị. Yeezy Boost 350 V2 Beluga 2.0 được phát hành vào tháng 11/2017 và nhanh chóng được giới săn giày sneaker đẩy giá lên ít nhất gấp đôi!','6','1');
INSERT INTO `product` VALUES('4','Adidas Yeezy 350 2.0 Bluetint','adidas-yeezy-350-v2-bluetint-replica.jpeg','1000000',null,'10','Mẫu giày Yeezy 350 V2 Blue Tint được giới thiệu vào dịp giáng sinh 2017, thời điểm đó, adidas x Kanye lần lượt giới thiệu cứ mỗi tháng một mẫu Yeezy Boost 350 V2, liên tục từ tháng 06/2017 đến tháng 12/2017. Tưởng chừng như Yeezy Boost 350 V2 Blue Tint khó mà cạnh tranh nổi với các anh em nhà Yeezy Boost 350 V2, chưa nói đến các đối thủ giày sneaker khác, nhưng thực đế đầy ngạc nhiên, Yeezy Boost 350 V2 Blue Tint hết vèo trong tuần lễ Giáng sinh và giá Yeezy Boost 350 V2 Blue Tint hiện giờ không dưới 10 triệu đồng.','6','1');
INSERT INTO `product` VALUES('5','Adidas Yeezy 350 2.0 Clay','adidas-yeezy-350-v2-clay-replica.jpg','450000',null,'10','Trong thế giới giày của nhà Adidas có rất nhiều siêu phẩm tuyệt vời hút khách, làm điên đảo thị trường. Sức sáng tạo, sự chăm chút và đầu tư một cách bài bản đã khiến cho những đứa con tinh thần mà họ sáng tạo nên luôn có sức sống vượt thời gian. Trong số đó, không thể không điểm danh mẫu giày Adidas Yeezy 350 V2 “Clay” với những phá cách trong thiết kế và phối màu khiến bất cứ tín đồ nào khi được chiêm ngưỡng cũng phải mê mẩn. Còn bạn thế nào, bạn đã có thông tin gì về dòng sản phẩm này hay chưa? Hãy tham khảo thông tin mà chúng tôi chia sẽ dưới đây để thật sự tự tin khi chi tiền nhé!','6','1');
INSERT INTO `product` VALUES('6','Adidas Yeezy 350 2.0 Glow','adidas-yeezy-350-v2-glow-replica.jpg','2000000',null,'10','Nhãn hàng Adidas vốn được biết đến là một thương hiệu giày thể thao cao cấp hàng đầu thế giới. Họ đã từng khiến cả thế giới phải kinh ngạc khi không ngừng tung ra thị trường những đứa con đình đám, có sức mê hoặc lòng người. Bộ sưu tập ấy ngày càng dày thêm nhưng sẽ vô cùng thiếu sót nếu không điền tên đôi giày Adidas Yeezy boost 350 V2 Glow. Bạn đã biết thông tin gì về dòng sản phẩm này hay chưa? Hãy tham khảo những chia sẽ dưới đây của chúng tôi nhé!','6','1');
INSERT INTO `product` VALUES('7','Adidas Yeezy 350 2.0 Hyperspace','adidas-yeezy-350-v2-hyperspace-replica.jpg','190000',null,'10','Like newer 350 V2 models, the adidas Yeezy Boost 350 V2 Lundmark sports a subtle summer color with the back heel tab removed. Replacing the SPLY-350 boost stripe that was traditionally found on the original 350s is a transparent stripe that reveals a more cream colored inner. A boost midsole is covered by a light tan rubber outsole that features a pink middle stripe. Adding to the exclusivity of these is the fact this colorway is a North and Latin America exclusive.','6','1');
INSERT INTO `product` VALUES('8','Adidas Yeezy 350 2.0 Static','adidas-yeezy-350-v2-static-replica.jpeg','290000',null,'10','Nhắc đến nền văn hóa sát mặt đất không thể thiếu tên nhãn hàng lừng danh số một thế giới Adidas. Những đứa con tinh thần của họ luôn được chăm sóc một cách tỉ mẫn nhất để có thể chiều lòng bất cứ vị khách khó tính nào. Đặc biệt khi ông trùm này hợp tác với nhà thiết kế hàng đầu thế giới Kanye West và cho trình làng mẫu giày Adidas Yeezy Boost 350 V2 Static. Người hâm mộ lại một lần nữa có cơ hội được sở hữu đôi giày cao cấp và danh giá như thế. Hãy cũng chúng tôi chiêm ngưỡng vẻ đẹp của dòng sản phẩm này bạn nhé!','6','1');
INSERT INTO `product` VALUES('9','Adidas Yeezy 350 2.0 Synth Reflective','adidas-yeezy-350-v2-synth-reflective-replica.jpg','360000',null,'10','Nhắc đến nhãn hàng Adidas không thể không nhắc đến bộ sưu tập giày Yeezy boost 350 V2. Đây chính là bộ sản phẩm đánh dấu sự phát triển, vươn xa, nâng tầm ảnh hưởng của ông trùm này ra toàn thế giới. Gần nhất phải kể đến sự ra mắt của đôi giày Adidas Yeezy boost 350 V2 LUNDMARK khiến cả cộng đồng giày phải xôn xao. Còn bạn thì sao, có cảm thấy tò mò hay muốn sở hữu dòng sản phẩm này hay không? Chúng tôi sẽ cung cấp thêm những thông tin cần thiết cho bạn nhé!
','6','1');
INSERT INTO `product` VALUES('10','Adidas Yeezy 350 2.0 True Form','adidas-yeezy-350-v2-true-form-replica.jpg','345000',null,'10','Nói đến thương hiệu Adidas là nói đến một nhãn hiệu hàng đầu trong lĩnh vực thời trang giày cao cấp. Trong số rất nhiều siêu phẩm đã trình làng, giày Adidas Yeezy boost 350 V2 True Form luôn được coi là đối thủ đáng gờm với bất kỳ sản phẩm nào trên thị trường đến từ những thương hiệu hàng đầu khác. Bạn đã biết gì về mẫu giày này, hãy tham khảo thông tin được chúng tôi chia sẽ dưới đây nhé!','6','1');

 -- converse
INSERT INTO `product` VALUES('11','Converse Đen Cổ Thấp Unisex','Converse-black-low-00.jpg','3000000',null,'10','Vẫn giữ nguyên thiết kế giày đặc trưng của đế chế Converse, Chuck Taylor 1970s mang trong mình một dấu ấn của thời trang cố điển. Với những chi tiết giày đảm bảo đúng chất vintage, đồng thời tạo được chất lượng tốt hơn cho người mang. Trong đó, những điểm mới trên đôi giày Chuck 1970s được các nhà thiết kế đưa vào mà bạn có thể nhận diện ngay:
Phần đế giày có màu ngà hơn so với các thiết kế trước, cao hơn và được phủ một lớp bóng để hạn chế bám bẩn và dễ dàng vệ sinh.
Lớp vải Canvas phần thân giày được dệt dày hơn, có lớp lót đệm giúp giày cứng cáp hơn, không còn tình trạng ọp ẹp sau một thời gian sử dụng như các mẫu cũ. Đệm chân Ortholite ® êm ái giúp giảm khả năng trơn trượt, làm giảm lực ma sát giữa ngón - gót chân với giày.
Form giày được thiết kế chuẩn hơn với gót giày và mũi giày ôm sát vào chân nhưng không gây cảm giác khó chịu cho người mang. Đường viền đen quanh đế nổi lên trên nền trắng ngà tạo sự bắt mắt, điểm nhấn cho đôi giày. 
Đường kim mũi chỉ quanh thân giày được gia công tỉ mỉ tạo nên sự tinh tế, nổi bật cho đôi giày.
Logo sau gót giày được thiết kế lại với font chữ của những năm 1970, chữ “Converse All Star Chuck Taylor” trắng nằm trên nền đen tạo nên sự khác biết so với các thiết kế trước.','6','2');
INSERT INTO `product` VALUES('12','Converse Đen Cổ Cao Buzz','Converse-black-hi-00.jpg','850000',null,'10','Vẫn giữ nguyên thiết kế giày đặc trưng của đế chế Converse, Chuck Taylor 1970s mang trong mình một dấu ấn của thời trang cố điển. Với những chi tiết giày đảm bảo đúng chất vintage, đồng thời tạo được chất lượng tốt hơn cho người mang. Trong đó, những điểm mới trên đôi giày Chuck 1970s được các nhà thiết kế đưa vào mà bạn có thể nhận diện ngay:
Phần đế giày có màu ngà hơn so với các thiết kế trước, cao hơn và được phủ một lớp bóng để hạn chế bám bẩn và dễ dàng vệ sinh.
Lớp vải Canvas phần thân giày được dệt dày hơn, có lớp lót đệm giúp giày cứng cáp hơn, không còn tình trạng ọp ẹp sau một thời gian sử dụng như các mẫu cũ. Đệm chân Ortholite ® êm ái giúp giảm khả năng trơn trượt, làm giảm lực ma sát giữa ngón - gót chân với giày.
Form giày được thiết kế chuẩn hơn với gót giày và mũi giày ôm sát vào chân nhưng không gây cảm giác khó chịu cho người mang. Đường viền đen quanh đế nổi lên trên nền trắng ngà tạo sự bắt mắt, điểm nhấn cho đôi giày. 
Đường kim mũi chỉ quanh thân giày được gia công tỉ mỉ tạo nên sự tinh tế, nổi bật cho đôi giày.
Logo sau gót giày được thiết kế lại với font chữ của những năm 1970, chữ “Converse All Star Chuck Taylor” trắng nằm trên nền đen tạo nên sự khác biết so với các thiết kế trước.','6','2');
INSERT INTO `product` VALUES('13','Converse Xám Cổ Thấp Nice Rock','Converse-grey-low-00.jpg','530000',null,'10','Vẫn giữ nguyên thiết kế giày đặc trưng của đế chế Converse, Chuck Taylor 1970s mang trong mình một dấu ấn của thời trang cố điển. Với những chi tiết giày đảm bảo đúng chất vintage, đồng thời tạo được chất lượng tốt hơn cho người mang. Trong đó, những điểm mới trên đôi giày Chuck 1970s được các nhà thiết kế đưa vào mà bạn có thể nhận diện ngay:
Phần đế giày có màu ngà hơn so với các thiết kế trước, cao hơn và được phủ một lớp bóng để hạn chế bám bẩn và dễ dàng vệ sinh.
Lớp vải Canvas phần thân giày được dệt dày hơn, có lớp lót đệm giúp giày cứng cáp hơn, không còn tình trạng ọp ẹp sau một thời gian sử dụng như các mẫu cũ. Đệm chân Ortholite ® êm ái giúp giảm khả năng trơn trượt, làm giảm lực ma sát giữa ngón - gót chân với giày.
Form giày được thiết kế chuẩn hơn với gót giày và mũi giày ôm sát vào chân nhưng không gây cảm giác khó chịu cho người mang. Đường viền đen quanh đế nổi lên trên nền trắng ngà tạo sự bắt mắt, điểm nhấn cho đôi giày. 
Đường kim mũi chỉ quanh thân giày được gia công tỉ mỉ tạo nên sự tinh tế, nổi bật cho đôi giày.
Logo sau gót giày được thiết kế lại với font chữ của những năm 1970, chữ “Converse All Star Chuck Taylor” trắng nằm trên nền đen tạo nên sự khác biết so với các thiết kế trước.','6','2');
INSERT INTO `product` VALUES('14','Converse Xám Cổ Cao haizaty','Converse-grey-hi-00.jpg','670000',null,'10','Vẫn giữ nguyên thiết kế giày đặc trưng của đế chế Converse, Chuck Taylor 1970s mang trong mình một dấu ấn của thời trang cố điển. Với những chi tiết giày đảm bảo đúng chất vintage, đồng thời tạo được chất lượng tốt hơn cho người mang. Trong đó, những điểm mới trên đôi giày Chuck 1970s được các nhà thiết kế đưa vào mà bạn có thể nhận diện ngay:
Phần đế giày có màu ngà hơn so với các thiết kế trước, cao hơn và được phủ một lớp bóng để hạn chế bám bẩn và dễ dàng vệ sinh.
Lớp vải Canvas phần thân giày được dệt dày hơn, có lớp lót đệm giúp giày cứng cáp hơn, không còn tình trạng ọp ẹp sau một thời gian sử dụng như các mẫu cũ. Đệm chân Ortholite ® êm ái giúp giảm khả năng trơn trượt, làm giảm lực ma sát giữa ngón - gót chân với giày.
Form giày được thiết kế chuẩn hơn với gót giày và mũi giày ôm sát vào chân nhưng không gây cảm giác khó chịu cho người mang. Đường viền đen quanh đế nổi lên trên nền trắng ngà tạo sự bắt mắt, điểm nhấn cho đôi giày. 
Đường kim mũi chỉ quanh thân giày được gia công tỉ mỉ tạo nên sự tinh tế, nổi bật cho đôi giày.
Logo sau gót giày được thiết kế lại với font chữ của những năm 1970, chữ “Converse All Star Chuck Taylor” trắng nằm trên nền đen tạo nên sự khác biết so với các thiết kế trước.','6','2');
INSERT INTO `product` VALUES('15','Converse Xanh Navy Cổ Thấp selenta','Converse-navy-low-00.jpg','700000',null,'10','Vẫn giữ nguyên thiết kế giày đặc trưng của đế chế Converse, Chuck Taylor 1970s mang trong mình một dấu ấn của thời trang cố điển. Với những chi tiết giày đảm bảo đúng chất vintage, đồng thời tạo được chất lượng tốt hơn cho người mang. Trong đó, những điểm mới trên đôi giày Chuck 1970s được các nhà thiết kế đưa vào mà bạn có thể nhận diện ngay:
Phần đế giày có màu ngà hơn so với các thiết kế trước, cao hơn và được phủ một lớp bóng để hạn chế bám bẩn và dễ dàng vệ sinh.
Lớp vải Canvas phần thân giày được dệt dày hơn, có lớp lót đệm giúp giày cứng cáp hơn, không còn tình trạng ọp ẹp sau một thời gian sử dụng như các mẫu cũ. Đệm chân Ortholite ® êm ái giúp giảm khả năng trơn trượt, làm giảm lực ma sát giữa ngón - gót chân với giày.
Form giày được thiết kế chuẩn hơn với gót giày và mũi giày ôm sát vào chân nhưng không gây cảm giác khó chịu cho người mang. Đường viền đen quanh đế nổi lên trên nền trắng ngà tạo sự bắt mắt, điểm nhấn cho đôi giày. 
Đường kim mũi chỉ quanh thân giày được gia công tỉ mỉ tạo nên sự tinh tế, nổi bật cho đôi giày.
Logo sau gót giày được thiết kế lại với font chữ của những năm 1970, chữ “Converse All Star Chuck Taylor” trắng nằm trên nền đen tạo nên sự khác biết so với các thiết kế trước.','6','2');
INSERT INTO `product` VALUES('16','Converse Xanh Navy Cổ Cao Aviana' ,'Converse-navy-hi-00.jpg','410000',null,'10','Vẫn giữ nguyên thiết kế giày đặc trưng của đế chế Converse, Chuck Taylor 1970s mang trong mình một dấu ấn của thời trang cố điển. Với những chi tiết giày đảm bảo đúng chất vintage, đồng thời tạo được chất lượng tốt hơn cho người mang. Trong đó, những điểm mới trên đôi giày Chuck 1970s được các nhà thiết kế đưa vào mà bạn có thể nhận diện ngay:
Phần đế giày có màu ngà hơn so với các thiết kế trước, cao hơn và được phủ một lớp bóng để hạn chế bám bẩn và dễ dàng vệ sinh.
Lớp vải Canvas phần thân giày được dệt dày hơn, có lớp lót đệm giúp giày cứng cáp hơn, không còn tình trạng ọp ẹp sau một thời gian sử dụng như các mẫu cũ. Đệm chân Ortholite ® êm ái giúp giảm khả năng trơn trượt, làm giảm lực ma sát giữa ngón - gót chân với giày.
Form giày được thiết kế chuẩn hơn với gót giày và mũi giày ôm sát vào chân nhưng không gây cảm giác khó chịu cho người mang. Đường viền đen quanh đế nổi lên trên nền trắng ngà tạo sự bắt mắt, điểm nhấn cho đôi giày. 
Đường kim mũi chỉ quanh thân giày được gia công tỉ mỉ tạo nên sự tinh tế, nổi bật cho đôi giày.
Logo sau gót giày được thiết kế lại với font chữ của những năm 1970, chữ “Converse All Star Chuck Taylor” trắng nằm trên nền đen tạo nên sự khác biết so với các thiết kế trước.','6','2');
INSERT INTO `product` VALUES('17','Converse Đỏ Cổ Thấp Alatanm','Converse-red-low-00.jpg','315000',null,'10','Vẫn giữ nguyên thiết kế giày đặc trưng của đế chế Converse, Chuck Taylor 1970s mang trong mình một dấu ấn của thời trang cố điển. Với những chi tiết giày đảm bảo đúng chất vintage, đồng thời tạo được chất lượng tốt hơn cho người mang. Trong đó, những điểm mới trên đôi giày Chuck 1970s được các nhà thiết kế đưa vào mà bạn có thể nhận diện ngay:
Phần đế giày có màu ngà hơn so với các thiết kế trước, cao hơn và được phủ một lớp bóng để hạn chế bám bẩn và dễ dàng vệ sinh.
Lớp vải Canvas phần thân giày được dệt dày hơn, có lớp lót đệm giúp giày cứng cáp hơn, không còn tình trạng ọp ẹp sau một thời gian sử dụng như các mẫu cũ. Đệm chân Ortholite ® êm ái giúp giảm khả năng trơn trượt, làm giảm lực ma sát giữa ngón - gót chân với giày.
Form giày được thiết kế chuẩn hơn với gót giày và mũi giày ôm sát vào chân nhưng không gây cảm giác khó chịu cho người mang. Đường viền đen quanh đế nổi lên trên nền trắng ngà tạo sự bắt mắt, điểm nhấn cho đôi giày. 
Đường kim mũi chỉ quanh thân giày được gia công tỉ mỉ tạo nên sự tinh tế, nổi bật cho đôi giày.
Logo sau gót giày được thiết kế lại với font chữ của những năm 1970, chữ “Converse All Star Chuck Taylor” trắng nằm trên nền đen tạo nên sự khác biết so với các thiết kế trước.','6','2');
INSERT INTO `product` VALUES('18','Converse Đỏ Cổ Cao sekentun','Converse-red-hi-00.jpg','600000',null,'10','Vẫn giữ nguyên thiết kế giày đặc trưng của đế chế Converse, Chuck Taylor 1970s mang trong mình một dấu ấn của thời trang cố điển. Với những chi tiết giày đảm bảo đúng chất vintage, đồng thời tạo được chất lượng tốt hơn cho người mang. Trong đó, những điểm mới trên đôi giày Chuck 1970s được các nhà thiết kế đưa vào mà bạn có thể nhận diện ngay:
Phần đế giày có màu ngà hơn so với các thiết kế trước, cao hơn và được phủ một lớp bóng để hạn chế bám bẩn và dễ dàng vệ sinh.
Lớp vải Canvas phần thân giày được dệt dày hơn, có lớp lót đệm giúp giày cứng cáp hơn, không còn tình trạng ọp ẹp sau một thời gian sử dụng như các mẫu cũ. Đệm chân Ortholite ® êm ái giúp giảm khả năng trơn trượt, làm giảm lực ma sát giữa ngón - gót chân với giày.
Form giày được thiết kế chuẩn hơn với gót giày và mũi giày ôm sát vào chân nhưng không gây cảm giác khó chịu cho người mang. Đường viền đen quanh đế nổi lên trên nền trắng ngà tạo sự bắt mắt, điểm nhấn cho đôi giày. 
Đường kim mũi chỉ quanh thân giày được gia công tỉ mỉ tạo nên sự tinh tế, nổi bật cho đôi giày.
Logo sau gót giày được thiết kế lại với font chữ của những năm 1970, chữ “Converse All Star Chuck Taylor” trắng nằm trên nền đen tạo nên sự khác biết so với các thiết kế trước.','6','2');
INSERT INTO `product` VALUES('19','Converse Trắng Cổ Thấp Insuk','Converse-white-low-00.jpg','1050000',null,'10','Vẫn giữ nguyên thiết kế giày đặc trưng của đế chế Converse, Chuck Taylor 1970s mang trong mình một dấu ấn của thời trang cố điển. Với những chi tiết giày đảm bảo đúng chất vintage, đồng thời tạo được chất lượng tốt hơn cho người mang. Trong đó, những điểm mới trên đôi giày Chuck 1970s được các nhà thiết kế đưa vào mà bạn có thể nhận diện ngay:
Phần đế giày có màu ngà hơn so với các thiết kế trước, cao hơn và được phủ một lớp bóng để hạn chế bám bẩn và dễ dàng vệ sinh.
Lớp vải Canvas phần thân giày được dệt dày hơn, có lớp lót đệm giúp giày cứng cáp hơn, không còn tình trạng ọp ẹp sau một thời gian sử dụng như các mẫu cũ. Đệm chân Ortholite ® êm ái giúp giảm khả năng trơn trượt, làm giảm lực ma sát giữa ngón - gót chân với giày.
Form giày được thiết kế chuẩn hơn với gót giày và mũi giày ôm sát vào chân nhưng không gây cảm giác khó chịu cho người mang. Đường viền đen quanh đế nổi lên trên nền trắng ngà tạo sự bắt mắt, điểm nhấn cho đôi giày. 
Đường kim mũi chỉ quanh thân giày được gia công tỉ mỉ tạo nên sự tinh tế, nổi bật cho đôi giày.
Logo sau gót giày được thiết kế lại với font chữ của những năm 1970, chữ “Converse All Star Chuck Taylor” trắng nằm trên nền đen tạo nên sự khác biết so với các thiết kế trước.','6','2');
INSERT INTO `product` VALUES('20','Converse Trắng Cổ Cao Natak','Converse-white-hi-00.jpg','2000000',null,'10','Vẫn giữ nguyên thiết kế giày đặc trưng của đế chế Converse, Chuck Taylor 1970s mang trong mình một dấu ấn của thời trang cố điển. Với những chi tiết giày đảm bảo đúng chất vintage, đồng thời tạo được chất lượng tốt hơn cho người mang. Trong đó, những điểm mới trên đôi giày Chuck 1970s được các nhà thiết kế đưa vào mà bạn có thể nhận diện ngay:
Phần đế giày có màu ngà hơn so với các thiết kế trước, cao hơn và được phủ một lớp bóng để hạn chế bám bẩn và dễ dàng vệ sinh.
Lớp vải Canvas phần thân giày được dệt dày hơn, có lớp lót đệm giúp giày cứng cáp hơn, không còn tình trạng ọp ẹp sau một thời gian sử dụng như các mẫu cũ. Đệm chân Ortholite ® êm ái giúp giảm khả năng trơn trượt, làm giảm lực ma sát giữa ngón - gót chân với giày.
Form giày được thiết kế chuẩn hơn với gót giày và mũi giày ôm sát vào chân nhưng không gây cảm giác khó chịu cho người mang. Đường viền đen quanh đế nổi lên trên nền trắng ngà tạo sự bắt mắt, điểm nhấn cho đôi giày. 
Đường kim mũi chỉ quanh thân giày được gia công tỉ mỉ tạo nên sự tinh tế, nổi bật cho đôi giày.
Logo sau gót giày được thiết kế lại với font chữ của những năm 1970, chữ “Converse All Star Chuck Taylor” trắng nằm trên nền đen tạo nên sự khác biết so với các thiết kế trước.','6','2');

-- vans
INSERT INTO `product` VALUES('22','Vans Sk8-Hi Black Bunlkn','canvas-old-skool-black-hi.png','200000',null,'10','VANS SK8 xuất hiện lần đầu năm 1978 với tên gọi "Style 38" với thiết kế cao qua mắt cá chân, bảo vệ phần quan trọng nơi mà các vận động viên trượt ván lạm dụng nhiều để có những Tricks độc đáo, và đồng thời Sk8 cũng mang lại phong cách thời trang đặc biệt điểm màu cho công viên thời bấy giờ. 

Phiên bản VANS Classic Sk8 Black/White là một trong style kinh điển của VANS và đã mang lại lợi nhuận khổng lồ cho hãng khi luôn nằm trong mục Best Seller của VANS.','6','3');
INSERT INTO `product` VALUES('23','Vans Sk8 White banladak','canvas-old-skool-white.jpg','749000',null,'10','Lại là một phiên bản Best Seller của VANS mọi thời đại, đôi giày chỉ với một màu trắng tinh này đã mang đến cho thương hiệu khá nhiều lợi nhuận dù khá kén người chọn. Là phiên bản được VANS sử dụng chủ yếu trong các sự kiện Custom giày, được các fan hâm mộ của VANS vẽ ra rất nhiều kiểu dáng khác nhau và luôn được hãng VANS ủng hộ và thậm chí là tài trợ để có những phiên bản Custom đặc sắc.

Chất liệu upper hoàn toàn là vải canvas nên mức giá vẫn rẻ hơn các phiên bản Old Skool da lộn tầm $10, nhờ mức giá phải chăng cùng với chất liệu dễ vẽ khiến cho các tín đồ Custom ưa thích và là sự lựa chọn hàng đầu khi họ thi triển tài nghệ. ','6','3');
INSERT INTO `product` VALUES('24','Vans Sk8-Hi White Hankaik','canvas-old-skool-white-hi.jpg','400000',null,'10','VANS SK8 HI là một trong những dòng giày mang tính kinh điển và làm nên thương hiệu của VANS -OFF THE WALL. Kiểu dáng của SK8 HI vẫn chú trọng phát triển sự đơn giản và thoải mái đến từ phần thiết kế cũng như màu sắc, VANS SK8 còn được ưu ái gọi là một đôi OLD SKOOL cổ cao,  
Phần cổ giày được đệm một cách đặc biệt khiến cho chúng trở nên êm ái. Màu sắc của VANS CLASSIC SK8-HI TRUE WHITE là một phần không thể không nhắc đến khi toàn bộ đôi giày được mặc một màu áo trắng, một lần nữa VANS đánh mạnh vào sự đơn giản, nhưng đơn giản một cách khó cưỡng như VANS CLASSIC SK8-HI TRUE WHITE thì khó có sản phẩm nào bì kịp. Tin chắc rằng, VANS CLASSIC SK8-HI TRUE WHITE sẽ là một sản phẩm đủ sức làm cho trang phục của khách hàng dù là phong cách gì cũng trở nên sành điệu và phóng khoáng như cách VANS xây dựng thương hiệu của mình...','6','3');
INSERT INTO `product` VALUES('25','Vans Black Checkerboard Slip-On','slip-on-check.png','666000',null,'10','VANS là thương hiệu hoạt động mạnh mẽ trong lĩnh vực thể thao mạo hiểm với những đôi giày của họ được thiết kế tối ưu cho những môn thể thao như trượt ván, BMX, mô tô đua, trượt tuyết v.v... với kiểu dáng cổ điển nhưng luôn ra mắt những phiên bản có phong cách sáng tạo.

VANS CHECKERBOARD SLIP-ON:
Bắt đầu trở nên nổi tiếng khi được Sean Penn sử dụng trong bộ phim Fast Times vào năm 1982 và từ phong trào trở thành một phong cách huyền thoại không hề lỗi thời và luôn nằm trong mục "Best Seller" của VANS cho tới thời điểm hiện tại.	','6','3');
INSERT INTO `product` VALUES('26','Vans White Slip-On sunwek','slip-on-white.png','500000',null,'10','VANS Classic Slip-on luôn có một lượng fan đông đảo trung thành, kiểu dáng đơn giản chỉ là một đôi giày lười nhưng thiết kế lại dành cho vận động viên trượt ván, BMX và nhiều môn thể thao mạo hiểm khác, điều đó khiến cho VANS Classic Slip-on trở nên đặc biệt khi ẩn chứa một nội lực đáng kể trong vẻ bề ngoài đơn giản. 

VANS CLASSIC SLIP-ON TRUE WHITE:
Là phiên bản trắng tinh True White nằm trong mục Best Seller của VANS và nằm trong bộ 3 True White mang lại lợi nhuận khổng lồ cho hãng. Được các họa sĩ Custom lựa chọn để cho ra những tác phẩm độc đáo vì chất liệu vải bố, đồng thời toàn đôi giày đều có thể vẽ lên bất cứ đâu.','6','3');
INSERT INTO `product` VALUES('27','Vans Checkerboard Old Skool Black','check-old-skool-black.png','400000',null,'10','Vans Old Skool ra đời với phong cách trẻ trung, năng động, nhưng không kém phần tinh tế, thời trang và nay điều ấy thật sự được khẳng định thêm lần nữa khi VANS PRIMARY CHECKERBOARD OLD SKOOL BLACK/WHITE ra đời, với sọc caro đậm chất VANS, đôi giày này một lần nữa khẳng định vị trí đặc biệt của mình đối với các tín đồ yêu cái đẹp cùng sự mạnh mẽ vốn có của VANS...','6','3');
INSERT INTO `product` VALUES('28','Vans Checkerboard Old Skool White','check-old-skool-white.png','900000',null,'10','VANS CHECKERBOARD OLD SKOOL là kiểu dáng giày ra đời vào thời kì đỉnh cao, những môn thể thao đường phố đang ngày càng phổ biến, và phát triển rộng rãi hơn như trượt ván, BMX...VANS CHECKERBOARD ra đời nhằm đánh mạnh vào thị trường những vận động viên thể thao mạo hiểm ấy. Nhưng điều mà VANS khó mà ngờ đến, khi mà VANS CHECKERBOARD OLD SKOOL cũng dễ dàng chiếm cảm tình của đại đa số các tín đồ đam mê thời trang, những con người khi lựa chọn phụ kiện quần áo, họ vẫn tìm kiếm một thứ gì đó để làm bộc phát mạnh mẽ cái tôi cá nhân của chính mình, và VANS CHECKERBOARD OLD SKOOL đã làm được điều đó một cách đầy ngoạn mục. VANS CHECKERBOARD OLD SKOOL WHITE/BLACK là một bằng chứng sống cho việc ấy khi chúng ta rất dễ bắt gặp một đôi giày này trên đường phố, hay bất cứ nơi chốn nào..','6','3');
INSERT INTO `product` VALUES('29','Vans Old Skool Black Low','Vans-old-skool-low.png','199000',null,'10','Là một trong những phiên bản đầu tiên và cổ điển nhất của VANS trong bộ sưu tập VANS OLD SKOOL ra đời năm 1977. Tới nay đôi giày chỉ với phối màu đen trắng này vẫn nằm trong top "Best Seller" của VANS trên toàn thế giới, với kiểu dáng cổ điển cùng "sọc Jazz" huyền thoại hợp thời trang khiến đôi VANS này thật sự trở thành mẫu giày classic bất bại, là fan hâm mộ của VANS nói chung và những skaters nói riêng đều nên có một đôi trong tủ giày. Được mệnh danh là phiên bản mang "càng cũ càng đẹp" và nhiều phiên bản custom  bậc nhất của nhà VANS.','6','3');
INSERT INTO `product` VALUES('30','Vans Old Skool Black Hi','Vans-old-skool-hi.png','800000',null,'10','','6','3');

insert INTO `order` values('01', '1', '37');
insert INTO `order` values('08', '1', '37');


select * from `order`;
SELECT * FROM `product`;
SELECT * FROM `user`;
SELECT * FROM `category`;
