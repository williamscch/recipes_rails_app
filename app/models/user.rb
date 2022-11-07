class User < ApplicationRecord
  has_many :recipes
  has_many :foods

  validates :name, presence: true, length: { maximum: 30, too_long: 'Maximun for lenght is 30 char' }
end
