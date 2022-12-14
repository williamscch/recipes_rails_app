require_relative '../rails_helper'

RSpec.describe Food, type: :model do
  user = User.create!(name: 'Tomiyasu', email: 'tomiyasu@email.com', password: '123456')
  subject do
    user.foods.new(name: 'Apple', measurement_unit: 'unit',
                   price: 50, quantity: 2)
  end

  before(:example) { subject.save }

  it 'Validation of the new food' do
    expect(subject).to be_valid
  end

  context 'Testing name argument' do
    it 'Name must be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'Name must be less than 30 char' do
      subject.name = 'tomasrichradlisonjosedelasantisimatrinidadpontepalaciosyblanco'
      expect(subject).to_not be_valid
    end
  end

  context 'Testing price argument' do
    it 'Price must be an integer' do
      subject.price = 'a'
      expect(subject).to_not be_valid
    end

    it 'Price must be greater than 0' do
      subject.price = -52
      expect(subject).to_not be_valid
    end
  end

  context 'Testing quantity argument' do
    it 'Quantity must be an integer' do
      subject.quantity = 'a'
      expect(subject).to_not be_valid
    end

    it 'Quantity must be grater than 0' do
      subject.quantity = -1
      expect(subject).to_not be_valid
    end
  end
end
