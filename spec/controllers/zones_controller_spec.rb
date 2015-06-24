require 'rails_helper'

RSpec.describe ZonesController, type: :controller do

	let(:zone) { create :zone }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  it "returns no reservation when no reservations are found in the db" do
      get :index
      expect(json).to be_empty
    end
  end
end
