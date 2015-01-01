CREATE TABLE IF NOT EXISTS `ticketing_for_producing_org` (
  `id` int(10) unsigned NOT NULL,
  `producer_id` int(10) unsigned NOT NULL,
  `ticketing_scheme_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `producer_id` (`producer_id`),
  KEY `ticketing_scheme_id` (`ticketing_scheme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `ticketing_for_producing_org`
  ADD CONSTRAINT `org_for_ticketing_fkey` FOREIGN KEY (`ticketing_scheme_id`) REFERENCES `ticket_scheme` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ticketing_for_org_fkey` FOREIGN KEY (`producer_id`) REFERENCES `producing_org` (`id`) ON DELETE CASCADE;