CREATE TABLE IF NOT EXISTS `space_for_showing` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `space_id` int(10) unsigned NOT NULL,
  `showing_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `space_id` (`space_id`),
  KEY `showing_id` (`showing_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `space_for_showing`
  ADD CONSTRAINT `space_for_showing_ibfk_1` FOREIGN KEY (`space_id`) REFERENCES `performance_space` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `space_for_showing_ibfk_2` FOREIGN KEY (`showing_id`) REFERENCES `scheduled_showing` (`id`) ON DELETE CASCADE;
