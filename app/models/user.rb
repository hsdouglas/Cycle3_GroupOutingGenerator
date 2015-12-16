class User < ActiveRecord::Base

 	attr_accessor :remote_photo_url

	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :trackable, :validatable

	has_many :tickets
	has_many :groups, through: :tickets
	has_many :events, through: :tickets
	has_many :credit_cards

	mount_uploader :photo, PhotoUploader

	# This should be refactored into a scope that uses joins!
	def get_groups
		groups = []
		self.tickets.each do |ticket|
			groups << ticket.group
		end
		groups
	end

	# This should be refactored into a scope that uses joins!
	def get_past_groups
		past_groups = []
		self.tickets.grouped.past.each do |ticket|
			past_groups << ticket.group
		end
		past_groups
	end

	# This should be refactored into a scope that uses joins!
	def get_upcoming_groups
		upcoming_groups = []
		self.tickets.grouped.upcoming.each do |ticket|
			upcoming_groups << ticket.group
		end
		upcoming_groups
	end

	def anonymized_name
		"#{first_name} #{last_name[0]}."
	end
end
