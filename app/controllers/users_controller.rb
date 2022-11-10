class UsersController < ApplicationController
  def index
    @recipes = Recipe.where(public: true)
    @recipe_foods = RecipeFood.all
  end
end
