class Contact < ActiveRecord::Base
belongs_to :reservations

#validates :first_name, presence: true
#validates :last_name,  presence: true
end
