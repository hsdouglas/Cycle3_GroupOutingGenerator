namespace :group_tickets do
  
  desc "Go through each event, and group the tickets"
  task group_every_event: :environment do
  	Event.upcoming.each do |event|
  	  event.group_tickets
  	end
    puts "Successfully grouped for all events @ #{Time.now}"
  end

  desc "After each grouping, notify the users"
  task notify_all_users: :environment do
  end

end
