# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

puts "Seeding the database..."

# Credit card types:
credit_cards_array = [ "VISA", "DCCB", "AMEX", "DISC", "MC"]

# User photos:
user_photos_array = [
      "https://blog.itriagehealth.com/wp-content/uploads/2012/06/african-american-men-and-prostate-cancer.jpg",
      "http://www.essence.com/sites/default/files/images/2012/12/28/happy-african-american-woman-0_400x295_52.jpg",
      "http://www.collegegrant.net/wp-content/uploads/blackwoman-300x238.jpg",
      "http://img.medscape.com/thumbnail_library/dt_140916_South_Asian_man_800x600.jpg",
      "http://sajablogs.typepad.com/photos/uncategorized/2008/06/01/sultan_aisha372_2.jpg",
      "http://www.abcsofattraction.com/blog/wp-content/uploads/2012/10/poker-face-3.jpg",
      "http://kari-joys.com/wp-content/uploads/2013/01/asian-smiling-300x200.jpg",
      "http://www.gynnow.com/wp-content/uploads/2013/03/asian-woman.jpg",
      "http://wcct.com/wp-content/uploads/2012/10/Pixta-Japanese-Man-2060201-1.jpg",
      "http://pbs.twimg.com/media/B-yd_6YVEAEqZau.jpg",
      "http://www.singleblackmale.org/wp-content/uploads/2013/08/black-man1.jpg",
      "http://i1290.photobucket.com/albums/b536/forharriet/For%20Harriet/smilinghappyblackwoman_zps0f93f2b6.jpg",
      "http://www.bathurstfinchdentaloffice.ca/en/images/vwxz3irpgy_4e3d5ab7_2e69_021f_c01a_fbe3b5a0cd1f.png",
      "https://www.arts.gov/sites/default/files/styles/large-620/public/ZamoraJHeadshot.jpg?itok=hk6q_SsR",
      "http://i.huffpost.com/gen/1357564/images/o-LATINA-WOMAN-facebook.jpg",
      "https://bitchmedia.org/sites/default/files/u2583/lucy_flores.jpg",
      "http://media-cache-ec0.pinimg.com/736x/7c/2a/c3/7c2ac3409da3fb0510959b87d18fb02f.jpg",
      "https://s-media-cache-ak0.pinimg.com/236x/2a/58/dd/2a58ddbe125f98c2af3d2b800792582a.jpg",
      "http://wcct.com/wp-content/uploads/2012/10/Korean-Man-000011341022Large.jpg",
      "http://cdn.stylisheve.com/wp-content/uploads/2012/01/Korean-Hairstyles-for-women_02.jpg",
      "http://www.castervision.com/wp-content/uploads/2015/05/Man-Smiling-after-surgery.jpg",
      "http://srkheadshotday.com/wp-content/uploads/Danielle_Lussier_Q4332_Crop32.jpg",
      "http://alpharenew.com/wp-content/uploads/2015/02/hair-supplement-for-growth.jpg",
      "http://www.diyhealth.com/wp-content/uploads/2012/07/smiling_image_title_tuemm.jpg",
      "http://www.themancompany.com/media/wysiwyg/smartwave/blog/johannes_strate_skarf_man_face_field_8373_1920x1080.jpg",
      "https://upload.wikimedia.org/wikipedia/en/2/28/Deep_Fried_Man_portrait_-_real_name_Daniel_Friedman_-_South_African_Comedian.jpg",
      "http://e08595.medialib.glogster.com/media/b6/b600315676aa1767a0f7787ae7c72fd812066d9c21f23c255621742b98eb6a4c/african-american-rhinoplasty-young-man-nose-jpg.jpg",
      "http://womenshealth.gov/minority-health/african-americans/images/young-woman-smiling.gif",
      "https://www.google.com/search?q=african+man&espv=2&biw=1392&bih=782&source=lnms&tbm=isch&sa=X&ved=0ahUKEwiBgef1iNzJAhUDPz4KHcg5B4cQ_AUIBigB#tbm=isch&q=filipino+man&imgdii=I7Qrek_afpU4gM%3A%3BI7Qrek_afpU4gM%3A%3BdfrsQqjMhGK0FM%3A&imgrc=I7Qrek_afpU4gM%3A"
    ]

