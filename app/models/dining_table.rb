class DiningTable < ActiveRecord::Base
has_one :zone, foreign_key:"zone_id"
belongs_to :reservations


end

