class Api::V1::FoodsController < Api::V1::BaseController

  def create
    @food = Food.new(food_params)
    if @food.save
      render json: @food, status: :created
    else
      render_error
    end
  end

  def show
    @food = Food.find(params[:id])

    render json: { food: @food }

        # @scans = Scan.where(user_id: params[:user_id])

  end


  private

  def food_params
    params.require(:food).permit(:product_name, :brand, :salt_quantity, :protein_quantity, :fiber_quantity, :calories_quantity, :sugar_quantity, :saturated_fat_quantity)
  end

  def product_params
    params.require(:barcode)
  end

  def render_error
    render json: {errors: @food.errors.full_messages}
  end
end
