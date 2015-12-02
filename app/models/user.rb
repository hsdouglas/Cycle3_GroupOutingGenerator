class User < ActiveRecord::Base
	has_many :tickets
	has_many :groups, through: :tickets

	def get_groups
		groups = []
		self.tickets.each do |ticket|
			groups << ticket.group
		end
	end
end
