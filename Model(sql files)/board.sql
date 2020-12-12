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

-- 테이블 Hoseo_World.board 구조 내보내기
DROP TABLE IF EXISTS `board`;
CREATE TABLE IF NOT EXISTS `board` (
  `Num` int(11) NOT NULL AUTO_INCREMENT COMMENT '게시물 글번호',
  `Writer` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '작성자',
  `Title` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '게시물 제목',
  `Content` varchar(2000) CHARACTER SET utf8 DEFAULT NULL COMMENT '게시물 내용',
  `Date` datetime DEFAULT NULL COMMENT '작성날',
  PRIMARY KEY (`Num`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

-- 테이블 데이터 Hoseo_World.board:~4 rows (대략적) 내보내기
DELETE FROM `board`;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` (`Num`, `Writer`, `Title`, `Content`, `Date`) VALUES
	(1, '20161477', '가입 인사입니다', '안녕하세요~ 잘부탁드립니다.', '2020-11-29 09:51:28'),
	(15, '20161471', '가입 인사 드립니다.', '안녕하세요 ', '2020-12-08 06:01:50'),
	(29, '20161468', '안녕하세요', '반갑습니다.', '2020-12-10 18:46:38'),
	(32, '20161488', '123', '123', '2020-12-11 06:54:54');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
