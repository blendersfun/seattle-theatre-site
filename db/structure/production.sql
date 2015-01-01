CREATE TABLE IF NOT EXISTS `production` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `running_time` smallint(6) NOT NULL COMMENT 'in minutes',
  `script_id` int(10) unsigned NOT NULL,
  `producer_id` int(10) unsigned NOT NULL,
  `performance_space_id` int(10) unsigned NOT NULL,
  `production_notes` varchar(5000) DEFAULT NULL,
  `is_premiere` tinyint(1) NOT NULL,
  `intermission_count` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `performance_space_id` (`performance_space_id`),
  KEY `producer_id` (`producer_id`),
  KEY `script_id` (`script_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `production`
  ADD CONSTRAINT `production_to_producer_fkey` FOREIGN KEY (`producer_id`) REFERENCES `producing_org` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `production_to_script_fkey` FOREIGN KEY (`script_id`) REFERENCES `script` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `production_to_space_fkey` FOREIGN KEY (`performance_space_id`) REFERENCES `performance_space` (`id`) ON DELETE CASCADE;