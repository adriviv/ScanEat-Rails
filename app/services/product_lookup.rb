# 1) ========================================

require 'httparty' # Something in the Gem File ??? Add one

class ProductLookup

  def initialize(barcode)
    @barcode = barcode

  end


  def to_fiber_nutriment_level(fiber_quantity)
    if fiber_quantity.to_i > 0
      fiber_nutrient_level = "high"
      return fiber_nutrient_level
    else
    end
  end

  def to_protein_nutriment_level(protein_quantity)
    if protein_quantity.to_i > 0
      protein_nutrient_level = "high"
    else
    end
  end

  def to_calories_quantity_kcal(calories_quantity)
    calories_kcal = calories_quantity.to_i * 0.239006
    return calories_kcal
  end

  def to_calories_nutrient_level(category, calories_quantity)
    if category.include?("Beverages")
      if calories_quantity.to_i < 58
        calories_nutriment_level = "low"
      elsif calories_quantity.to_i > 58 && calories_quantity.to_i < 152
        calories_nutriment_level = "moderate"
      elsif calories_quantity.to_i > 152
        calories_nutriment_level = "high"
      end
    else
      if calories_quantity.to_i < 1506
        calories_nutriment_level = "low"
      elsif calories_quantity.to_i > 1506 && calories_quantity.to_i < 2343
        calories_nutriment_level = "moderate"
      elsif calories_quantity.to_i > 2343
        calories_nutriment_level = "high"
      end
    end
  end

  def get_product_infos
    response = HTTParty.get("https://world.openfoodfacts.org/api/v0/product/#{@barcode}.json")

# 2) ========================================
    #response.parsed_response <----- I read that on stackoverflow, should I add it ????
    body = JSON.parse(response.body)
    category = body["product"]["categories"]

    calories_quantity = body["product"]["nutriments"]["energy_100g"]
    protein_quantity = body["product"]["nutriments"]["proteins_100g"]
    fiber_quantity = body["product"]["nutriments"]["fiber_100g"]

    {
      barcode: body["code"],
      product_name: body["product"]["product_name"],
      brand: body["product"]["brands_tags"],
      nutrition_grade: body["product"]["nutrition_grades_tags"],
      salt_quantity: body["product"]["nutriments"]["salt_100g"],
      salt_nutrient_level: body["product"]["nutrient_levels"]["salt"],
      saturated_fat_quantity: body["product"]["nutriments"]["saturated-fat_100g"],
      saturated_fat_nutrient_level: body["product"]["nutrient_levels"]["saturated-fat"],
      sugar_quantity: body["product"]["nutriments"]["sugars_100g"],
      sugar_nutrient_level: body["product"]["nutrient_levels"]["sugars"],
      ingredients: body["product"]["ingredients_text_debug"],
      allergens: body["product"]["allergens_tags"],
      packaging_type: body["product"]["packaging_tags"],
      labels: body["product"]["labels_tags"],
      image_url: body["product"]["image_small_url"],
      additives: body["product"]["additives_original_tags"],
      status: body["status_verbose"],
      protein_quantity: protein_quantity,
      category: category,
      fiber_quantity: fiber_quantity,


      calories_quantity: to_calories_quantity_kcal(calories_quantity),
      calories_nutrient_level: to_calories_nutrient_level(category, calories_quantity),



      protein_nutrient_level: to_protein_nutriment_level(protein_quantity),
      fiber_nutrient_level: to_fiber_nutriment_level(fiber_quantity)
    }
  end





end
