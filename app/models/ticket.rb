class Ticket < ActiveRecord::Base
	belongs_to :group
	belongs_to :event
	belongs_to :user

	# "X people are interested in this event!"
	scope :for_event, -> (event) {where(event: event)}
	scope :ungrouped, -> {where(group_id: nil)}
	scope :grouped, -> { where(group_id: !nil )}
	scope :past, -> { joins(:event).where("events.start < ?", Date.today).order("events.start ASC")}
	scope :upcoming, -> { joins(:event).where("events.start >= ?", Date.today).order("events.start ASC")}

end
