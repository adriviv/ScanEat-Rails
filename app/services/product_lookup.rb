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
    calories_kcal = calories_quantity.to_f * (0.239006)
    return calories_kcal
  end

  def to_calories_nutrient_level(category, calories_quantity)
    if category.include?("en:beverages")
      if calories_quantity.to_i < 4.184
         calories_nutriment_level = "very_low"
      elsif calories_quantity.to_i >= 4.184 && calories_quantity.to_f < 58.576
        calories_nutriment_level = "low"
      elsif calories_quantity.to_i >= 58.576 && calories_quantity.to_f < 146.44
        calories_nutriment_level = "moderate"
      elsif calories_quantity.to_i >= 146.44
        calories_nutriment_level = "high"
      end
    else
      if calories_quantity.to_i < 669
        calories_nutriment_level = "very_low"
         elsif calories_quantity.to_i > 669 && calories_quantity.to_i < 1506
        calories_nutriment_level = "low"
      elsif calories_quantity.to_i > 1506 && calories_quantity.to_i < 3347
        calories_nutriment_level = "moderate"
      elsif calories_quantity.to_i > 3347
        calories_nutriment_level = "high"
      end
    end
  end

  def to_additives(additives)
    additives_debug = additives.map do |additives|
      additives.gsub(/en:|fr:.*||es:.*|,/, "")
    end
    additives_clean = additives_debug.join(" ")
    return additives_clean
  end

  def to_allergens(allergens)
    allergens_debug = allergens.map do |allergens|
      allergens.gsub(/en:|fr:.*||es:.*|,/, "")
    end
    allergens_clean = allergens_debug.join(" ")
    return allergens_clean
  end

   def to_ingredients(ingredients)
    ingredients_debug = ingredients.map do |ingredients|
      ingredients.gsub(/en:|fr:.*||es:.*|,/, "")
    end
    ingredients_clean = ingredients_debug.join(" ")
    return ingredients_clean
  end

   def to_category(category)
    if category.include?('en:beverages')
      return'beverage'
    else
      return 'other'
    end

  end

  def to_labels(labels)
    label_debug = labels.map do |label|
      label.gsub(/en:|fr:.*|,/, "")
    end
    label_clean = label_debug.join(" ")
    return label_clean
  end

  def to_calories_percentage(category, calories_quantity)
    if category.include?('en:beverages')
      if calories_quantity.to_i < 4.184
        calories_percentage = (calories_quantity.to_i * 0.239006) * 25
      elsif calories_quantity.to_i >= 4.184 && calories_quantity.to_i < 58.576
        calories_percentage = (calories_quantity.to_i * 0.239006 - 1) / (14 - 1) * 25 + 25
      elsif calories_quantity.to_i >= 58.576 && calories_quantity.to_i < 146.44
        calories_percentage = (calories_quantity.to_i * 0.239006 - 14) / (35 - 14) * 25 + 50
      elsif calories_quantity.to_i >= 146.44
        calories_percentage = (calories_quantity.to_i * 0.239006 - 35) / (65 - 35) * 25 + 75
      end
    else
      if calories_quantity.to_i < 669
        calories_percentage = (calories_quantity.to_f * 0.239006) / 160 * 100 /4
      elsif calories_quantity.to_i >= 669 && calories_quantity.to_i < 1506
        calories_percentage = (calories_quantity.to_f * 0.239006 - 160) / 8 + 25
      elsif calories_quantity.to_i >= 1506 && calories_quantity.to_i < 3347
        calories_percentage = (calories_quantity.to_f * 0.239006 - 360) / 8 + 50
      elsif calories_quantity.to_i >= 3347
      calories_percentage = (calories_quantity.to_f * 0.239006 - 560)/(800 - 560) * 100 + 75
      end
    end
  end

  def get_product_infos
    response = HTTParty.get("https://world.openfoodfacts.org/api/v0/product/#{@barcode}.json")

# 2) ========================================
    #response.parsed_response <----- I read that on stackoverflow, should I add it ????
    body = JSON.parse(response.body)
    category = body["product"]["categories_tags"]

    calories_quantity = body["product"]["nutriments"]["energy_100g"]
    protein_quantity = body["product"]["nutriments"]["proteins_100g"]
    fiber_quantity = body["product"]["nutriments"]["fiber_100g"]

    additives = body["product"]["additives_original_tags"]
    ingredients = body["product"]["ingredients_tags"]
    allergens = body["product"]["allergens_tags"]
    labels = body["product"]["labels_tags"]
    {
      barcode: body["code"],
      product_name: body["product"]["product_name"],
      brand: body["product"]["brands"],
      nutrition_grade: body["product"]["nutrition_grade_fr"],
      salt_quantity: body["product"]["nutriments"]["salt_100g"],
      salt_nutrient_level: body["product"]["nutrient_levels"]["salt"],
      saturated_fat_quantity: body["product"]["nutriments"]["saturated-fat_100g"],
      saturated_fat_nutrient_level: body["product"]["nutrient_levels"]["saturated-fat"],
      sugar_quantity: body["product"]["nutriments"]["sugars_100g"],
      sugar_nutrient_level: body["product"]["nutrient_levels"]["sugars"],
      packaging_type: body["product"]["packaging"],
      image_url: body["product"]["image_small_url"],
      status: body["status_verbose"],
      protein_quantity: protein_quantity,


      category: to_category(category),
      fiber_quantity: fiber_quantity,
      ingredients: to_ingredients(ingredients),
      additives: to_additives(additives),
      allergens: to_allergens(allergens),
      labels: to_labels(labels),


      calories_quantity: to_calories_quantity_kcal(calories_quantity),
      calories_nutrient_level: to_calories_nutrient_level(category, calories_quantity),

      protein_nutrient_level: to_protein_nutriment_level(protein_quantity),
      fiber_nutrient_level: to_fiber_nutriment_level(fiber_quantity),

      calories_percentage: to_calories_percentage(category, calories_quantity)

    }
  end

end
