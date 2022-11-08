class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods

  validates :name, presence: true, length: { maximum: 30, too_long: 'Maximun for lenght is 30 char' }
  validates :cooking_time, presence: true, length: { maximum: 5, too_long: 'Maximun for lenght is 5 char' }
  validates :preparation_time, presence: true, length: { maximum: 5, too_long: 'Maximun for lenght is 5 char' }
end
