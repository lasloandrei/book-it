class Reservation < ActiveRecord::Base
  belongs_to :contact, inverse_of: :reservations
  belongs_to :dining_table

  validates :contact, presence: true
  validates :dining_table,  presence: true
  validates :date, presence: true
end
