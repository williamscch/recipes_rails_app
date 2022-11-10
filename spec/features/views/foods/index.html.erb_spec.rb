require_relative '../../../rails_helper'

RSpec.describe 'My recipes page' do
  before(:each) do
    DatabaseCleaner.clean_with(:truncation)
    @user1 = User.create(name: 'Jhon First', email: 'jhon@email.com',
                         password: '123456')
    @food1 = @user1.foods.create(name: 'Tomatoe',
                                 measurement_unit: 'kg',
                                 price: 15, quantity: '10')
    @food2 = @user1.foods.create(name: 'Cheesse',
                                 measurement_unit: 'kg',
                                 price: 125, quantity: '1')
    @food3 = @user1.foods.create(name: 'Milk',
                                 measurement_unit: 'lts',
                                 price: 25, quantity: '2')

    visit '/'

    find('#user_email').set('jhon@email.com')
    find('#user_password').set('123456')
    find("input[type='submit']").click

    visit foods_path
  end

  it 'should show the title' do
    expect(page).to have_text 'Foods', minimum: 1
  end

  it 'should have the foods table' do
    expect(page).to have_selector '.table'
  end

  it 'should show the food name' do
    expect(page).to have_content @food1.name
  end

  it 'Should have a New Food me link' do
    expect(page).to have_link('New Food')
  end

  it 'When I click on a new food, it redirects me to new foods page' do
    click_link('New Food')
    expect(page.current_path).to eql('/foods/new')
  end
end
