class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def new
    @user = current_user
    @food = Food.new
  end

  def create
    @food = Food.new(params.require(:food).permit(:name, :measurement_unit, :price, :quantity))
    @food.user_id = current_user.id

    @food.save

    if @food.save
      redirect_to foods_path
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to foods_path
  end

end
