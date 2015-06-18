class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      
      t.integer  :contact_id
      t.integer  :dining_table_id
      t.datetime :date
      t.text     :observation

      t.timestamps null: false
    end
  end
end
