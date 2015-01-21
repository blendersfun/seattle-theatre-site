CREATE TABLE IF NOT EXISTS `performance_space` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `seat_count` int(11) DEFAULT NULL,
  `configurable_seating` tinyint(1) DEFAULT NULL,
  `flavor_text` varchar(5000) DEFAULT NULL,
  `venue_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `venue_id` (`venue_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

ALTER TABLE `performance_space`
  ADD CONSTRAINT `venue_houses_perf_space_fkey` FOREIGN KEY (`venue_id`) REFERENCES `venue` (`id`) ON DELETE CASCADE;
