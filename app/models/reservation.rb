class Reservation < ActiveRecord::Base
  belongs_to :contact, inverse_of: :reservations
  belongs_to :dining_table

  validates :contact, presence: true
  validates :dining_table,  presence: true
  validates :date, presence: true
  #Function displays the date of the Reservation in Activeadmin dropdown
  def display_name
    date
  end
end
