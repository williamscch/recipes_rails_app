require 'rails_helper'

RSpec.describe 'ShoppingLists', type: :request do
  subject do
    User.new(name: 'Tommy', email: 'tommy@email.com', password: '123456')
  end

  before(:example) { subject.save }

  describe 'GET /index' do
    it 'returns http success' do
      get new_user_registration_path
      expect(response).to have_http_status(:success)
    end
  end
end
