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
      expect(json.collect{|e| e["id"]}).to include(contact.id)
    end
  end

  describe "GET #show" do
    it "finds a specific contact" do
      contact
      get :show, id: contact.id
      expect(json['id']).to eq contact.id
    end

    it 'works for many contacts' do
      contact
      c2 = create :contact

      get :show, id: c2.id, name: 'foo'
      expect(json['id']).to eq c2.id
    end
  end

  describe "POST #create" do
  end
end
