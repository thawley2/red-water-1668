require 'rails_helper'

RSpec.describe '/dishes/id#show', type: :feature do

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

  describe 'When I visit a dishes show page' do
    it 'I see the chef name and dish name/description' do
      visit dish_path(dish1)

      expect(page).to have_content('Chef: Thomas')
      expect(page).to have_content('Dish Name: Tuna Salad')
      expect(page).to have_content('Description: Yummy')
    end

    it 'I see the list of ingredients for that dish and total calorie count' do
      visit dish_path(dish1)

      expect(page).to have_content('Ingredients')

      within "#ingre_#{tuna.id}" do
        expect(page).to have_content('Tuna')
      end
      within "#ingre_#{salt.id}" do
        expect(page).to have_content('Salt')
      end
      within "#ingre_#{mayo.id}" do
        expect(page).to have_content('Mayo')
      end

      expect(page).to have_content('Total Calories for this Dish: 1371')
      expect(page).to_not have_content('Steak')
      expect(page).to_not have_content('Grilled Steak')

    end

    describe 'I see a form to add an existing Ingredient to that Dish' do
      describe 'When I fill in the form with the ID of an Ingredient that exists in the database' do
        it 'I click submit then I am redierected to that dishs show page and the new ingredient is listed' do
          visit dish_path(dish1)

          expect(page).to_not have_content('Steak')
          expect(page).to have_content('Add Ingredient to Dish')

          fill_in 'Ingredient ID', with: steak.id
          click_button 'Submit'

          expect(current_path).to eq(dish_path(dish1))
          expect(page).to have_content('Steak')
          expect(page).to have_content('Total Calories for this Dish: 2871')
        end
      end
    end
  end
end