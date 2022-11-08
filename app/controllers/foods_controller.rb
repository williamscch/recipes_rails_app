class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end
  def create
    @food = Food.new(food_params)
    @food.save
    redirect_to foods_path
  end
end
