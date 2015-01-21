CREATE TABLE IF NOT EXISTS `character` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `gender` char(1) DEFAULT NULL,
  `description` varchar(5000) DEFAULT NULL,
  `age_range` varchar(50) DEFAULT NULL,
  `script_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `script_id` (`script_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

ALTER TABLE `character`
  ADD CONSTRAINT `char_to_script_fkey` FOREIGN KEY (`script_id`) REFERENCES `script` (`id`) ON DELETE CASCADE;