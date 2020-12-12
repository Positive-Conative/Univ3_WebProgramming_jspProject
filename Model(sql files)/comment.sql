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

-- 테이블 Hoseo_World.comment 구조 내보내기
DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `board_num` int(11) DEFAULT NULL,
  `C_Writer` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Comment` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `C_Date` datetime NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `FK__board` (`board_num`),
  CONSTRAINT `FK__board` FOREIGN KEY (`board_num`) REFERENCES `board` (`Num`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

-- 테이블 데이터 Hoseo_World.comment:~10 rows (대략적) 내보내기
DELETE FROM `comment`;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` (`cid`, `board_num`, `C_Writer`, `Comment`, `C_Date`) VALUES
	(19, 1, '20161472', '잘부탁드려요~~', '2020-12-10 16:26:23'),
	(20, 1, '20161472', '감사합니다', '2020-12-10 16:27:25'),
	(25, 29, '20161471', '안녕하세요~', '2020-12-10 21:27:05'),
	(26, 29, '20161471', '반갑습니다', '2020-12-10 21:27:48'),
	(27, 29, '20161477', '안녕하세요!!!', '2020-12-10 21:29:22'),
	(28, 15, '20161477', '반갑습니다.', '2020-12-10 21:29:42'),
	(29, 15, '20161472', '안녕하세요', '2020-12-10 21:31:47'),
	(30, 15, '20161468', '잘 부탁드립니다!', '2020-12-10 21:32:53'),
	(31, 1, '20161468', '감사해요', '2020-12-10 21:33:05'),
	(32, 15, '20161471', '네~', '2020-12-10 22:55:07');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
