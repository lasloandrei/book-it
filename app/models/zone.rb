class Zone < ActiveRecord::Base
  has_many :dining_tables
  accepts_nested_attributes_for :dining_tables
  validates :name, presence: true
  #Function displays the name of the Zone in Activeadmin dropdown
  def display_name
    name
  end
end
