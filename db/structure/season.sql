CREATE TABLE IF NOT EXISTS `season` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `flavor_text` varchar(5000) DEFAULT NULL,
  `producer_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `producer_id` (`producer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;