require 'rails_helper'

RSpec.describe '/chefs/id/ingredients#index', type: :feature do
  
    let!(:chef1) {Chef.create!(name: 'Thomas')}

    let!(:dish1) {chef1.dishes.create!(name: 'Tuna Salad', description: 'Yummy')}
    let!(:dish2) {chef1.dishes.create!(name: 'Grilled Steak', description: "Hope you aren't vegan")}

    let!(:tuna) {Ingredient.create!(name: 'Tuna', calories: 156)}
    let!(:salt) {Ingredient.create!(name: 'Salt', calories: 15)}
    let!(:mayo) {Ingredient.create!(name: 'Mayo', calories: 1200)}

    let!(:steak) {Ingredient.create!(name: 'Steak', calories: 1500)}

    let!(:dishingr1) {DishIngredient.create!(dish: dish1, ingredient: tuna)}
    let!(:dishingr2) {DishIngredient.create!(dish: dish1, ingredient: salt)}
    let!(:dishingr3) {DishIngredient.create!(dish: dish1, ingredient: mayo)}

    let!(:dishingr4) {DishIngredient.create!(dish: dish2, ingredient: steak)}
    let!(:dishingr5) {DishIngredient.create!(dish: dish2, ingredient: salt)}

    describe 'When I visit a chefs ingredients index page' do
      it 'I can see a unique list of names of all the ingredients that this chef uses.' do
        visit chef_ingredients_path(chef1)

        expect(page).to have_content('Chef Thomas')
        expect(page).to have_content('All Ingredients')
        expect(page).to have_content('Tuna')
        expect(page).to have_content('Salt').once
        expect(page).to have_content('Mayo')
        expect(page).to have_content('Steak')
      end
    end
end