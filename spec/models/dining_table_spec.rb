require 'rails_helper'

RSpec.describe DiningTable, type: :model do
  let(:dining_table) { create :dining_table }
  
  it 'requires seat number' do
   	#create :dining_table, seat: 6
 end

  it 'requires a uid' do
  	#create :dining_table, :uid 1
 end

  it 'requires a zone' do

 end
end
