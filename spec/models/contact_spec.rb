require 'rails_helper'

RSpec.describe Contact, type: :model do
  let(:contact) { create :contact }

  it 'requires a first name' do

   create :contact, first_name: ''
     expect(contact.first_name).to_not be_empty
  
  end

  it 'requires a last name' do
  	
   create :contact, last_name: ''
   expect(contact.first_name).to_not be_empty

  end

  it 'requires phone number' do
   
   create :contact, phone_number:''
   expect(contact.phone_number).to_not be_empty
  
  end
 
  it 'requires a valid phone number' do
  
   create :contact, phone_number: ''
   puts contact.phone_number.length
   expect(contact.phone_number.length).to eq 10
   #expect(contact.phone_number.each_char =~ /[[:digit:]]/)
  end

  it 'has an optional email' do

   create :contact, email:'' 
   expect(contact.email).to_not be_empty
   #expect(contact.email =~ /@/)

  end

  	

end
