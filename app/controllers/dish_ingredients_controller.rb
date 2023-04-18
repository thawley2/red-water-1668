class DishIngredientsController < ApplicationController

  def create
    dish = Dish.find(params[:dish_id])
    ingredient = Ingredient.find(params[:dish_ingredient][:ingredient])
    DishIngredient.create(dish: dish, ingredient: ingredient)

    redirect_to dish_path(dish)
  end
end