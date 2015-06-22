class Contact < ActiveRecord::Base
belongs_to :reservations

validates :first_name, presence: true
validates :last_name,  presence: true
validates_length_of :phone_number, minimum: 10, too_short: 'please enter at least 10 characters'

end
