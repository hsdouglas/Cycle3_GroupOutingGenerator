class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.string :name
      t.string :card_type
      t.string :number
      t.integer :expiration_month
      t.integer :expiration_year
      t.string :zipcode

      t.timestamps null: false
    end
  end
end
