json.scans do
  json.array! @scans do |scan|
    json.extract! scan,
    :barcode,
    :product_name,
    :brand,
    :nutrition_grade,
    :salt_quantity,
    :salt_nutrient_level,
    :calories_quantity,
    :calories_nutrient_level,
    :protein_quantity,
    :protein_nutrient_level,
    :saturated_fat_quantity,
    :saturated_fat_nutrient_level,
    :fiber_quantity,
    :fiber_nutrient_level,
    :sugar_quantity,
    :sugar_nutrient_level,
    :ingredients,
    :allergens,
    :packaging_type,
    :labels,
    :image_url,
    :additives,
    :category,
    :status
  end
end
