CREATE TABLE IF NOT EXISTS `actor_playing_character` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `actor_id` int(10) unsigned NOT NULL,
  `character_id` int(10) unsigned NOT NULL,
  `staging_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `character_id` (`character_id`),
  KEY `staging_id` (`staging_id`),
  KEY `actor_id` (`actor_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

ALTER TABLE `actor_playing_character`
  ADD CONSTRAINT `actor_playing_character_ibfk_1` FOREIGN KEY (`staging_id`) REFERENCES `staging` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `actor_playing_char_fkey` FOREIGN KEY (`actor_id`) REFERENCES `person` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `char_played_by_actor_fkey` FOREIGN KEY (`character_id`) REFERENCES `character` (`id`) ON DELETE CASCADE;
