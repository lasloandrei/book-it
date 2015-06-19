class Zone < ActiveRecord::Base
  has_many :dining_tables

  validates :name, presence: true
end
