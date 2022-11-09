class ShopController < ApplicationController
  def index
    @foods = Food.all
    prices = @foods.map(&:price)
    @prices = prices.sum
  end
end
