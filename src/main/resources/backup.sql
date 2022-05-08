-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.6.7-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- new 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `new` /*!40100 DEFAULT CHARACTER SET utf8mb3 */;
USE `new`;

-- 함수 new.FNC_HIERARCHI 구조 내보내기
DELIMITER //
CREATE FUNCTION `FNC_HIERARCHI`() RETURNS int(11)
BEGIN
    DECLARE v_id_menu_no INT;
    DECLARE v_parent_super_menu_no INT;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET @id = NULL;

    SET v_parent_super_menu_no = @id;
    SET v_id_menu_no = -1;

    IF @id IS NULL THEN
        RETURN NULL;
    END IF;

    LOOP   

    SELECT MIN(menu_no)
      INTO @id 
      FROM T_MENU
     WHERE super_menu_no = v_parent_super_menu_no
       AND menu_no > v_id_menu_no;

    IF (@id IS NOT NULL) OR (v_parent_super_menu_no = @start_with) THEN
       SET @level = @level + 1;
    RETURN @id;
    END IF;

    SET @level := @level - 1;

    SELECT menu_no, super_menu_no
      INTO v_id_menu_no , v_parent_super_menu_no 
        FROM T_MENU
       WHERE menu_no = v_parent_super_menu_no;
    END LOOP;
END//
DELIMITER ;

-- 테이블 new.t_menu 구조 내보내기
CREATE TABLE IF NOT EXISTS `t_menu` (
  `menu_no` int(11) DEFAULT NULL,
  `super_menu_no` int(11) DEFAULT NULL,
  `menu_order` int(11) DEFAULT NULL,
  `page_no` varchar(10) DEFAULT NULL,
  `menu_name` varchar(50) DEFAULT NULL,
  `page_url` varchar(100) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `visible` char(1) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `insert_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='menu info';

-- 테이블 데이터 new.t_menu:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `t_menu` DISABLE KEYS */;
INSERT INTO `t_menu` (`menu_no`, `super_menu_no`, `menu_order`, `page_no`, `menu_name`, `page_url`, `icon`, `visible`, `update_time`, `insert_time`) VALUES
	(1, 0, 1, 'M00001', 'Master', '/master', 'fa fa-home', '1', '2022-05-05 22:13:25', '2022-05-05 22:13:25'),
	(2, 0, 2, 'M00002', 'Sample', '/sample', 'fa fa-list', '1', '2022-05-05 22:13:29', '2022-05-05 22:13:29'),
	(3, 0, 3, 'M00003', 'User Manager', '/user-mng', 'fa fa-user', '1', '2022-05-08 08:08:34', '2022-05-08 08:08:34');
/*!40000 ALTER TABLE `t_menu` ENABLE KEYS */;

-- 테이블 new.t_user 구조 내보내기
CREATE TABLE IF NOT EXISTS `t_user` (
  `user_id` varchar(20) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `user_group_no` varchar(10) NOT NULL,
  `update_time` datetime NOT NULL,
  `insert_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='user table';

-- 테이블 데이터 new.t_user:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` (`user_id`, `user_name`, `password`, `user_group_no`, `update_time`, `insert_time`) VALUES
	('admin', 'admin', '1234', '1', '2022-05-06 15:14:41', '2022-05-06 15:14:41'),
	('system', 'system', '1234', '2', '2022-05-08 08:09:57', '2022-05-08 08:09:57');
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;

-- 테이블 new.t_webmenupermission 구조 내보내기
CREATE TABLE IF NOT EXISTS `t_webmenupermission` (
  `user_group_no` varchar(10) NOT NULL,
  `menu_no` int(11) NOT NULL,
  `permission` char(1) NOT NULL DEFAULT '',
  `writable` char(1) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='menu permission info';

-- 테이블 데이터 new.t_webmenupermission:~5 rows (대략적) 내보내기
/*!40000 ALTER TABLE `t_webmenupermission` DISABLE KEYS */;
INSERT INTO `t_webmenupermission` (`user_group_no`, `menu_no`, `permission`, `writable`) VALUES
	('1', 1, '1', '1'),
	('1', 2, '1', '1'),
	('1', 3, '1', '1'),
	('2', 1, '1', '1'),
	('2', 3, '1', '1');
/*!40000 ALTER TABLE `t_webmenupermission` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
