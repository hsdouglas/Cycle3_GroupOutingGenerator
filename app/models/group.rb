class Group < ActiveRecord::Base
	has_many :tickets
	has_many :users, through: :tickets
	belongs_to :event

	# This should be refactored into a scope that uses joins!
	def get_members
		group_members = []
		self.tickets.each do |ticket|
			# ticket.group.get_members
			group_members << ticket.user
		end
		group_members
	end

	# This should be refactored into a scope that uses joins!
	def get_event
		self.tickets.first.event
	end

end
