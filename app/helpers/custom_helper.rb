module CustomHelper
	def setup_contact(contact)
    contact.address ||= Reservation.new
    contact
  end
end
