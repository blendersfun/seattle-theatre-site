CREATE TABLE IF NOT EXISTS `scheduled_show` (
  `id` int(10) unsigned NOT NULL,
  `production_id` int(10) unsigned NOT NULL,
  `showtime` datetime NOT NULL,
  `doors_before` tinyint(3) unsigned DEFAULT NULL COMMENT 'in minutes',
  `show_type` varchar(255) DEFAULT NULL COMMENT 'Matinee, student matinee, industry night, etc.',
  PRIMARY KEY (`id`),
  KEY `production_id` (`production_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `scheduled_show`
  ADD CONSTRAINT `showing_of_production_fkey` FOREIGN KEY (`production_id`) REFERENCES `production` (`id`) ON DELETE CASCADE;