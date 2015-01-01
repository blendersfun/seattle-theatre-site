CREATE TABLE IF NOT EXISTS `ticket_scheme` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `producer_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `producer_id` (`producer_id`),
  KEY `producer_id_2` (`producer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `ticket_scheme`
  ADD CONSTRAINT `ticket_scheme_to_producer` FOREIGN KEY (`producer_id`) REFERENCES `producing_org` (`id`) ON DELETE CASCADE;