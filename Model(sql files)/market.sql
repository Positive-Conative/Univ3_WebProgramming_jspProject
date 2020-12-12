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

-- 테이블 Hoseo_World.market 구조 내보내기
DROP TABLE IF EXISTS `market`;
CREATE TABLE IF NOT EXISTS `market` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `Writer` varchar(20) NOT NULL DEFAULT '0',
  `Title` varchar(30) NOT NULL DEFAULT '0',
  `Content` varchar(200) NOT NULL DEFAULT '0',
  `Price` varchar(50) NOT NULL DEFAULT '0',
  `Date` datetime NOT NULL,
  `img_src` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- 테이블 데이터 Hoseo_World.market:~3 rows (대략적) 내보내기
DELETE FROM `market`;
/*!40000 ALTER TABLE `market` DISABLE KEYS */;
INSERT INTO `market` (`mid`, `Writer`, `Title`, `Content`, `Price`, `Date`, `img_src`) VALUES
	(2, '20161477', 'Soul River 책 판매합니다~~', '개인적으로 정말 재미있게 읽었던 책입니다! 이 좋은 책을 다른 분들도 쉽게 접하셨으면 좋겠다는 뜻으로 매우 싼 값에 판매해요!', '2000', '2020-12-02 11:12:16', 'mybook.jpg'),
	(57, '20161471', 'casio 시계 팝니다.', 'casio 시계 팝니다. 000-1111-2222 많은 연락 주세요~', '43000', '2020-12-10 20:37:50', 'casio1.PNG'),
	(58, '20161468', '갤럭시 버즈 라이브 판매합니다~', '갤럭시 버즈 라이브 판매합니다. 단돈 50000원에 판매합니다.', '50000', '2020-12-10 20:56:08', 'buds.PNG');
/*!40000 ALTER TABLE `market` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
