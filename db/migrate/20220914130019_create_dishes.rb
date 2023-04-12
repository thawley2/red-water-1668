class CreateDishes < ActiveRecord::Migration[5.2]
  def change
    create_table :dishes do |t|
      t.string :name
      t.string :description
      t.references :chef, foreign_key: true

      t.timestamps
    end
  end
end