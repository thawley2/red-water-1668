require 'rails_helper'

RSpec.describe '/chefs/id#show', type: :feature do
    
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

    describe 'When I visit a chefs show page' do
      describe 'I see a link to view a list of all ingredients that this chef uses in their dishes' do
        it 'When I click on that link Im taken to a chefs ingredients index page' do
          visit chef_path(chef1)

          expect(page).to have_content('Chef Thomas')
          expect(page).to have_link('View All Ingredients')

          click_link('View All Ingredients')

          expect(current_path).to eq(chef_ingredients_path(chef1))
        end
      end
    end
end