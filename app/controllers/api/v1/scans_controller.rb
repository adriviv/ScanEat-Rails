class Api::V1::ScansController < Api::V1::BaseController
  before_action :set_project, only: [:show]

  def index
    @scans = Scan.where(user_id: params[:user_id])
  end

  def show
  end

  def create
    puts '1'
    @user = User.find(params[:user_id])
    puts '2'
    product_object = ProductLookup.new(product_params)
    puts '3'
    nutrician_info = product_object.get_product_infos()
    puts '4'

puts '5'
    @food = Food.find_or_create_by(nutrician_info)
    puts '6'
    @food.save
puts '7'
    @scan = Scan.new(user_id: @user.id, food_id: @food.id)
    puts '8'
    render json: @food, status: :created if @scan.save
    puts '9'
  end


# Old version
  # def create
  #   @user = User.find(params[:user_id])
  #   product_object = ProductLookup.new(product_params)
  #   nutrician_info = product_object.get_product_infos()


  #   @food = Food.find_or_create_by(nutrician_info)
  #   @food.save

  #   @scan = Scan.new(user_id: @user.id, food_id: @food.id)
  #   render json: @food, status: :created if @scan.save
  # end


  def statisitics

    total_scans = Scan.where(user_id: params[:user_id]).count
    statisitics_number = Scan.where(user_id: params[:user_id]).joins(:food)

    very_bad_nutrition_number = statisitics_number.where(foods: {nutrition_grade: 'Very Bad'}).count
    very_bad_nutrition_percentage = (very_bad_nutrition_number.to_f / total_scans.to_f * 100).round(0)
    #very_bad_nutrition_percentage = very_bad_nutrition_percentages.round(2)

    bad_nutrition_number = statisitics_number.where(foods: {nutrition_grade: 'Bad'}).count
    bad_nutrition_percentage = (bad_nutrition_number.to_f / total_scans.to_f * 100).round(0)

    medium_nutrition_number = statisitics_number.where(foods: {nutrition_grade: 'medium'}).count
    medium_nutrition_percentage = (medium_nutrition_number.to_f / total_scans.to_f * 100).round(0)

    good_nutrition_number = statisitics_number.where(foods: {nutrition_grade: 'good'}).count
    good_nutrition_percentage = (good_nutrition_number.to_f / total_scans.to_f * 100).round(0)

    very_good_nutrition_number = statisitics_number.where(foods: {nutrition_grade: 'very_good'}).count
    very_good_nutrition_percentage = (very_good_nutrition_number.to_f / total_scans.to_f * 100).round(0)

     render json: {
      very_bad_nutrition_percentage: very_bad_nutrition_percentage,
      very_bad_nutrition_number: very_bad_nutrition_number,
      bad_nutrition_percentage: bad_nutrition_percentage,
      bad_nutrition_number: bad_nutrition_number,
      medium_nutrition_percentage: medium_nutrition_percentage,
      medium_nutrition_number: medium_nutrition_number,
      good_nutrition_percentage: good_nutrition_percentage,
      good_nutrition_number: good_nutrition_number,
      very_good_nutrition_percentage: very_good_nutrition_percentage,
      very_good_nutrition_number: very_good_nutrition_number,
      }
    end


  private

  def set_project
    @scan = Scan.find(params[:id])
  end

  def product_params
    params.require(:barcode)
  end

  def render_error
    render json: {errors: @food.errors.full_messages}
  end
end
