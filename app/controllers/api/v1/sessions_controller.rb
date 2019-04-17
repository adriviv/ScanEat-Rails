
class Api::V1::SessionsController < Api::V1::BaseController

  def create

puts '2'
    user_code_object = UsercodeLookup.new(product_params)
    puts '3'

    user_code_parsed = user_code_object.get_user_code()
    puts '4'


    @sessions = Session.new(user_code_parsed)
    if @session.save
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
    puts "allo"
    params.require(:usercode)
  end

  def render_error
    render json: {errors: @food.errors.full_messages}
  end
end

