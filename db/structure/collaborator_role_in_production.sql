CREATE TABLE IF NOT EXISTS `collaborator_role_in_production` (
  `id` int(10) unsigned NOT NULL,
  `collaborator_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `production_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `collaborator_id` (`collaborator_id`,`role_id`),
  KEY `role_id` (`role_id`),
  KEY `production_id` (`production_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `collaborator_role_in_production`
  ADD CONSTRAINT `collaborator_working_on_production_fkey` FOREIGN KEY (`production_id`) REFERENCES `production` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `persons_role_in_production_fkey` FOREIGN KEY (`role_id`) REFERENCES `collaborator_role` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `person_working_on_production_fkey` FOREIGN KEY (`collaborator_id`) REFERENCES `person` (`id`) ON DELETE CASCADE;