# Events:
events_hash = {
      "Carnegie Mellon University Philharmonic & Chorus" => "Under the direction of Andrés Cárdenes, the CMU Chorus will join the Philharmonic on Poulenc's Gloria. Debussy's Prelude to the Afternoon of a Faun and Maurice Ravel's Pavane for a Dead Princess will be conducted by Resident Conductor, Daniel Nesta Curtis. Under the direction of Thomas W. Douglas, the Choirs will perform Holst's In the Bleak Midwinter (arr. Thomas W. Douglas) and Joy Joy Joy (arr. Robert Page). Also on the program will be Gershwin's An American in Paris and the premiere of Mike Garson's Christmas is Here.",
      "Scotch'n'Soda Theatre Presents: Bang Bang Banality" => "A student-written one act play by Scotch'n'Soda member Bradley Plaxen. Directed by Donovan Powers and Brianna Hudock. Audience Participation is strongly encouraged! Join us for our December Slot production and help to answer the question: what makes a good person? Warning: Dark material and themes",
      "The Music of Star Wars: Episodes I-VI" => "Conducted by Daniel Meyer, this concert will feature the iconic music of John Williams from the first six Star Wars films, and will be the perfect warm-up to the movie premiere of Star Wars Episode VII: The Force Awakens on December 18. The program includes fan favorites The Imperial March, Across the Stars, The Main Title and many more! The concert will be presented without intermission, ending in plenty of time for a midnight showing of the new movie at a local movie theater!",
      "Pittsburgh Penguins vs. Boston Bruins" => "Ticket+ allows you the opportunity to add concession value to your ticket. Simply choose the number of tickets you wish to purchase in the Ticket+ box below and present your ticket at any concession stand upon checkout. Your ticket barcode will be swiped and the appropriate amount will be debited from your Ticket+. All Ticket+ money expires at the end of the game date printed on your ticket.",
      "Pittsburgh Steelers vs. Denver Broncos" => "Section 120 Rows BB-HH are designated as the Family Section. No Alcohol will be permitted in this area.",
      "Winter Flower Show and Light Garden" => "The most magical time of the year arrives with the opening of Winter Flower Show and Light Garden on Fri., Nov. 27. Bringing the familiar carol “Deck the Halls” to life, each of the changing exhibit rooms will embody the spirit of the holiday tune, complete with artful arrangements of LED lights, decorated fir trees, whimsical props, and, of course, plenty of seasonal favorites such as colorful poinsettias, aromatic paperwhites, showy amaryllis and a jaw-dropping massive evergreen situated in the pond of the Victoria Room. Little ones can also be on the lookout for tiny troll figures hidden throughout the displays, a clever twist on the “troll the ancient yuletide carol” lyric of the song. Adding to the festive atmosphere, in our Outdoor and Discovery Gardens, the Winter Light Garden will sparkle with luminous orbs, trees and fountains of light. Garden Railroad will be on view too, taking you on a magical trip through the plots of nine fairy tales and fables brought to life with interactive buttons for children to push, and miniature living plants, shrubs and trees.",
      "Escape the Room PA" => "Escape the Room is a fun, interactive entertainment concept located in Pittsburgh.  While it looks like any other ordinary room, it’s actually a real life adventure game designed for small groups of friends, families, co-w0rkers or strangers.  Find the hidden objects, figure out the clues and solve the puzzles to earn your freedom and “Escape the Room.”  You have 60 minutes, so be quick! Book today to see if you have what it takes to escape.",
      "Yoga at CMOA" => "Have you ever wandered into Carnegie Museum of Art’s magnificent Hall of Sculpture and thought, “This would be a great place to work on my downward dog”? Well, now’s your chance. Join CMOA for three yoga sessions in the Hall this winter with instructors from Pittsburgh’s The Yoga Hive. Each 60-minute session will be accompanied by live music from a member of the Pittsburgh Symphony Orchestra. Participate in one session or all three. A three-session package is available for a discounted price. All levels are welcome. And, stick around after yoga to enjoy the world-class art and specimen collections at Carnegie Museums of Art and Natural History for FREE. Participants must be age 16 or older, and anyone under 18 must be accompanied by a parent or legal guardian. All participants will be required to sign waivers upon arrival to event. Please bring your own mat, if you are able. Water will be provided.",
      "Poverty, Inc. Screening @ AMC Loews Waterfront" => "After a successful screening in October, the award winning documentary Poverty, Inc. is back! In order for this event to happen, a 74 ticket threshold must be met. Tickets are only available online and you will not be charged until the threshold is met. Purchase tickets and watch trailer here: https://www.tugg.com/events/77080 Film Synopsis: 'I see multiple colonial governors,'' says Ghanaian software entrepreneur Herman Chinery-Hesse of the international development establishment in Africa. “We are held captive by the donor community.” The West has positioned itself as the protagonist of development, giving rise to a vast multi-billion dollar poverty industry — the business of doing good has never been better. Yet the results have been mixed, in some cases even catastrophic, and leaders in the developing world are growing increasingly vocal in calling for change. Drawing from over 200 interviews filmed in 20 countries, Poverty, Inc. unearths an uncomfortable side of charity we can no longer ignore. From TOMs Shoes to international adoptions, from solar panels to U.S. agricultural subsidies, the film challenges each of us to ask the tough question: Could I be part of the problem?",
      "Carrie Underwood @ CONSOL Energy Center" => "Seven-time Grammy winner and Pollstar’s three-time top female country touring artist, Carrie Underwood, who just released her fifth studio album, Storyteller, will launch a new arena tour in 2016 to take her new music on the road. The Storyteller Tour - Stories in the Round,in association with award-winning cosmetics brand ALMAY, will kick off on January 30 in Jacksonville,Florida, playing 40 arenas across the U.S. and Canada. “I can’t wait to play new music from Storyteller for the fans,” shares Underwood. 'I am so blessed to have this career and get to do to the things I do, but there is nothing like that moment when I get to step onto the stage to sing and all the fans are singing along with me.'",
      "Pittsburgh Winter Beerfest 2016" => "Join us for the 3rd Annual Pittsburgh Winter Beerfest! Now one fo the Top Ten Largest Craft Beer Festivals in the country! 300-350 Craft Beers from down the street and around the country! Food booths by local restaurants & food trucks! Head over to our website for all of the details. One session each night. Friday and Saturday February 26 & 27, 6:30pm Early Admission, 7:30pm Regular Admission. Event ends at 11pm. All proceeds benefit Animal Rescue Partners, a 501-c-3 tax exempt organization, and their local partners Biggie's Bullies. REMEMBER, GET EARLY ADMISSION TICKETS FOR THE PRICE OF REGULAR ADMISSION UNTIL CHRISTMAS DAY!",
    }

