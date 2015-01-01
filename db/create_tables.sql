
-- No dependencies:

source structure/address.sql
source structure/collaborator_role.sql
source structure/person.sql
source structure/producing_org.sql
source structure/script.sql
source structure/season.sql
source structure/ticket_price.sql
source structure/ticket_type.sql

-- One level deep:

source structure/character.sql
source structure/collaborator_usual_role.sql
source structure/ticket_scheme.sql
source structure/venue.sql
source structure/writer_contributed_to_script.sql

-- Two levels deep:

source structure/performance_space.sql
source structure/priced_ticket.sql
source structure/ticketing_for_producing_org.sql

-- Three levels deep:

source structure/producer_admins_space.sql
source structure/producers_main_space.sql
source structure/production.sql

-- Four levels deep:

source structure/actor_playing_character.sql
source structure/collaborator_role_in_production.sql
source structure/production_part_of_season.sql
source structure/scheduled_show.sql
source structure/ticketing_for_production.sql

-- Five levels deep:

source structure/ticketing_for_showing.sql