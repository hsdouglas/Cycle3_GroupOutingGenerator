class Group < ActiveRecord::Base
	has_many :tickets
	has_many :users, through: :tickets

	def get_members
		Group.joins(tickets: :user)
	end
end
