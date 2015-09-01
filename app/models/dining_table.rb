class DiningTable < ActiveRecord::Base
  belongs_to :zone
  has_many :reservations
  accepts_nested_attributes_for :reservations
  validates :uid, presence: true
  validates :zone_id, presence: true
  #Function displays the id of the DiningTable in Activeadmin dropdown
  def display_name
    id
  end
end
