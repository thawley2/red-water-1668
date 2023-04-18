class Chef < ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  has_many :ingredients, through: :dishes


  def all_ingredients
    ingredients.distinct.pluck(:name)
    
  end

  def most_popular_ingredients
    #I don't have time to implement this in the view but I wanted 
    # to see if I could write a query that was close
    ingredients.select("ingredients.*, count(dishes)")
    .group(:id)
    .order(count: :desc)
    .limit(3).pluck(:name)
  end
end