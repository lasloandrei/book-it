require 'rails_helper'
RSpec.describe CustomController, type: :controller do

	let(:dining_table) { create :dining_table }
	let(:contact) { create :contact}

	it 'works' do
		create :contact
		expect {
			post :create, {	contact: {
					first_name: 'foo',
					last_name: 'bar',
					phone_number: '0000000000000',
					reservations_attributes: [{
						dining_table_id: dining_table.id,
						date: Date.today
					}]
				}
			}
			p json
			p Contact.find(json['id']).reservations
		}.to change { Reservation.count }.by(1)
	end
end
