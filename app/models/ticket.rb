class Ticket < ActiveRecord::Base
	belongs_to :group
	belongs_to :event
	belongs_to :user

	scope :for_event, -> (event) {where(event: event)}

	# scope :ungrouped, -> { where(group_id: nil)}
	# scope :grouped, -> { where(group_id: !nil )}
	scope :ungrouped, -> { where("group_id IS NULL")}
	scope :grouped, -> { where("group_id IS NOT NULL")}
	
	scope :past, -> { joins(:event).where("events.start < ?", Time.now).order("events.start ASC")}
	scope :upcoming, -> { joins(:event).where("events.start >= ?", Time.now).order("events.start ASC")}

	scope :with_group_notification, -> { where("notification_received IS NOT NULL")}
	scope :received, -> { where("notification_received = ?", true)}
	scope :not_received, -> { where("notification_received = ?", false)}

end
