class Reservation < ActiveRecord::Base
has_one :contact,      foreign_key: "contact_id"
has_one :dining_table, foreign_key: "dining_table_id"

end
