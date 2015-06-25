class Reservation < ActiveRecord::Base
belongs_to :contact   
belongs_to :dining_table

end
