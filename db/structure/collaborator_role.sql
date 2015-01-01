CREATE TABLE IF NOT EXISTS `collaborator_role` (
  `id` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;