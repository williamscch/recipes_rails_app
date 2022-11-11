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

    visit recipes_path(@user1)
  end

  it 'should show the title with the user name' do
    expect(page).to have_text "Welcome to #{@user1.name}'s Recipes", count: 1
  end

  it 'should have a recipe card' do
    expect(page).to have_selector '.recipe-card'
  end

  it 'should show the recipe description' do
    expect(page).to have_content @recipe1.description
  end

  it 'Should have a New recipe me link' do
    expect(page).to have_link('Create a new recipe')
  end

  it 'When I click on a recipe, it redirects me to that recipe show page' do
    click_on @recipe1.name
    expect(page.current_path).to eql("/recipes/show/#{@recipe1.id}")
  end
end
