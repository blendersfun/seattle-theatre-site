CREATE TABLE IF NOT EXISTS `space_for_producing_org` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `space_id` int(10) unsigned NOT NULL,
  `producer_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `space_id` (`space_id`),
  KEY `producer_id` (`producer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

ALTER TABLE `space_for_producing_org`
  ADD CONSTRAINT `space_for_producing_org_ibfk_1` FOREIGN KEY (`space_id`) REFERENCES `performance_space` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `space_for_producing_org_ibfk_2` FOREIGN KEY (`producer_id`) REFERENCES `producing_org` (`id`) ON DELETE CASCADE;
