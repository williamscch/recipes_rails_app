class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods

  validates :name, presence: true, length: { maximum: 30, too_long: 'Maximun for lenght is 30 char' }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, precense: true
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, precense: true
end
