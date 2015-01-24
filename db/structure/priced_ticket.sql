CREATE TABLE IF NOT EXISTS `priced_ticket` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_type_id` int(10) unsigned NOT NULL,
  `price_id` int(10) unsigned NOT NULL,
  `scheme_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_type_id` (`ticket_type_id`),
  KEY `price_id` (`price_id`),
  KEY `scheme_id` (`scheme_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

ALTER TABLE `priced_ticket`
  ADD CONSTRAINT `priced_ticket_belongs_to_scheme_fkey` FOREIGN KEY (`scheme_id`) REFERENCES `ticket_scheme` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pricing_for_ticket_type_fkey` FOREIGN KEY (`ticket_type_id`) REFERENCES `ticket_type` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ticket_type_for_pricing_fkey` FOREIGN KEY (`price_id`) REFERENCES `ticket_price` (`id`) ON DELETE CASCADE;
