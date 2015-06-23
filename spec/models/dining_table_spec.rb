require 'rails_helper'

RSpec.describe DiningTable, type: :model do
  let(:dining_table) { create :dining_table }
  
  it 'requires seat number' do
   	create :dining_table, seat: 6
   	expect(dining_table.seat).to eq 6
 end

  it 'requires a uid' do
  	create :dining_table, uid: 1
  	expect(dining_table.uid).to eq 1
 end

  it 'requires a zone' do
    create :dining_table, zone_id: 4
    expect(dining_table.zone_id).to eq 4
 end

  it 'belongs_to zone' do
    
  end
end
