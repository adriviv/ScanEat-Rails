class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.string :barcode
      t.string :product_name
      t.string :brand
      t.string :nutrition_grade
      t.integer :salt_quantity
      t.string :salt_nutrient_level
      t.integer :calories_quantity
      t.string :calories_nutrient_level
      t.integer :protein_quantity
      t.string :protein_nutrient_level
      t.integer :saturated_fat_quantity
      t.string :saturated_fat_nutrient_level
      t.integer :fiber_quantity
      t.string :fiber_nutrient_level
      t.integer :sugar_quantity
      t.string :sugar_nutrient_level
      t.string :ingredients
      t.string :allergens
      t.string :packaging_type
      t.string :labels
      t.string :image_url
      t.string :additives
      t.string :category
      t.string :status


      t.timestamps
    end
  end
end
