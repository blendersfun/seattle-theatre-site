
-- No dependencies:

source structure/address.sql
source structure/collaborator_role_type.sql
source structure/person.sql
source structure/producing_org.sql
source structure/script.sql
source structure/season.sql
source structure/staging.sql
source structure/ticket_price.sql
source structure/ticket_type.sql

-- One level deep:

source structure/character.sql
source structure/collaborator_role.sql
source structure/show.sql
source structure/staging_of_script.sql
source structure/ticket_scheme.sql
source structure/venue.sql

-- Two levels deep:

source structure/actor_playing_character.sql
source structure/collaborator_role_in_staging.sql
source structure/collaborator_usual_role.sql
source structure/performance_space.sql
source structure/priced_ticket.sql
source structure/scheduled_showing.sql
source structure/show_part_of_season.sql
source structure/show_order.sql
source structure/ticketing_for_producing_org.sql
source structure/ticketing_for_show.sql
source structure/writer_contributed_to_script.sql

-- Three levels deep:

source structure/producer_admins_space.sql
source structure/producers_main_space.sql
source structure/space_for_producing_org.sql
source structure/space_for_show.sql
source structure/space_for_showing.sql
source structure/ticketing_for_showing.sql
