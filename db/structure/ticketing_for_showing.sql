CREATE TABLE IF NOT EXISTS `ticketing_for_showing` (
  `id` int(10) unsigned NOT NULL,
  `showing_id` int(10) unsigned NOT NULL,
  `ticketing_scheme_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `showing_id` (`showing_id`),
  KEY `ticketing_scheme_id` (`ticketing_scheme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `ticketing_for_showing`
  ADD CONSTRAINT `showing_for_ticketing_fkey` FOREIGN KEY (`ticketing_scheme_id`) REFERENCES `ticket_scheme` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ticketing_for_showing_fkey` FOREIGN KEY (`showing_id`) REFERENCES `scheduled_show` (`id`) ON DELETE CASCADE;