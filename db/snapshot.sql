-- Snapshot taken: 14:39:00 01-01-2014

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

INSERT INTO `address` (`id`, `line1`, `line2`, `city`, `state`, `zip`, `lat`, `lng`) VALUES
(1, '700 Union Street', '', 'Seattle', 'WA', '98101', 47.611038, -122.332397),
(2, '4711 California Ave SW', '', 'Seattle', 'WA', '98116', 47.560753, -122.387062),
(3, '305 Harrison Street', '', 'Seattle', 'WA', '98109', 47.621479, -122.350777),
(4, '1214 10th Ave', '', 'Seattle', 'WA', '98122', 47.612640, -122.319069),
(5, '201 Mercer St', '', 'Seattle', 'WA', '98109', 47.624119, -122.352448),
(6, '1406 18th Avenue', '', 'Seattle', 'WA', '98122', 47.613174, -122.308685),
(7, '201 Thomas Street', '', 'Seattle', 'WA', '98109', 47.620457, -122.352371),
(8, '7120 62nd Ave NE', '', 'Seattle', 'WA', '98115', 47.680649, -122.262238),
(9, '155 Mercer Street', '', 'Seattle', 'WA', '98109', 47.624268, -122.353783),
(10, '4029 Stone Way N', '', 'Seattle', 'WA', '98103', 47.656448, -122.342690),
(11, '204 N. 85th Street', '', 'Seattle', 'WA', '98103', 47.690834, -122.356270),
(12, '303 Front Street North', '', 'Issaquah', 'WA', '98027', 47.533073, -122.036942),
(13, '2710 Wetmore Avenue', '', 'Everett', 'WA', '98201', 47.981548, -122.207558),
(14, '1620 12th Avenue', '', 'Seattle', 'WA', '98112', 47.615471, -122.316872),
(15, '203 N 36TH ST', '', 'Seattle', 'WA', '98103', 47.652439, -122.356339),
(16, '1308 5th Avenue', '', 'Seattle', 'WA', '98101', 47.608780, -122.333839),
(17, '1100 E. Pike St.', '', 'Seattle', 'WA', '98122', 47.614265, -122.317833),
(18, '200 Madison Avenue North', '', 'Bainbridge Island', 'WA', '98110', 47.626064, -122.518341),
(19, '2220 NW Market Street', 'Lower Level', 'Seattle', 'WA', '98107', 47.669197, -122.385834),
(20, '5510 University Way Northeast', '', 'Seattle', 'WA', '98105', 47.668884, -122.312698),
(21, '7312 West Green Lake Dr. N', '', 'Seattle', 'WA', '98103', 47.682121, -122.339790),
(22, '6587 NE 74th ST', '', 'Redmond', 'WA', '98052', 47.671043, -122.144005),
(23, '815 Seattle Blvd. S.', '', 'Seattle', 'WA', '98134', 47.595600, -122.327423),
(24, '2125 3rd Ave', '', 'Seattle', 'WA', '98121', 47.613674, -122.343323),
(25, '1428 Post Alley', '', 'Seattle', 'WA', '98101', 47.608421, -122.339928);

INSERT INTO `collaborator_role` (`id`, `title`, `description`) VALUES
(1, 'stage manager', NULL),
(2, 'assistant stage manager', NULL),
(3, 'director', NULL),
(4, 'scenic designer', NULL),
(5, 'lighting designer', NULL),
(6, 'costume designer', NULL),
(7, 'sound designer', NULL),
(8, 'dramaturg', NULL),
(9, 'dance choreographer', NULL),
(10, 'dialect coach', NULL),
(11, 'actor', NULL);

INSERT INTO `person` (`id`, `first_name`, `middle_name`, `last_name`, `gender`, `in_actors_equity`) VALUES
(1, 'Jane', NULL, 'Austen', 'F', NULL),
(2, 'Marcus', NULL, 'Goodwin', 'M', NULL),
(3, 'Allan', NULL, 'Armstrong', 'M', 0),
(4, 'Jesica', NULL, 'Avellone', 'F', 0),
(5, 'John', NULL, 'Bianchi', 'M', 0),
(6, 'Rachel', NULL, 'Brow', 'F', 0),
(7, 'Amy', NULL, 'Danneker', 'F', 0),
(8, 'Trick', NULL, 'Danneker', 'M', 0),
(9, 'Kimberly', NULL, 'King', 'F', 1),
(10, 'Rebecca', NULL, 'Olson', 'F', 0),
(11, 'Richard', 'Nguyen', 'Sloniker', 'M', 1),
(12, 'Sascha', NULL, 'Streckel', 'F', 0),
(13, 'Kate', NULL, 'Sumpter', 'F', 0),
(14, 'Jen', NULL, 'Taylor', 'F', 1),
(15, 'Brian', NULL, 'Thompson', 'M', 1),
(16, 'Connor', NULL, 'Toms', 'M', 1),
(17, 'Victoria', NULL, 'Thompson', 'F', NULL),
(18, 'Emma', NULL, 'Pihl', 'F', NULL),
(19, 'Steve', NULL, 'West', 'M', 0),
(20, 'Greg', NULL, 'Carter', 'M', NULL),
(21, 'Craig', NULL, 'Wollam', 'M', NULL),
(22, 'Jocelyne', NULL, 'Fowler', 'F', NULL),
(23, 'Jen', NULL, 'Raynak', 'F', NULL),
(24, 'Anthea', NULL, 'Carns', 'F', NULL),
(25, 'Laura', NULL, 'Ferri', 'F', NULL),
(26, 'Gin', NULL, 'Hammond', 'F', NULL);

