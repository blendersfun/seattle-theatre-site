CREATE TABLE IF NOT EXISTS `producers_main_space` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `producer_id` int(10) unsigned NOT NULL,
  `space_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `producer_id` (`producer_id`),
  KEY `space_id` (`space_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='What space a producer usually uses, if they don''t administer a space.';

ALTER TABLE `producers_main_space`
  ADD CONSTRAINT `main_space_to_producer_fkey` FOREIGN KEY (`space_id`) REFERENCES `performance_space` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `producer_to_main_space_fkey` FOREIGN KEY (`producer_id`) REFERENCES `producing_org` (`id`) ON DELETE CASCADE;