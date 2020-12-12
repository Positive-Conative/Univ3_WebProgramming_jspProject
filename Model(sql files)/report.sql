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

-- 테이블 Hoseo_World.report 구조 내보내기
DROP TABLE IF EXISTS `report`;
CREATE TABLE IF NOT EXISTS `report` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `reporter_id` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `accused_id` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `title` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `content` varchar(300) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `write_date` datetime DEFAULT NULL,
  `is_checked` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- 테이블 데이터 Hoseo_World.report:~3 rows (대략적) 내보내기
DELETE FROM `report`;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` (`rid`, `reporter_id`, `accused_id`, `title`, `content`, `write_date`, `is_checked`) VALUES
	(11, '20161471', '20161468', '사기행위 신고합니다', '책 대신 벽돌이 왔습니다.', '2020-12-10 19:17:45', 1),
	(12, '20161477', '20161468', '어제 책을 교환하기로 했는데...', '선금을 요구하길래 먼저 돈을 보냈지만, 해당 학생이 나타나지 않았습니다. 처벌해주세요...ㅠ', '2020-12-10 22:30:38', 1),
	(13, '20161488', '20161477', '신고', '신고', '2020-12-11 06:55:37', 1);
/*!40000 ALTER TABLE `report` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
