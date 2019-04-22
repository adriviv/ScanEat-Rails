require 'httparty'

class ProductLookup

  def initialize(barcode)
    @barcode = barcode
  end

  def to_fiber_nutriment_level(fiber_quantity)
    if fiber_quantity.to_i > 0 && fiber_quantity.to_i < 3.5
      fiber_nutrient_level = "high"
    elsif fiber_quantity.to_i >= 3.5
      fiber_nutrient_level = "very_high"
      return fiber_nutrient_level
    end
    return fiber_nutrient_level
  end

  def to_protein_nutriment_level(protein_quantity)
    if protein_quantity.to_i > 0 && protein_quantity.to_i < 8
      protein_nutrient_level = "high"
    elsif protein_quantity.to_i >= 8
      protein_nutrient_level = "very_high"
    end
    return protein_nutrient_level
  end

  def to_calories_quantity_kcal(calories_quantity)
    calories_kcal = calories_quantity.to_f * (0.239006)
    return calories_kcal
  end

  def to_calories_nutrient_level(category, calories_quantity)
    if category.include?("en:beverages")
      if calories_quantity.to_i < 4.184
        "very_low"
      elsif calories_quantity.to_i >= 4.184 && calories_quantity.to_f < 58.576
        "low"
      elsif calories_quantity.to_i >= 58.576 && calories_quantity.to_f < 146.44
         "moderate"
      elsif calories_quantity.to_i >= 146.44
         "high"
      end
    else
      if calories_quantity.to_i < 669
        "very_low"
      elsif calories_quantity.to_i > 669 && calories_quantity.to_i < 1506
        "low"
      elsif calories_quantity.to_i > 1506 && calories_quantity.to_i < 2343
        "moderate"
      elsif calories_quantity.to_i > 2347
        "high"
      end
    end
  end

  def to_additives(additives)
    additives_debug = additives.map do |additives|
      additives.gsub(/en:|fr:.*||es:.*||de:.*|,/, "")
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

  def to_brand(brand)
  brand_clean = brand.gsub(","," - ")
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


  def to_salt_percentage(salt_quantity)
    if salt_quantity.to_f < 46
      return (salt_quantity.to_f)/46 * 25
    elsif salt_quantity.to_f >= 46 && salt_quantity.to_f < 92
      return ((salt_quantity.to_f - 46)) / (92 - 46) * 25 + 25
    elsif salt_quantity.to_f >= 92 && salt_quantity.to_f < 162
      return ((salt_quantity.to_f) - 92) / (162 - 92) * 25 + 50
    elsif salt_quantity.to_f >= 162
      return ((salt_quantity.to_f) - 162)/(230-162 ) * 25 +75
    end
  end

  def to_sugar_percentage(category, sugar_quantity)
    puts "sugar_test #{sugar_quantity}"
    if category.include?('en:beverages')
      if (sugar_quantity.to_f)*10 < 15
        return (sugar_quantity.to_f)/15 * 25
      elsif (sugar_quantity.to_f)*10 >= 15 && sugar_quantity.to_f < 3
        return ((sugar_quantity.to_f - 15)) / 2 * 25 + 25
      elsif sugar_quantity.to_f >= 3 && sugar_quantity.to_f < 7
        return ((sugar_quantity.to_f) - 3) / 4 * 25 + 50
      elsif sugar_quantity.to_f >= 7
        return ((sugar_quantity.to_f)-7)/6+75
      end
    else
      if sugar_quantity.to_f < 9
        return (sugar_quantity.to_f)/9 * 25
      elsif sugar_quantity.to_f >= 9 && sugar_quantity.to_f < 18
        return (sugar_quantity.to_f - 9)/ 2 * 25 + 25
      elsif sugar_quantity.to_f >= 18 && sugar_quantity.to_f < 31
        return (sugar_quantity.to_f - 18)/ (31-18) * 25 + 50
      elsif sugar_quantity.to_f >= 31
        return (sugar_quantity.to_f - 31)/ (45-31) * 25 + 75
      end
    end
  end

  def to_protein_percentage(protein_quantity)
   (protein_quantity.to_f)/16*100
  end

  def to_fiber_percentage(fiber_quantity)
   (fiber_quantity.to_f)*0.07*100
  end


def to_saturated_fat_percentage(saturated_fat_quantity)
  if saturated_fat_quantity.to_f < 2
    return (saturated_fat_quantity.to_f)/2 * 25
  elsif saturated_fat_quantity.to_f >= 2 && saturated_fat_quantity.to_f < 4
    return ((saturated_fat_quantity.to_f)-2)/2 * 25 + 25
  elsif saturated_fat_quantity.to_f >= 4 && saturated_fat_quantity.to_f < 7
    return ((saturated_fat_quantity.to_f)-4)/3 * 25 + 50
  elsif saturated_fat_quantity.to_f >= 7
    return ((saturated_fat_quantity.to_f)-7)/3 * 25 + 75
  end
end

def to_nutrition_grade(nutrition_grade)
  case
    when nutrition_grade == 'a'
      return 'Very Good'
    when nutrition_grade == 'b'
      return 'Good'
    when nutrition_grade == 'c'
      return 'Medium'
    when nutrition_grade == 'd'
      return 'Bad'
    when nutrition_grade == 'e'
      return 'Very Bad'
  end
end


# ===========================================================================#
# ===========================================================================#


  def get_product_infos
    response = HTTParty.get("https://world.openfoodfacts.org/api/v0/product/#{@barcode}.json")
    body = JSON.parse(response.body)

    category = body["product"]["categories_tags"]
    calories_quantity = body["product"]["nutriments"]["energy_100g"]
    protein_quantity = body["product"]["nutriments"]["proteins_100g"]
    fiber_quantity = body["product"]["nutriments"]["fiber_100g"]
    additives = body["product"]["additives_original_tags"]
    ingredients = body["product"]["ingredients_tags"]
    allergens = body["product"]["allergens_tags"]
    labels = body["product"]["labels_tags"]
    brand = body["product"]["brands"]
    sugar_quantity = body["product"]["nutriments"]["sugars_100g"]

    saturated_fat_quantity = body["product"]["nutriments"]["saturated-fat_100g"]

    salt_quantity = body["product"]["nutriments"]["salt_100g"]*100.0
    nutrition_grade = body["product"]["nutrition_grade_fr"]
    {
      barcode: body["code"],
      product_name: body["product"]["product_name"],
      brand: to_brand(brand),
      nutrition_grade: to_nutrition_grade(nutrition_grade),
      salt_quantity: salt_quantity,
      salt_nutrient_level: body["product"]["nutrient_levels"]["salt"],
      saturated_fat_quantity: saturated_fat_quantity,

      saturated_fat_nutrient_level: body["product"]["nutrient_levels"]["saturated-fat"],
      sugar_quantity: sugar_quantity,
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

      calories_percentage: to_calories_percentage(category, calories_quantity),
      salt_percentage: to_salt_percentage(salt_quantity),
      sugar_percentage: to_sugar_percentage(category, sugar_quantity),

      saturated_fat_percentage: to_saturated_fat_percentage(saturated_fat_quantity),

      protein_percentage: to_protein_percentage(protein_quantity),
      fiber_percentage: to_fiber_percentage(fiber_quantity)

    }
  end
end
