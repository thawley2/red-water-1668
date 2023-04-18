class DishesController < ApplicationController
  
  def show
    #refactor and take away @chef since it's linked to dish
    @chef = Chef.find(params[:chef_id])
    @dish = Dish.find(params[:id])
    @dish_ingred = DishIngredient.new
  end
end