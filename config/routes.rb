Rails.application.routes.draw do

  resources :chefs, only: [] do
    resources :dishes, only: :show
  end

  resources :dishes, only: [] do
    resources :dish_ingredients, only: :create
  end
end
