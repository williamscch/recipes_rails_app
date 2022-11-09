class ShopController < ApplicationController
  def index
    @foods = Food.all
    prices = @foods.map { |n| n.price }
    @prices = prices.sum
  end
end
