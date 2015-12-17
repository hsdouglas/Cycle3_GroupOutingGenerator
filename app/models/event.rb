class Event < ActiveRecord::Base
	attr_accessor :remote_poster_url

	has_many :tickets
	has_many :users, through: :tickets
	# has_many :groups, through: :tickets

	scope :chronological, -> { order('start') }
	scope :upcoming, -> { where('start >= ?', Time.now)}

	mount_uploader :poster, PhotoUploader

	def purchased_tickets
		self.tickets.count
	end

	def group_tickets
		tickets = Ticket.for_event(self).ungrouped.shuffle[0..5]

		if tickets.count % 6 == 0
			newest = Group.new(title: "#{self.title} Group")
			newest.save!

			tickets.each do |ticket|
				ticket.group = newest
				ticket.notification_received = false
				ticket.save!
			end
		end
	end
end
