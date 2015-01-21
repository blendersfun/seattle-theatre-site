CREATE TABLE IF NOT EXISTS `show` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `running_time` smallint(6) NOT NULL COMMENT 'in minutes',
  `producer_id` int(10) unsigned NOT NULL,
  `show_notes` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `producer_id` (`producer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

ALTER TABLE `show`
  ADD CONSTRAINT `production_to_producer_fkey` FOREIGN KEY (`producer_id`) REFERENCES `producing_org` (`id`) ON DELETE CASCADE;