INSERT INTO `producing_org` (`id`, `name`, `mission_statement`, `founding_year`) VALUES
(1, 'A Contemporary Theatre', 'We exist for the same reason that there is public education and public health - to support and raise the quality of life in our civilization.\r\n\r\nWe believe in the theatre of the moment, this moment, the present, contemporary struggles, issues, ideas, being. If this practice creates light, consciousness, deeper thought, more fellow feeling, both in our audiences and in ourselves, we believe this to be good for something.\r\n\r\nACT seeks to create a conversation with its work, its season, that reaches for something broader, deeper, seeking to create a philosophical view, or a more connected sense of compassion with our fellow beings and the world at large...An investigation, a sense of experiment, of searching for the new idea or synthesis.\r\n\r\nThe primacy of product - the beautifully fashioned thing, the definitive performance, the astonishing act. We strive for insane excellence. Otherwise, everything is dismissible.\r\n\r\nACT is a reef - A vertical ecosystem of artistic practice. Its job is to create levels of experience through the medium of performance. Its building, its series of performance spaces and intriguing rooms reflect this potential and cry out for its use in this way. The present is multifarious, contradictory, high and low culture, has many guises, ethnicities, and voices. The theatre must reflect this diversity---aesthetically, socially, ethnically, and intellectually.\r\n\r\nA reef is a home - A community of mutually sustaining life forms. ACT should be a mutually sustaining community of theatre practices and audiences. It also exists to stimulate and please its audiences, and to sustain its community of theatre workers and artists. Nothing significant can be made without this community, this family. The artist cannot be forgotten.\r\n\r\nAll forms of theatre represent possibilities for new insight, new experience, new life. Hence, all performance practices and disciplines are fair game. Conventional theatre, performance art, musicals, dance, site-specific pieces, poetry, cabaret, Comedy, and a broad range of theatrical experimentations live side by side.\r\n\r\nNew art. If the theatre doesn''t press the envelope, it fails its ambition to lead the pack by creating new experience. Risk is essential. Few have ever made anything good without it. All plays can be looked at as simulations of risk for the audience, allowing patrons to experience risk in a risk-less environment. It is the business of theatre to create them and take them.\r\n\r\nThe dimension of poetry, High Art. If the theatre has no supersensual utility, it is nothing. If it cannot lead its patrons to another plane of experience-metaphorical, abstract, or deeply affective-it remains earthbound and less than pop media. It has no reason to exist. If it does not reflect the complexities of the world, it is false.\r\n\r\nPopulist art must be part of the overall complexion of the theatre. If it only becomes a palace for High Art, it loses connection with the universal yearning for the redemptive story and the belly laugh.\r\n\r\nACT exists for the community and to strengthen it, for all searchers of all ethnicities and ages. We continually develop deep connections with other likeminded institutions. We produce mutually, interweave and sustain communities of audiences from the socio-politically driven to the sybarites, from the connoisseurs and intellectuals to the fun seekers.', NULL),
(2, 'Arts West', 'The mission of ArtsWest is to produce artistic events so compelling that they require conversation, improve the imagination, and promote cultural vibrancy as a core value for the communities of Seattle.\nWhat does that mean exactly?  It means that we are committed to bringing plays, musicals and art to our audiences that speak to who we are and that are not afraid to explore human emotion. Our work is not always easy or safe.  We are willing and able to take on work that reaches deeper than the surface, that may not be tied up in a fancy bow, but that will force you to engage, to react, and we hope to improve the spirit of your most creative self – your imagination.   We also do not seek to be edgy for the sake of shock value.  There is no need to go there because to truly compel conversation one needs only to be willing to open the dialogue, to give you the tools and fodder, to open your minds and instill in you the need to do that which is most human – to discuss and share.', NULL),
(3, 'Book-It Repertory Theatre', 'Book-It Repertory Theatre is a non-profit organization dedicated to transforming great literature into great theatre through simple and sensitive production and to inspiring its audiences to read.\r\n\r\nBook-It Repertory Theatre’s vision is to be a nationally-known theatre arts center where Book-It’s partnership of theatre, literature and education nourishes literacy and the artistic vitality of our community.\r\n\r\nLiteracy is a multi-dimensional enhancement to life, yet illiteracy is a fundamental obstacle for one third of King County. In a nation where 46% to 51% of adults read so poorly that they earn significantly below the threshold poverty level for an individual*, Book-It’s mission to inspire people to read becomes increasingly more important.\r\n\r\nIn a world of growing automation and interactive multi-media, the American Theater is being overwhelmed by the competitive need to produce cinematic-scaled designs on stage. The bombardment of violent images and constant noise on movie and television screens is robbing us of our sensitivity and our attention spans.\r\n\r\nAudiences are rarely challenged to participate. Active listening is becoming an endangered skill in our society. Book-It recognizes the need to go beyond the quick-fix entertainment mentality and has garnered a devoted audience of people who love to read. More importantly, Book-It has drawn in people who do not or cannot read, and who leave a performance wanting and needing to change that fact.', 1990),
(4, 'Eclectic Theater', 'To produce original, contemporary, and classic works for the stage and screen.', NULL),
(5, 'Intiman Theatre Festival', 'Intiman Theatre produces theatre that is relevant to our time and as diverse as the community in which we live.', NULL),
(6, 'Latino Theatre Projects', 'To inform, enlighten, and engage audiences through presentation of thought-provoking literature, what we term “useful theatre” or “Teatro Útil.” Furthermore, we seek to engage the Latino community in a variety of theatre-based activities to empower and integrate its members through these artistic expressions.', NULL),
(7, 'New Century Theatre Company', 'New Century Theatre Company...where risk & craft collide.\r\n \r\nNCTC is a company of professional artists devoted to expanding the boundaries of live theater in Seattle. We are committed to plays that speak to our humanity; fearless, sincere, dangerous, crass, erotic, ugly, and full of hope. Our shows are produced with visceral simplicity that will stir your imagination to new heights and never do your thinking for you.', NULL),
(8, 'New City Theater', 'The New City is an alternative, artist-run theater producing contemporary work in Seattle since 1982 under the continuous artistic leadership of director John Kazanjian and performer Mary Ewald.\r\n\r\nThe New City aims to commission and produce language centered plays that grapple with the socio-political issues of our time.', NULL),
(9, 'Seattle Children''s Theatre', NULL, NULL),
(10, 'Seattle Musical Theatre', 'Seattle Musical Theatre exists to engage and entertain our community by producing new and traditional musicals; this theater nurtures local talent by providing training and artistic development opportunities for children, youth and adults from all walks of life.\r\n\r\nTo enrich the entertainment and educational value of live theater in the Northwest region.\r\n\r\nTo provide a premier environment for nurturing artistic and technical talent.\r\n\r\nTo develop our Magnuson Park theater facility as a key cultural resource for civic, arts, and other community organizations.', NULL),
(11, 'Seattle Repertory Theatre', 'Seattle Repertory Theatre creates productions and programs that surprise, entertain, challenge and uplift our community through a shared act of imagination.\n\nIn 1963, a group of theatre lovers created Seattle Rep as a foundation for a thriving arts-rich community. Nearly 50 years later, Seattle Rep remains a vital source for creative thought and conversation, a place where the audience brings life to the stories we tell. As we reach new audiences and deepen relationships with our long-time patrons, we welcome and take care of all who come though our doors—there is room for everyone.\n\nWhen we plan our seasons, the scope and scale of our thinking is reflected in the breadth of ideas, emotions and perspectives presented on stage. Through the voices of a diverse range of playwrights, we take Seattle audiences on globe-spanning journeys, while speaking to the issues that resonate with their lives here in the Northwest.\n\nWhether dreaming up a new work or re-imagining a classic, Seattle Rep is the place where anything can happen. Our resources and reputation invite actors, directors, designers and theatre professionals at the top of their craft. The caliber of our resident staff along with the technical capacity of our theatre spaces and shops make Seattle Rep a creative home for artists and audiences—a place for unlimited imagination.', NULL),
(12, 'Seattle Shakespeare Company', 'With the plays of William Shakespeare at our core, Seattle Shakespeare Company engages our audiences, our artists and our community in the universal human experience inherent in classic drama through the vitality, immediacy and intimacy of live performance and dynamic outreach programs.', NULL),
(13, 'Stone Soup Theatre', 'Here at Stone Soup, it is our philosophy that everyone – actor, author and audience – bring an essential ingredient to the creation of theatre and the sum is always greater than the parts.', NULL),
(14, 'Taproot Theatre Company', 'Taproot Theatre Company creates theatre experiences to brighten the spirit, engage the mind and deepen the understanding of the world around us while inspiring imagination, conversation and hope.', NULL),
(15, 'Village Theatre', 'To be a regionally recognized and nationally influential center of excellence in family theatre:\r\n\r\n - To promote a season of top quality productions\r\n - To commission and produce new musicals that achieve national exposure\r\n - To train young people in theatre skills for career opportunities and enriched lives\r\n - To develop a broad-based appreciation for live theatre\r\n - To promote positive values through art', NULL),
(16, 'Washington Ensemble Theatre', 'To bring immediate and accessible theatre to a diverse audience.\r\n\r\nWashington Ensemble Theatre is committed to maintaining an environment wherein our members, as well as artists from our community, are challenged to grow through our work as an ensemble.\r\n\r\nWe intend for our theatre to be a physical and creative intersection for community and art in Seattle, and we hope to expand our contemporary audience, by fostering a love of theatre’s humanity, utility, and vitality.', NULL),
(17, '5th Avenue Theatre Association', 'The non-profit 5th Avenue Theatre Association exists to develop, produce and present live musical theater for the cultural enrichment of the Northwest community, and to preserve, maintain, and operate the historic and irreplaceable 5th Avenue Theatre.\r\n\r\nTo achieve this mission, the Theatre will actively pursue the highest standards of artistic excellence and service, enhance and continuously improve all aspects of the facility operations, endeavor to make its programming accessible and relevant to all audiences, and maintain organizational stability.\r\n\r\nOur vision is to be nationally recognized as a pre-eminent musical theater company, involved in all aspects of the American musical (past, present and future) – reflected by the highest levels of artistic and production quality, staff expertise, and audience engagement.\r\n\r\nWe both produce and present musical theater (America’s great indigenous art form) with the highest standards of artistic excellence.  We place an emphasis on producing and utilizing Northwest-based artists.\r\n\r\nWe are committed to the development and production of new works.  Each season, we program an appealing mix of productions that reflect the broad scope and cultural significance of the American musical (past, present and future), and attract, delight and retain a large and diverse audience.\r\n\r\nWe achieve artistic excellence while maintaining fiscal responsibility.  Each season must be both artistically and financially sound.', NULL),
(18, 'Akropolis Performance Lab', ' - to connect the performer directly with memory (individual and collective), fantasy, and mythology by means of psycho-physical exercises and paratheatrical activities;\r\n - to investigate means of communicating this inner process through the precise, dynamic use of poetry, song, movement, dance, and action;\r\n - to create simple, engaging theatrical productions at the confluence of the performers’ personal resources and traditional (artistic and cultural) material; and,\r\n - to reveal through detailed, rigorous performance the impulses of the human psyche toward states of grace.\r\n\r\nAkropolis Performance Lab works in the tradition of Jerzy Grotowski’s Polish Laboratory Theatre and Eugenio Barba’s Odin Teatret. We actively resist pressures to institutionalize and embrace the poor theatre ethos as an opportunity to eliminate superfluous theatrical elements and focus on revealing the deep artistic wealth actors bring from within. We believe theatre is reducible to the relationship between actor and spectator, the actor being the central figure in any performance event. To this end, we craft intimate productions designed for small audiences, and we augment our production activity by conducting regular company training sessions, teaching classes, and producing workshops.', NULL),
(19, 'Annex Theatre', 'Annex Theatre is a democratic collective of theatre artists dedicated to creating bold new work in an environment of improbability, resourcefulness, and risk.\r\n\r\nIn addition to new plays by living playwrights, Annex produces radical reinterpretations of classic scripts, ensemble-generated non-linear spectacles, and dynamic solo performances, as well as our monthly late-night variety show Spin the Bottle, now in its 14th year. All productions are chosen by the Annex company as a whole, through a process of proposals, interviews, readings, frenzied argument, and final consensus.', NULL),
(20, 'Bainbridge Performing Arts', 'Bainbridge Performing Arts promotes appreciation of and participation in the performing arts to build, educate and inspire our vibrant, creative community.', NULL),
(21, 'Fantastic.Z Theatre Company', 'Fantastic.Z Theatre Company is an artist run, LGBTQ, nonprofit theater company focused on new & under produced works.\r\n\r\nFantastic.Z Theatre Company continually strives to amuse, amaze, entertain and inspire their community. ', NULL),
(22, 'Strawberry Theatre Workshop', 'Strawberry Theatre Workshop is committed to the idea that the theatre is the people''s place of aspiration, and that any voice from the stage is translated exponentially into conversations at coffee shops, bus stops, classrooms, and play fields. Strawshop is dedicated to the idea of ensemble, in the broadest sense of the word. Our ensemble does not only mean a resident company of workers, but a collective that includes our work, our audience, and our neighborhood. This is an activist stance. To be a good neighbor is to be a relevant neighbor, a responsible neighbor, and a vocal neighbor.', NULL),
(23, 'Ghost Light Theatricals', 'Ghost Light Theatricals’ mission is to create bold, imaginative stories inspired by classic texts that resonate with a modern world.', NULL),
(24, 'GreenStage', 'GreenStage’s mission is to inspire our audiences to engage in live theatre as part of their recreation. We wish to instill and foster in our community an appreciation for live theater, with a strong belief that theater can be enjoyed in the same spirit as a picnic or a ballgame. We make high-quality theatrical productions of Shakespeare’s plays freely accessible to all residents and visitors to Seattle and King County.\r\n\r\nOur productions are free, fun, and family oriented, focusing on the text and story of the play. The talent of our artists, the beauty of the natural park spaces, and the imagination and participation of our audiences creates inspiring productions that allow everyone involved to experience live theatre, and Shakespeare in particular, in new ways. Shakespeare’s characters and words come to life in eye-opening ways when heard in these intimate, outdoor performances, and GreenStage’s patrons, fans, and participants, all join together to help keep theatre freely accessible to all.', NULL),
(25, 'Jet City Improv / Wing-It Productions', 'Our mission is to enlighten, educate and entertain audiences of all ages and economic backgrounds utilizing theater’s improvisational roots in order to bring the art of improvisation into the mainstream thought of everyday culture.', NULL),
(26, 'Printer’s Devil Theater', 'Printer’s Devil Theater (PDT) is a company of theater artists dedicated to creating, developing, and producing new work that meets three criteria: smart, original, and local. Founded in 1995, here in Seattle, we work to produce innovative work combining bold acting, whip-smart writing, and a commitment to simple, but well conceived production values. Our work has consistently included new and genre-diverse material, driven by a strong sense of intelligence and passion, and no small measure of humor.', NULL),
(27, 'Seattle Public Theatre', 'Seattle Public Theater at the Bathhouse brings together performers, teachers, audiences, designers, directors & community members to create theater as an integral part of life in Seattle.\r\n\r\nSeattle Public Theater at the Bathhouse is theater for bold imaginations; theater that provokes conversation and curiosity among us all.', NULL),
(28, 'SecondStory Repertory', 'Since its opening in October 1999, SecondStory Repertory has offered a year-round season of musicals, comedies, reviews, and dramas, along with its popular Theater for Young Audiences series. The theater also presents contemporary rock and folk concerts, improvisational comedy, poetry readings, informal stagings of new works, and many other special events. In all, there have been over 150 different performances held at SSR.', NULL),
(29, 'the Satori Group', 'the Satori Group collaboratively generates new work aimed at exploring the audience experience with curiosity, commitment, and consideration to the world of each piece. We have built a culture in which dialogue, respect, and ensemble training are key; where we ask questions and empower each other to say yes and ask how.', NULL),
(30, 'Theater Schmeater', 'Since its inception in 1992, Theater Schmeater''s mission has been to produce great plays simply and foster a love of theater as an art form in future audiences.', NULL),
(31, 'Unexpected Productions', 'Unexpected Productions is heart of improv in Seattle, and has been performing comedy improv in Seattle since 1983, and is dedicated to promoting the art and spirit of improvisation.', NULL);

