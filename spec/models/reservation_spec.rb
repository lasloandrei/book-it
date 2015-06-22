require 'rails_helper'
require 'date'
RSpec.describe Reservation, type: :model do
 let(:reservation) { create :reservation }

  it 'requires a date' do
    
    create :reservation, date: '2015-06-18'
    expect(reservation.date).to eq Date.parse('2015-06-18')
  end					
  
  it 'requires a table' do
  	create :reservation, dining_table_id: ''
    expect(reservation.dining_table_id).to eq 1
  end
  
  it 'requires a contact' do
    create :reservation, contact_id: ''
    expect(reservation.contact_id).to eq 3

  end

  it 'has an optional observation' do
  
  end

end
