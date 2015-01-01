CREATE TABLE IF NOT EXISTS `ticketing_for_production` (
  `id` int(10) unsigned NOT NULL,
  `production_id` int(10) unsigned NOT NULL,
  `ticketing_scheme_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `production_id` (`production_id`),
  KEY `ticketing_scheme_id` (`ticketing_scheme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `ticketing_for_production`
  ADD CONSTRAINT `production_for_ticketing_fkey` FOREIGN KEY (`ticketing_scheme_id`) REFERENCES `ticket_scheme` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ticketing_for_production_fkey` FOREIGN KEY (`production_id`) REFERENCES `production` (`id`) ON DELETE CASCADE;