INSERT INTO `script` (`id`, `name`, `synopsis`, `publish_date`, `premiere_date`, `is_conventional`) VALUES
(1, 'Pride and Prejudice, Book-It''s Adaptation', 'The story is based on Jane Austen''s novel about five sisters - Jane, Elizabeth, Mary, Kitty and Lydia Bennet - in Georgian England. Their lives are turned upside down when a wealthy young man (Mr. Bingley) and his best friend (Mr. Darcy) arrive in their neighborhood.\n\n- Marcy Gomez\n\n(source: http://www.imdb.com/title/tt0414387/plotsummary)', NULL, NULL, 1);

INSERT INTO `season` (`id`, `name`, `flavor_text`, `producer_id`) VALUES
(1, 'Silver Jubilee Season (2014-2015)', 'Twenty-five years of growing a theatre company is a BIG deal. Book-It Repertory Theatre is thrilled to announce (something we never dreamed of in 1990) our 25th season! The first two productions come from our repertory of more than 100 adaptations; the final three are world-premiere works. All five mainstage shows will be produced at the Center Theatre in the Armory.', 3);

INSERT INTO `ticket_price` (`id`, `name`, `amount`, `qualifying_conditions`, `is_special_case`) VALUES
(1, 'Standard Price', 5500, NULL, 0),
(2, 'Senior', 4500, 'The patron must be at or over the age of 60.', 0),
(3, 'Under 30', 2500, 'The patron must be under the age of 30.', 0),
(4, 'Stand-by', 2500, 'The patron must stand by and wait until 5 minutes before the show. Stand-by pricing will then come into effect for any remaining available seats. Cash only.', 0),
(5, 'Student', 2500, 'The patron must be a student currently. The patron must provide a current student ID as verification. This can only be done in person.', 0),
(6, 'Industry Rate', 2000, 'The patron must be a member of a qualifying industry organization. Qualifying organizations include: Theatre Puget Sound (TPS) and Actors’ Equity Association (AEA). Tickets must be bought the day of the show.', 1),
(7, 'Pay What You Will', 0, 'Suggested minimum: $10.', 1),
(8, 'Opening Night', 6000, NULL, 0),
(9, 'Preview', 3500, NULL, 0);

