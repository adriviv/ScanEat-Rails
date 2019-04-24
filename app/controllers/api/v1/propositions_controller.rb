class Api::V1::PropositionsController < Api::V1::BaseController

  def create
    puts'hello1'
    @proposition = Proposition.new(proposition_params)
    puts'hello2'
    if @proposition.save
      puts'hello3'
      render json: @proposition, status: :created
      puts'hello4'
    else
      render_error
    end
  end

  private

  def proposition_params
    params.require(:proposition).permit(:barcode,
      :brand,
      :product_name,
      :image_url,
      :ingredients,
      :category,
      :calories_quantity,
      :sugar_quantity,
      :salt_quantity,
      :saturated_fat_quantity,
      :protein_quantity,
      :fiber_quantity)
  end

  def render_error
    render json: {errors: @food.errors.full_messages}
  end

end
