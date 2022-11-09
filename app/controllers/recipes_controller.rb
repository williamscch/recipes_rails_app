class RecipesController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @recipes = @user.recipes.all
  end

  def show
    @user = User.find(current_user.id)
    @recipe = @user.recipes.find(params[:format])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
