class User < ActiveRecord::Base
	has_many :tickets
	has_many :groups, through: :tickets
	has_many :credit_cards

	mount_uploader :photo, PhotoUploader

	def get_groups
		groups = []
		self.tickets.each do |ticket|
			groups << ticket.group
		end
	end

	def anonymized_name
		"#{first_name} #{last_name[0]}."
	end
end
