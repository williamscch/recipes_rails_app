class ShopController < ApplicationController
  def index
    recipe_foods = RecipeFood.all
    foods = Food.all
    @foods = []
    foods.each do |food|
      @foods.push(food) unless food.id.in?(recipe_foods.pluck(:food_id))
    end
    prices = @foods.map(&:price)
    @prices = prices.sum
  end
end
