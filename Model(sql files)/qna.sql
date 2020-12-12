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

-- 테이블 Hoseo_World.qna 구조 내보내기
DROP TABLE IF EXISTS `qna`;
CREATE TABLE IF NOT EXISTS `qna` (
  `qid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `writer` varchar(50) NOT NULL,
  `content` varchar(250) NOT NULL,
  `date` datetime NOT NULL,
  `admin_coment` varchar(50) DEFAULT NULL,
  `admin_date` datetime DEFAULT NULL,
  PRIMARY KEY (`qid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- 테이블 데이터 Hoseo_World.qna:~2 rows (대략적) 내보내기
DELETE FROM `qna`;
/*!40000 ALTER TABLE `qna` DISABLE KEYS */;
INSERT INTO `qna` (`qid`, `title`, `writer`, `content`, `date`, `admin_coment`, `admin_date`) VALUES
	(1, '거래 정지당할 시엔 어떻게하나요?', '20161472', '제가 나쁜 마음을 먹고 사기를 저지르게되어 거래 정지가 되었습니다.. 이제는 착하게 살겠습니다. 거래 정지를 풀어주세요!', '2020-12-03 11:23:41', '안 됩니다.', '2020-12-04 22:44:52'),
	(2, '이벤트도 만들어 주시나요?', '20161477', '이벤트도 했으면 좋겠어요!!', '2020-12-11 07:25:19', '그래요? 그럼 이벤트 배너 추가하겠습니다! 기대해주세요!', '2020-12-10 22:40:25');
/*!40000 ALTER TABLE `qna` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
