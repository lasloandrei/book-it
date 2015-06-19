class DiningTable < ActiveRecord::Base
  belongs_to :zone
  belongs_to :reservations

validates :uid, presence: true

end

