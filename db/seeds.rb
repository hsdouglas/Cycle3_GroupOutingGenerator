# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

puts "Seeding the database..."

# Users:
40.times do
  user = User.new
  user.last_name = Faker::Name.last_name
  user.first_name = Faker::Name.first_name 
  user.email = Faker::Internet.safe_email(user.first_name + '-' + user.last_name)
  user.phone = Faker::Base.numerify('(###)-###-####')
  user.photo = Faker::Avatar.image
  user.bio = Faker::Hipster.paragraph
  user.birth_date = Faker::Date.between(30.years.ago, 15.years.ago)
  user.save!
end

puts "There are now #{User.count} users..."

# Events:
events_hash = { 
			"Lord of the Flies" => "Lord of the Flies, adapted from the classic novel, tells the tale of 11 students trapped on an island with no adults. They must fend for themselves and make their own rules – their survival depends on it. Some are driven by reason, others by basic human instinct. As they battle for dominance, they slowly realize that the real thing to fear is themselves.", 
			"First Friday Art Show & Live Music" => "Come view new artwork by John Muldoon and photography from Pat Bruener Photography this Friday at the Internation Children's Art Gallery on Penn Ave. Entertainment via Live music will be provided by members of The Clock Reads.", 
			"Coffee and French Cinema" => "Coffee from Espresso a Mano will complement screenings of films by Godard and Melville. Coffee will be on sale from 6:30. Godard's Made in U.S.A. begins at 7:00 and Melville's Le Cercle Rouge at 9:00.", 
			"FUSE@PSO!" => "Creative Director Steve Hackman turns his attention to Aaron Copland's Appalachian Spring, the orchestral suite that captures the essence of an ideal America - one of open fields and endless possibilities, and the music of Bon Iver, the Grammy Award-winning American indie folk band. Together the two form a beautiful, contemplative and simply gorgeous evening of music, featuring guest vocalists and the Pittsburgh Symphony Orchestra.",
			"Phipps Winter Flower Show" => "The most magical time of the year arrives with the opening of Winter Flower Show and Light Garden on Fri., Nov. 27. Bringing the familiar carol “Deck the Halls” to life, each of the changing exhibit rooms will embody the spirit of the holiday tune, complete with artful arrangements of LED lights, decorated fir trees, whimsical props, and, of course, plenty of seasonal favorites such as colorful poinsettias, aromatic paperwhites, showy amaryllis and a jaw-dropping massive evergreen situated in the pond of the Victoria Room. ",
			"Straight No Chaser" => "If the phrase 'male a cappella group' conjures up an image of students in blue blazers, ties, and khakis singing traditional college songs on ivied campuses... think again. Straight No Chaser (SNC) are neither strait-laced nor straight-faced, but neither are they vaudeville-style kitsch. They have emerged as a phenomenon with a massive fan base, numerous national TV appearances and proven success with CD releases. THE NEW OLD FASHIONED TOUR comes to town on the heels of the release of their new album 'The New Old Fashioned' (in stores October 27th), their fifth album release through Atlantic Records. ", 
			"Denver Broncos at Pittsburgh Steelers" => "", 
			"LA Kings at Pittsburgh Penguins" => "", 
			"The Nutcracker" => "Holiday magic envelopes the stage in Pittsburgh Ballet Theatre's classic The Nutcracker.  Set to Tchaikovsky's sublime score, a dreamlike journey unfolds through a moonlit snow scape to a whimsical Land of Enchantment. More than 100 dancers bring to life iconic choreography from the wondrous waltz of the snowflakes to the pristine Sugar Plum Fairy pas de deux.", 
		}

event0 = Event.new
event0.title = events_hash.keys[0]
event0.description = events_hash.values[0]
event0.start = Faker::Time.forward(14, :night)
event0.venue_title = Faker::Company.name
event0.address_1 = Faker::Address.street_address
event0.city = "Pittsburgh"
event0.state = "PA"
event0.zip = "15217"
event0.save!

event1 = Event.new
event1.title = events_hash.keys[1]
event1.description = events_hash.values[1]
event1.start = Faker::Time.forward(14, :night)
event1.venue_title = Faker::Company.name
event1.address_1 = Faker::Address.street_address
event1.city = "Pittsburgh"
event1.state = "PA"
event1.zip = "15217"
event1.save!

event2 = Event.new
event2.title = events_hash.keys[2]
event2.description = events_hash.values[2]
event2.start = Faker::Time.forward(14, :night)
event2.venue_title = Faker::Company.name
event2.address_1 = Faker::Address.street_address
event2.city = "Pittsburgh"
event2.state = "PA"
event2.zip = "15217"
event2.save!

event3 = Event.new
event3.title = events_hash.keys[3]
event3.description = events_hash.values[3]
event3.start = Faker::Time.forward(14, :night)
event3.venue_title = Faker::Company.name
event3.address_1 = Faker::Address.street_address
event3.city = "Pittsburgh"
event3.state = "PA"
event3.zip = "15217"
event3.save!

event4 = Event.new
event4.title = events_hash.keys[4]
event4.description = events_hash.values[4]
event4.start = Faker::Time.forward(14, :night)
event4.venue_title = Faker::Company.name
event4.address_1 = Faker::Address.street_address
event4.city = "Pittsburgh"
event4.state = "PA"
event4.zip = "15217"
event4.save!

event5 = Event.new
event5.title = events_hash.keys[5]
event5.description = events_hash.values[5]
event5.start = Faker::Time.forward(14, :night)
event5.venue_title = Faker::Company.name
event5.address_1 = Faker::Address.street_address
event5.city = "Pittsburgh"
event5.state = "PA"
event5.zip = "15217"
event5.save!

event6 = Event.new
event6.title = events_hash.keys[6]
event6.description = events_hash.values[6]
event6.start = Faker::Time.forward(14, :night)
event6.venue_title = Faker::Company.name
event6.address_1 = Faker::Address.street_address
event6.city = "Pittsburgh"
event6.state = "PA"
event6.zip = "15217"
event6.save!

event7 = Event.new
event7.title = events_hash.keys[7]
event7.description = events_hash.values[7]
event7.start = Faker::Time.forward(14, :night)
event7.venue_title = Faker::Company.name
event7.address_1 = Faker::Address.street_address
event7.city = "Pittsburgh"
event7.state = "PA"
event7.zip = "15217"
event7.save!

event8 = Event.new
event8.title = events_hash.keys[8]
event8.description = events_hash.values[8]
event8.start = Faker::Time.forward(14, :night)
event8.venue_title = Faker::Company.name
event8.address_1 = Faker::Address.street_address
event8.city = "Pittsburgh"
event8.state = "PA"
event8.zip = "15217"
event8.save!

puts "There are now #{Event.count} events..."