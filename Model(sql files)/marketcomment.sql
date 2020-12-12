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

-- 테이블 Hoseo_World.marketcomment 구조 내보내기
DROP TABLE IF EXISTS `marketcomment`;
CREATE TABLE IF NOT EXISTS `marketcomment` (
  `m_cid` int(11) NOT NULL AUTO_INCREMENT,
  `m_board_num` int(11) DEFAULT NULL,
  `M_Writer` varchar(50) NOT NULL DEFAULT '..',
  `M_Comment` varchar(50) DEFAULT NULL,
  `M_Date` datetime NOT NULL,
  PRIMARY KEY (`m_cid`),
  KEY `FK_market` (`m_board_num`),
  CONSTRAINT `FK_market` FOREIGN KEY (`m_board_num`) REFERENCES `market` (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- 테이블 데이터 Hoseo_World.marketcomment:~3 rows (대략적) 내보내기
DELETE FROM `marketcomment`;
/*!40000 ALTER TABLE `marketcomment` DISABLE KEYS */;
INSERT INTO `marketcomment` (`m_cid`, `m_board_num`, `M_Writer`, `M_Comment`, `M_Date`) VALUES
	(6, 2, '20161472', '저 구매하고싶은데 연락 가능한 시간좀 알려주시겠어요?', '2020-12-10 16:18:40'),
	(16, 2, '20161477', '7시 괜찮으세요?', '2020-12-10 21:30:51'),
	(17, 2, '20161472', '네 연락 주세요', '2020-12-10 21:32:05');
/*!40000 ALTER TABLE `marketcomment` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
