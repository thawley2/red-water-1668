Rails.application.routes.draw do

  resources :dishes, only: :show do
    resources :dish_ingredients, only: :create
  end

  resources :chefs, only: :show do
    resources :ingredients, only: :index, controller: 'chefs/ingredients'
  end
end
