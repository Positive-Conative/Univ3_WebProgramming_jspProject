-- --------------------------------------------------------
-- 호스트:                          conative.myds.me
-- 서버 버전:                        5.7.31 - MySQL Community Server (GPL)
-- 서버 OS:                        Linux
-- HeidiSQL 버전:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 테이블 Hoseo_World.user_info 구조 내보내기
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE IF NOT EXISTS `user_info` (
  `id` char(8) NOT NULL DEFAULT '' COMMENT '학번',
  `pw` varchar(300) NOT NULL COMMENT '비밀번호',
  `name` varchar(20) NOT NULL COMMENT '이름',
  `phone` varchar(15) NOT NULL DEFAULT '00000000000' COMMENT '전화번호',
  `address` varchar(50) DEFAULT NULL COMMENT '주소',
  `penalty` datetime DEFAULT '2020-01-01 00:00:00',
  `authority` varchar(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 Hoseo_World.user_info:~9 rows (대략적) 내보내기
DELETE FROM `user_info`;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` (`id`, `pw`, `name`, `phone`, `address`, `penalty`, `authority`) VALUES
	('1', 'asdf', '1', '00000000000', NULL, '2020-01-01 00:00:00', '0'),
	('20161468', '1ad7aeca90495d0ba9837b567e303090b66f7f5ae91d9c537b7b7cf01ddc153de696d955c8ea7587f39bd21c91198b47b0f72eb5f1abee4c9a511f8ddd636d8c', '권순영', '01020903129', '경기도 화성시 병점 1로 82 한신아파트', '2021-01-10 04:06:59', '0'),
	('20161471', '6dd30d64a0019b4ff53421a8c74e6bbae9eb39585125ed861fc61616eb2fd2a7508116a19e02e403c7da703627b7115a636ce6825e857387c58686ba18ce5fa1', '김동헌', '01049342908', '경기도 화성시 동탄', '2020-01-01 00:00:00', '0'),
	('20161472', '247e42c4322da3666e95206cdea4ad970c122c8b4aa34e653f4b450c9c181a590087fc8fc5763fef80a1270ae79e38f105c58d59b20be9955be8d9cb659bb467', '김득회', '01043042134', NULL, '2020-01-01 00:00:00', '0'),
	('20161477', 'cb38639f6c6c11993266045579a56e17522c8230e4b630ce9b529d64c2928568ccaa45c0bb276dc50a779539a91eeaf6588cadac70a44c350adbd261ff85005b', '김영재', '01086052418', NULL, '2020-12-25 06:56:16', '0'),
	('20161488', '247e42c4322da3666e95206cdea4ad970c122c8b4aa34e653f4b450c9c181a590087fc8fc5763fef80a1270ae79e38f105c58d59b20be9955be8d9cb659bb467', '테스터', '00000000000', NULL, '2020-01-01 00:00:00', '0'),
	('20161496', '89998646b47b07154bc00916b7fd3acc214d2c18656e75fb59316a83a4c5b01042bd0b126a7ba75f148abc8850539a15f408110db437b7380f157d840a0750fb', '송준하', '00000000000', NULL, '2020-01-01 00:00:00', '0'),
	('20161504', 'cd47815d15416c9130f9657a1e681a37a63091250ead4f15b867d095bddb1cf48a5db7e6bd802c494bffa2ac607e3661740a180e95a5d119472bbfd7417da7aa', '이규환', '01020416712', '충청남도 천안시 동남구 청당2길 118 벽산블루밍아파트 110동1303호', '2020-01-01 00:00:00', '0'),
	('admin', 'c7ad44cbad762a5da0a452f9e854fdc1e0e7a52a38015f23f3eab1d80b931dd472634dfac71cd34ebc35d16ab7fb8a90c81f975113d6c7538dc69dd8de9077ec', '관리자', '00000000000', 'admin', '2020-01-08 13:22:33', '1');
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
