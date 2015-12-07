class User < ActiveRecord::Base
	has_many :tickets
	has_many :groups, through: :tickets
	has_many :credit_cards

	mount_uploader :photo, PhotoUploader

	# need scopes for the my groups page
	# upcoming groups, with the title of the event they're attending
	# first, need the upcoming events of the user
	# Group.first.tickets.first.event.start
	# scope :upcoming, -> (time) User.joins(tickets: [:event, :group]).where(events: {"start > ?", time})
	# scope :upcoming, -> { where('start > ?', DateTime.current )}
	# scope :past, -> { where('start < ?', DateTime.current )}

	# def upcoming(time)
	# 	User.joins(tickets: [:event, :group]).where(events: ("start > ?", time))
	# end

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
