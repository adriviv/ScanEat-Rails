class Api::V1::ScansController < Api::V1::BaseController
  before_action :set_project, only: [:show]

  def index
    @scans = Scan.where(user_id: params[:user_id])
  end

  def show
  end

  def create
    @user = User.find(params[:user_id])
    product_object = ProductLookup.new(product_params)
    nutrician_info = product_object.get_product_infos()
    puts nutrician_info

    @food = Food.new(nutrician_info)
    @food.save

    @scan = Scan.new(user_id: @user.id, food_id: @food.id)
    render json: @food, status: :created if @scan.save


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
