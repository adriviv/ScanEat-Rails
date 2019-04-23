class Api::V1::FavoritesController < Api::V1::BaseController

  def index
    # Get User's favourites
    # @favorites = Favorite.where(user_id: params[:user_id])
    @food_array =[]
    @favorites = Favorite.where(user_id: params[:user_id]).joins(:food)
    @favorites.each do |favorite|
      @fooood = Food.find_by_id(favorite.food_id)
      @food_array << @fooood
    end


    # favorite_info = @favorites.get_product_infos()
    # @favorite = Favorite.new(favorite_info)
    # Get Food details of each favourite's food




    #construct the result

    render json: @food_array
  end

  def show
  end

  def create
    @user = User.find(params[:user_id])
    @favorite = Favorite.find_or_create_by(favorite_params)
    @favorite.user = @user


    if @favorite.save
      render json: { testing: 123 }
    else
       render_error
     end
  end

  def destroy
  end

  private

  def favorite_params
    params.require(:favorite).permit(:food_id)
  end

  def render_error
    render json: {errors: @favorite.errors.full_messages}
  end
end
