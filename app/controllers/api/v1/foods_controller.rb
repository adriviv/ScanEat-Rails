class Api::V1::FoodsController < Api::V1::BaseController

  def create
    product_object = ProductLookup.new(product_params)

    nutrician_info = product_object.get_product_infos()
    puts " helooooooo #{nutrician_info}"

    @food = Food.find_or_create_by(nutrician_info)
    if @food.save
      # @scan = Scan.new(user_id: 1, food_id: @food.id)
      render json: {}, status: :created
    else
      render_error
    end
  end

  def destroy
  end



  private



  def product_params
    params.require(:barcode)
  end

  def render_error
    render json: {errors: @food.errors.full_messages}
  end
end
