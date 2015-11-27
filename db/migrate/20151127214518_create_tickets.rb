class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :event_id
      t.integer :user_id
      t.date :date_purchased
      t.integer :group_id

      t.timestamps null: false
    end
  end
end