CREATE TABLE IF NOT EXISTS `collaborator_usual_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `collaborator_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `collaborator_id` (`collaborator_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `collaborator_usual_role`
  ADD CONSTRAINT `usual_role_to_person_fkey` FOREIGN KEY (`collaborator_id`) REFERENCES `person` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `usual_role_to_role_type_fkey` FOREIGN KEY (`role_id`) REFERENCES `collaborator_role` (`id`) ON DELETE CASCADE;
