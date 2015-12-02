class Event < ActiveRecord::Base
	has_many :tickets

	mount_uploader :poster, PhotoUploader

	def purchased_tickets
		self.tickets.count
	end

	def self.group_tickets
		tickets = Ticket.for_event(self).ungrouped[0..5]

		if tickets.count % 6 == 0
			newest = Group.new(title: "#{self.title} Group")
			newest.save!
			
			tickets.each do |ticket|
				ticket.group = newest
				ticket.save!
			end
		end
	end
end