INSERT INTO `ticket_type` (`id`, `name`, `benefits_granted`) VALUES
(1, 'General Admission', 'No assigned seating. Seating is self-selected on a first-come, first serve basis.');

INSERT INTO `character` (`id`, `name`, `gender`, `description`, `age_range`, `script_id`) VALUES
(1, 'Sir William Lucas', 'M', NULL, NULL, 1),
(2, 'Mr. Gardiner', 'M', NULL, NULL, 1),
(3, 'Mrs. Long', 'F', NULL, NULL, 1),
(4, 'Mrs. Hurst', 'F', NULL, NULL, 1),
(5, 'Charlotte Lucas', 'F', NULL, NULL, 1),
(6, 'Mrs. Gardiner', 'F', NULL, NULL, 1),
(7, 'Mr. Hurst', 'M', NULL, NULL, 1),
(8, 'Mr. Collins', 'M', NULL, NULL, 1),
(9, 'Miss Lydia Bennet', 'F', NULL, NULL, 1),
(10, 'Miss Kitty Bennet', 'F', NULL, NULL, 1),
(11, 'Miss de Bourgh', 'F', NULL, NULL, 1),
(12, 'Mr. Bingley', 'M', NULL, NULL, 1),
(13, 'Mrs. Bennet', 'F', NULL, NULL, 1),
(14, 'Lady Catherine de Bourgh', 'F', NULL, NULL, 1),
(15, 'Miss Jane Bennet', 'F', NULL, NULL, 1),
(16, 'Mr. Darcy', 'M', NULL, NULL, 1),
(17, 'Miss Mary Bennet', 'F', NULL, NULL, 1),
(18, 'Miss Darcy', 'F', NULL, NULL, 1),
(19, 'Miss Bingley', 'F', NULL, NULL, 1),
(20, 'Mrs. Reynolds', 'F', NULL, NULL, 1),
(21, 'Miss Elizabeth Bennet', 'F', NULL, NULL, 1),
(22, 'Mr. Bennet', 'M', NULL, NULL, 1),
(23, 'Mr. Cartwright', 'M', NULL, NULL, 1),
(24, 'Mr. Wickham', 'M', NULL, NULL, 1),
(25, 'Jenkins', 'M', NULL, NULL, 1),
(26, 'Mr. Pattinson', 'M', NULL, NULL, 1),
(27, 'Jacobs', 'M', NULL, NULL, 1),
(28, 'Mr. Denny', 'M', NULL, NULL, 1),
(29, 'Colonel Fitzwilliam', 'M', NULL, NULL, 1);

