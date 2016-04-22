-- --------------------------------------------------------
-- 主机:                           192.168.1.193
-- 服务器版本:                        10.0.23-MariaDB - MariaDB Server
-- 服务器操作系统:                      Linux
-- HeidiSQL 版本:                  9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 pc 的数据库结构
CREATE DATABASE IF NOT EXISTS `pc` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `pc`;


-- 导出  表 pc.taskhis 结构
CREATE TABLE IF NOT EXISTS `taskhis` (
  `taskid` bigint(11) DEFAULT NULL,
  `username` char(24) DEFAULT NULL,
  `tasktime` char(24) DEFAULT NULL,
  `taskcode` char(240) DEFAULT NULL,
  `filename` char(240) DEFAULT NULL,
  `upload` char(240) DEFAULT NULL,
  `download` char(240) DEFAULT NULL,
  `tasklevel` int(1) DEFAULT NULL,
  `taskstatus` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  pc.taskhis 的数据：~53 rows (大约)
/*!40000 ALTER TABLE `taskhis` DISABLE KEYS */;
REPLACE INTO `taskhis` (`taskid`, `username`, `tasktime`, `taskcode`, `filename`, `upload`, `download`, `tasklevel`, `taskstatus`) VALUES
	(54, 'chenpenghuan', '1457486706', 'chenpenghuan1457486706', '20160222检测号码.zip', '/var/www/html/PC/Public/Uploads/20160309/56df7b7211866.zip', '/var/www/html/PC/Public/Downloads/1457486712.2536693_1226.zip', 0, 2),
	(55, 'chenpenghuan', '1457487021', 'chenpenghuan1457487021', '20160222检测号码.csv', '/var/www/html/PC/Public/Uploads/20160309/56df7cadad97b.csv', '/var/www/html/PC/Public/Downloads/1457487028.9619305_3784.zip', 0, 2),
	(56, 'chenpenghuan', '1457487156', 'chenpenghuan1457487156', 'MySQL分区.txt', '/var/www/html/PC/Public/Uploads/20160309/56df7d3482416.txt', '/var/www/html/PC/Public/Downloads/1457487158.9452305_6795.zip', 0, 2),
	(1, 'chenpenghuan', '1457487441', 'chenpenghuan1457487441', '号码清洗增量备份方案.txt', '/var/www/html/PC/Public/Uploads/20160309/56df7e511f16b.txt', '/var/www/html/PC/Public/Downloads/1457487441.8447084_9787.zip', 0, 2),
	(2, 'chenpenghuan', '1457490021', 'chenpenghuan1457490021', '20160222检测号码.csv', '/var/www/html/PC/Public/Uploads/20160309/56df886511d23.csv', '/var/www/html/PC/Public/Downloads/1457490022.5867696_7441.zip', 0, 2),
	(3, 'chenpenghuan', '1457492291', 'chenpenghuan1457492291', '20160222检测号码.csv', '/var/www/html/PC/Public/Uploads/20160309/56df91430e972.csv', '/var/www/html/PC/Public/Downloads/1457492292.824284_2285.zip', 0, 2),
	(4, 'chenpenghuan', '1457492322', 'chenpenghuan1457492322', '20160222检测号码.csv', '/var/www/html/PC/Public/Uploads/20160309/56df91620b7aa.csv', '/var/www/html/PC/Public/Downloads/1457492323.6068475_779.zip', 0, 2),
	(5, 'chenpenghuan', '1457492336', 'chenpenghuan1457492336', '20160222检测号码.zip', '/var/www/html/PC/Public/Uploads/20160309/56df917034497.zip', '/var/www/html/PC/Public/Downloads/1457492340.918015_6589.zip', 0, 2),
	(6, 'chenpenghuan', '1457492842', 'chenpenghuan1457492842', '20160222检测号码.csv', '/var/www/html/PC/Public/Uploads/20160309/56df936ac4d21.csv', '/var/www/html/PC/Public/Downloads/1457492863.8131816_6056.zip', 0, 2),
	(7, 'chenpenghuan', '1457492898', 'chenpenghuan1457492898', '20160222检测号码.csv', '/var/www/html/PC/Public/Uploads/20160309/56df93a2bf994.csv', '/var/www/html/PC/Public/Downloads/1457492901.0967586_118.zip', 0, 2),
	(8, 'chenpenghuan', '1457492935', 'chenpenghuan1457492935', '20160222检测号码.zip', '/var/www/html/PC/Public/Uploads/20160309/56df93c7344ae.zip', '/var/www/html/PC/Public/Downloads/1457492942.4552026_847.zip', 0, 2),
	(9, 'chenpenghuan', '1457493714', 'chenpenghuan1457493714', '20160222检测号码.csv', '/var/www/html/PC/Public/Uploads/20160309/56df96d2f397c.csv', '/var/www/html/PC/Public/Downloads/1457493718.1901152_6325.zip', 1, 2),
	(10, 'chenpenghuan', '1457494982', 'chenpenghuan1457494982', '20160309号码.txt', '/var/www/html/PC/Public/Uploads/20160309/56df9bc608514.txt', '/var/www/html/PC/Public/Downloads/1457494983.3320205_7219.zip', 0, 2),
	(11, 'chenpenghuan', '1457495412', 'chenpenghuan1457495412', '20160309号码.txt', '/var/www/html/PC/Public/Uploads/20160309/56df9d7455015.txt', '/var/www/html/PC/Public/Downloads/1457495414.7223456_1447.zip', 0, 2),
	(1, 'chenpenghuan', '1457499894', 'chenpenghuan1457499894', '20160222检测号码.csv', '/var/www/html/PC/Public/Uploads/20160309/56dfaef662132.csv', '/var/www/html/PC/Public/Downloads/1457499897.9596963_9659.zip', 0, 2),
	(2, 'chenpenghuan', '1457500123', 'chenpenghuan1457500123', '56df9d7455015.txt', '/var/www/html/PC/Public/Uploads/20160309/56dfafdb80e7a.txt', '/var/www/html/PC/Public/Downloads/1457500124.2852721_3960.zip', 0, 2),
	(3, 'chenpenghuan', '1457500229', 'chenpenghuan1457500229', '新建文本文档.txt', '/var/www/html/PC/Public/Uploads/20160309/56dfb0459b9c1.txt', '/var/www/html/PC/Public/Downloads/1457500230.647622_8840.zip', 0, 2),
	(1, 'chenpenghuan', '1457504807', 'chenpenghuan1457504807', '20160222检测号码.csv', '/var/www/html/PC/Public/Uploads/20160309/56dfc22764732.csv', '/var/www/html/PC/Public/Downloads/1457504810.259302_6246.zip', 0, 2),
	(2, 'chenpenghuan', '1457504902', 'chenpenghuan1457504902', '新建文本文档.txt', '/var/www/html/PC/Public/Uploads/20160309/56dfc2869b0d3.txt', '/var/www/html/PC/Public/Downloads/1457504904.0533617_736.zip', 0, 2),
	(3, 'chenpenghuan', '1457505004', 'chenpenghuan1457505004', '20160222检测号码.zip', '/var/www/html/PC/Public/Uploads/20160309/56dfc2ec2512a.zip', '/var/www/html/PC/Public/Downloads/1457505013.6761436_3691.zip', 0, 2),
	(4, 'chenpenghuan', '1457505605', 'chenpenghuan1457505605', '20160309号码.txt', '/var/www/html/PC/Public/Uploads/20160309/56dfc545d3fd4.txt', '/var/www/html/PC/Public/Downloads/1457505608.1774695_7687.zip', 0, 2),
	(5, 'chenpenghuan', '1457509743', 'chenpenghuan1457509743', '20160309号码.txt', '/var/www/html/PC/Public/Uploads/20160309/56dfd56fcde13.txt', '/var/www/html/PC/Public/Downloads/1457509745.0406804_6552.zip', 1, 2),
	(6, 'chenpenghuan', '1457514678', 'chenpenghuan1457514678', '22.csv', '/var/www/html/PC/Public/Uploads/20160309/56dfe8b6ac959.csv', '/var/www/html/PC/Public/Downloads/1457514678.8226192_6115.zip', 0, 2),
	(7, 'chenpenghuan', '1457516127', 'chenpenghuan1457516127', '1846120803167ba88ad23414.zip', '/var/www/html/PC/Public/Uploads/20160309/56dfee5f72d4c.zip', '/var/www/html/PC/Public/Downloads/1457516128.3250103_5571.zip', 0, 2),
	(1, 'chenpenghuan', '1457518332', 'chenpenghuan1457518332', '新建文本文档.txt', '/var/www/html/PC/Public/Uploads/20160309/56dff6fc2bb8d.txt', '/var/www/html/PC/Public/Downloads/1457518417.7358181_3754.zip', -1, 2),
	(1, 'chenpenghuan', '1457571515', 'chenpenghuan1457571515', '新建文本文档.txt', '/var/www/html/PC/Public/Uploads/20160310/56e0c6bb01f13.txt', '/var/www/html/PC/Public/Downloads/1457571735.9596093_4475.zip', 0, 2),
	(2, 'chenpenghuan', '1457571758', 'chenpenghuan1457571758', '新建文本文档.txt', '/var/www/html/PC/Public/Uploads/20160310/56e0c7aeaadd5.txt', '/var/www/html/PC/Public/Downloads/1457571760.562888_7769.zip', 0, 2),
	(3, 'chenpenghuan', '1457571787', 'chenpenghuan1457571787', '新建文本文档.txt', '/var/www/html/PC/Public/Uploads/20160310/56e0c7cb29374.txt', '/var/www/html/PC/Public/Downloads/1457571788.6232328_9053.zip', 0, 2),
	(4, 'chenpenghuan', '1457572225', 'chenpenghuan1457572225', '新建文本文档.txt', '/var/www/html/PC/Public/Uploads/20160310/56e0c981be078.txt', '/var/www/html/PC/Public/Downloads/1457572227.0740364_1968.zip', 0, 2),
	(1, 'chenpenghuan', '1457572695', 'chenpenghuan1457572695', '新建文本文档.txt', '/var/www/html/PC/Public/Uploads/20160310/56e0cb573da4b.txt', '/var/www/html/PC/Public/Downloads/1457572951.4800348_4163.zip', -1, 2),
	(2, 'chenpenghuan', '1457573017', 'chenpenghuan1457573017', '新建文本文档.txt', '/var/www/html/PC/Public/Uploads/20160310/56e0cc998ec31.txt', '/var/www/html/PC/Public/Downloads/1457573018.6167257_5206.zip', 0, 2),
	(3, 'chenpenghuan', '1457573400', 'chenpenghuan1457573400', '新建文本文档.txt', '/var/www/html/PC/Public/Uploads/20160310/56e0ce18e3263.txt', '/var/www/html/PC/Public/Downloads/1457573407.3658006_1488.zip', 0, 2),
	(4, 'chenpenghuan', '1457573445', 'chenpenghuan1457573445', '新建文本文档.txt', '/var/www/html/PC/Public/Uploads/20160310/56e0ce45c292e.txt', '/var/www/html/PC/Public/Downloads/1457573588.629338_7956.zip', -1, 2),
	(5, 'chenpenghuan', '1457573732', 'chenpenghuan1457573732', '新建文本文档.txt', '/var/www/html/PC/Public/Uploads/20160310/56e0cf64e7336.txt', '/var/www/html/PC/Public/Downloads/1457573736.9743555_8776.zip', 0, 2),
	(6, 'chenpenghuan', '1457574054', 'chenpenghuan1457574054', '20160222检测号码.csv', '/var/www/html/PC/Public/Uploads/20160310/56e0d0a6e544f.csv', '/var/www/html/PC/Public/Downloads/1457574063.1624434_1357.zip', 0, 2),
	(7, 'chenpenghuan', '1457574195', 'chenpenghuan1457574195', '20160222检测号码.zip', '/var/www/html/PC/Public/Uploads/20160310/56e0d13339b63.zip', '/var/www/html/PC/Public/Downloads/1457575233.5389316_2258.zip', -1, 2),
	(1, 'chenpenghuan', '1457575881', 'chenpenghuan1457575881', '20160222检测号码.zip', '/var/www/html/PC/Public/Uploads/20160310/56e0d7c91a028.zip', '/var/www/html/PC/Public/Downloads/1457575905.0033438_9472.zip', 0, 2),
	(2, 'chenpenghuan', '1457576356', 'chenpenghuan1457576356', '悄然重逢.csv', '/var/www/html/PC/Public/Uploads/20160310/56e0d9a47a3b9.csv', '/var/www/html/PC/Public/Downloads/1457576361.8588405_2195.zip', 3, 2),
	(3, 'chenpenghuan', '1457577048', 'chenpenghuan1457577048', '号码.txt', '/var/www/html/PC/Public/Uploads/20160310/56e0dc5818376.txt', '/var/www/html/PC/Public/Downloads/1457577048.523084_7784.zip', 2, 2),
	(4, 'chenpenghuan', '1457577900', 'chenpenghuan1457577900', '22.csv', '/var/www/html/PC/Public/Uploads/20160310/56e0dfac060b6.csv', '/var/www/html/PC/Public/Downloads/1457577900.8038535_5876.zip', 1, 2),
	(5, 'chenpenghuan', '1457579203', 'chenpenghuan1457579203', '1.csv', '/var/www/html/PC/Public/Uploads/20160310/56e0e4c31ccae.csv', '/var/www/html/PC/Public/Downloads/1457579204.3323202_8547.zip', 0, 2),
	(6, 'chenpenghuan', '1457579411', 'chenpenghuan1457579411', '号码.txt', '/var/www/html/PC/Public/Uploads/20160310/56e0e593e0130.txt', '/var/www/html/PC/Public/Downloads/1457579412.4671323_6033.zip', 0, 2),
	(7, 'chenpenghuan', '1457580180', 'chenpenghuan1457580180', '号码.txt', '/var/www/html/PC/Public/Uploads/20160310/56e0e8942ec1a.txt', '/var/www/html/PC/Public/Downloads/1457580181.4635665_3546.zip', 1, 2),
	(8, 'chenpenghuan', '1457580895', 'chenpenghuan1457580895', '新E1号码.txt', '/var/www/html/PC/Public/Uploads/20160310/56e0eb5f244e7.txt', '/var/www/html/PC/Public/Downloads/1457580896.4103076_595.zip', 0, 2),
	(9, 'chenpenghuan', '1457581008', 'chenpenghuan1457581008', '20160222检测号码.csv', '/var/www/html/PC/Public/Uploads/20160310/56e0ebd0b562f.csv', '/var/www/html/PC/Public/Downloads/1457581009.886346_4192.zip', 0, 2),
	(1, 'chenpenghuan', '1458119915', 'chenpenghuan1458119915', '20160222检测号码.csv', '/var/www/html/PC/Public/Uploads/20160316/56e924eb6554b.csv', '/var/www/html/PC/Public/Downloads/1458120308.0751042_7532.zip', 0, 2),
	(1, 'chenpenghuan', '1458121178', 'chenpenghuan1458121178', '20160222检测号码.csv', '/var/www/html/PC/Public/Uploads/20160316/56e929da26061.csv', '/var/www/html/PC/Public/Downloads/1458121247.8330188_8280.zip', 0, 2),
	(2, 'chenpenghuan', '1458121267', 'chenpenghuan1458121267', '20160222检测号码.csv', '/var/www/html/PC/Public/Uploads/20160316/56e92a33d1af5.csv', '/var/www/html/PC/Public/Downloads/1458121270.0156066_9378.zip', 0, 2),
	(3, 'chenpenghuan', '1458121296', 'chenpenghuan1458121296', '20160222检测号码.csv', '/var/www/html/PC/Public/Uploads/20160316/56e92a506097e.csv', '/var/www/html/PC/Public/Downloads/1458121297.671272_5101.zip', 3, 2),
	(4, 'chenpenghuan', '1458121755', 'chenpenghuan1458121755', '20160222检测号码.csv', '/var/www/html/PC/Public/Uploads/20160316/56e92c1b3bed1.csv', '/var/www/html/PC/Public/Downloads/1458121757.6011894_9816.zip', 0, 2),
	(1, 'chenpenghuan', '1458178052', 'chenpenghuan1458178052', '20160222检测号码.csv', '/var/www/html/PC/Public/Uploads/20160317/56ea0804ab046.csv', '/var/www/html/PC/Public/Downloads/1458178296.4166312_9851.zip', 0, 2),
	(4, 'cph', '1461207037', 'cph1461207037', '20160222检测号码.csv', '/var/www/html/PC/Public/Uploads/20160421/57183ffd2f7fb.csv', '/var/www/html/PC/Public/Downloads/1461208506.2051442_1772.zip', 3, 2),
	(3, 'cph', '1461204918', 'cph1461204918', '20160222检测号码.csv', '/var/www/html/PC/Public/Uploads/20160421/571837b660270.csv', '/var/www/html/PC/Public/Downloads/1461208510.0709977_4575.zip', 0, 2);
/*!40000 ALTER TABLE `taskhis` ENABLE KEYS */;


-- 导出  表 pc.taskinfo 结构
CREATE TABLE IF NOT EXISTS `taskinfo` (
  `taskid` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` char(24) DEFAULT NULL,
  `tasktime` char(24) DEFAULT NULL,
  `taskcode` char(240) DEFAULT NULL,
  `filename` char(240) DEFAULT NULL,
  `upload` char(240) DEFAULT NULL,
  `download` char(240) DEFAULT NULL,
  `tasklevel` int(1) DEFAULT '0',
  `taskstatus` int(1) DEFAULT NULL,
  PRIMARY KEY (`taskid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- 正在导出表  pc.taskinfo 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `taskinfo` DISABLE KEYS */;
REPLACE INTO `taskinfo` (`taskid`, `username`, `tasktime`, `taskcode`, `filename`, `upload`, `download`, `tasklevel`, `taskstatus`) VALUES
	(5, 'cph', '1461215873', 'cph1461215873', '20160222检测号码.csv', '/var/www/html/PC/Public/Uploads/20160421/57186281cb3a5.csv', '/var/www/html/PC/Public/Downloads/1461216289.248798_8277.zip', 0, 2),
	(6, 'cph', '1461216356', 'cph1461216356', '20160222检测号码.csv', '/var/www/html/PC/Public/Uploads/20160421/571864648b5df.csv', '/var/www/html/PC/Public/Downloads/1461216382.1866589_6534.zip', 0, 2),
	(7, 'cph', '1461216417', 'cph1461216417', '20160222检测号码.csv', '/var/www/html/PC/Public/Uploads/20160421/571864a1dedc4.csv', '/var/www/html/PC/Public/Downloads/1461216433.891039_6041.zip', 0, 2);
/*!40000 ALTER TABLE `taskinfo` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
