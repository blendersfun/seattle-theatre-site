CREATE TABLE IF NOT EXISTS `producer_admins_space` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `producer_id` int(10) unsigned NOT NULL,
  `space_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `producer_id` (`producer_id`),
  KEY `space_id` (`space_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Links producer to space where administrative relationship exists.';

ALTER TABLE `producer_admins_space`
  ADD CONSTRAINT `producer_admins_space_fkey` FOREIGN KEY (`producer_id`) REFERENCES `producing_org` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `space_admined_by_producer_fkey` FOREIGN KEY (`space_id`) REFERENCES `performance_space` (`id`) ON DELETE CASCADE;
