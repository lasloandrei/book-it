require 'rails_helper'
RSpec.describe Contact, type: :model do
  let(:contact) { create :contact }
  it 'requires a first name' do
    create :contact, first_name: 'Laslo'
    expect(contact.first_name).to_not be_empty
  end

  it 'requires a last name' do
    create :contact, last_name: 'Andrei'
    expect(contact.first_name).to_not be_empty
  end

  it 'requires phone number' do
    create :contact, phone_number: '0758878747'
    expect(contact.phone_number).to_not be_empty
  end

  it 'requires a valid phone number' do
    create :contact, phone_number: '0758878747'
    expect(contact.phone_number.length).to be >= 10
    expect(contact.phone_number !~ /\D/).to be true
  end

  it 'has an optional email' do
    create :contact, email: 'lasloandrei@gmail.com'
    expect(contact.email.include?('@')).to be true
    expect(contact.email.include?('.')).to be true
  end

  it 'creates a contact' do
    expect {
      c = Contact.create({ first_name: 'asd', last_name: 'bar', phone_number: '0745898947', email: 'contact@das.ro' })
    }.to change { Contact.count }.by 1
  end
end