INSERT INTO `ticket_scheme` (`id`, `name`, `description`, `producer_id`) VALUES
(1, 'Standard', 'Standard ticket pricing scheme for Book-It productions.', 3),
(2, 'Opening Night Pricing', 'Opening night ticket pricing scheme for Book-It productions.', 3),
(3, 'Preview Pricing', 'Preview ticket pricing scheme for Book-It productions.', 3),
(4, 'Pay What You Will', 'Pay what you will ticket pricing scheme for Book-It productions.', 3);

INSERT INTO `venue` (`id`, `name`, `address_id`) VALUES
(1, 'ACT Theatre', 1),
(2, 'Arts West Playhouse', 2),
(3, 'The Armory', 3),
(4, 'Eclectic Theatre', 4),
(5, 'Cornish Playhouse', 5),
(6, 'New City Theatre', 6),
(7, 'Seattle Children''s Theatre', 7),
(8, 'Seattle Musical Theatre', 8),
(9, 'Seattle Repertory Theatre', 9),
(10, 'Stone Soup Theatre', 10),
(11, 'Taproot Theatre', 11),
(12, 'Francis J. Gaudette Theatre', 12),
(13, 'Everett Performing Arts Center', 13),
(14, '12th Avenue Arts', 14),
(15, 'West of Lenin', 15),
(16, '5th Avenue Theatre', 16),
(17, 'Annex Theatre', 17),
(18, 'Bainbridge Performing Arts', 18),
(19, 'The Ballard Underground', 19),
(20, 'Jet City Improv', 20),
(21, 'The Bathhouse Theatre', 21),
(22, 'SecondStory Repertory', 22),
(23, 'The Inscape Arts Building', 23),
(24, 'Theater Schmeater', 24),
(25, 'The Market Theater', 25);

