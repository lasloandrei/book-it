class Contact < ActiveRecord::Base
has_many :reservations

validates :first_name, presence: true
validates :last_name,  presence: true
validates :phone_number, :presence => {:message => 'The contact needs a phone number!'},
                    	 :numericality => {:message => 'The number needs to contain digits ONLY'}, 
                    	 :length => { :minimum => 10, :maximum => 15 }
validates_format_of :email, :with => /.+@.+\..+/i


end
