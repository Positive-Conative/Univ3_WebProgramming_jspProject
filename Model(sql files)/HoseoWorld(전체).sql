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


-- Hoseo_World 데이터베이스 구조 내보내기
DROP DATABASE IF EXISTS `Hoseo_World`;
CREATE DATABASE IF NOT EXISTS `Hoseo_World` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `Hoseo_World`;

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

-- 테이블 데이터 Hoseo_World.board:~3 rows (대략적) 내보내기
DELETE FROM `board`;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` (`Num`, `Writer`, `Title`, `Content`, `Date`) VALUES
	(1, '20161477', '가입 인사입니다', '안녕하세요~ 잘부탁드립니다.', '2020-11-29 09:51:28'),
	(15, '20161471', '가입 인사 드립니다.', '안녕하세요 ', '2020-12-08 06:01:50'),
	(29, '20161468', '안녕하세요', '반갑습니다.', '2020-12-10 18:46:38'),
	(32, '20161488', '123', '123', '2020-12-11 06:54:54');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;

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

-- 테이블 데이터 Hoseo_World.comment:~8 rows (대략적) 내보내기
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

-- 테이블 Hoseo_World.file 구조 내보내기
DROP TABLE IF EXISTS `file`;
CREATE TABLE IF NOT EXISTS `file` (
  `fileName` varchar(100) DEFAULT NULL,
  `fileRealName` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 Hoseo_World.file:~0 rows (대략적) 내보내기
DELETE FROM `file`;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
/*!40000 ALTER TABLE `file` ENABLE KEYS */;

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

-- 테이블 Hoseo_World.notice 구조 내보내기
DROP TABLE IF EXISTS `notice`;
CREATE TABLE IF NOT EXISTS `notice` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL DEFAULT '0',
  `writer` varchar(30) NOT NULL DEFAULT 'Admin',
  `content` varchar(200) NOT NULL DEFAULT 'Admin',
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- 테이블 데이터 Hoseo_World.notice:~3 rows (대략적) 내보내기
DELETE FROM `notice`;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` (`nid`, `title`, `writer`, `content`) VALUES
	(1, '거래 관련 공지사항입니다', 'Admin', '거래를 할 시에는 주의하도록 합시다.'),
	(3, '많은 이용 바랍니다.', 'Admin', '많은 이용 부탁드리겠습니다. 감사합니다.');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;

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

-- 테이블 데이터 Hoseo_World.report:~1 rows (대략적) 내보내기
DELETE FROM `report`;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` (`rid`, `reporter_id`, `accused_id`, `title`, `content`, `write_date`, `is_checked`) VALUES
	(11, '20161471', '20161468', '사기행위 신고합니다', '책 대신 벽돌이 왔습니다.', '2020-12-10 19:17:45', 1),
	(12, '20161477', '20161468', '어제 책을 교환하기로 했는데...', '선금을 요구하길래 먼저 돈을 보냈지만, 해당 학생이 나타나지 않았습니다. 처벌해주세요...ㅠ', '2020-12-10 22:30:38', 1),
	(13, '20161488', '20161477', '신고', '신고', '2020-12-11 06:55:37', 1);
/*!40000 ALTER TABLE `report` ENABLE KEYS */;

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
