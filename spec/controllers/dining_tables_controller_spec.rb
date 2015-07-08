require 'rails_helper'
RSpec.describe DiningTablesController, type: :controller do
  let(:dining_table) { create :dining_table }

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
    it 'returns no dining table when no dining table are found in the db' do
      get :index
      expect(json).to be_empty
    end
  end
end
