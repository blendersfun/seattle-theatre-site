CREATE TABLE IF NOT EXISTS `writer_contributed_to_script` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `writer_id` int(10) unsigned NOT NULL,
  `script_id` int(10) unsigned NOT NULL,
  `contribution_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `script_id` (`script_id`),
  KEY `contribution_id` (`contribution_id`),
  KEY `writer_id` (`writer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

ALTER TABLE `writer_contributed_to_script`
  ADD CONSTRAINT `how_writer_contributed_fkey` FOREIGN KEY (`contribution_id`) REFERENCES `collaborator_role` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `script_worked_on_by_writer_fkey` FOREIGN KEY (`script_id`) REFERENCES `script` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `writer_worked_on_script_fkey` FOREIGN KEY (`writer_id`) REFERENCES `person` (`id`) ON DELETE CASCADE;
