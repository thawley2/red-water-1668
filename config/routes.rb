Rails.application.routes.draw do

  resources :dishes, only: :show do
    resources :dish_ingredients, only: :create
  end
end
