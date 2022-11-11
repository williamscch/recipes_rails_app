require_relative '../../../rails_helper'

RSpec.describe 'My recipes page' do
  before(:each) do
    DatabaseCleaner.clean_with(:truncation)
    @user1 = User.create(name: 'Jhon First', email: 'jhon@email.com',
                         password: '123456')

    visit '/'

    find('#user_email').set('jhon@email.com')
    find('#user_password').set('123456')
    find("input[type='submit']").click

    visit recipes_new_path(@user1)
  end

  it 'should show the title' do
    expect(page).to have_text 'New recipe'
  end

  it 'Have to be the right path' do
    expect(page.current_path).to eql('/recipes/new/1')
  end

  it 'Should create the new post and redirects to the post show page' do
    find('#recipe_name').set('Hamburguer')
    find('#recipe_preparation_time').set('10m')
    find('#recipe_cooking_time').set('20m')
    find('#recipe_description').set('Hamburger with cheese bacon meat lettuce tomatoes and chicken')
    find("input[type='checkbox']").click
    find("input[type='submit']").click
    expect(page.current_path).to eql('/recipes/show/1')
  end
end
