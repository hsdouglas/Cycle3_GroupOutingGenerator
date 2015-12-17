class AddNotificationReceivedToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :notification_received, :boolean
  end
end
