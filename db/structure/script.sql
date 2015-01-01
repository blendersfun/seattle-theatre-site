CREATE TABLE IF NOT EXISTS `script` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `synopsis` varchar(5000) NOT NULL,
  `publish_date` datetime DEFAULT NULL,
  `premiere_date` datetime DEFAULT NULL,
  `is_conventional` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;