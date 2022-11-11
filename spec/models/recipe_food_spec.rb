require_relative '../rails_helper'

RSpec.describe RecipeFood, type: :model do
  user = User.create!(name: 'Tomory', email: 'tomory@email.com', password: '123456')
  food = user.foods.create(name: 'Apple', measurement_unit: 'unit',
                           price: 50, quantity: 2)
  recipe = user.recipes.create(name: 'Apple Cake', preparation_time: '10m',
                               cooking_time: '10m', description: 'This is a easy recipe to follow', public: false)
  subject do
    food.recipe_foods.new(quantity: 10, recipe:)
  end

  before(:example) { subject.save }

  it 'Validation of the new recipe' do
    expect(subject).to be_valid
  end

  context 'Test quantity argument' do
    it 'Quantity must be present' do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end

    it 'Quantity must be grater or equal to 0' do
      subject.quantity = -1
      expect(subject).to_not be_valid
    end
  end
end
