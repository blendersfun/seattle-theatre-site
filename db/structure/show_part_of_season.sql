CREATE TABLE IF NOT EXISTS `show_part_of_season` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `season_id` int(10) unsigned NOT NULL,
  `show_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `season_id` (`season_id`),
  KEY `show_id` (`show_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

ALTER TABLE `show_part_of_season`
  ADD CONSTRAINT `production_part_of_season_fkey` FOREIGN KEY (`season_id`) REFERENCES `season` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `show_part_of_season_ibfk_1` FOREIGN KEY (`show_id`) REFERENCES `show` (`id`) ON DELETE CASCADE;
