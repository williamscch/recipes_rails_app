require_relative '../rails_helper'

RSpec.describe 'Recipes', type: :request do
  before(:example) do
    @user = User.create(name: 'Tommy', email: 'test@email.com', password: '123456')
  end

  describe 'login' do
    it 'returns http success' do
      get new_user_session_path
      expect(response).to have_http_status(:success)
    end
  end
end