INSERT INTO `writer_contributed_to_script` (`id`, `writer_id`, `script_id`, `capacity`) VALUES
(1, 1, 1, 'novelist'),
(2, 2, 1, 'adapter');

INSERT INTO `performance_space` (`id`, `name`, `seat_count`, `configurable_seating`, `flavor_text`, `venue_id`) VALUES
(1, 'The Falls Theatre', 409, 0, 'Never more than 30 feet from the stage, this thrust stage (where audiences surround all three sides) is named after ACT''s founder Gregory A. Falls. Located downstairs.', 1),
(2, 'The Allen Theatre', 434, 0, 'Once a grand ballroom, this unique space has been transformed into a beautiful theatre in the round. Located on the 3rd floor.', 1),
(3, 'The Bullitt Cabaret', 160, 1, 'A versatile room that offers various types of seating, from cabaret to thrust. Located on the lowest level, next to the Falls Theatre.', 1),
(4, 'Buster''s', 80, 1, 'A multi-purpose room with custom configurable seating, Buster''s is located on the 2nd level.', 1),
(5, 'The Eulalie Scandiuzzi Space', 60, 0, 'A beautiful and intimate 60-seat black box theatre that was recently renovated from its former purpose as a rehearsal room.', 1),
(6, 'Arts West Playhouse', NULL, NULL, '', 2),
(7, 'Center Theatre', NULL, 0, 'Located on the 1st floor of the Armory (formerly the Center House), the Center House Theatre at the Seattle Center is most easily recognized as "the old Group Theatre space." The theater is also the administrative home to the Seattle Shakespeare Company and Book-It Repertory Theatre. For rates and rental information please contact TPS Facility Manager.', 3),
(8, 'Eclectic Theatre', NULL, 0, 'Formerly the Odd Duck Studio. In 2013, Odd Duck Studio was renovated and renamed Eclectic Theater.', 4),
(9, 'Cornish Playhouse', 476, 0, 'The Cornish Playhouse at Seattle Center is a vibrant theatrical and educational facility, a landmark of modern architecture built for the World’s Fair of 1962. Operated by Cornish College of the Arts as its most high-profile venue, the playhouse presents to the public a full range of professional and student performing arts productions. In its 476-seat main stage, its black-box theater and its generous lobby, Cornish and its professional partners offer rich experiences not only in theater but also in dance, music and the visual arts. In keeping with the College’s mission, the Cornish Playhouse provides students aspiring to become practicing artists with educational opportunities of the highest possible quality, preparing them to contribute to society as artists, citizens and innovators.', 5),
(10, 'New City Theatre', NULL, 0, 'Did it used to be called the "Shoebox Theatre" or am I crazy? Or is it still called that?', 6),
(11, 'Charlotte Martin Theatre', 482, 0, NULL, 7),
(12, 'Eve Alvord Theatre', 275, 0, NULL, 7),
(13, 'Seattle Musical Theater', NULL, 0, NULL, 8),
(14, 'Bagley Wright Theatre', 842, 0, 'It is 65 feet from the stage to the last row of the house (approx 5 feet farther than the distance between home plate and the pitcher''s mound in baseball).', 9),
(15, 'Leo K. Theatre', 282, 0, 'It is about 25 feet from the stage to the rear wall.', 9),
(16, 'The DownStage Theatre', NULL, NULL, 'Cozy 60-seat neighborhood theater featuring professional productions & youth acting camps.', 10),
(17, 'Isaac Studio Theatre', 120, 1, NULL, 11),
(18, 'Francis J. Gaudette Theatre', 450, 0, 'The Francis J. Gaudette Theatre opened its doors in November of 1994 and is the home to Village Theatre’s Mainstage programming in Issaquah. With just under 500 seats, this theatre is the ideal intimate environment for theatre performances, and there truly is not a bad seat in the house. The theatre also boasts family rooms where parties with small children may enjoy the show in a sound-proof booth, allowing for a stress-free environment for young children. This custom-built theatre boasts rehearsal rooms, shops, a fully-equipped fly system, large control booth, capacious dressing rooms, green room, offices, and state-of-the-art lighting and sound capabilities.', 12),
(19, 'Everett Performing Arts Center', NULL, NULL, 'An outstanding venue for all occasions, the Everett Performing Arts Center is one of the premier rental spaces in Snohomish County for performing arts and special events. The Everett Performing Arts Center is owned and supported by the City of Everett as a service to the entire Everett community. In 1998, Village Theatre was contracted by the City of Everett to be the resident performing and management company. This building is home to Village Theatre’s Mainstage productions in Everett. In addition to presenting a season of high-quality theatre, the management and technical staff of Village Theatre are dedicated to making this space the best possible place for other community organizations that require a state-of-the-art venue for their events. Rental events include choral concerts, film festivals, ballet, receptions, seminars and business meetings.', 13),
(20, 'Washington Ensemble Theatre', NULL, NULL, NULL, 14),
(21, 'The West of Lenin Theatre', 88, 1, 'The West of Lenin Theatre is a flexible blackbox performance space. In its'' rep configuration, it has 88 seats. ', 15),
(22, '5th Avenue Theatre', 2130, 0, 'Unique in its Chinese-inspired design, this exquisite theater opened in 1926 as a venue for vaudeville and film. In the early days, people eagerly lined up for first-class vaudeville shows, featuring the top touring entertainers of the day. The Theatre later transformed itself into a popular movie palace. In the late 1970s, The 5th Avenue Theatre fell on hard times, but was saved from a wrecking ball by a visionary group of businesses and community leaders. In 1980, the non-profit 5th Avenue Theatre began producing and presenting top-quality live musical theater.', 16),
(23, 'Annex Theatre', 99, 0, 'It''s upstairs, and there is a bar attached.', 17),
(24, 'Hodges Hall', 245, NULL, NULL, 18),
(25, 'The Ballard Underground', 65, 1, NULL, 19),
(26, 'Jet City Improv', NULL, 0, NULL, 20),
(27, 'The Bathhouse Theatre', 165, NULL, NULL, 21),
(28, 'SecondStory Repertory', 86, NULL, NULL, 22),
(29, 'the Satori Group', NULL, 1, NULL, 23),
(30, 'Theater Schmeater', NULL, NULL, NULL, 24),
(31, 'The Market Theater', NULL, 0, NULL, 25);

