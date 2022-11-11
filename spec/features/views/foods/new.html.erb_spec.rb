require_relative '../../../rails_helper'

RSpec.describe 'My foods page' do
  before(:each) do
    DatabaseCleaner.clean_with(:truncation)
    @user1 = User.create(name: 'Jhon First', email: 'jhon@email.com',
                         password: '123456')

    visit '/'

    find('#user_email').set('jhon@email.com')
    find('#user_password').set('123456')
    find("input[type='submit']").click

    visit new_food_path
  end

  it 'should show the title' do
    expect(page).to have_text 'New Food'
  end

  it 'Have to be the right path' do
    expect(page.current_path).to eql('/foods/new')
  end

  it 'Should create the new post and redirects to the post show page' do
    find('#food_name').set('Onion')
    find('#food_measurement_unit').set('lbs')
    find('#food_price').set(20)
    find('#food_quantity').set(4)
    find("input[type='submit']").click
    expect(page.current_path).to eql('/foods')
  end
end
