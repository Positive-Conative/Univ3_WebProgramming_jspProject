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

-- 테이블 Hoseo_World.developers 구조 내보내기
DROP TABLE IF EXISTS `developers`;
CREATE TABLE IF NOT EXISTS `developers` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '0',
  `student_num` char(8) NOT NULL DEFAULT '0',
  `age` int(11) NOT NULL DEFAULT '0',
  `target` varchar(100) NOT NULL DEFAULT '0',
  `hobby` varchar(50) NOT NULL DEFAULT '0',
  `Technology_Available` varchar(350) DEFAULT NULL,
  `interesting` varchar(100) NOT NULL DEFAULT '0',
  `note` varchar(150) NOT NULL DEFAULT '0',
  `img_src` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- 테이블 데이터 Hoseo_World.developers:~3 rows (대략적) 내보내기
DELETE FROM `developers`;
/*!40000 ALTER TABLE `developers` DISABLE KEYS */;
INSERT INTO `developers` (`did`, `name`, `student_num`, `age`, `target`, `hobby`, `Technology_Available`, `interesting`, `note`, `img_src`) VALUES
	(1, '김영재', '20161477', 24, 'WEB Full-Stack Programmer <br> Server(Back-end) Programmer', '음악(NCS) 감상', 'HTML, CSS, JavaScript, Jquery, <br>Bootstrap, MysqlDB, MongoDB, React, Redux, Node.js, AWS EC2, Git, Docker', 'Angular, React Native, <br> Python Flask, Python django, Oauth', '자바스크립트는 최고야!', 'KYJ.jpg'),
	(2, '김동헌', '20161471', 24, 'Not yet decided', '볼링, 게임', 'JSP,DataBase, CSS ,JAVA ,MYSQL , HTML, C', 'DataBase ,Front-end, MYSQL', '프로젝트가 끝이 보인다', 'KDH.jpg'),
	(3, '권순영', '20161468', 24, 'Not yet decided', '잠, 게임', 'C, JAVA, Python, HTML, CSS, JAVAScript, Arduino, Raspberry PI', 'Node.js, Android', '필요하다면 밤을 새워서라도...', 'KSY.png');
/*!40000 ALTER TABLE `developers` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
