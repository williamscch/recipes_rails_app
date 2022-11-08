require_relative '../rails_helper'

RSpec.describe Recipe, type: :model do
  user = User.create!(name: 'Tomas', email: 'tomas@email.com', password: '123456')
  subject do
    user.recipes.new(name: 'Apple Cake', preparation_time: '10m',
                     cooking_time: '10m', description: 'This is a easy recipe to follow', public: false)
  end

  before(:example) { subject.save }

  it 'Validation of the new recipe' do
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

  context 'Testing preparation time argument' do
    it 'Should be lesser than 5 char' do
      subject.preparation_time = '10 minutes'
      expect(subject).to_not be_valid
    end

    it 'Should not be nil' do
      subject.preparation_time = nil
      expect(subject).to_not be_valid
    end
  end

  context 'Testing coooking time argument' do
    it 'Should be lesser than 5 char' do
      subject.cooking_time = '10 minutes'
      expect(subject).to_not be_valid
    end

    it 'Should not be nil' do
      subject.cooking_time = nil
      expect(subject).to_not be_valid
    end
  end
end
