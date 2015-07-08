class Reservation < ActiveRecord::Base
belongs_to :contact   
belongs_to :dining_table
validates :contact_id, presence: true
validates :dining_table_id,  presence: true
validates :date , presence:true
#accepts_nested_attributes_for :contacts, :dining_tables
end
