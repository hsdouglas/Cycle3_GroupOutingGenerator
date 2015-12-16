class Group < ActiveRecord::Base
	has_many :tickets
	has_many :users, through: :tickets
	belongs_to :event

	after_commit :generate_group_notification

	# This should be refactored into a scope that uses joins!
	def get_members
		group_members = []
		self.tickets.each do |ticket|
			# ticket.group.get_members
			group_members << ticket.user
		end
		group_members
	end

	# This only gets the event id... not particularly useful for exteded use
	def get_event_id
		Group.joins("join tickets t on groups.id = t.group_id join events e on e.id = t.event_id").select("e.id").where("groups.id = ?", self.id).distinct
	end

	def generate_group_notification
		GroupOutingGenerator::Application::GROUP_MATCH_NOTIFICATION = "You've been placed into group #{self.id}!"
		# puts "You've been grouped in group #{self.id}"
	end

	# first determine the message...
	# then use that message to send out via the controller
	# how does it know that there's a new message... like does it

end