INSERT INTO `priced_ticket` (`id`, `ticket_type_id`, `price_id`, `scheme_id`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 1),
(3, 1, 3, 1),
(4, 1, 4, 1),
(5, 1, 5, 1),
(6, 1, 6, 1),
(7, 1, 7, 4),
(8, 1, 8, 2),
(9, 1, 2, 2),
(10, 1, 3, 2),
(11, 1, 4, 2),
(12, 1, 5, 2),
(13, 1, 6, 2),
(14, 1, 9, 3),
(16, 1, 3, 3),
(17, 1, 4, 3),
(18, 1, 5, 3),
(19, 1, 6, 3);

INSERT INTO `ticketing_for_producing_org` (`id`, `producer_id`, `ticketing_scheme_id`) VALUES
(1, 3, 1);

INSERT INTO `producers_main_space` (`id`, `producer_id`, `space_id`) VALUES
(1, 3, 7),
(2, 5, 9),
(3, 12, 7);

INSERT INTO `producer_admins_space` (`id`, `producer_id`, `space_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 8, 10),
(7, 9, 11),
(8, 9, 12),
(9, 10, 13),
(10, 11, 14),
(11, 11, 15),
(12, 13, 16),
(13, 14, 17),
(14, 15, 18),
(15, 15, 19),
(16, 16, 20),
(17, 17, 22),
(18, 19, 23),
(19, 20, 24),
(20, 23, 25),
(21, 25, 26),
(22, 27, 27),
(23, 28, 28),
(24, 29, 29),
(25, 30, 30),
(26, 31, 31);

INSERT INTO `production` (`id`, `name`, `running_time`, `script_id`, `producer_id`, `performance_space_id`, `production_notes`, `is_premiere`, `intermission_count`) VALUES
(1, 'Pride and Prejudice', 220, 1, 3, 7, 'Our first foray into adapting the novels of Miss Jane Austen, P&P is replete with the author’s charm, wit, and keen observations. Her comedy of manners and courtship boasts a cast of beloved and unforgettable characters led by the extraordinary Elizabeth Bennet and the dashing Mister Darcy. Book-It is delighted to once again stage the classic favorite for new and returning audiences this holiday season.', 0, NULL);

INSERT INTO `actor_playing_character` (`id`, `actor_id`, `character_id`, `production_id`) VALUES
(1, 3, 1, 1),
(2, 3, 2, 1),
(3, 4, 3, 1),
(4, 4, 4, 1),
(5, 4, 5, 1),
(6, 4, 6, 1),
(7, 5, 7, 1),
(8, 5, 8, 1),
(9, 6, 9, 1),
(10, 7, 10, 1),
(11, 7, 11, 1),
(12, 8, 12, 1),
(13, 9, 13, 1),
(14, 9, 14, 1),
(15, 10, 15, 1),
(16, 11, 16, 1),
(17, 12, 17, 1),
(18, 12, 18, 1),
(19, 13, 19, 1),
(20, 13, 20, 1),
(21, 14, 21, 1),
(22, 15, 22, 1),
(23, 16, 23, 1),
(24, 16, 24, 1),
(25, 19, 25, 1),
(26, 19, 26, 1),
(27, 19, 27, 1),
(28, 19, 28, 1),
(29, 19, 29, 1);

INSERT INTO `collaborator_role_in_production` (`id`, `collaborator_id`, `role_id`, `production_id`) VALUES
(1, 17, 1, 1),
(2, 18, 2, 1),
(3, 2, 3, 1),
(4, 20, 4, 1),
(5, 21, 5, 1),
(6, 22, 6, 1),
(7, 23, 7, 1),
(8, 24, 8, 1),
(9, 25, 9, 1),
(10, 26, 10, 1);

INSERT INTO `production_part_of_season` (`id`, `season_id`, `production_id`) VALUES
(1, 1, 1);

INSERT INTO `scheduled_show` (`id`, `production_id`, `showtime`, `doors_before`, `show_type`) VALUES
(1, 1, '2014-11-25 19:30:00', NULL, 'pay what you can'),
(2, 1, '2014-11-26 19:30:00', NULL, 'preview'),
(3, 1, '2014-11-28 19:30:00', NULL, 'opening'),
(4, 1, '2014-11-29 19:30:00', NULL, NULL),
(5, 1, '2014-11-30 14:00:00', NULL, NULL),
(6, 1, '2014-12-02 10:30:00', NULL, 'student matinee'),
(7, 1, '2014-12-03 14:00:00', NULL, NULL),
(8, 1, '2014-12-03 19:30:00', NULL, NULL),
(9, 1, '2014-12-04 19:30:00', NULL, NULL),
(10, 1, '2014-12-05 19:30:00', NULL, NULL),
(11, 1, '2014-12-06 19:30:00', NULL, NULL),
(12, 1, '2014-12-07 14:00:00', NULL, NULL),
(13, 1, '2014-12-09 10:30:00', NULL, 'student matinee'),
(14, 1, '2014-12-10 19:30:00', NULL, NULL),
(15, 1, '2014-12-11 19:30:00', NULL, NULL),
(16, 1, '2014-12-12 19:30:00', NULL, NULL),
(17, 1, '2014-12-13 14:00:00', NULL, NULL),
(18, 1, '2014-12-13 19:30:00', NULL, NULL),
(19, 1, '2014-12-14 14:00:00', NULL, NULL),
(20, 1, '2014-12-17 19:30:00', NULL, NULL),
(21, 1, '2014-12-18 19:30:00', NULL, NULL),
(22, 1, '2014-12-19 19:30:00', NULL, NULL),
(23, 1, '2014-12-20 14:00:00', NULL, NULL),
(24, 1, '2014-12-20 19:30:00', NULL, NULL),
(25, 1, '2014-12-21 14:00:00', NULL, NULL),
(26, 1, '2014-12-21 19:30:00', NULL, NULL),
(27, 1, '2014-12-23 14:00:00', NULL, NULL),
(28, 1, '2014-12-23 19:30:00', NULL, NULL),
(29, 1, '2014-12-26 19:30:00', NULL, NULL),
(30, 1, '2014-12-27 14:00:00', NULL, NULL),
(31, 1, '2014-12-27 19:30:00', NULL, NULL),
(32, 1, '2014-12-28 14:00:00', NULL, NULL);

INSERT INTO `ticketing_for_showing` (`id`, `showing_id`, `ticketing_scheme_id`) VALUES
(1, 1, 4),
(2, 2, 3),
(3, 3, 2);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
