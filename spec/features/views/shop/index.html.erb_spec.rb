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

    visit shop_path
  end

  it 'should show the title' do
    expect(page).to have_text 'Shopping List', minimum: 1
  end

  it 'should have the shopping list table' do
    expect(page).to have_selector '.table'
  end

  it 'should show the foods names' do
    expect(page).to have_content @food1.name
    expect(page).to have_content @food2.name
    expect(page).to have_content @food3.name
  end

  it 'Should shows the quantity' do
    expect(page).to have_text('Quantity')
  end

  it 'should shows the price' do
    expect(page).to have_text('Price')
  end

  it 'Should shows the right sum' do
    expect(page).to have_content "Total value of food needed: $ #{@food1.price + @food2.price + @food3.price}"
  end

  it 'Should show the right amount of items' do
    expect(page).to have_content 'Amoung of items to buy: 3'
  end
end
