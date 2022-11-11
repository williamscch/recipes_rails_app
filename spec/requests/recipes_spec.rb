require_relative '../rails_helper'

RSpec.describe 'Recipes', type: :request do
  before(:example) do
    @user1 = User.create(
      name: 'Jhon First',
      email: 'jhon@email.com',
      password: '123456'
    )
    get '/'
  end
  describe 'GET /index' do
    it 'returns http success' do
      get recipes_path(@user1)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get recipe_path(@user1)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/recipes/new/1'
      expect(response).to have_http_status(:success)
    end
  end
end
