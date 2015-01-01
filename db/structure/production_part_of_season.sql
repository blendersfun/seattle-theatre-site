CREATE TABLE IF NOT EXISTS `production_part_of_season` (
  `id` int(10) unsigned NOT NULL,
  `season_id` int(10) unsigned NOT NULL,
  `production_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `season_id` (`season_id`),
  KEY `production_id` (`production_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `production_part_of_season`
  ADD CONSTRAINT `production_part_of_season_fkey` FOREIGN KEY (`season_id`) REFERENCES `season` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `season_contains_production_fkey` FOREIGN KEY (`production_id`) REFERENCES `production` (`id`) ON DELETE CASCADE;
