CREATE TABLE IF NOT EXISTS `collaborator_role_in_staging` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `collaborator_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `staging_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `staging_id` (`staging_id`),
  KEY `collaborator_id` (`collaborator_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

ALTER TABLE `collaborator_role_in_staging`
  ADD CONSTRAINT `collaborator_role_in_staging_ibfk_1` FOREIGN KEY (`staging_id`) REFERENCES `staging` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `persons_role_in_show_fkey` FOREIGN KEY (`role_id`) REFERENCES `collaborator_role` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `person_working_on_show_fkey` FOREIGN KEY (`collaborator_id`) REFERENCES `person` (`id`) ON DELETE CASCADE;
