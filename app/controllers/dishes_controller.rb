class DishesController < ApplicationController
  
  def show
    @dish = Dish.find(params[:id])
    @dish_ingred = DishIngredient.new
  end
end