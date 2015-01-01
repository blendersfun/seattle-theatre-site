CREATE TABLE IF NOT EXISTS `producing_org` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `mission_statement` varchar(5000) DEFAULT NULL,
  `founding_year` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;