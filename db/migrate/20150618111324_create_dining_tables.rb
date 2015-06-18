class CreateDiningTables < ActiveRecord::Migration
  def change
    create_table :dining_tables do |t|
      
      t.integer :number	
      t.integer :seat
      t.integer :zone_id


      t.timestamps null: false
    end

    add_index :reservations, :dining_table_id

  end
end
