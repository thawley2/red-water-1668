Rails.application.routes.draw do

  resources :chefs, only: [] do
    resources :dishes, only: :show, controller: 'chefs/dishes'
  end
end
