User.destroy_all
Food.destroy_all
Scan.destroy_all

User.create!(
  nickname: 'Luke',
  avatar_url: 'https://picsum.photos/200/300',
  city: 'Shenzhen',
  province: 'Guangdong'
)

User.create!(
  nickname: 'Sofa',
  avatar_url: 'https://picsum.photos/200/300',
  city: 'JinGan',
  province: 'Shanghai'
)

Food.create!(
    barcode: "5449000131805",
    product_name: "coca-cola red",
    brand: "coca_cola",
    nutrition_grade: "d",
    salt_quantity: 12,
    salt_nutrient_level: "low",
    calories_quantity: 14,
    calories_nutrient_level: "high",
    protein_quantity: 12,
    protein_nutrient_level: "moderate",
    saturated_fat_quantity: 8,
    saturated_fat_nutrient_level: "low",
    fiber_quantity: 0,
    fiber_nutrient_level: "low",
    sugar_quantity: 1,
    sugar_nutrient_level: "low",
    ingredients:"cafeine",
    allergens: "none",
    packaging_type: "plastic",
    labels: "none",
    image_url: "https://static.openfoodfacts.org/images/products/544/900/013/1805/front_en.78.400.jpg",
    additives: "none",
    category: "drink",
    status: "product found"
)

Scan.create!(
  food_id: 1,
  user_id: 1
)
