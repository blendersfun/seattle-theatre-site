CREATE TABLE IF NOT EXISTS `staging_of_script` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `script_id` int(10) unsigned NOT NULL,
  `staging_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `script_id` (`script_id`),
  KEY `staging_id` (`staging_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

ALTER TABLE `staging_of_script`
  ADD CONSTRAINT `staging_of_script_ibfk_1` FOREIGN KEY (`script_id`) REFERENCES `script` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `staging_of_script_ibfk_2` FOREIGN KEY (`staging_id`) REFERENCES `staging` (`id`) ON DELETE CASCADE;
