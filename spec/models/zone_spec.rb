require 'rails_helper'

RSpec.describe Zone, type: :model do
  let(:zone) { create :zone }

  it 'should be valid' do
  	expect(zone).to be_valid
  end

  it 'should have many dining tables' do
  	
    expect(zone.dining_tables).to be_empty

  	create :dining_table, zone: zone

  	expect(zone.dining_tables).to_not be_empty

  	create :dining_table

  	expect(zone.dining_tables.size).to eq 1
  	expect(DiningTable.count).to eq 2
  end

  it 'requires a name' do
  	expect {
  		create :zone, name: ''
  	}.to raise_error ActiveRecord::RecordInvalid
  end
end
