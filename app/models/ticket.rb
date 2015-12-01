class Ticket < ActiveRecord::Base
	belongs_to :group
	belongs_to :event

	# "X people are interested in this event!"
	scope :for_event, -> (event) {where(event: event)}
	scope :ungrouped, -> {where(group_id: nil)}
	
end
