CREATE TABLE IF NOT EXISTS `writer_contributed_to_script` (
  `id` int(10) unsigned NOT NULL,
  `writer_id` int(10) unsigned NOT NULL,
  `script_id` int(10) unsigned NOT NULL,
  `capacity` char(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `writer_id` (`writer_id`,`script_id`),
  KEY `script_id` (`script_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `writer_contributed_to_script`
  ADD CONSTRAINT `script_worked_on_by_writer_fkey` FOREIGN KEY (`script_id`) REFERENCES `script` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `writer_worked_on_script_fkey` FOREIGN KEY (`writer_id`) REFERENCES `person` (`id`) ON DELETE CASCADE;