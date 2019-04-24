class CreatePropositions < ActiveRecord::Migration[5.2]
  def change
    create_table :propositions do |t|
      t.string :product_name
      t.string :brand
      t.float :salt_quantity
      t.integer :calories_quantity
      t.float :protein_quantity
      t.float :saturated_fat_quantity
      t.float :fiber_quantity
      t.float :sugar_quantity
      t.string :image_url
      t.string :barcode
      t.string :category


      t.timestamps
    end
  end
end
