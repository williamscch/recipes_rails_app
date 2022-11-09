require_relative '../rails_helper'

RSpec.describe 'Recipes', type: :request do
  before(:example) do
    User.create(
      name: 'Jhon First',
      email: 'jhon@email.com',
      password: '123456'
    )
  end
  describe 'GET /index' do
    it 'returns http success' do
      get recipes_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get recipe_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/recipes/new'
      expect(response).to have_http_status(:success)
    end
  end
end
