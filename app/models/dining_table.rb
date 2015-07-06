class DiningTable < ActiveRecord::Base
  belongs_to :zone
  has_many :reservations
  
  validates :uid, presence: true
  validates :zone_id, presence: true
end

