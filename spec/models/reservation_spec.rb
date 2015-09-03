require 'rails_helper'
require 'date'
RSpec.describe Reservation, type: :model do
  
  let(:dining_table) { create :dining_table }
  let(:contact) { create :contact }
  let(:reservation) { create :reservation, dining_table: dining_table, contact: contact }

  it 'requires a date' do
    expect(reservation.date).to eq Date.parse('2015-06-18')
  end

  it 'requires a table' do
    expect(reservation.dining_table).to eq dining_table
  end

  it 'requires a contact' do
    expect(reservation.contact).to eq contact
  end

  it 'has an optional observation' do
  end

  it 'test' do
    p Reservation.group_by_day(:date, last:7).count
  end
end
