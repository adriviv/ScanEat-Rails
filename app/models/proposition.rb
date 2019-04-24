class Proposition < ApplicationRecord

validates :barcode, presence: true
validates :product_name, presence: true
validates :brand, presence: true
validates :category, presence: true
validates :ingredients, presence: true
validates :image_url, presence: true

validates :salt_quantity, presence: true
validates :calories_quantity, presence: true
validates :sugar_quantity, presence: true
validates :saturated_fat_quantity, presence: true
validates :fiber_quantity, presence: true
validates :protein_quantity, presence: true

end
