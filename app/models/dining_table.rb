class DiningTable < ActiveRecord::Base
  belongs_to :zone, foreign_key: 'id'
  belongs_to :reservations, foreign_key: 'id'
  
  validates :uid, presence: true
  validates :zone_id, presence: true
end

