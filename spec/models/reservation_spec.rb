require 'rails_helper'

RSpec.describe Reservation, type: :model do
 let(:reservation) { create :reservation }

  it 'requires a date' do

  #create :reservation, :date ''

  end					
  
  it 'requires a zone' do
  	#expect(zone).not_to be_empty
  end
  
  it 'requires a contact' do
 

  end

  it 'has an optional observation' do
  end

end
