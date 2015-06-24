class Reservation < ActiveRecord::Base
has_one :contact,      foreign_key: "id"
has_one :dining_table, foreign_key: "id"

end
