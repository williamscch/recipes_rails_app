class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]

  # GET /recipes or /recipes.json
  def index
    @current_user = current_user
    @recipes = Recipe.includes(:user).where(user: @current_user)
  end

  # GET /public_recipes

  def public_recipes
    @public_recipes = Recipe.all.where(public: true).order(created_at: :desc)
  end

  # GET /recipes/1 or /recipes/1.json
  def show
    @recipe_foods = @recipe.recipe_foods.includes(:food, :recipe)
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit; end

  # POST /recipes or /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1 or /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # shopping List
  def shopping_list
    @total_value = 0
    recipe = Recipe.find(params[:recipe_id])
    @recipe_foods = recipe.recipe_foods.includes(:food).select do |recipe_food|
      food = recipe_food.food
      user_food = current_user.foods.find_by(name: food.name, measurement_unit: food.measurement_unit)
      @total_value += recipe_food.process_cost(user_food)
      recipe_food.process_quantity(user_food).positive?
    end
    @total_value = @total_value.round(2)
    @items_to_buy = @recipe_foods.count
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
