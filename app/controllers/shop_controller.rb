class ShopController < ApplicationController
  def index
    @foods = Food.all

  end
end
