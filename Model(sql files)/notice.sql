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

-- 테이블 Hoseo_World.notice 구조 내보내기
DROP TABLE IF EXISTS `notice`;
CREATE TABLE IF NOT EXISTS `notice` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL DEFAULT '0',
  `writer` varchar(30) NOT NULL DEFAULT 'Admin',
  `content` varchar(200) NOT NULL DEFAULT 'Admin',
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- 테이블 데이터 Hoseo_World.notice:~2 rows (대략적) 내보내기
DELETE FROM `notice`;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` (`nid`, `title`, `writer`, `content`) VALUES
	(1, '거래 관련 공지사항입니다', 'Admin', '거래를 할 시에는 주의하도록 합시다.'),
	(3, '많은 이용 바랍니다.', 'Admin', '많은 이용 부탁드리겠습니다. 감사합니다.');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
