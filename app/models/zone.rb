class Zone < ActiveRecord::Base
  has_many :dining_tables
  accepts_nested_attributes_for :dining_tables
  validates :name, presence: true
end
