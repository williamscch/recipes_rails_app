require_relative '../../../rails_helper'

RSpec.describe 'My recipes page' do
  before(:each) do
    DatabaseCleaner.clean_with(:truncation)
    @user1 = User.create(name: 'Jhon First', email: 'jhon@email.com',
                         password: '123456')
    @user2 = User.create(name: 'Jhon Second', email: 'jhon2@email.com',
                         password: '123456')
    @recipe1 = @user1.recipes.create(name: 'Fried Chicken',
                                     description: 'Nomad lifestyle is something really amazing, you should try it',
                                     preparation_time: '10m', cooking_time: '10', public: true)
    @recipe2 = @user2.recipes.create(name: 'Pasta Alfredo',
                                     description: 'Nomad lifestyle is something really amazing, you should try it',
                                     preparation_time: '15m', cooking_time: '20', public: true)
    @recipe3 = @user2.recipes.create(name: 'Pizza',
                                     description: 'Nomad lifestyle is something really amazing, you should try it',
                                     preparation_time: '15m', cooking_time: '20', public: false)

    visit '/'

    find('#user_email').set('jhon@email.com')
    find('#user_password').set('123456')
    find("input[type='submit']").click

    visit recipe_path(@recipe1.id)
  end

  it 'should show the name of the recipe' do
    expect(page).to have_text @recipe1.name, count: 1
  end

  it 'should have a recipe info div' do
    expect(page).to have_selector '.recipe-info'
  end

  it 'should have the preparation and cooking time' do
    expect(page).to have_content 'Preparation time'
    expect(page).to have_content 'Cooking time'
  end

  it 'should show the recipe description' do
    expect(page).to have_content @recipe1.description
  end

  it 'Should have a add ingredient link' do
    expect(page).to have_link('Add Ingredient')
  end
end
