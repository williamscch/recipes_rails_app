require_relative '../rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom') }

  before(:example) { subject.save }

  it 'Name must be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Name must be less than 30 char' do
    subject.name = 'tomasrichradlisonjosedelasantisimatrinidadpontepalaciosyblanco'
    expect(subject).to_not be_valid
  end

  it 'A valid name should be accepted' do
    subject.name = 'David'
    expect(subject).to be_valid
  end
end
