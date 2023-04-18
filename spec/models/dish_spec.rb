require 'rails_helper'

RSpec.describe Dish, type: :model do
  let!(:chef1) {Chef.create!(name: 'Thomas')}

  let!(:dish1) {chef1.dishes.create!(name: 'Tuna Salad', description: 'Yummy')}
  let!(:dish2) {chef1.dishes.create!(name: 'Grilled Steak', description: "Hope you aren't vegan")}
  let!(:dish3) {chef1.dishes.create!(name: 'Hamburgers', description: "You can taste the charcoal")}

  let!(:tuna) {Ingredient.create!(name: 'Tuna', calories: 156)}
  let!(:salt) {Ingredient.create!(name: 'Salt', calories: 15)}
  let!(:mayo) {Ingredient.create!(name: 'Mayo', calories: 1200)}

  let!(:steak) {Ingredient.create!(name: 'Steak', calories: 1500)}

  let!(:dishingr1) {DishIngredient.create!(dish: dish1, ingredient: tuna)}
  let!(:dishingr2) {DishIngredient.create!(dish: dish1, ingredient: salt)}
  let!(:dishingr3) {DishIngredient.create!(dish: dish1, ingredient: mayo)}

  let!(:dishingr4) {DishIngredient.create!(dish: dish2, ingredient: steak)}

  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe 'instance methods' do
    describe '#total_calories' do
      it 'returns an integer of the total calories for a dish' do
        expect(dish1.total_calories).to eq(1371)
        expect(dish2.total_calories).to eq(1500)
        expect(dish3.total_calories).to eq(0)
      end
    end

    describe '#chef_name' do
      it 'returns the chefs name for that dish' do
        expect(dish1.chef_name).to eq('Thomas')
      end
    end
  end
end