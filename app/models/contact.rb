class Contact < ActiveRecord::Base
  has_many :reservations
  accepts_nested_attributes_for :reservations
  validates :first_name, presence: true
  validates :last_name,  presence: true
  validates :phone_number, presence: true, numericality: { message: 'has to be digits ONLY!' }, length: { minimum: 10, maximum: 15 }
  validates_format_of :email, with: /.+@.+\..+/i, allow_blank: true
end
