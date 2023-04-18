require 'rails_helper'

RSpec.describe '/chefs/id/dishes/id#show', type: :feature do

    let!(:chef1) {Chef.create!(name: 'Thomas')}

    let!(:dish1) {chef1.dishes.create!(name: 'Tuna Salad', description: 'Yummy')}

    let!(:tuna) {Ingredient.create!(name: 'Tuna', calories: 156)}
    let!(:salt) {Ingredient.create!(name: 'Salt', calories: 15)}
    let!(:mayo) {Ingredient.create!(name: 'Mayo', calories: 1200)}

  describe 'When I visit a dishes show page' do
    it 'I see the chef name and dish name/description' do
      visit chef_dish_path(chef1, dish1)

      expect(page).to have_content('Chef: Thomas')
      expect(page).to have_content('Dish Name: Tuna Salad')
      expect(page).to have_content('Description: Yummy')
    end
  end
end