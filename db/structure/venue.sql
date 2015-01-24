CREATE TABLE IF NOT EXISTS `venue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `address_id` (`address_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

ALTER TABLE `venue`
  ADD CONSTRAINT `venue_located_at_address_fkey` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`) ON DELETE CASCADE;
