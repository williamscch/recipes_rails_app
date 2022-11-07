class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods

  validates :name, presence: true, length: { maximum: 30, too_long: 'Maximun for lenght is 30 char' }
  validates :measurement_unit, presence: true, length: { maximum: 5, too_long: 'Maximun for lenght is 5 char' }
  validates :cooking_time, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :preparation_time, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