# Users:
30.times do |user_number|
  user = User.new
  user.last_name = Faker::Name.last_name
  user.first_name = Faker::Name.first_name
  user.email = Faker::Internet.safe_email(user.first_name + '-' + user.last_name)
  user.password = "Secret123"
  user.phone = Faker::Base.numerify('(###)-###-####')
  #user.remote_photo_url = Faker::Avatar.image
  user.remote_photo_url = user_photos_array[user_number]
  user.bio = Faker::Hipster.paragraph
  user.birth_date = Faker::Date.between(30.years.ago, 15.years.ago)
  user.save!

  credit_card = CreditCard.new
  credit_card.name = "Personal"
  credit_card.card_type = credit_cards_array.sample
  credit_card.user_id = user.id
  credit_card.save!
end

puts "There are now #{User.count} users..."
puts "and #{CreditCard.count} credit cards..."

event0 = Event.new
event0.title = events_hash.keys[0]
event0.description = events_hash.values[0]
event0.start = Time.new(2015, 12, 9, 20, 0, 0)
event0.price = Faker::Commerce.price
event0.venue_title = Faker::Company.name
event0.address_1 = Faker::Address.street_address
event0.city = "Pittsburgh"
event0.state = "PA"
event0.zip = "15217"
event0.save!

event1 = Event.new
event1.title = events_hash.keys[1]
event1.description = events_hash.values[1]
event1.start = Time.new(2015, 12, 12, 19, 0, 0)
event1.price = Faker::Commerce.price
event1.venue_title = Faker::Company.name
event1.address_1 = Faker::Address.street_address
event1.city = "Pittsburgh"
event1.state = "PA"
event1.zip = "15217"
event1.save!

