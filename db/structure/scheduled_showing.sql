CREATE TABLE IF NOT EXISTS `scheduled_showing` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `show_id` int(10) unsigned NOT NULL,
  `showtime` datetime NOT NULL,
  `doors_before` tinyint(3) unsigned DEFAULT NULL COMMENT 'in minutes',
  `show_type` varchar(255) DEFAULT NULL COMMENT 'Matinee, student matinee, industry night, etc.',
  PRIMARY KEY (`id`),
  KEY `show_id` (`show_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

ALTER TABLE `scheduled_showing`
  ADD CONSTRAINT `scheduled_showing_ibfk_1` FOREIGN KEY (`show_id`) REFERENCES `show` (`id`) ON DELETE CASCADE;
