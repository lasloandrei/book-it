require 'rails_helper'

RSpec.describe ContactsController, type: :controller do

  let(:contact) { create :contact }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "returns no contacts when no contacts are found in the db" do
      get :index
      expect(json).to be_empty
    end

    it "returns all the contacts" do
      contact
      get :index
      expect(json).to include(contact)
    end
  end

  describe "GET #show" do
    it "finds a specific contact" do
      contact
      get :show, id: contact.id
      expect(json['id']).to eq contact.id
    end
  end
end
