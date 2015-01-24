CREATE TABLE IF NOT EXISTS `collaborator_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `role_type_id` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `role_type_id` (`role_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

ALTER TABLE `collaborator_role`
  ADD CONSTRAINT `collaborator_role_to_type_fkey` FOREIGN KEY (`role_type_id`) REFERENCES `collaborator_role_type` (`id`) ON DELETE CASCADE;