event2 = Event.new
event2.title = events_hash.keys[2]
event2.description = events_hash.values[2]
event2.start = Time.new(2015, 12, 17, 19, 0, 0)
event2.price = Faker::Commerce.price
event2.venue_title = Faker::Company.name
event2.address_1 = Faker::Address.street_address
event2.city = "Pittsburgh"
event2.state = "PA"
event2.zip = "15217"
event2.save!

event3 = Event.new
event3.title = events_hash.keys[3]
event3.description = events_hash.values[3]
event3.start = Time.new(2015, 12, 18, 19, 0, 0)
event3.price = Faker::Commerce.price
event3.venue_title = Faker::Company.name
event3.address_1 = Faker::Address.street_address
event3.city = "Pittsburgh"
event3.state = "PA"
event3.zip = "15217"
event3.save!

event4 = Event.new
event4.title = events_hash.keys[4]
event4.description = events_hash.values[4]
event4.start = Time.new(2015, 12, 20, 16, 25, 0)
event4.price = Faker::Commerce.price
event4.venue_title = Faker::Company.name
event4.address_1 = Faker::Address.street_address
event4.city = "Pittsburgh"
event4.state = "PA"
event4.zip = "15217"
event4.save!

event5 = Event.new
event5.title = events_hash.keys[5]
event5.description = events_hash.values[5]
event5.start = Time.new(2015, 12, 21, 17, 30, 0)
event5.price = Faker::Commerce.price
event5.venue_title = Faker::Company.name
event5.address_1 = Faker::Address.street_address
event5.city = "Pittsburgh"
event5.state = "PA"
event5.zip = "15217"
event5.save!

event6 = Event.new
event6.title = events_hash.keys[6]
event6.description = events_hash.values[6]
event6.start = Time.new(2015, 12, 23, 15, 30, 0)
event6.price = Faker::Commerce.price
event6.venue_title = Faker::Company.name
event6.address_1 = Faker::Address.street_address
event6.city = "Pittsburgh"
event6.state = "PA"
event6.zip = "15217"
event6.save!

event7 = Event.new
event7.title = events_hash.keys[7]
event7.description = events_hash.values[7]
event7.start = Time.new(2016, 1, 17, 11, 0, 0)
event7.price = Faker::Commerce.price
event7.venue_title = Faker::Company.name
event7.address_1 = Faker::Address.street_address
event7.city = "Pittsburgh"
event7.state = "PA"
event7.zip = "15217"
event7.save!

event8 = Event.new
event8.title = events_hash.keys[8]
event8.description = events_hash.values[8]
event8.start = Time.new(2016, 1, 25, 19, 30, 0)
event8.price = Faker::Commerce.price
event8.venue_title = Faker::Company.name
event8.address_1 = Faker::Address.street_address
event8.city = "Pittsburgh"
event8.state = "PA"
event8.zip = "15217"
event8.save!

event9 = Event.new
event9.title = events_hash.keys[8]
event9.description = events_hash.values[8]
event9.start = Time.new(2016, 2, 17, 19, 0, 0)
event9.price = Faker::Commerce.price
event9.venue_title = Faker::Company.name
event9.address_1 = Faker::Address.street_address
event9.city = "Pittsburgh"
event9.state = "PA"
event9.zip = "15217"
event9.save!

event10 = Event.new
event10.title = events_hash.keys[8]
event10.description = events_hash.values[8]
event10.start = Time.new(2016, 2, 26, 16, 0, 0)
event10.price = Faker::Commerce.price
event10.venue_title = Faker::Company.name
event10.address_1 = Faker::Address.street_address
event10.city = "Pittsburgh"
event10.state = "PA"
event10.zip = "15217"
event10.save!

puts "There are now #{Event.count} events..."
