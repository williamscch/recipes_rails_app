class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods

  validates :name, presence: true, length: { maximum: 30, too_long: 'Maximun for lenght is 30 char' }
  validates :cooking_time, presence: true, length: { maximum: 10, too_long: 'Maximun for lenght is 10 char' }
  validates :preparation_time, presence: true, length: { maximum: 10, too_long: 'Maximun for lenght is 10 char' }

  def total_cost
    total = 0
    recipe_foods.includes(:food).each do |recipe_food|
      total += recipe_food.quantity * recipe_food.food.price
    end
    total.round(2)
  end
end
