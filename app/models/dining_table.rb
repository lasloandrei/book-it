class DiningTable < ActiveRecord::Base
  #belongs_to :zone
  belongs_to :reservations

  validates :uid, presence: true
  validates :zone_id, presence: true
end

