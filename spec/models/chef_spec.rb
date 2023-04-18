require 'rails_helper'

RSpec.describe Chef, type: :model do
    
    let!(:chef1) {Chef.create!(name: 'Thomas')}
    let!(:chef2) {Chef.create!(name: 'Rigby')}

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
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
    it {should have_many(:ingredients).through(:dishes)}
  end

  describe 'Instance methods' do
    describe '#all_ingredients' do
      it 'returns an array of unique ingredients the chef uses' do
        expect(chef1.all_ingredients).to eq(['Mayo', 'Salt', 'Steak', 'Tuna'])
        expect(chef2.all_ingredients).to eq([])
      end
    end
  end
end