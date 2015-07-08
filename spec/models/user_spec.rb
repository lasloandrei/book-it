require 'rails_helper'
RSpec.describe User, type: :model do
  before :each do
    create :user
  end

  it 'should exist' do
    expect(User.count).to eq 1
    user = User.last
    expect(user.email).to eq 'john@hoh.com'
    expect(user.first_name).to eq 'john'
  end
end
