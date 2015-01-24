CREATE TABLE IF NOT EXISTS `ticket_price` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL COMMENT 'in U.S.A. cents',
  `qualifying_conditions` varchar(1000) DEFAULT NULL,
  `is_special_case` tinyint(1) NOT NULL COMMENT 'Indicates if this pricing type is uncommon for public use and should be omitted from certain displays.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;