class DishIngredientsController < ApplicationController

  def create
    dish = Dish.find(params[:dish_id])
    ingredient = Ingredient.find(params[:dish_ingredient][:ingredient])
    DishIngredient.create(dish: dish, ingredient: ingredient)
    
    redirect_to chef_dish_path(dish.chef_id, dish)
  end
end